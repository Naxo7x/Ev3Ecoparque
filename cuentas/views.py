from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib import messages
from .models import Perfil  

# Create your views here.

def iniciar_sesion(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            try:
                perfil = user.perfil
                if perfil.rol == 'ADMIN':
                    return redirect('admin_dashboard')
                elif perfil.rol == 'GUIA':
                    return redirect('guia_dashboard')
                else:
                    return redirect('home')
            except Perfil.DoesNotExist:
                return redirect('home')
    else:
        form = AuthenticationForm()
    return render(request, 'cuentas/login.html', {'form': form})

def cerrar_sesion(request):
    logout(request)
    return redirect('home')

@login_required
def lista_usuarios(request):
    if hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN':
        perfiles = Perfil.objects.all()
        return render(request, 'cuentas/lista_usuarios.html', {'perfiles': perfiles})
    return redirect('home')

@login_required
def crear_usuario(request):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        rol = request.POST.get('rol')  
        if username and password:
            if User.objects.filter(username=username).exists():
                messages.error(request, 'El nombre de usuario ya existe.')
            else:
                user = User.objects.create_user(username=username, email=email, password=password)
                perfil, created = Perfil.objects.get_or_create(user=user)
                perfil.rol = rol
                perfil.save()         
                messages.success(request, 'Usuario creado exitosamente.')
                return redirect('lista_usuarios')
    return render(request, 'cuentas/crear_usuario.html')

@login_required
def editar_usuario(request, user_id):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    perfil = get_object_or_404(Perfil, user__id=user_id)
    if request.method == 'POST':
        nuevo_rol = request.POST.get('rol')
        nuevo_estado = request.POST.get('is_active') == 'on'
        perfil.rol = nuevo_rol
        perfil.save()
        user = perfil.user
        user.is_active = nuevo_estado
        user.save()
        messages.success(request, 'Usuario actualizado correctamente.')
        return redirect('lista_usuarios')
    return render(request, 'cuentas/editar_usuario.html', {'perfil': perfil})

@login_required
def eliminar_usuario(request, user_id):
    if not (hasattr(request.user, 'perfil') and request.user.perfil.rol == 'ADMIN'):
        return redirect('home')
    perfil = get_object_or_404(Perfil, user__id=user_id)
    if perfil.user != request.user:
        perfil.user.delete()
        messages.success(request, 'Usuario eliminado correctamente.')
        
    return redirect('lista_usuarios')