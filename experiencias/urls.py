from django.urls import path
from . import views

urlpatterns = [
    path('admin-dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('categorias/', views.gestionar_categorias, name='gestionar_categorias'),
    path('categorias/editar/<int:pk>/', views.admin_editar_categoria, name='admin_editar_categoria'),
    path('categorias/eliminar/<int:pk>/', views.admin_eliminar_categoria, name='admin_eliminar_categoria'),
    path('guia-dashboard/', views.guia_dashboard, name='guia_dashboard'),
    path('experiencia/crear/', views.crear_experiencia, name='crear_experiencia'),
    path('experiencia/editar/<int:pk>/', views.editar_experiencia, name='editar_experiencia'),
    path('inscribir/<int:experiencia_id>/', views.inscribir_experiencia, name='inscribir_experiencia'),
    path('mis-reservas/', views.mis_reservas, name='mis_reservas'),
    path('admin/experiencias/', views.admin_gestionar_experiencias, name='admin_gestionar_experiencias'),
    path('admin/experiencias/editar/<int:pk>/', views.admin_editar_experiencia, name='admin_editar_experiencia'),
    path('admin/experiencias/eliminar/<int:pk>/', views.admin_eliminar_experiencia, name='admin_eliminar_experiencia'),   
    path('admin/reservas/', views.admin_gestionar_reservas, name='admin_gestionar_reservas'),   
]