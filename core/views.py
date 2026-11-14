from django.shortcuts import render, redirect  # <--- Asegúrate de importar redirect
from experiencias.models import Experiencia, Categoria


# Create your views here.
def home(request):
    if (request.user.is_authenticated and hasattr(request.user, 'perfil') and request.user.perfil.rol == 'GUIA'):
        return redirect('guia_dashboard')
    experiencias = Experiencia.objects.filter(activo=True, categoria__activo=True)
    categorias = Categoria.objects.filter(activo=True)
    return render(request,'core/home.html',{ 'experiencias': experiencias, 'categorias': categorias},)