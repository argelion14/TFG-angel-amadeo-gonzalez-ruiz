from django.db import models
import os
from django.contrib.auth.models import AbstractUser


class Periodicidad(models.Model):
    #id = models.BigAutoField(primary_key=True)
    tipo_periodicidad = models.CharField(max_length=40)
    periodosanuales = models.IntegerField()
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'periodicidad'

    def __str__(self):
        return self.tipo_periodicidad


class PartnershipAgreement(models.Model):
    #id = models.BigAutoField(primary_key=True)
    estado = models.CharField(max_length=40)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'partnership_agreement'

    def __str__(self):
        return self.estado


class Institucion(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombreinstitucion = models.CharField(max_length=200, null=True)
    email = models.EmailField(max_length=200, null=True)
    pais = models.CharField(max_length=200, null=True)
    
    class Meta:
        db_table = 'institucion'

    def __str__(self):
        return self.nombreinstitucion


class Proyecto(models.Model):
    proyecto_id = models.AutoField(primary_key=True)
    nombreproyecto = models.CharField(max_length=200)
    sigla = models.CharField(max_length=10, blank=True, null=True)
    id_referencia = models.IntegerField(blank=True, null=True)
    web = models.CharField(max_length=100, blank=True, null=True)
    notas = models.CharField(max_length=500, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)
    coordina_institucion = models.ForeignKey(Institucion, on_delete=models.CASCADE)
    partnership_agreement = models.ForeignKey(PartnershipAgreement, on_delete=models.CASCADE, blank=True, null=True)
    periodicidad = models.ForeignKey(Periodicidad, on_delete=models.CASCADE)
    fecha_fin = models.DateField()
    fecha_inicio = models.DateField()

    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)
    
    class Meta:
        db_table = 'proyecto'

    def __str__(self):
        return self.nombreproyecto


class File(models.Model):
    #id = models.BigAutoField(primary_key=True)
    file = models.FileField(upload_to="archivos/",null=False, blank=False,)
    file_proyecto_id = models.ForeignKey(Proyecto, on_delete=models.CASCADE,null=False, blank=False)

    class Meta:
        db_table = 'file'

    def __str__(self):
        return self.file

    def delete(self, *args, **kwargs):
        if os.path.isfile(self.file.path):
            os.remove(self.file.path)
        super(File, self).delete(*args, **kwargs)

class Presupuesto(models.Model):
    #id = models.BigAutoField(primary_key=True)
    proyecto = models.OneToOneField(Proyecto, on_delete=models.CASCADE)
    organismo_financiador = models.CharField(max_length=100, null=True, blank=True)
    total = models.CharField(max_length=100, null=True, blank=True)
    presentacion = models.DateField(auto_now = False,auto_now_add=False, null=True, blank=True)
    
    class Meta:
        db_table = 'presupuesto'

class Departamento(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombredepartamento = models.CharField(max_length=200)
    correo = models.EmailField(max_length=200, null=True, blank=True)

    class Meta:
        db_table = 'departamento'

    def __str__(self):
        return self.nombredepartamento


"""
class Usuario(AbstractUser):
    departamentouser = models.ForeignKey(Departamento, on_delete=models.CASCADE, null=True, blank=True)
    vinculacion = models.CharField(max_length=200, null=True, blank=True)
    notas = models.CharField(max_length=200, null=True, blank=True)
    proyectos = models.ManyToManyField(Proyecto, blank=True)

    class Meta:
        db_table = 'ParticipanteOri'

    def __str__(self):
        return f'{self.first_name},{self.last_name}'
"""

class Participante(AbstractUser):
    
    username = models.CharField(max_length=200)
    
    vinculacion = models.CharField(max_length=200, null=True, blank=True)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE, null=True, blank=True)
    email = models.EmailField(max_length=200, unique=True)
    notas = models.CharField(max_length=200, null=True, blank=True)
    #https://www.youtube.com/watch?v=QBzsoQPgJQ8&t=198s
    
    
    
    #proyectos = models.ManyToManyField(Proyecto, blank=True)


    #https://www.youtube.com/watch?v=eIG0xq00p5A
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    class Meta:
        db_table = 'participante'

    def __str__(self):
        return self.username


class Rol(models.Model):
    #id = models.BigAutoField(primary_key=True)
    rolename = models.CharField(max_length=200)

    class Meta:
        db_table = 'rol'

    def __str__(self):
        return self.rolename


class Periodo(models.Model):
    #id = models.BigAutoField(primary_key=True)
    tiempo = models.CharField(max_length=200)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

    class Meta:
        db_table = 'periodo'
        unique_together = ('id','proyecto')

    def __str__(self):
        return self.tiempo


class Timesheet(models.Model):
    
    
    #participante_participa_proyecto = models.ForeignKey(Participante, on_delete=models.CASCADE, null=False, blank=False, related_name='participante_proyectos')
    #id = models.BigAutoField(primary_key=True)
    tipo = models.CharField(max_length=200)
    rol = models.ForeignKey(Rol, on_delete=models.CASCADE, null=True, blank=True)
    periodo = models.ForeignKey(Periodo, on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        db_table = 'timesheet'

    def __str__(self):
        return self.tipo





class Programa(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombreprograma = models.CharField(max_length=200)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'programa'


class Subprograma(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombresubprograma = models.CharField(max_length=200)
    programa = models.ForeignKey(Programa, on_delete=models.CASCADE)
    hijosubprograma = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True)
    hijoprograma = models.ForeignKey(Programa, on_delete=models.CASCADE, blank=True, null=True)
    
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'subprograma'
        unique_together = ('id','programa')


class Convocatoria(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombreconvocatoria = models.CharField(max_length=200)
    tiempo = models.CharField(max_length=200)

    #convocatorias_subprogramas = models.ManyToManyField(Subprograma)

    class Meta:
        db_table = 'convocatoria'

    def __str__(self):
        return self.tipo


class ConvocatoriaConvocatoriasSubprogramas(models.Model):
    #id = models.BigAutoField(primary_key=True)
    convocatoria = models.ForeignKey(Convocatoria, on_delete=models.CASCADE)
    subprograma = models.ForeignKey('Subprograma', on_delete=models.CASCADE)

    class Meta:
        db_table = 'convocatoria_convocatorias_subprogramas'
        unique_together = (('convocatoria', 'subprograma'),)


class ParticipanteProyectos(models.Model):
    #id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, on_delete=models.CASCADE)
    proyecto = models.ForeignKey('Proyecto', on_delete=models.CASCADE)

    class Meta:
        db_table = 'participante_proyectos'
        unique_together = (('participante', 'proyecto'),)


class ProyectoParticipaInstitucion(models.Model):
    id = models.BigAutoField(primary_key=True)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    institucion = models.ForeignKey(Institucion, on_delete=models.CASCADE)

    class Meta:
        db_table = 'proyecto_participa_institucion'
        unique_together = (('proyecto', 'institucion'),)



class Posee(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(ParticipanteProyectos, on_delete=models.CASCADE)
    proyecto = models.ForeignKey(ParticipanteProyectos, on_delete=models.CASCADE)
    timesheet = models.ForeignKey('Timesheet', on_delete=models.CASCADE)

    class Meta:
        db_table = 'posee'
        unique_together = (('participante', 'proyecto', 'timesheet'),)


class Sepresenta(models.Model):
    id = models.BigAutoField(primary_key=True)
    convocatoria = models.ForeignKey(ConvocatoriaConvocatoriasSubprogramas, on_delete=models.CASCADE)
    subprograma = models.ForeignKey(ConvocatoriaConvocatoriasSubprogramas, on_delete=models.CASCADE)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

    class Meta:
        db_table = 'sepresenta'
        unique_together = (('convocatoria', 'subprograma', 'proyecto'),)