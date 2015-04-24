from django import template
from wings.riskblock.models import risk_score, risk_copy
register = template.Library()


@register.simple_tag
def get_risk_score(user):
    return risk_score(user)


@register.simple_tag
def get_risk_copy(block, user):
    return risk_copy(block, user)
