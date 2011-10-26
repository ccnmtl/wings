# Create your views here.
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseNotFound
from wings_main.models import Participant

from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login

#from forms import UploadVideoForm,AddSeriesForm
import uuid, os, re, datetime
from django.conf import settings
from django.db import transaction
from django.core.paginator import Paginator, EmptyPage, InvalidPage
from restclient import GET,POST
from simplejson import loads, dumps
from django.db.models import Q

class rendered_with(object):
    def __init__(self, template_name):
        self.template_name = template_name

    def __call__(self, func):
        def rendered_func(request, *args, **kwargs):
            items = func(request, *args, **kwargs)
            if type(items) == type({}):
                return render_to_response(self.template_name, items, context_instance=RequestContext(request))
            else:
                return items

        return rendered_func




@login_required
@rendered_with('wings_main/participant_list.html')
def participant_list(request):
    """   """
    return dict ()

@login_required
#@rendered_with('wings_main/launch_participant.html')
def launch_participant(request, id_string):
    """   
    create a new user with a pointer to the participant object.
    generate a UUID for its password
    log in
    redirect to the first forest page
    
    http://stackoverflow.com/questions/3222549/how-to-automatically-login-a-user-after-registration-in-django
    """
    
    participant = get_object_or_404(Participant,id_string=id_string)

    if participant.user:
        messages.info(request, "This participant has already started the intervention.")
        return HttpResponseRedirect("/admin/wings_main/participant/")

    #else:
    #    import pdb
    #    pdb.set_trace()

    assert participant.user == None
    
    #print id_string
    #import pdb
    #pdb.set_trace()
    
    new_user = User()
    new_user.set_unusable_password()
    new_user.username = id_string
    new_user.save()
    
    
    participant.user = new_user
    participant.save()
    
    
    assert participant.user != None
    
    
    messages.info(request, "Logged in!")
    new_user.backend='django.contrib.auth.backends.ModelBackend' 
    authenticate(username=new_user.username, password= new_user.password)
    login(request, new_user)
    return HttpResponseRedirect("/introduction/")


@login_required
@rendered_with('wings_main/launch_participant.html')
def land_participant(request, id):
    """   
    log out the participant user.
    redirect to /
    """
    return dict ()


if 1 == 0:
                @login_required
                @rendered_with('main/dashboard.html')
                def dashboard(request):
                    submitted = request.GET.get('submitted','') == '1'
                    status_filters = dict()
                    status_filters["failed"] = request.GET.get('status_filter_failed',not submitted)
                    status_filters["complete"] = request.GET.get('status_filter_complete',not submitted)
                    status_filters["submitted"] = request.GET.get('status_filter_submitted',not submitted)
                    status_filters["inprogress"] = request.GET.get('status_filter_inprogress',not submitted)
                    user_filter = request.GET.get('user','')
                    series_filter = int(request.GET.get('series',False) or '0')
                    d = dict(
                        all_series=Series.objects.all().order_by("title"),
                        all_users=User.objects.all(),
                        user_filter = user_filter,
                        series_filter = series_filter,
                        submitted = submitted,
                        )
                    d.update(status_filters)
                    return d

                def received(request):
                    if 'title' not in request.POST:
                        return HttpResponse("expecting a title")
                    title = request.POST.get('title','no title')
                    uuid = uuidparse(title)
                    r = Operation.objects.filter(uuid=uuid)
                    if r.count() == 1:
                        operation = r[0]

                    return HttpResponse("ok")


                @login_required
                def recent_operations(request):
                    submitted = request.GET.get('submitted','') == '1'
                    status_filters = []
                    if request.GET.get('status_filter_failed',not submitted):
                        status_filters.append("failed")
                    if request.GET.get('status_filter_complete',not submitted):
                        status_filters.append("complete")
                    if request.GET.get('status_filter_inprogress',not submitted):
                        status_filters.append("inprogress")
                    if request.GET.get('status_filter_submitted',not submitted):
                        status_filters.append("submitted")
                    user_filter = request.GET.get('user','')
                    series_filter = int(request.GET.get('series',False) or '0')
                    
                    q = Operation.objects.filter(status__in=status_filters)
                    if series_filter:
                        q = q.filter(video__series__id=series_filter)
                    if user_filter:
                        q = q.filter(video__creator=user_filter)
                    
                    return HttpResponse(dumps(dict(operations=[o.as_dict() for o in q.order_by("-modified")[:200]])), mimetype="application/json")

                @login_required
                def most_recent_operation(request):
                    return HttpResponse(dumps(dict(modified=str(Operation.objects.all().order_by("-modified")[0].modified)[:19])), mimetype="application/json")

                @login_required
                @rendered_with('main/series.html')
                def series(request,id):
                    series = get_object_or_404(Series,id=id)
                    videos = Video.objects.filter(series=series).order_by("-modified")
                    return dict(series=series,videos=videos[:20],
                                operations=Operation.objects.filter(video__series__id=id).order_by("-modified")[:20])

                @login_required
                @rendered_with('main/user.html')
                def user(request,username):
                    user = get_object_or_404(User,username=username)
                    return dict(viewuser=user,
                                operations=Operation.objects.filter(owner__id=user.id).order_by("-modified")[:20])


                @login_required
                @rendered_with('main/edit_series.html')
                def edit_series(request,id):
                    series = get_object_or_404(Series,id=id)
                    if request.method == "POST":
                        form = series.edit_form(request.POST)
                        if form.is_valid():
                            series = form.save()
                            return HttpResponseRedirect(series.get_absolute_url())
                    form = series.edit_form()
                    return dict(series=series,form=form)

                @login_required
                @rendered_with('main/edit_video.html')
                def edit_video(request,id):
                    video = get_object_or_404(Video,id=id)
                    if request.method == "POST":
                        form = video.edit_form(request.POST)
                        if form.is_valid():
                            video = form.save()
                            return HttpResponseRedirect(video.get_absolute_url())
                    form = video.edit_form()
                    return dict(video=video,form=form)

                @login_required
                def remove_tag_from_video(request,id,tagname):
                    video = get_object_or_404(Video,id=id)
                    if 'ajax' in request.GET:
                        # we're not being strict about requiring POST,
                        # but let's at least require ajax
                        video.tags.remove(tagname)
                    return HttpResponse("ok")

                @login_required
                def remove_tag_from_series(request,id,tagname):
                    series = get_object_or_404(Series,id=id)
                    if 'ajax' in request.GET:
                        # we're not being strict about requiring POST,
                        # but let's at least require ajax
                        series.tags.remove(tagname)
                    return HttpResponse("ok")


                @login_required
                @rendered_with('main/tag.html')
                def tag(request,tagname):
                    return dict(tag=tagname,
                                series=Series.objects.filter(tags__name__in=[tagname]).order_by("-modified"),
                                videos = Video.objects.filter(tags__name__in=[tagname]).order_by("-modified"))

                @login_required
                @rendered_with('main/tags.html')
                def tags(request):
                    return dict(tags=Tag.objects.all().order_by("name"))

                @login_required
                @rendered_with('main/video_index.html')
                def video_index(request):
                    videos = Video.objects.all()
                    creators = request.GET.getlist('creator')
                    if len(creators) > 0:
                        videos = videos.filter(creator__in=creators)
                    descriptions = request.GET.getlist('description')
                    if len(descriptions) > 0:
                        videos = videos.filter(description__in=descriptions)
                    languages = request.GET.getlist('language')
                    if len(languages) > 0:
                        videos = videos.filter(language__in=languages)
                    subjects = request.GET.getlist('subject')
                    if len(subjects) > 0:
                        videos = videos.filter(subject__in=subjects)
                    licenses = request.GET.getlist('license')
                    if len(licenses) > 0:
                        videos = videos.filter(license__in=licenses)
                    paginator = Paginator(videos.order_by('title'),100)
                    
                    try:
                        page = int(request.GET.get('page','1'))
                    except ValueError:
                        page = 1

                    try:
                        videos = paginator.page(page)
                    except (EmptyPage, InvalidPage):
                        videos = paginator.page(paginator.num_pages)
                    params = dict()
                    for k,v in request.GET.items():
                        params[k] = v
                    params.update(dict(videos=videos))
                    return params

                @login_required
                @rendered_with('main/file_index.html')
                def file_index(request):
                    files = File.objects.all()
                    params = dict()
                    facets = []
                    for k,v in request.GET.items():
                        params[k] = v
                        metadatas = Metadata.objects.filter(field=k,value=v)
                        files = files.filter(id__in=[m.file_id for m in metadatas])
                        facets.append(dict(field=k,value=v))
                    paginator = Paginator(files.order_by('video__title'),100)
                    
                    try:
                        page = int(request.GET.get('page','1'))
                    except ValueError:
                        page = 1

                    try:
                        files = paginator.page(page)
                    except (EmptyPage, InvalidPage):
                        files = paginator.page(paginator.num_pages)
                    params.update(dict(files=files,facets=facets))
                    return params

                @login_required
                @rendered_with('main/add_series.html')
                def add_series(request):
                    if request.method == "POST":
                        form = AddSeriesForm(request.POST)
                        if form.is_valid():
                            suuid = uuid.uuid4()
                            s = form.save(commit=False)
                            s.uuid = suuid
                            s.save()
                            form.save_m2m()
                            return HttpResponseRedirect(s.get_absolute_url())
                    return dict(form=AddSeriesForm())


                @transaction.commit_manually
                @login_required
                @rendered_with('main/upload.html')
                def upload(request):
                    series_id = None
                    if request.method == "POST":
                        form = UploadVideoForm(request.POST,request.FILES)
                        if form.is_valid():
                            # save it locally
                            vuuid = uuid.uuid4()
                            source_filename = None
                            if request.POST.get('scan_directory',False):
                                source_filename = request.POST.get('source_file')
                            if request.FILES.get('source_file',False):
                                source_filename = request.FILES['source_file'].name
                            # important to note here that we allow an "upload" with no file
                            # so the user can create a placeholder for a later upload,
                            # or to associate existing files/urls with

                            if source_filename:
                                try: 
                                    os.makedirs(settings.TMP_DIR)
                                except:
                                    pass
                                extension = source_filename.split(".")[-1]
                                tmpfilename = settings.TMP_DIR + "/" + str(vuuid) + "." + extension.lower()
                                if request.POST.get('scan_directory',False):
                                    os.rename(settings.WATCH_DIRECTORY + request.POST.get('source_file'),tmpfilename)
                                else:
                                    tmpfile = open(tmpfilename, 'wb')
                                    for chunk in request.FILES['source_file'].chunks():
                                        tmpfile.write(chunk)
                                    tmpfile.close()
                            # make db entry
                            try:
                                v = form.save(commit=False)
                                v.uuid = vuuid
                                series_id = request.GET.get('series',None)
                                if series_id:
                                    v.series_id = series_id
                                v.save()
                                form.save_m2m()
                                if source_filename:
                                    source_file = File.objects.create(video=v,
                                                                      label="source file",
                                                                      filename=source_filename,
                                                                      location_type='none')
                                    if request.POST.get('submit_to_vital',False) \
                                            and request.POST.get('course_id',False):
                                        submit_file = File.objects.create(video=v,
                                                                          label="vital submit",
                                                                          filename=source_filename,
                                                                          location_type='vitalsubmit')
                                        submit_file.set_metadata("username",request.user.username)
                                        submit_file.set_metadata("set_course",request.POST['course_id'])
                                        submit_file.set_metadata("notify_url",settings.VITAL_NOTIFY_URL)
                            except:
                                transaction.rollback()
                                raise
                            else:
                                transaction.commit()
                                if source_filename:
                                    # only run these steps if there's actually a file uploaded
                                    if request.POST.get('upload_to_tahoe',False):
                                        save_file_to_tahoe.delay(tmpfilename,v.id,source_filename,request.user,settings.TAHOE_BASE)
                                    if request.POST.get('extract_metadata',False):
                                        extract_metadata.delay(tmpfilename,v.id,request.user,source_file.id)
                                    if request.POST.get('extract_images',False):
                                        make_images.delay(tmpfilename,v.id,request.user)
                                    if request.POST.get('submit_to_vital',False):
                                        submit_to_podcast_producer.delay(tmpfilename,v.id,request.user,settings.VITAL_PCP_WORKFLOW,
                                                                         settings.PCP_BASE_URL,settings.PCP_USERNAME,settings.PCP_PASSWORD)
                                    if request.POST.get('submit_to_youtube',False):
                                        youtube.tasks.upload_to_youtube.delay(tmpfilename,v.id,request.user,
                                                                              settings.YOUTUBE_EMAIL,
                                                                              settings.YOUTUBE_PASSWORD,
                                                                              settings.YOUTUBE_SOURCE,
                                                                              settings.YOUTUBE_DEVELOPER_KEY,
                                                                              settings.YOUTUBE_CLIENT_ID
                                                                              )
                                return HttpResponseRedirect("/")
                    else:
                        form = UploadVideoForm()
                        series_id = request.GET.get('series',None)
                        if series_id:
                            series = get_object_or_404(Series,id=series_id)
                            form = series.add_video_form()
                            
                    return dict(form=form,series_id=series_id)


                @transaction.commit_manually
                @login_required
                @rendered_with('main/upload.html')
                def scan_directory(request):
                    series_id = None
                    file_listing = []
                    form = UploadVideoForm()
                    series_id = request.GET.get('series',None)
                    if series_id:
                        series = get_object_or_404(Series,id=series_id)
                        form = series.add_video_form()
                    file_listing = os.listdir(settings.WATCH_DIRECTORY)
                    return dict(form=form,series_id=series_id,file_listing=file_listing,scan_directory=True)

                def test_upload(request):
                    return HttpResponse("a response")

                def uuidparse(s):
                    pattern = re.compile(r"([a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})")
                    m = pattern.match(s)
                    if m:
                        return m.group()
                    else:
                        return ""


                def done(request):
                    if 'title' not in request.POST:
                        return HttpResponse("expecting a title")
                    title = request.POST.get('title','no title')
                    uuid = uuidparse(title)
                    r = Operation.objects.filter(uuid=uuid)
                    if r.count() == 1:
                        operation = r[0]
                        operation.status = "complete"
                        operation.save()
                        ol = OperationLog.objects.create(operation=operation,
                                                         info="PCP completed")

                        cunix_path = request.POST.get('movie_destination_path','')
                        if cunix_path.startswith("/www/data/ccnmtl/broadcast/secure/"):
                            f = File.objects.create(video=operation.video,
                                                    label="CUIT File",
                                                    filename=cunix_path,
                                                    location_type='cuit',
                                                    )

                        if operation.video.is_mediathread_submit():
                            (set_course,username) = operation.video.mediathread_submit()
                            if set_course is not None:
                                user = User.objects.get(username=username)
                                mediathread.tasks.submit_to_mediathread.delay(operation.video.id,user,set_course,
                                                                              settings.MEDIATHREAD_SECRET,
                                                                              settings.MEDIATHREAD_BASE)
                                operation.video.clear_mediathread_submit()

                    return HttpResponse("ok")

                def posterdone(request):
                    if 'title' not in request.POST:
                        return HttpResponse("expecting a title")
                    title = request.POST.get('title','no title')
                    uuid = uuidparse(title)
                    r = Operation.objects.filter(uuid=uuid)
                    if r.count() == 1:
                        operation = r[0]
                        cunix_path = request.POST.get('image_destination_path','')
                        poster_url = cunix_path.replace("/www/data/ccnmtl/broadcast/posters/",
                                                        "http://ccnmtl.columbia.edu/broadcast/posters/")

                        cuit_file = File.objects.create(video=operation.video,
                                                        label="CUIT thumbnail image",
                                                        url=poster_url,
                                                        location_type='cuitthumb')
                    return HttpResponse("ok")


                @login_required
                @rendered_with('main/video.html')
                def video(request,id):
                    v = get_object_or_404(Video,id=id)
                    return dict(video=v)


                @login_required
                @rendered_with('main/file.html')
                def file(request,id):
                    f = get_object_or_404(File,id=id)
                    return dict(file=f)

                @login_required
                @rendered_with("main/file_surelink.html")
                def file_surelink(request,id):
                    f = get_object_or_404(File,id=id)
                    PROTECTION_KEY = settings.SURELINK_PROTECTION_KEY
                    filename = f.filename
                    if filename.startswith("/www/data/ccnmtl/broadcast/"):
                        filename = filename[len("/www/data/ccnmtl/broadcast/"):]

                    s = SureLink(filename,
                                 int(request.GET.get('width','0')),
                                 int(request.GET.get('height','0')),
                                 request.GET.get('captions',''),
                                 request.GET.get('poster',''),
                                 request.GET.get('protection',''),
                                 request.GET.get('authtype',''),
                                 request.GET.get('player',''),
                                 PROTECTION_KEY)

                    return dict(surelink=s,
                                protection=request.GET.get('protection',''),
                                public=request.GET.get('protection','').startswith('public'),
                                public_mp4_download=request.GET.get('protection','')=="public-mp4-download",
                                width = request.GET.get('width',''),
                                height = request.GET.get('height',''),
                                captions = request.GET.get('captions',''),
                                filename=filename,
                                file = f)

                @login_required
                @rendered_with('main/delete_confirm.html')
                def delete_file(request,id):
                    f = get_object_or_404(File,id=id)
                    if request.method == "POST":
                        video = f.video
                        f.delete()
                        return HttpResponseRedirect(video.get_absolute_url())
                    else:
                        return dict()

                @login_required
                @rendered_with('main/delete_confirm.html')
                def delete_video(request,id):
                    v = get_object_or_404(Video,id=id)
                    if request.method == "POST":
                        series = v.series
                        v.delete()
                        return HttpResponseRedirect(series.get_absolute_url())
                    else:
                        return dict()

                @login_required
                @rendered_with('main/delete_confirm.html')
                def delete_series(request,id):
                    s = get_object_or_404(Series,id=id)
                    if request.method == "POST":
                        s.delete()
                        return HttpResponseRedirect("/")
                    else:
                        return dict()

                @login_required
                @rendered_with('main/delete_confirm.html')
                def delete_operation(request,id):
                    o = get_object_or_404(Operation,id=id)
                    if request.method == "POST":
                        video = o.video
                        o.delete()
                        return HttpResponseRedirect(video.get_absolute_url())
                    else:
                        return dict()


                @login_required
                @rendered_with('main/pcp_submit.html')
                def video_pcp_submit(request,id):
                    video = get_object_or_404(Video,id=id)
                    if request.method == "POST":
                        filename = video.filename()
                        # send to podcast producer
                        pull_from_tahoe_and_submit_to_pcp.delay(video.id,
                                                                request.user,
                                                                request.POST.get('workflow',''),
                                                                settings.PCP_BASE_URL,settings.PCP_USERNAME,settings.PCP_PASSWORD)
                        return HttpResponseRedirect(video.get_absolute_url())        
                    try:
                        p = PCP(settings.PCP_BASE_URL,
                                settings.PCP_USERNAME,
                                settings.PCP_PASSWORD)
                        workflows = p.workflows()
                    except:
                        workflows = []
                    return dict(video=video,workflows=workflows,
                                kino_base=settings.PCP_BASE_URL)

                @login_required
                def video_zencoder_submit(request,id):
                    video = get_object_or_404(Video,id=id)
                    if request.method == "POST":
                        tahoe_url = video.tahoe_download_url()
                        if not tahoe_url:
                            return HttpResponse("not stored in tahoe")
                        zen = Zencoder(settings.ZENCODER_API_KEY)
                        job = zen.job.create(tahoe_url)
                        f = File.objects.create(video=video,
                                                label="zencoder file",
                                                url=job.body['outputs'][0]['url'],
                                                location_type='zencoder')
                        return HttpResponseRedirect(video.get_absolute_url())
                    return HttpResponse("POST only")

                @login_required
                @rendered_with('main/add_file.html')
                def video_add_file(request,id):
                    video = get_object_or_404(Video,id=id)
                    if request.method == "POST":
                        form = video.add_file_form(request.POST)
                        if form.is_valid():
                            f = form.save(commit=False)
                            f.video = video
                            f.save()
                        else:
                            pass
                        return HttpResponseRedirect(video.get_absolute_url())
                    return dict(video=video)

                @login_required
                def video_select_poster(request,id,image_id):
                    video = get_object_or_404(Video,id=id)
                    image = get_object_or_404(Image,id=image_id)
                    # clear any existing ones for the video
                    Poster.objects.filter(video=video).delete()
                    p = Poster.objects.create(video=video,image=image)
                    return HttpResponseRedirect(video.get_absolute_url())


                @login_required
                @rendered_with('main/workflows.html')
                def list_workflows(request):
                    try:
                        p = PCP(settings.PCP_BASE_URL,
                                settings.PCP_USERNAME,
                                settings.PCP_PASSWORD)
                        workflows = p.workflows()
                    except:
                        workflows = []
                    return dict(workflows=workflows,
                                kino_base=settings.PCP_BASE_URL)

                @login_required
                @rendered_with("main/search.html")
                def search(request):
                    q = request.GET.get('q','')
                    results = dict(count=0)
                    if q:
                        r = Series.objects.filter(
                            Q(title__icontains=q) |
                            Q(creator__icontains=q) |
                            Q(contributor__icontains=q) |
                            Q(language__icontains=q) |
                            Q(description__icontains=q) |
                            Q(subject__icontains=q) |
                            Q(license__icontains=q)             
                            )
                        results['count'] += r.count()
                        results['series'] = r

                        r = Video.objects.filter(
                            Q(title__icontains=q) |
                            Q(creator__icontains=q) |
                            Q(language__icontains=q) |
                            Q(description__icontains=q) |
                            Q(subject__icontains=q) |
                            Q(license__icontains=q)             
                            )
                        results['count'] += r.count()
                        results['videos'] = r

                    return dict(q=q,results=results)

                def tag_autocomplete(request):
                    q = request.GET.get('q','')
                    r = Tag.objects.filter(name__icontains=q)
                    return HttpResponse("\n".join([t.name for t in list(r)]))

                def subject_autocomplete(request):
                    q = request.GET.get('q','')
                    q = q.lower()
                    r = Video.objects.filter(subject__icontains=q)
                    all_subjects = dict()
                    for v in r:
                        s = v.subject.lower()
                        for p in s.split(","):
                            p = p.strip()
                            all_subjects[p] = 1
                    r = Series.objects.filter(subject__icontains=q)
                    for v in r:
                        s = v.subject.lower()
                        for p in s.split(","):
                            p = p.strip()
                            all_subjects[p] = 1

                    return HttpResponse("\n".join(all_subjects.keys()))

                @rendered_with("main/surelink.html")
                def surelink(request):
                    PROTECTION_KEY = settings.SURELINK_PROTECTION_KEY
                    results = []
                    if request.GET.get('files',''):
                        for filename in request.GET.get('files','').split('\n'):
                            filename = filename.strip()
                            s = SureLink(filename,
                                         int(request.GET.get('width','0')),
                                         int(request.GET.get('height','0')),
                                         request.GET.get('captions',''),
                                         request.GET.get('poster',''),
                                         request.GET.get('protection',''),
                                         request.GET.get('authtype',''),
                                         request.GET.get('player',''),
                                         PROTECTION_KEY)
                            results.append(s)
                    return dict(protection=request.GET.get('protection',''),
                                public=request.GET.get('protection','').startswith('public'),
                                public_mp4_download=request.GET.get('protection','')=="public-mp4-download",
                                width = request.GET.get('width',''),
                                height = request.GET.get('height',''),
                                captions = request.GET.get('captions',''),
                                results = results,
                                rows = len(results) * 3,
                                files = request.GET.get('files',''))
