from django import forms
from .models import Experiencia, Categoria

class ExperienciaForm(forms.ModelForm):
    class Meta:
        model = Experiencia
        fields = ['titulo', 'descripcion', 'precio', 'categoria', 'fecha_hora', 'cupo_maximo', 'activo']
        widgets = {
            'fecha_hora': forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form-control'}),
            'titulo': forms.TextInput(attrs={'class': 'form-control'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'precio': forms.NumberInput(attrs={'class': 'form-control'}),
            'categoria': forms.Select(attrs={'class': 'form-control'}),
            'cupo_maximo': forms.NumberInput(attrs={'class': 'form-control'}),
        }

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre', 'activo'] 
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
        }