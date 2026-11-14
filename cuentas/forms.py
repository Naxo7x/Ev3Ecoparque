from django import forms
from django.contrib.auth.models import User
from .models import Perfil

class PerfilForm(forms.ModelForm):
    class Meta:
        model = Perfil
        fields = ['telefono']
        widgets = {
            'telefono': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '+569XXXXXXXX'}),
}