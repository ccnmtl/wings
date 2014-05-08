from annoying.decorators import render_to
from django.http import HttpResponseRedirect, HttpResponse
from pagetree.helpers import get_section_from_path, get_module
from pagetree.helpers import needs_submit, submitted
from django.contrib.auth.decorators import login_required

from .models import get_stand

from wings.analytics.models import ActionType

from wings.wings_main.views import decoration_info, whether_to_show_decorations
from wings.wings_main.views import check_next_page
from wings.wings_main.views import destination_on_check_next_page_fail


class stand(object):

    def __init__(*args, **kwargs):
        pass

    def __call__(self, func):
        def stand_func(request, *args, **kwargs):
            stand = get_stand(request.get_host())
            if not stand:
                return HttpResponse("no such site")
            request.stand = stand
            items = func(request, *args, **kwargs)
            if isinstance(items, type({})):
                items['stand'] = stand
            return items
        return stand_func


@login_required
@render_to('main/page.html')
@stand()
def page(request, path):
    hierarchy = request.get_host()
    section = get_section_from_path(path, hierarchy=hierarchy)
    root = section.hierarchy.get_root()
    module = get_module(section)

    if not request.stand.can_view(request.user):
        return HttpResponse("you do not have permission")
    can_edit = request.stand.can_edit(request.user)
    can_admin = request.stand.can_admin(request.user)
    if section.id == root.id:
        # trying to visit the root page
        if section.get_next():
            # just send them to the first child
            return HttpResponseRedirect(section.get_next().get_absolute_url())
        else:
            # send them to the stand admin interface
            return HttpResponseRedirect("/_stand/")

    if request.method == "POST":
        # user has submitted a form. deal with it
        section.submit(request.POST, request.user)
        if request.POST['destination'] == '':
            return HttpResponseRedirect(section.get_absolute_url())

        if request.POST['destination'] == 'previous':
            return (
                HttpResponseRedirect(section.get_previous().get_absolute_url())
            )

        if request.POST['destination'] == 'next':
            return HttpResponseRedirect(section.get_next().get_absolute_url())

    else:
        if True:
            # Wings-specific modifications:
            if not check_next_page(request, section):
                return (
                    HttpResponseRedirect(
                        destination_on_check_next_page_fail(request))
                )
            show_decorations = whether_to_show_decorations(section)
            the_decoration_info = decoration_info(section)
            action_type_summary = ActionType.summary()

        return dict(section=section,
                    module=module,
                    needs_submit=needs_submit(section),
                    is_submitted=submitted(section, request.user),
                    stand=request.stand,
                    modules=root.get_children(),
                    root=section.hierarchy.get_root(),
                    can_edit=can_edit,
                    can_admin=can_admin,
                    show_decorations=show_decorations,
                    decoration_info=the_decoration_info,
                    action_type_summary=action_type_summary
                    )


@login_required
@render_to('main/edit_page.html')
@stand()
def edit_page(request, path):
    hierarchy = request.get_host()
    section = get_section_from_path(path, hierarchy=hierarchy)
    if not request.stand.can_edit(request.user):
        return HttpResponse("you do not have admin permission")
    can_admin = request.stand.can_admin(request.user)
    root = section.hierarchy.get_root()
    return dict(section=section,
                module=get_module(section),
                modules=root.get_children(),
                stand=request.stand,
                can_admin=can_admin,
                available_pageblocks=request.stand.available_pageblocks(),
                root=section.hierarchy.get_root())