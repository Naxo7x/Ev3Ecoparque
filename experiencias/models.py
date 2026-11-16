from django.db import models
from django.contrib.auth.models import User

class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


class Experiencia(models.Model):
    titulo = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    fecha_hora = models.DateTimeField(null=True, blank=True)
    cupo_maximo = models.PositiveIntegerField(default=10)
    creador = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.titulo


class Reserva(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    experiencia = models.ForeignKey(Experiencia, on_delete=models.CASCADE)
    fecha_reserva = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Reserva de {self.usuario.username} para {self.experiencia.titulo}"