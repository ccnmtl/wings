import os
import random
from django import template
from django.conf import settings

register = template.Library()


def is_image_file(filename):
    """Does `filename` appear to be an image file?"""
    img_types = [".jpg", ".jpeg", ".png", ".gif"]
    ext = os.path.splitext(filename)[1]
    return ext in img_types


@register.simple_tag
def random_image(path):
    """
    Select a random image file from the provided directory
    and return its href. `path` should be relative to MEDIA_ROOT.
    Usage:  <img src='{% random_image "images/whatever/" %}'>
    """
    images_location = os.path.realpath(settings.SITE_MEDIA_ROOT + path)
    return (
        path +
        random.choice(
            [f for f in os.listdir(images_location) if is_image_file(f)])
    )
