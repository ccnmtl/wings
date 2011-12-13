from django import template
from ssnmtreeblock.models import name_for_box
register = template.Library()
    
@register.simple_tag
def get_name_for_box (box, user):
    return name_for_box(box, user)
