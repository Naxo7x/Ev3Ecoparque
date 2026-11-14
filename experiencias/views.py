from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib import messages
from .models import Experiencia, Categoria, Reserva
from .forms import ExperienciaForm, CategoriaForm

# Create your views here.

def es_admin(user):
    return user.is_authenticated and hasattr(user, 'perfil') and user.perfil.rol == 'ADMIN'

def es_guia(user):
    return user.is_authenticated and hasattr(user, 'perfil') and user.perfil.rol == 'GUIA'

def es_turista(user):
    return user.is_authenticated and hasattr(user, 'perfil') and user.perfil.rol == 'Cliente'

def es_admin_o_guia(user):
    return user.is_authenticated and hasattr(user, 'perfil') and user.perfil.rol in ['ADMIN', 'GUIA']



@user_passes_test(es_admin)
def admin_dashboard(request):
    experiencias = Experiencia.objects.all()
    categorias = Categoria.objects.all()
    reservas = Reserva.objects.all()
    return render(request, 'experiencias/panel_admin.html', {
        'experiencias': experiencias,
        'categorias': categorias,
        'reservas': reservas
    })

@user_passes_test(es_admin)
def gestionar_categorias(request):
    categorias = Categoria.objects.all()
    if request.method == 'POST':
        form = CategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Categoría creada correctamente.')
            return redirect('gestionar_categorias')
    else:
        form = CategoriaForm()
    return render(request, 'experiencias/gestion_categorias.html', {
        'categorias': categorias,
        'form': form
    })

@user_passes_test(es_admin)
def admin_editar_categoria(request, pk):
    categoria = get_object_or_404(Categoria, pk=pk)
    if request.method == 'POST':
        form = CategoriaForm(request.POST, instance=categoria)
        if form.is_valid():
            form.save()
            messages.success(request, 'Categoría actualizada correctamente.')
            return redirect('gestionar_categorias')
    else:
        form = CategoriaForm(instance=categoria)
    return render(request, 'experiencias/admin_editar_categoria.html', {
        'form': form,
        'categoria': categoria
    })

@user_passes_test(es_admin)
def admin_eliminar_categoria(request, pk):
    categoria = get_object_or_404(Categoria, pk=pk)
    categoria.delete()
    messages.success(request, 'Categoría eliminada correctamente.')
    return redirect('gestionar_categorias')

@user_passes_test(es_guia)
def guia_dashboard(request):
    experiencias = Experiencia.objects.filter(creador=request.user)
    return render(request, 'experiencias/panel_guia.html', {'experiencias': experiencias})

@user_passes_test(es_admin_o_guia)
def crear_experiencia(request):
    if request.method == 'POST':
        form = ExperienciaForm(request.POST)
        if form.is_valid():
            experiencia = form.save(commit=False)
            experiencia.creador = request.user 
            experiencia.save()
            if hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN':
                return redirect('admin_dashboard')
            else:
                return redirect('guia_dashboard')
    else:
        form = ExperienciaForm()
    return render(request, 'experiencias/crear_experiencia.html', {'form': form})

@user_passes_test(es_guia)
def editar_experiencia(request, pk):
    experiencia = get_object_or_404(Experiencia, pk=pk, creador=request.user)
    if request.method == 'POST':
        form = ExperienciaForm(request.POST, instance=experiencia)
        if form.is_valid():
            form.save()
            return redirect('guia_dashboard')
    else:
        form = ExperienciaForm(instance=experiencia)
    return render(request, 'experiencias/editar_experiencia.html', {'form': form, 'experiencia': experiencia})


@login_required
def inscribir_experiencia(request, experiencia_id):
    experiencia = get_object_or_404(Experiencia, pk=experiencia_id)
    reservas_actuales = Reserva.objects.filter(experiencia=experiencia).count()
    if reservas_actuales < experiencia.cupo_maximo:
        Reserva.objects.get_or_create(
            usuario=request.user,
            experiencia=experiencia
        )
        messages.success(request, f'¡Te has inscrito exitosamente en {experiencia.titulo}!')
    else:
        messages.error(request, 'Lo sentimos, esta experiencia ya ha completado todos sus cupos.')
        
    return redirect('mis_reservas')

@login_required
def mis_reservas(request):
    reservas = Reserva.objects.filter(usuario=request.user)
    return render(request, 'experiencias/reservas_usr.html', {'reservas': reservas})

@login_required
def admin_gestionar_experiencias(request):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    experiencias = Experiencia.objects.all()
    return render(request, 'experiencias/admin_experiencias.html', {'experiencias': experiencias})

@login_required
def admin_editar_experiencia(request, pk):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    
    experiencia = get_object_or_404(Experiencia, pk=pk)
    categorias = Categoria.objects.all()
    
    if request.method == 'POST':
        experiencia.titulo = request.POST.get('titulo')
        experiencia.descripcion = request.POST.get('descripcion')
        experiencia.precio = request.POST.get('precio')
        experiencia.categoria_id = request.POST.get('categoria')
        experiencia.activo = request.POST.get('activo') == 'on'
        experiencia.save()   
        messages.success(request, 'Experiencia actualizada correctamente.')
        return redirect('admin_gestionar_experiencias')
    return render(request, 'experiencias/admin_editar_experiencia.html', {'experiencia': experiencia, 'categorias': categorias})

@login_required
def admin_eliminar_experiencia(request, pk):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')   
    experiencia = get_object_or_404(Experiencia, pk=pk)
    experiencia.delete()
    messages.success(request, 'Experiencia eliminada correctamente.')
    return redirect('admin_gestionar_experiencias')

@login_required
def admin_gestionar_reservas(request):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    reservas = Reserva.objects.all()
    return render(request, 'experiencias/admin_reservas.html', {'reservas': reservas})