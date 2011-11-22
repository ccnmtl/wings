from django.db import models
from django.contrib.auth.models import User
from sorl.thumbnail.fields import ImageWithThumbnailsField
from django import forms
from pagetree.models import Section, Hierarchy, PageBlock

from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseNotFound, HttpRequest




class Participant(models.Model):



    id_string = models.IntegerField(unique=True) 
    #state =  models.TextField(default="",blank=True,null=True)
    
    user =  models.ForeignKey(User,blank=True,null=True)
    current_section = models.ForeignKey(Section,blank= True,null=True)

    def label(self):
        return self.__unicode__()

    def __unicode__(self):
        return "P%s" % self.id_string

    def has_user(self):
        return self.user != None
        
    def has_started_intervention(self):
        return self.has_user()
        #return True
        
    def current_url ( self):
        return self.current_section.get_absolute_url()


    def all_unlocked (self, section):
        #import pdb
        #pdb.set_trace()
        user = self.user
        for p in section.pageblock_set.all():
           if hasattr(p.block(),'unlocked'):
                 if p.block().unlocked(user) == False:
                     return False
        return True


    def log_visit (self, new_section):
        """" return true if it's ok for a participant to see this page.
        set the current section, also,         """
        
        #if 1 == 0:
        #print self
        #print new_section
        #import pdb
        #pdb.set_trace()
        
        #print 'previous'
        #print self.all_unlocked (new_section.get_previous())
        #print 'this one'
        #print self.all_unlocked (new_section)
        
        #import pdb
        #pdb.set_trace()
        if self.current_section == None:
            self.current_section = new_section.hierarchy.get_root().get_first_child()
            self.save()
        old_current_section = self.current_section
        if old_current_section == new_section:
            return True
        if old_current_section.get_next() == new_section:
        
            if not self.all_unlocked (old_current_section):
                return False #finish all the work on the old page before you move to this page.
                
            self.current_section = new_section
            self.save()
            return True
        node_list = []
        #note: given the UI, this code will seldom get executed in real life.
        traverse_tree( new_section.hierarchy.get_root(), node_list)
        if node_list.index(new_section) < node_list.index (old_current_section):
            return True #just navigated back; no big deal
        return False
        

def traverse_tree (node, the_list):
    the_list.append(node)
    kids = node.get_children()
    for k in kids:
        traverse_tree(k, the_list)
    

#monkey-patch method:
def user_participant (self):
    try:
        return Participant.objects.get(user=self)
    except Participant.DoesNotExist:
        return None
        
User.part = user_participant



if 1 == 0:
            TAHOE_BASE = "http://tahoe.ccnmtl.columbia.edu/"

            class Series(TimeStampedModel):
                title = models.CharField(max_length=256)
                creator = models.CharField(max_length=256,default="",blank=True)
                contributor = models.CharField(max_length=256,default="",blank=True)
                language = models.CharField(max_length=256,default="",blank=True)
                description = models.TextField(default="",blank=True,null=True)
                subject = models.TextField(default="",blank=True,null=True)    
                license = models.CharField(max_length=256,default="",blank=True)    

                uuid = UUIDField()

                tags = TaggableManager(blank=True)

                def __unicode__(self):
                    return self.title

                def get_absolute_url(self):
                    return "/series/%d/" % self.id

                def add_video_form(self):
                    class AddVideoForm(forms.ModelForm):
                        class Meta:
                            model = Video
                            exclude = ('series')
                    return AddVideoForm()

                def edit_form(self,data=None):
                    class EditForm(forms.ModelForm):
                        class Meta:
                            model = Series
                    if data:
                        return EditForm(data,instance=self)
                    else:
                        return EditForm(instance=self)

            class Video(TimeStampedModel):
                series = models.ForeignKey(Series)
                title = models.CharField(max_length=256)
                creator = models.CharField(max_length=256,default="",blank=True)
                description = models.TextField(default="",blank=True,null=True)
                subject = models.TextField(default="",blank=True,null=True)    
                license = models.CharField(max_length=256,default="",blank=True)    
                language = models.CharField(max_length=256,default="",blank=True)

                uuid = UUIDField()

                tags = TaggableManager(blank=True)

                def tahoe_file(self):
                    r = self.file_set.filter(location_type='tahoe')
                    if r.count():
                        return r[0]
                    else:
                        return None

                def source_file(self):
                    r = self.file_set.filter(label='source file')
                    if r.count():
                        return r[0]
                    else:
                        return None


                def cap(self):
                    t = self.tahoe_file()
                    if t:
                        return t.cap
                    else:
                        return None

                def tahoe_download_url(self):
                    t = self.tahoe_file()
                    if t:
                        return t.tahoe_download_url()
                    else:
                        return ""

                def enclosure_url(self):
                    return self.tahoe_download_url()

                def filename(self):
                    r = self.file_set.filter().exclude(filename="")
                    if r.count():
                        return r[0].filename
                    else:
                        return "none"

                def get_absolute_url(self):
                    return "/video/%d/" % self.id

                def get_oembed_url(self):
                    return "/video/%d/oembed/" % self.id

                def add_file_form(self,data=None):
                    class AddFileForm(forms.ModelForm):
                        class Meta:
                            model = File
                            exclude = ('video')
                    if data:
                        return AddFileForm(data)
                    else:
                        return AddFileForm()

                def edit_form(self,data=None):
                    class EditForm(forms.ModelForm):
                        class Meta:
                            model = Video
                    if data:
                        return EditForm(data,instance=self)
                    else:
                        return EditForm(instance=self)

                def get_dimensions(self):
                    t = self.source_file()
                    return (t.get_width(),t.get_height())

                def vital_thumb_url(self):
                    r = self.file_set.filter(location_type="vitalthumb")
                    if r.count() > 0:
                        f = r[0]
                        return f.url
                    return ""

                def cuit_url(self):
                    r = self.file_set.filter(location_type="cuit")
                    if r.count() > 0:
                        f = r[0]
                        return f.cuit_public_url()
                    return ""

                def poster_url(self):
                    if self.image_set.all().count() > 0:
                        # TODO: get absolute url of first image
                        # and use that
                        # return self.image_set.all()[0].image
                        pass
                    return "http://ccnmtl.columbia.edu/broadcast/posters/vidthumb_480x360.jpg",

                def cuit_poster_url(self):
                    try:
                        return File.objects.filter(video=self,location_type='cuitthumb')[0].url
                    except:
                        return None

                def is_mediathread_submit(self):
                    return self.file_set.filter(location_type="mediathreadsubmit").count() > 0

                def mediathread_submit(self):
                    r = self.file_set.filter(location_type="mediathreadsubmit")
                    if r.count() > 0:
                        f = r[0]
                        return (f.get_metadata("set_course"),f.get_metadata("username"),)
                    else:
                        return (None,None)

                def clear_mediathread_submit(self):
                    self.file_set.filter(location_type="mediathreadsubmit").delete()

                def is_vital_submit(self):
                    return self.file_set.filter(location_type="vitalsubmit").count() > 0

                def get_vital_submit_file(self):
                    return self.file_set.filter(location_type="vitalsubmit")[0]

                def vital_submit(self):
                    r = self.file_set.filter(location_type="vitalsubmit")
                    if r.count() > 0:
                        f = r[0]
                        return (f.get_metadata("set_course"),f.get_metadata("username"),f.get_metadata("notify_url"))
                    else:
                        return (None,None,None)

                def clear_vital_submit(self):
                    self.file_set.filter(location_type="vitalsubmit").delete()
                        
                def poster(self):
                    class DummyPoster:
                        dummy = True
                    r = Poster.objects.filter(video=self)
                    if r.count() > 0:
                        return r[0].image
                    else:
                        return DummyPoster()



            class File(TimeStampedModel):
                video = models.ForeignKey(Video)
                label = models.CharField(max_length=256,blank=True,null=True,default="")
                url = models.URLField(default="",blank=True,null=True,max_length=2000)
                cap = models.CharField(max_length=256,default="",blank=True,null=True)
                filename = models.CharField(max_length=256,blank=True,null=True)
                location_type = models.CharField(max_length=256,default="tahoe",
                                                 choices=(('tahoe','tahoe'),('pcp','pcp'),('cuit','cuit'),
                                                          ('youtube','youtube'),('none','none')))

                def tahoe_download_url(self):
                    if self.location_type == "tahoe":
                        return TAHOE_BASE + "file/" + self.cap + "/@@named=" + self.filename
                    else:
                        return None

                def pcp_filename(self):
                    return self.uuid + ".mp4"

                def set_metadata(self,field,value):
                    r = Metadata.objects.filter(file=self,field=field)
                    if r.count():
                        # update
                        m = r[0]
                        m.value = value
                        m.save()
                    else:
                        # add
                        m = Metadata.objects.create(file=self,field=field,value=value)

                def get_metadata(self,field):
                    r = Metadata.objects.filter(file=self,field=field)
                    if r.count():
                        return r[0].value
                    else:
                        return None

                def get_absolute_url(self):
                    return "/file/%d/" % self.id

                def get_width(self):
                    return int(self.metadata_set.filter(field="ID_VIDEO_WIDTH")[0].value)

                def get_height(self):
                    return int(self.metadata_set.filter(field="ID_VIDEO_HEIGHT")[0].value)

                # for these, if we don't know our width/height, 
                # we see if the video has a source file associated
                # with it that may have the dimensions
                def guess_width(self):
                    try:
                        return self.get_width()
                    except:
                        return self.video.get_dimensions()[0]
                        
                def guess_height(self):
                    try:
                        return self.get_height()
                    except:
                        return self.video.get_dimensions()[1]

                def surelinkable(self):
                    return self.location_type == 'cuit'

                def has_cuit_poster(self):
                    return File.objects.filter(video=self.video,location_type='cuitthumb').count() > 0

                def cuit_poster_url(self):
                    return File.objects.filter(video=self.video,location_type='cuitthumb')[0].url

                def cuit_public_url(self):
                    filename = self.filename[len("/www/data/ccnmtl/broadcast/"):]
                    return "http://ccnmtl.columbia.edu/stream/flv/%s" % filename

            class Metadata(models.Model):
                """ metadata that we've extracted. more about 
                encoding/file format kinds of stuff than dublin-core"""
                file = models.ForeignKey(File)
                field = models.CharField(max_length=256,default="")
                value = models.TextField(default="",blank=True,null=True)

                class Meta:
                    ordering = ('field',)


            class Operation(TimeStampedModel):
                video = models.ForeignKey(Video)
                action = models.CharField(max_length=256,default="")
                owner = models.ForeignKey(User)
                status = models.CharField(max_length=256,default="in progress")
                params = models.TextField(default="")
                uuid = UUIDField()

                def as_dict(self):
                    d = dict(action=self.action,
                             status=self.status,
                             params=self.params,
                             uuid=self.uuid,
                             id=self.id,
                             video_id=self.video.id,
                             video_title=self.video.title,
                             video_creator=self.video.creator,
                             series_id=self.video.series.id,
                             series_title=self.video.series.title,
                             modified=str(self.modified)[:19],
                             )
                    return d
                
            class OperationFile(models.Model):
                operation = models.ForeignKey(Operation)
                file = models.ForeignKey(File)

            class OperationLog(TimeStampedModel):
                operation = models.ForeignKey(Operation)
                info = models.TextField(default="")

            class Image(TimeStampedModel):
                video = models.ForeignKey(Video)

                image = ImageWithThumbnailsField(upload_to="images",thumbnail={'size' : (100,100)})

                class Meta:
                    order_with_respect_to = "video"

            class Poster(models.Model):
                video = models.ForeignKey(Video)
                image = models.ForeignKey(Image)

