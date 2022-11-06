# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class Departamento(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombredepartamento = models.CharField(max_length=200)
    correo = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'departamento'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Participante', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


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


class ParticipanteGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'participante_groups'
        unique_together = (('participante', 'group'),)


class ParticipanteProyectos(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, models.DO_NOTHING)
    proyecto = models.ForeignKey('Proyecto', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'participante_proyectos'
        unique_together = (('participante', 'proyecto'),)


class ParticipanteUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    participante = models.ForeignKey(Participante, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'participante_user_permissions'
        unique_together = (('participante', 'permission'),)


class PartnershipAgreement(models.Model):
    id = models.BigAutoField(primary_key=True)
    estado = models.CharField(max_length=40)
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'partnership_agreement'


class Periodo(models.Model):
    id = models.BigAutoField(primary_key=True)
    tiempo = models.CharField(max_length=200)
    proyecto = models.ForeignKey('Proyecto', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'periodo'
        unique_together = (('id', 'proyecto'),)


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
    nombreprograma = models.CharField(max_length=200, blank=True, null=True)
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


class Subprograma(models.Model):
    id = models.BigAutoField(primary_key=True)
    nombreprograma = models.CharField(max_length=200, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)
    programa = models.ForeignKey(Programa, models.DO_NOTHING, blank=True, null=True)

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
