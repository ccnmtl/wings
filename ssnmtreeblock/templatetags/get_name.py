from django import template
register = template.Library()
    
@register.simple_tag
def get_name_for_box (box, user):
    return box.name(user)
