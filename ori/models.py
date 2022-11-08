import os

from django.contrib.auth.models import AbstractUser
from django.db import models

#https://www.youtube.com/watch?v=QBzsoQPgJQ8&t=198s
#https://www.youtube.com/watch?v=eIG0xq00p5A

class Periodicidad(models.Model):
    #id = models.BigAutoField(primary_key=True)
    tipo_periodicidad = models.CharField(max_length=40, unique=True)
    periodosanuales = models.IntegerField(unique=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'periodicidad'

    def __str__(self):
        return self.tipo_periodicidad

class PartnershipAgreement(models.Model):
    #id = models.BigAutoField(primary_key=True)
    estado = models.CharField(max_length=100, unique=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'partnership_agreement'

    def __str__(self):
        return self.estado

class Institucion(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombreinstitucion = models.CharField(max_length=200, unique=True)
    email = models.EmailField(max_length=200, null=True)
    pais = models.CharField(max_length=200, null=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)
    
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
    file_proyecto_id = models.OneToOneField(Proyecto, on_delete=models.CASCADE,null=False, blank=False)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

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
    organismo_financiador = models.CharField(max_length=100)
    total = models.CharField(max_length=100)
    presentacion = models.DateField(auto_now = False,auto_now_add=False, null=True, blank=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'presupuesto'

class Departamento(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombredepartamento = models.CharField(max_length=200, unique=True)
    correo = models.EmailField(max_length=200, null=True, blank=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'departamento'

    def __str__(self):
        return self.nombredepartamento

class Participante(AbstractUser):
    username = models.CharField(max_length=200, unique=True)
    vinculacion = models.CharField(max_length=200, null=True, blank=True)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE, null=True, blank=True)
    email = models.EmailField(max_length=200, unique=True)
    notas = models.CharField(max_length=200, null=True, blank=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'participante'

    def __str__(self):
        return self.username

class Rol(models.Model):
    #id = models.BigAutoField(primary_key=True)
    rolename = models.CharField(max_length=200, unique=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'rol'

    def __str__(self):
        return self.rolename

class Periodo(models.Model):
    #id = models.BigAutoField(primary_key=True)
    num_periodo = models.IntegerField()
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'periodo'
        unique_together = ('id','proyecto')

    def __str__(self):
        return str(self.num_periodo)

class Timesheet(models.Model):
    #id = models.BigAutoField(primary_key=True)
    #nombretimesheet = models.CharField(max_length=200)
    tipo = models.CharField(max_length=200)
    rol = models.ForeignKey(Rol, on_delete=models.CASCADE)
    periodo = models.ForeignKey(Periodo, on_delete=models.CASCADE)
    intellectual_output = models.CharField(max_length=200,null=True, blank=True)
    num_working_days = models.IntegerField(null=True, blank=True)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'timesheet'
        unique_together = ('rol', 'periodo')

    def __str__(self):
        return str(self.id)

class Tarea(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombretarea = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=200)
    dia = models.DateField()
    lugar = models.CharField(max_length=200)
    timesheet = models.ForeignKey(Timesheet, on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'tarea'

    def __str__(self):
        return self.nombretarea

class Programa(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombreprograma = models.CharField(max_length=200)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'programa'

    def __str__(self):
        return self.nombreprograma

class Subprograma(models.Model):
    #id = models.BigAutoField(primary_key=True)
    nombresubprograma = models.CharField(max_length=200, unique=True)
    programa = models.ForeignKey(Programa, on_delete=models.CASCADE,related_name='programapadre')
    padresubprograma = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True,related_name='subprogramahijo')
    padreprograma = models.ForeignKey(Programa, on_delete=models.CASCADE, blank=True, null=True,related_name='programahijo') 
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'subprograma'
        unique_together = ('id','programa')

    def __str__(self):
        return self.nombresubprograma

class Convocatoria(models.Model):
    #id = models.BigAutoField(primary_key=True)
    anio = models.IntegerField()
    #tiempo = models.CharField(max_length=200)
    #anio = models.DateField()
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)    

    class Meta:
        db_table = 'convocatoria'

    def __str__(self):
        return str(self.anio)

class ConvocatoriaConvocatoriasSubprogramas(models.Model):
    #id = models.BigAutoField(primary_key=True)
    convocatoria = models.ForeignKey(Convocatoria, on_delete=models.CASCADE)
    subprograma = models.ForeignKey('Subprograma', on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'convocatoria_convocatorias_subprogramas'
        unique_together = ('convocatoria', 'subprograma')
    
    def __str__(self):
        return "Convocatoria: " + str(self.convocatoria) + " y subprograma: " + str(self.subprograma)

class ParticipanteProyectos(models.Model):
    #id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, on_delete=models.CASCADE)
    proyecto = models.ForeignKey('Proyecto', on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'participante_proyectos'
        unique_together = ('participante', 'proyecto')

    def __str__(self):
        return "Participante: " + str(self.participante) + " y proyecto: " + str(self.proyecto)

class ProyectoParticipaInstitucion(models.Model):
    #id = models.BigAutoField(primary_key=True)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    institucion = models.ForeignKey(Institucion, on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'proyecto_participa_institucion'
        unique_together = (('proyecto', 'institucion'),)

    def __str__(self):
        return "Proyecto: " + str(self.proyecto) + " y institución: " + str(self.institucion)

class Posee(models.Model):
    #id = models.BigAutoField(primary_key=True)
    participanteproyectos = models.ForeignKey(ParticipanteProyectos, on_delete=models.CASCADE)
    timesheet = models.OneToOneField('Timesheet', on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'posee'
        unique_together = ('participanteproyectos', 'timesheet')

    def delete(self, *args, **kwargs):
        self.timesheet.delete()
        super(Posee, self).delete(*args, **kwargs)
        
class Sepresenta(models.Model):
    #id = models.BigAutoField(primary_key=True)
    convocatoriasubprogramas = models.ForeignKey(ConvocatoriaConvocatoriasSubprogramas, on_delete=models.CASCADE)
    proyecto = models.OneToOneField(Proyecto, on_delete=models.CASCADE)
    fecha_creacion = models.DateField(auto_now = False,auto_now_add=True, null=True)

    class Meta:
        db_table = 'sepresenta'
        unique_together = ('convocatoriasubprogramas', 'proyecto')

    def delete(self, *args, **kwargs):
        self.proyecto.delete()
        super(Sepresenta, self).delete(*args, **kwargs)
