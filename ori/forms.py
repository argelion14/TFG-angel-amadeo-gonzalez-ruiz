from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import *

#https://docs.djangoproject.com/en/4.1/ref/forms/widgets/
#https://www.youtube.com/watch?v=VYs-u0g__1A

class ParticipanteStaffForm(UserCreationForm):
    password1 = forms.CharField(label = '*Contraseña' , widget = forms.PasswordInput(attrs={'class':'form-control', 'placeholder' : 'Contraseña'}))
    password2 = forms.CharField(label = '*Confirma Contraseña' , widget = forms.PasswordInput(attrs={'class':'form-control', 'placeholder' : 'Confirmación de la contraseña'}))
    class Meta:
        model = Participante
        fields = ('username', 'first_name', 'last_name', 'email', 'vinculacion', 'departamento', 'notas','password1', 'password2')
        labels = {
            'username' : '*Nombre de usuario',
            'first_name' : 'Nombre',
            'last_name' : 'Apellidos',
            'email' : '*Email',
            'vinculacion' : 'Vinculación',
            'departamento' : 'Departamento',
            'notas' : 'Notas',            
        }
        widgets = {
            'username' :  forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Username'} ),
            'first_name' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre'}),
            'last_name' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Apellidos'}),
            'email' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Email'}),
            'vinculacion' : forms.TextInput(attrs={'class':'form-control','placeholder' : 'Vinculación que tiene con la UGR'}),
            'departamento' : forms.Select(attrs={'class':'form-control'}),
            'notas' : forms.Textarea(attrs={'class':'form-control', 'rows':'3','placeholder' : 'Consulta/Información extra'}),
        }

class ParticipanteSuperuserForm(UserCreationForm):
    password1 = forms.CharField(label = '*Contraseña' , widget = forms.PasswordInput(attrs={'class':'form-control', 'placeholder' : 'Contraseña'}))
    password2 = forms.CharField(label = '*Confirma Contraseña' , widget = forms.PasswordInput(attrs={'class':'form-control', 'placeholder' : 'Confirmación de la contraseña'}))
    
    class Meta:
        model = Participante
        fields = ('username', 'first_name', 'last_name', 'email', 'vinculacion', 'departamento', 'notas' ,'password1', 'password2','is_staff','is_superuser')
        labels = {
            'username' : '*Nombre de usuario',
            'first_name' : 'Nombre',
            'last_name' : 'Apellidos',
            'email' : '*Email',
            'vinculacion' : 'Vinculación',
            'departamento' : 'Departamento',
            'notas' : 'Notas',
            'is_staff' : 'Staff',
            'is_superuser' : 'Superuser',
        }
        widgets = {
            'username' :  forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Username'} ),
            'first_name' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre'}),
            'last_name' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Apellidos'}),
            'email' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Email'}),
            'vinculacion' : forms.TextInput(attrs={'class':'form-control','placeholder' : 'Vinculación que tiene con la UGR'}),
            'departamento' : forms.Select(attrs={'class':'form-control'}),
            'notas' : forms.Textarea(attrs={'class':'form-control', 'rows':'3','placeholder' : 'Consulta/Información extra'}),
            'is_staff' : forms.CheckboxInput(attrs={'class':'form-check-input'}),
            'is_superuser' : forms.CheckboxInput(attrs={'class':'form-check-input'}),
        }

class PresupuestoForm(forms.ModelForm):
    class Meta:
        model = Presupuesto
        fields = ('proyecto', 'organismo_financiador', 'total', 'presentacion')
        labels = {
            'proyecto' : '*Proyecto',
            'organismo_financiador' : '*Organismo Financiador',
            'total' : '*Total ($)',
            'presentacion' : 'Fecha de presentación (dd/mm/yyyy)',
        }
        widgets = {
            'proyecto' : forms.Select(attrs={'class':'form-control'}),
            'organismo_financiador' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Organismo financiador'}),
            'total' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Total de dinero destinado'}),
            'presentacion' : forms.DateInput(attrs={'class':'form-control datetimepicker-input', 'placeholder' : 'dd/mm/yyyy'}),
        }

class FileInputs(forms.ModelForm):
    class Meta:
        model = File
        fields = ('file','file_proyecto_id')
        labels = {
            'file' : '*Archivo',
            'file_proyecto_id' : '*Proyecto al que pertenece'
        }
        widgets = {
            'file' : forms.FileInput(attrs={'class':'custom-file-input'}),
            'file_proyecto_id' : forms.Select(attrs={'class':'form-control'}),
        }

class EditarProyecto(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = ('nombreproyecto','sigla','id_referencia','web','notas','partnership_agreement','fecha_inicio','fecha_fin','periodicidad','coordina_institucion')
        labels = {
            'nombreproyecto' : '*Nombre del proyecto',
            'sigla' : 'Siglas',
            'id_referencia' : 'Id de referencia',
            'web' : 'Web',
            'notas' : 'Notas',
            'fecha_inicio' : '*Fecha de inicio (dd/mm/yyyy)',
            'fecha_fin' : '*Fecha de fin (dd/mm/yyyy)',
            'periodicidad' : '*Periodicidad',
            'partnership_agreement' : 'Partnership Agreement',
            'coordina_institucion' : '*Institución coordinadora',                        
        }
        widgets = {
            'nombreproyecto' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre del proyecto'}),
            'sigla' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Siglas del proyecto'}),
            'id_referencia' : forms.NumberInput(attrs={'class':'form-control', 'placeholder' : 'Id de referencia'}),
            'web' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Web del proyecto'}),
            'notas' : forms.Textarea(attrs={'class':'form-control', 'rows':'3', 'placeholder' : 'Escribe las notas que consideres para este proyecto'}),
            'partnership_agreement' : forms.Select(attrs={'class':'form-control'}),
            'fecha_inicio' : forms.DateInput(attrs={'class':'form-control datetimepicker-input','placeholder' : 'dd/mm/yyyy'}),
            'fecha_fin' : forms.DateInput(attrs={'class':'form-control datetimepicker-input','placeholder' : 'dd/mm/yyyy'}),
            'periodicidad' : forms.Select(attrs={'class':'form-control'}),
            'coordina_institucion' : forms.Select(attrs={'class':'form-control'}),            
        }


class ParticipanteProyectosForm(forms.ModelForm):
    class Meta:
        model = ParticipanteProyectos
        fields = ('participante','proyecto')
        labels = {
            'participante' : '*Participante',
            'proyecto' : '*Proyecto',
        }
        widgets = {
            'participante' : forms.Select(attrs={'class':'form-control'}),
            'proyecto' : forms.Select(attrs={'class':'form-control'}),
        }

class ConvocatoriaConvocatoriasSubprogramasForm(forms.ModelForm):
    class Meta:
        model = ConvocatoriaConvocatoriasSubprogramas
        fields = ('convocatoria','subprograma')
        labels = {
            'convocatoria' : '*Convocatoria',
            'subprograma' : '*Subprograma',
        }
        widgets = {
            'convocatoria' : forms.Select(attrs={'class':'form-control'}),
            'subprograma' : forms.Select(attrs={'class':'form-control'}),
        }

class ConvocatoriaConvocatoriasSubprogramasSinSubForm(forms.ModelForm):
    class Meta:
        model = ConvocatoriaConvocatoriasSubprogramas
        fields = ('convocatoria',)
        labels = {
            'convocatoria' : '*Convocatoria',
        }
        widgets = {
            'convocatoria' : forms.Select(attrs={'class':'form-control'}),
        }

class SubprogramaForm(forms.ModelForm):
    class Meta:
        model = Subprograma
        fields = ('nombresubprograma', 'programa', 'padresubprograma', 'padreprograma')
        labels = {
            'nombresubprograma' : '*Nombre del subprograma',
            'programa' : '*Programa',
            'padresubprograma' : 'Desciende de subprograma',
            'padreprograma' : 'Desciende de programa',
        }
        widgets = {
            'nombresubprograma' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre del subprograma'}),
            'programa' : forms.Select(attrs={'class':'form-control'}),
            'padresubprograma' : forms.Select(attrs={'class':'form-control'}),
            'padreprograma' : forms.Select(attrs={'class':'form-control'}),
         }

class ProgramaForm(forms.ModelForm):
    class Meta:
        model = Programa
        fields = ('nombreprograma',)
        labels = {
            'nombreprograma' : '*Nombre del programa',           
        }
        widgets = {
            'nombreprograma' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre del programa'}),            
         }

class ConvocatoriaForm(forms.ModelForm):
    class Meta:
        model = Convocatoria
        fields = ('anio',)
        labels = {
            'anio' : '*Año de la convocatoria',            
        }
        widgets = {
            'anio' : forms.NumberInput(attrs={'class':'form-control', 'placeholder' : 'yyyy'}),            
        }

class ProyectoParticipaInstitucionForm(forms.ModelForm):
    class Meta:
        model = ProyectoParticipaInstitucion
        fields = ('proyecto', 'institucion')
        labels = {
            'proyecto' : '*Proyecto',
            'institucion' : '*Institucion',
        }
        widgets = {
            'proyecto' : forms.Select(attrs={'class':'form-control'}),
            'institucion' : forms.Select(attrs={'class':'form-control'}),
        }

class NuevoProyecto(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = ('nombreproyecto','sigla','id_referencia','web','notas','partnership_agreement','fecha_inicio','fecha_fin','periodicidad','coordina_institucion')
        labels = {
            'nombreproyecto' : '*Nombre del proyecto',
            'sigla' : 'Siglas',
            'id_referencia' : 'Id de referencia',
            'web' : 'Web',
            'notas' : 'Notas',
            'fecha_inicio' : '*Fecha de inicio (dd/mm/yyyy)',
            'fecha_fin' : '*Fecha de fin (dd/mm/yyyy)',
            'periodicidad' : '*Periodicidad',
            'partnership_agreement' : 'Partnership Agreement',
            'coordina_institucion' : '*Institución coordinadora',
        }
        widgets = {
            'nombreproyecto' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre del proyecto'}),
            'sigla' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Siglas del proyecto'}),
            'id_referencia' : forms.NumberInput(attrs={'class':'form-control', 'placeholder' : 'Id de referencia'}),
            'web' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Web del proyecto'}),
            'notas' : forms.Textarea(attrs={'class':'form-control', 'rows':'3', 'placeholder' : 'Escribe las notas que consideres para este proyecto'}),
            'partnership_agreement' : forms.Select(attrs={'class':'form-control'}),
            'fecha_inicio' : forms.DateInput(attrs={'class':'form-control datetimepicker-input','placeholder' : 'dd/mm/yyyy'}),
            'fecha_fin' : forms.DateInput(attrs={'class':'form-control datetimepicker-input','placeholder' : 'dd/mm/yyyy'}),
            'periodicidad' : forms.Select(attrs={'class':'form-control'}),
            'coordina_institucion' : forms.Select(attrs={'class':'form-control'}),
        }

class TimesheetForm(forms.ModelForm):
    class Meta:
        model = Timesheet
        fields = ('tipo', 'rol', 'periodo', 'intellectual_output', 'num_working_days',)
        labels = {
            'tipo' : '*Tipo',
            'rol' : '*Rol',
            'periodo' : '*Periodo',
            'intellectual_output' : 'Intellectual Output',
            'num_working_days' : 'Número de dias trabajados',
        }
        widgets = {
            'tipo' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Tipo de esquema que sigue la timesheet'}),
            'rol' : forms.Select(attrs={'class':'form-control'}),
            'periodo' : forms.Select(attrs={'class':'form-control'}),
            'intellectual_output' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Intellectual Output'}),
            'num_working_days' : forms.NumberInput(attrs={'class':'form-control', 'placeholder' : 'Número de días trabajados'}),
        }

class TareaForm(forms.ModelForm):
    class Meta:
        model = Tarea
        fields = ('nombretarea', 'descripcion', 'dia', 'lugar' ,'timesheet')
        labels = {
            'nombretarea' : '*Nombre de la tarea',
            'descripcion' : '*Descripción de la tarea',
            'dia' : '*Dia(dd/mm/yyyy)',
            'lugar' : '*Localización',
            'timesheet' : '*Timesheet a la cual corresponde la tarea',
        }
        widgets = {
            'nombretarea' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Nombre de la tarea'}),
            'descripcion' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Descripción de la tarea'}),
            'dia' : forms.DateInput(attrs={'class':'form-control datetimepicker-input', 'placeholder' : 'dd/mm/yyyy'}),
            'lugar' : forms.TextInput(attrs={'class':'form-control', 'placeholder' : 'Lugar donde se realizaron las actividades'}),
            'timesheet' : forms.Select(attrs={'class':'form-control'}),
        }

class PoseeSinTimForm(forms.ModelForm):
    class Meta:
        model = Posee
        fields = ('participanteproyectos',)
        labels = {
            'participanteproyectos' : '*Participante con proyectos',
        }
        widgets = {
            'participanteproyectos' : forms.Select(attrs={'class':'form-control'}),
        }

class PoseeForm(forms.ModelForm):
    class Meta:
        model = Posee
        fields = ('participanteproyectos','timesheet')
        labels = {
            'participanteproyectos' : '*Participante con proyectos',
            'timesheet' : '*Timesheet',
        }
        widgets = {
            'participanteproyectos' : forms.Select(attrs={'class':'form-control'}),
            'timesheet' : forms.Select(attrs={'class':'form-control'}),
        }

class SepresentaForm(forms.ModelForm):
    class Meta:
        model = Sepresenta
        fields = ('convocatoriasubprogramas','proyecto')
        labels = {
            'convocatoriasubprogramas' : '*Convocatoria con Subprograma',
            'proyecto' : '*Proyecto',
        }
        widgets = {
            'convocatoriasubprogramas' : forms.Select(attrs={'class':'form-control'}),
            'proyecto' : forms.Select(attrs={'class':'form-control'}),
        }

class SepresentaSinProForm(forms.ModelForm):
    class Meta:
        model = Sepresenta
        fields = ('convocatoriasubprogramas',)
        labels = {
            'convocatoriasubprogramas' : '*Convocatoria con subprogramas',
        }
        widgets = {
            'convocatoriasubprogramas' : forms.Select(attrs={'class':'form-control'}),
        }
