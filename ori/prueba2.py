# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Convocatoria(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombreconvocatoria = models.CharField(max_length=200)
    tiempo = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'convocatoria'


class ConvocatoriaConvocatoriasSubprogramas(models.Model):
    id = models.BigAutoField(primary_key=True)
    convocatoria = models.ForeignKey(Convocatoria, models.DO_NOTHING)
    subprograma = models.ForeignKey('Subprograma', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'convocatoria_convocatorias_subprogramas'
        unique_together = (('convocatoria', 'subprograma'),)


class Departamento(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombredepartamento = models.CharField(max_length=200)
    correo = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'departamento'


class File(models.Model):
    id = models.BigAutoField(primary_key=True)
    file = models.CharField(max_length=100)
    file_proyecto_id = models.ForeignKey('Proyecto', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'file'


class Institucion(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombreinstitucion = models.CharField(max_length=200, blank=True, null=True)
    email = models.CharField(max_length=200, blank=True, null=True)
    pais = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'institucion'


class Participante(models.Model):
    id = models.BigAutoField(primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    username = models.CharField(max_length=200)
    vinculacion = models.CharField(max_length=200, blank=True, null=True)
    email = models.CharField(unique=True, max_length=200)
    notas = models.CharField(max_length=200, blank=True, null=True)
    departamento = models.ForeignKey(Departamento, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'participante'


class ParticipanteProyectos(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, models.DO_NOTHING)
    proyecto = models.ForeignKey('Proyecto', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'participante_proyectos'
        unique_together = (('participante', 'proyecto'),)


class PartnershipAgreement(models.Model):
    id = models.BigAutoField(primary_key=True)
    estado = models.CharField(max_length=40)
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'partnership_agreement'


class Periodicidad(models.Model):
    id = models.BigAutoField(primary_key=True)
    tipo_periodicidad = models.CharField(max_length=40)
    periodosanuales = models.IntegerField()
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'periodicidad'


class Periodo(models.Model):
    id = models.BigAutoField(primary_key=True)
    tiempo = models.CharField(max_length=200)
    proyecto = models.ForeignKey('Proyecto', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'periodo'
        unique_together = (('id', 'proyecto'),)


class Posee(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(ParticipanteProyectos, models.DO_NOTHING)
    proyecto = models.ForeignKey(ParticipanteProyectos, models.DO_NOTHING)
    timesheet = models.ForeignKey('Timesheet', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'posee'
        unique_together = (('participante', 'proyecto', 'timesheet'),)


class Presupuesto(models.Model):
    id = models.BigAutoField(primary_key=True)
    organismo_financiador = models.CharField(max_length=100, blank=True, null=True)
    total = models.CharField(max_length=100, blank=True, null=True)
    presentacion = models.DateField(blank=True, null=True)
    proyecto = models.OneToOneField('Proyecto', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'presupuesto'


class Programa(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombreprograma = models.CharField(max_length=200)
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'programa'


class Proyecto(models.Model):
    proyecto_id = models.AutoField(primary_key=True)
    nombreproyecto = models.CharField(max_length=200)
    sigla = models.CharField(max_length=10, blank=True, null=True)
    id_referencia = models.IntegerField(blank=True, null=True)
    web = models.CharField(max_length=100, blank=True, null=True)
    notas = models.CharField(max_length=500, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)
    coordina_institucion = models.ForeignKey(Institucion, models.DO_NOTHING)
    partnership_agreement = models.ForeignKey(PartnershipAgreement, models.DO_NOTHING, blank=True, null=True)
    periodicidad = models.ForeignKey(Periodicidad, models.DO_NOTHING)
    fecha_fin = models.DateField()
    fecha_inicio = models.DateField()

    class Meta:
        managed = False
        db_table = 'proyecto'


class ProyectoParticipaInstitucion(models.Model):
    id = models.BigAutoField(primary_key=True)
    proyecto = models.ForeignKey(Proyecto, models.DO_NOTHING)
    institucion = models.ForeignKey(Institucion, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'proyecto_participa_institucion'
        unique_together = (('proyecto', 'institucion'),)


class Rol(models.Model):
    id = models.BigAutoField(primary_key=True)
    rolename = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'rol'


class Sepresenta(models.Model):
    id = models.BigAutoField(primary_key=True)
    convocatoria = models.ForeignKey(ConvocatoriaConvocatoriasSubprogramas, models.DO_NOTHING)
    subprograma = models.ForeignKey(ConvocatoriaConvocatoriasSubprogramas, models.DO_NOTHING)
    proyecto = models.ForeignKey(Proyecto, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'sepresenta'
        unique_together = (('convocatoria', 'subprograma', 'proyecto'),)


class Subprograma(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombreprograma = models.CharField(max_length=200)
    fecha_creacion = models.DateField(blank=True, null=True)
    programa = models.ForeignKey(Programa, models.DO_NOTHING)
    hijosubprograma = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    hijoprograma = models.ForeignKey(Programa, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'subprograma'
        unique_together = (('id', 'programa'),)


class Timesheet(models.Model):
    id = models.BigAutoField(primary_key=True)
    tipo = models.CharField(max_length=200, blank=True, null=True)
    periodo = models.ForeignKey(Periodo, models.DO_NOTHING, blank=True, null=True)
    rol = models.ForeignKey(Rol, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'timesheet'
