from django import template
register = template.Library()
    
@register.simple_tag
def get_name_for_box (box, user):
    return box.name(user)
    
    
@register.simple_tag
def list_of_support_types_for (box, user, block):
    return box.support_types_for_user_and_block(user, block)
