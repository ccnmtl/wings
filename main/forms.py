from models import Video, Series
from django import forms

class AddSeriesForm(forms.ModelForm):
    class Meta:
        model = Series

class UploadVideoForm(forms.ModelForm):
    class Meta:
        model = Video


