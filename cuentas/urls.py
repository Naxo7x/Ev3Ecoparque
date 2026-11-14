from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.iniciar_sesion, name='login'),
    path('logout/', views.cerrar_sesion, name='logout'),
    path('usuarios/', views.lista_usuarios, name='lista_usuarios'),
    path('usuarios/editar/<int:user_id>/', views.editar_usuario, name='editar_usuario'),
    path('usuarios/eliminar/<int:user_id>/', views.eliminar_usuario, name='eliminar_usuario'),
    path('usuarios/crear/', views.crear_usuario, name='crear_usuario'),
]