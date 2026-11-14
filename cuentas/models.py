from django.db import models
from django.contrib.auth.models import User

class Perfil(models.Model):
    ROLES = (
        ('ADMIN', 'Administrador'),
        ('GUIA', 'Guía'),
        ('Cliente', 'Cliente'),
    )
    
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    rol = models.CharField(max_length=20, choices=ROLES, default='Cliente')

    def __str__(self):
        return f"{self.user.username} - {self.rol}"