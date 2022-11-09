from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

from .forms import *
from .models import *

# Create your views here.

"""
https://pythoniza.me/el-framework-de-mensajes-de-django/
    messages.success(request, F"El proyecto { proyecto.nombre } ha sido eliminado !")
    messages.info(request, F"El proyecto { proyecto.nombre } ha sido eliminado !")
    messages.error(request, F"El proyecto { proyecto.nombre } ha sido eliminado !")
    messages.warning(request, F"El proyecto { proyecto.nombre } ha sido eliminado !")
"""

#Área user normal

def portada(request):
    return render(request,'portada_ORI.html')

def dashboard(request):
    numeros_ori = {
        "num_proyectos":Proyecto.objects.count(),
        "num_participantes":Participante.objects.count(),
        "num_convocatorias":Convocatoria.objects.count(),
        "num_programas":Programa.objects.count(),
        "num_subprogramas":Subprograma.objects.count(),
        "num_timesheets":Timesheet.objects.count(),
    }
    return render(request,'dashboard.html', {'numeros_ori' : numeros_ori})

@login_required
def proyectos(request):
    proyectos = Proyecto.objects.all()

    data=[]
    for proyecto in proyectos:       
        if Sepresenta.objects.filter(proyecto_id = proyecto.proyecto_id):
            papa = Sepresenta.objects.get(proyecto_id = proyecto.proyecto_id).convocatoriasubprogramas.id
            convocatoria = Sepresenta.objects.get(proyecto_id = proyecto.proyecto_id).convocatoriasubprogramas.convocatoria_id
            convocatoria = Convocatoria.objects.get(id=convocatoria)           
            subprograma = Sepresenta.objects.get(proyecto_id = proyecto.proyecto_id).convocatoriasubprogramas.subprograma_id
            subprograma = Subprograma.objects.get(id=subprograma)
        else:
            papa =""
            convocatoria = ""
            subprograma = ""

        num_periodos = Periodo.objects.filter(proyecto_id = proyecto.proyecto_id)
        num_periodos = num_periodos.count()

        objeto = {
            'proyecto_id' : proyecto.proyecto_id,
            'nombreproyecto' : proyecto.nombreproyecto,
            'sigla' : proyecto.sigla,
            'id_referencia' : proyecto.id_referencia,
            'web' : proyecto.web,
            'coordina_institucion' : proyecto.coordina_institucion,
            'notas' : proyecto.notas,
            'fecha_inicio' : proyecto.fecha_inicio,
            'fecha_fin' : proyecto.fecha_fin,
            'periodicidad' : proyecto.periodicidad,
            'num_periodos' : num_periodos,
            'partnership_agreement' : proyecto.partnership_agreement,
            'papa' : papa,
            'convocatoria' : convocatoria,
            'subprograma' : subprograma,
        }
        data.append(objeto)
    proyectos = data
    return render(request,'proyectos.html', {'proyectos' : proyectos})

@login_required
def ver_proyecto(request,pk):
    proyecto = Proyecto.objects.get(proyecto_id=pk)
    files = File.objects.filter(file_proyecto_id = pk)
    participantesListados = ParticipanteProyectos.objects.filter(proyecto_id=pk)
    data=[]

    for participalis in participantesListados:
        objeto = Participante.objects.get(id=participalis.participante_id)
        data.append(objeto)
    participantesListados = data

    instituciones_participantes = ProyectoParticipaInstitucion.objects.filter(proyecto_id=pk)
    data=[]
    for instituciones_par in instituciones_participantes:
        objeto = Institucion.objects.get(id=instituciones_par.institucion_id)
        data.append(objeto)
    instituciones_participantes = data

    if (Presupuesto.objects.filter(proyecto=pk)):
        presupuesto = Presupuesto.objects.get(proyecto=pk)
    else:
        presupuesto = Presupuesto.objects.filter(proyecto=pk)

    if (Sepresenta.objects.filter(proyecto_id = proyecto.proyecto_id)):
        convocatoria = Sepresenta.objects.get(proyecto_id = pk).convocatoriasubprogramas.convocatoria_id
        convocatoria = Convocatoria.objects.get(id=convocatoria)
        subprograma = Sepresenta.objects.get(proyecto_id = pk).convocatoriasubprogramas.subprograma_id
        subprograma = Subprograma.objects.get(id=subprograma)
    else:
        convocatoria = ""
        subprograma = ""
    
    convocatoriaysubprograma = {
        'convocatoria' : convocatoria,
        'subprograma' : subprograma,
    }
    periodos = Periodo.objects.filter(proyecto = proyecto)
    return render(request,'ver_proyecto.html', {'proyecto' : proyecto, 'presupuesto' : presupuesto, 'files' : files, 'participantesListados' : participantesListados, 'instituciones_participantes' : instituciones_participantes, 'convocatoriaysubprograma' : convocatoriaysubprograma, 'periodos' : periodos} )

@login_required
def participantes(request):
    participantesListados = Participante.objects.all()
    return render(request,'participantes.html', {'participantesListados' : participantesListados})

@login_required
def ver_participante(request,pk):
    participante = Participante.objects.get(id=pk)
    participaproyecto = ParticipanteProyectos.objects.filter(participante_id=pk)
    data = []
    for participapro in participaproyecto:
        objeto = Proyecto.objects.get(proyecto_id=participapro.proyecto_id)
        data.append(objeto)
    proyectos = data
    posee = Posee.objects.all()
    data = []
    for pos in posee:
        if (pos.participanteproyectos.participante.id == participante.id):
            objeto = pos
            data.append(objeto)
    posee = data 
    return render(request, 'ver_participante.html', {'participante' : participante, 'proyectos' : proyectos, 'posee' : posee})
    
@login_required
def timesheet(request):

    timesheets = Timesheet.objects.all()
    
    data=[]

    for timesheet in timesheets:        
        if Posee.objects.filter(timesheet_id = timesheet.id):
            papa = Posee.objects.get(timesheet_id = timesheet.id).participanteproyectos.id
            proyecto = Posee.objects.get(timesheet_id = timesheet.id).participanteproyectos.proyecto_id
            proyecto = Proyecto.objects.get(proyecto_id=proyecto)

            participante = Posee.objects.get(timesheet_id = timesheet.id).participanteproyectos.participante_id
            participante = Participante.objects.get(id=participante)
        else:
            papa = ""
            proyecto = ""
            participante = ""
        
        num_tareas = Tarea.objects.filter(timesheet=timesheet.id).count()

        objeto = {
            'id' : timesheet.id,
            'tipo' : timesheet.tipo,
            'periodo' : timesheet.periodo,
            'rol' : timesheet.rol,
            'intellectual_output' : timesheet.intellectual_output,
            'num_working_days' : timesheet.num_working_days,
            'papa' : papa,
            'proyecto' : proyecto,
            'participante' : participante,
            'num_tareas' : num_tareas,
        }
        data.append(objeto)
    timesheets = data

    return render(request,'timesheet.html', {'timesheets' : timesheets})

@login_required
def ver_timesheet(request,pk):


    timesheet = Timesheet.objects.get(id=pk)
    tareas = Tarea.objects.filter(timesheet=timesheet)

    participante = Posee.objects.get(timesheet_id = pk).participanteproyectos.participante_id
    participante = Participante.objects.get(id=participante)
    proyecto = Posee.objects.get(timesheet_id = pk).participanteproyectos.proyecto_id
    proyecto = Proyecto.objects.get(proyecto_id=proyecto)

    participanteyproyecto = {
        'participante' : participante,
        'proyecto' : proyecto,
    }

    return render(request, 'ver_timesheet.html', {'timesheet' : timesheet, 'tareas' : tareas ,'participanteyproyecto' : participanteyproyecto})

@login_required
def convocatorias(request):
    convocatorias = Convocatoria.objects.all()
    return render(request,'convocatorias.html', {'convocatorias' : convocatorias})

@login_required
def ver_convocatoria(request,pk):
    convocatoria = Convocatoria.objects.get(id=pk)
    return render(request, 'ver_convocatoria.html', {'convocatoria' : convocatoria})

@login_required
def programas(request):
    programas = Programa.objects.all()
    return render(request,'programas.html', {'programas' : programas})

@login_required
def ver_programa(request,pk):
    programa = Programa.objects.get(id=pk)
    return render(request, 'ver_programa.html', {'programa' : programa})

@login_required
def subprogramas(request):
    subprogramas = Subprograma.objects.all()
    return render(request,'subprogramas.html', {'subprogramas' : subprogramas})

@login_required
def ver_subprograma(request,pk):
    subprograma = Subprograma.objects.get(id=pk)
    convocatoriasubprogramaListadas = ConvocatoriaConvocatoriasSubprogramas.objects.filter(subprograma=pk)
    data=[]
    for convocatoriasubprograma in convocatoriasubprogramaListadas:
        objeto = Convocatoria.objects.get(id=convocatoriasubprograma.convocatoria_id)
        data.append(objeto)
    convocatoriasubprogramaListadas = data 
    return render(request, 'ver_subprograma.html', {'subprograma' : subprograma,'convocatoriasubprogramaListadas' : convocatoriasubprogramaListadas})

@login_required
def ver_perfil(request):
    participaproyecto = ParticipanteProyectos.objects.filter(participante_id=request.user.id)
    
    
    
    
    
    
    data = []
    for participapro in participaproyecto:
        objeto = Proyecto.objects.get(proyecto_id=participapro.proyecto_id)
        data.append(objeto)
    proyectos = data
    posee = Posee.objects.all()
    data = []
    for pos in posee:
        if (pos.participanteproyectos.participante.id == request.user.id):
            objeto = pos
            data.append(objeto)
    posee = data        
    return render(request, 'ver_perfil.html', {'proyectos' : proyectos, 'posee' : posee})

@login_required
def editar_perfil(request):
    participante = request.user
    if request.user.is_superuser:
        form = ParticipanteSuperuserForm(instance=participante)
    else:
        form = ParticipanteStaffForm(instance=participante)
    if request.method == "POST":
        if request.user.is_superuser:
            form = ParticipanteSuperuserForm(request.POST, instance=participante)
        else:
            form = ParticipanteStaffForm(request.POST, instance=participante)
        if form.is_valid():
            form.save()
            messages.success(request, F"El usuario {participante.username} ha sido actualizado!")
        else:
            messages.error(request, F"Fallo en el formulario")
    return render(request,'editar_perfil.html', {'participante' : participante,'form' : form})
    
@login_required
def eliminar_perfil(request):
    request.user.delete()
    messages.success(request, F"Has eliminado tu perfil correctamente")
    return redirect('/dashboard')

#Área Staff

@login_required
def nuevo_proyecto(request):  
    if request.user.is_authenticated and request.user.is_staff:
        if request.method == "POST":
            form = NuevoProyecto(request.POST)
            form2 = SepresentaSinProForm(request.POST)

            if form.is_valid() and form2.is_valid():
                proyecto = form.save(commit=False)
                proyecto.save()

                enlaceproyectoconcocatoriasubprograma = form2.save(commit=False)
                enlaceproyectoconcocatoriasubprograma.proyecto = proyecto
                enlaceproyectoconcocatoriasubprograma.save()
                messages.success(request, F"El proyecto ha sido creado con éxito")
        
            else:
                messages.error(request, F"Formulario de nuevo proyecto no válido")
        
        
        else:
            form = NuevoProyecto()
            form2 = SepresentaSinProForm()
        return render(request,'nuevo_proyecto.html', {'form' : form, 'form2' : form2})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_proyecto(request,pk):
    if request.user.is_authenticated and request.user.is_staff:
        proyecto = Proyecto.objects.get(proyecto_id=pk)
        files = File.objects.filter(file_proyecto_id = pk)
        participantes = Participante.objects.all() 
        form = EditarProyecto(instance=proyecto)
        form1 = FileInputs()

        if (Presupuesto.objects.filter(proyecto=pk)):
            form2 = PresupuestoForm(instance=Presupuesto.objects.get(proyecto=pk))
        else:
            form2 = PresupuestoForm()
        
        form3 = ParticipanteStaffForm()
        form4 = ParticipanteProyectosForm()
        form5 = ProyectoParticipaInstitucionForm()

        if Sepresenta.objects.filter(proyecto_id = proyecto.proyecto_id):
            form6 = SepresentaForm(instance = Sepresenta.objects.get(proyecto_id=pk))
        else:
            form6 = SepresentaForm()

        if request.method == "POST":

            if request.POST.get('proyectoform'):
                form = EditarProyecto(request.POST, instance=proyecto)
                if form.is_valid():
                    form.save()
                    messages.success(request, F"El proyecto {proyecto.nombreproyecto} ha sido actualizado!")
                else:
                    messages.error(request, F"Formulario de proyecto no válido")

            elif request.POST.get('archivoform'):
                form1 = FileInputs(request.POST, request.FILES)
                if form1.is_valid():
                    form1.save()
                    messages.success(request, F"El fichero ha sido subido")
                else:
                    messages.error(request, F"El fichero no ha sido subido")

            elif request.POST.get('presupuestoform'):
                if (Presupuesto.objects.filter(proyecto=pk)):
                    form2 = PresupuestoForm(request.POST, instance=Presupuesto.objects.get(proyecto=pk))
                else:
                    form2 = PresupuestoForm(request.POST)
                if form2.is_valid():
                    form2.save()
                    messages.success(request, F"El presupuesto ha sido actualizado!")
                else:
                    messages.error(request, F"Formulario no válido")

            elif request.POST.get('participanteform'):

                form4 = ParticipanteProyectosForm(request.POST)
                if form4.is_valid():
                    #form4.proyecto=pk
                    form4.save()
                    messages.success(request, F"El participante ha sido agregado!")
                else:
                    messages.error(request, F"Formulario no válido")
                           
            elif request.POST.get('eliminaparticipanteform'):
                participanteaeliminar = ParticipanteProyectos.objects.get(proyecto=pk , participante = request.POST.get('id_participante'))
                posee = Posee.objects.filter(participanteproyectos=participanteaeliminar)
                for pos in posee:
                    timesheetaborrar = pos.timesheet
                    timesheetaborrar.delete()
                
                participanteaeliminar.delete()
                messages.warning(request, F"El participante ha sido eliminado del proyecto")

            elif request.POST.get('institucionesform'):
                form5 = ProyectoParticipaInstitucionForm(request.POST)
                if form5.is_valid():
                    form5.save()
                    messages.success(request, F"La institución ha sido agregada!")
                else:
                    messages.error(request, F"Formulario no válido")

            elif request.POST.get('eliminainstitucionform'):
                institucionparticipanteaeliminar = ProyectoParticipaInstitucion.objects.get(proyecto=pk , institucion = request.POST.get('id_institucionparticipante'))
                institucionparticipanteaeliminar.delete()
                messages.warning(request, F"La institucion ha sido eliminado del proyecto")
                
            elif request.POST.get('editarconvocatoriasubprograma'):
                if Sepresenta.objects.filter(proyecto_id = proyecto.proyecto_id):
                    form6 = SepresentaForm(request.POST, instance = Sepresenta.objects.get(proyecto_id=pk))
                else:
                    form6 = SepresentaForm(request.POST)
                if form6.is_valid():
                    form6.save()
                    messages.success(request, F"La convocatoria y subprograma ha sido actualizada")
                else:
                    messages.error(request, F"Formulario no válido")
            elif request.POST.get('periodoextraform'):
                num_periodos = int( request.POST.get('num_periodos') )
                for i in range(num_periodos):
                    perio = Periodo()
                    perio.proyecto = proyecto
                    perio.num_periodo = i + 1
                    perio.save()
                messages.success(request, F"Se ha creado los {num_periodos} periodos")
            else:
                messages.error(request, F"Sin formulario")

        participantesListados = ParticipanteProyectos.objects.filter(proyecto_id=pk)
        data=[]
        for participalis in participantesListados:
            objeto = Participante.objects.get(id=participalis.participante_id)
            data.append(objeto)
        participantesListados = data

        institucionesParticipantesListadas = ProyectoParticipaInstitucion.objects.filter(proyecto_id=pk)
        data=[]
        for institucionesParticipantes in institucionesParticipantesListadas:
            objeto = Institucion.objects.get(id=institucionesParticipantes.institucion_id)
            data.append(objeto)
        institucionesParticipantesListadas = data

        periodos = Periodo.objects.filter(proyecto = proyecto)

        return render(request, 'editar_proyecto.html', {'form' : form,'form1' : form1 ,'form2' : form2, 'form3' : form3, 'form4' : form4, 'form5' : form5, 'form6' : form6 , 'proyecto' : proyecto, 'files' : files, 'participantesListados' : participantesListados,'institucionesParticipantesListadas' : institucionesParticipantesListadas ,'participantes' : participantes, 'periodos' : periodos})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_proyecto(request,pk):
    if request.user.is_authenticated and request.user.is_staff:
        proyecto = Proyecto.objects.get(proyecto_id=pk)
        #Para borrar los archivos de la media
        files = File.objects.filter(file_proyecto_id = pk)
        for file in files:
            file.delete()
        #Fin de borrar los archivos asociados al proyecto
        proyecto.delete()
        messages.success(request, F"El proyecto { proyecto.nombreproyecto } ha sido eliminado !")
        return redirect('/proyectos/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def nuevo_participante(request):  
    if request.user.is_authenticated and request.user.is_staff:
        if request.method == "POST":
            if request.user.is_superuser:
                form = ParticipanteSuperuserForm(request.POST)
            else:
                form = ParticipanteStaffForm(request.POST)
            if form.is_valid():
                proyecto = form.save(commit=False)
                if proyecto.is_superuser == 1:
                    proyecto.is_staff = 1
                proyecto.save()
                messages.success(request, "Se creó el participante")
                return redirect('/participantes')
            else:
                messages.error(request, "No se pudo crear el participante")
        else:
            if request.user.is_superuser:
                form = ParticipanteSuperuserForm()
            else:
                form = ParticipanteStaffForm()
        return render(request,'nuevo_participante.html', {'form' : form})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_participante(request,pk):  
    if request.user.is_authenticated and request.user.is_staff:
        participante = Participante.objects.get(id=pk)
        if request.user.is_superuser:
            form = ParticipanteSuperuserForm(instance=participante)
        else:
            form = ParticipanteStaffForm(instance=participante)
        
        if request.method == "POST":
            if request.user.is_superuser:
                form = ParticipanteSuperuserForm(request.POST, instance=participante)
            else:
                form = ParticipanteStaffForm(request.POST, instance=participante)
            if form.is_valid():
                partici = form.save(commit=False)
                if partici.is_superuser == 1:
                    partici.is_staff = 1
                partici.save()
                messages.success(request, F"El usuario {participante.username} ha sido actualizado!")
            else:
                messages.error(request, F"Fallo en el formulario")
        return render(request,'editar_participante.html', {'participante' : participante,'form' : form})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_participante(request,pk):
    if request.user.is_authenticated and request.user.is_staff:
        participante = Participante.objects.get(id=pk)
        if participante == request.user:
            #Esto pasará si intenta realizar cosas fuera de el html
            messages.warning(request, F"No te puedes eliminar a ti mismo")
        else:
            messages.success(request, F"El participante {participante.username} ha sido eliminado !")
            participante.delete()
        return redirect('/participantes/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def nueva_timesheet(request):  

    proyectoparti = ParticipanteProyectos.objects.filter(participante_id = request.user.id)
    
    periodosenproyectoelparticipante = Periodo.objects.all()
    data = []
    for periodo in periodosenproyectoelparticipante:
        for proyecto in proyectoparti:
            if (periodo.proyecto == proyecto.proyecto):
                objeto = periodo
                data.append(objeto)
    periodosenproyectoelparticipante = data



    if request.user.is_authenticated:
        if request.method == "POST":
            
            form = TimesheetForm(request.POST)
            form2 = PoseeSinTimForm(request.POST)
            
            if form.is_valid() and form2.is_valid():
                timesheet = form.save(commit=False)
                enlaceparticipanteproyecto = form2.save(commit=False)
                enlaceparticipanteproyecto.timesheet = timesheet

                if (timesheet.periodo.proyecto == enlaceparticipanteproyecto.participanteproyectos.proyecto):
                    timesheet.save()
                    enlaceparticipanteproyecto.save()
                    messages.success(request, F"La timesheet ha sido creada con éxito")
                else:
                    messages.error(request, F"El periodo debe pertenecer al mismo proyecto con lo que lo quieres enlazar")
            else:
                messages.error(request, F"Formulario de nueva timesheet no válido")
        else:
            form = TimesheetForm()
            form2 = PoseeSinTimForm()
        return render(request,'nueva_timesheet.html', {'form' : form, 'form2' : form2, 'proyectoparti' : proyectoparti, 'periodosenproyectoelparticipante' : periodosenproyectoelparticipante})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_timesheet(request,pk):  
    
    #Si el usuario esta dentro de participante_proyecto, 
    # dentro de los posee que tiene este id de tiemsheet 
    # le dejo continuar
    # Si existe combinación timesheet y participante, este puede acceder a editarla 

    posee = Posee.objects.all()
    puede_editar=False
    for pos in posee:
        if pos.participanteproyectos.participante.username == request.user.username and pos.timesheet.id == pk:
            puede_editar = True 

    if request.user.is_authenticated and (request.user.is_staff or puede_editar):
        timesheet = Timesheet.objects.get(id=pk)
        form = TimesheetForm(instance=timesheet)
        form1 = PoseeForm(instance = Posee.objects.get(timesheet_id=pk))
        form2 = TareaForm()

        if request.method == "POST":
            
            
            if request.POST.get('timesheetform'):
                form = TimesheetForm(request.POST, instance=timesheet)
                if form.is_valid():
                    timesheet = form.save(commit=False)
                    if (timesheet.periodo.proyecto == Posee.objects.get(timesheet_id=pk).participanteproyectos.proyecto):              
                        form.save()
                        messages.success(request, F"La timesheet ha sido actualizado!")
                    else:
                        messages.error(request, F"El periodo debe pertenecer al mismo proyecto con lo que lo quieres enlazar")
                else:
                    messages.error(request, F"Fallo en el formulario")
            
            elif request.POST.get('editarparticipanteproyecto'):
                form1 = PoseeForm(request.POST, instance = Posee.objects.get(timesheet_id=pk))
                if form1.is_valid():
                    posee = form1.save(commit=False)
                    if (posee.participanteproyectos.proyecto == Timesheet.objects.get(id=pk).periodo.proyecto):
                        form1.save()
                        messages.success(request, F"El participante y proyecto ha sido actualizada")
                    else: 
                        messages.error(request, F"El periodo debe pertenecer al mismo proyecto con lo que lo quieres enlazar")
                else:
                    messages.error(request, F"Formulario no válido")

            elif request.POST.get('agregatareaatimesheet'):
                form2 = TareaForm(request.POST)
                if form2.is_valid():
                    form2.save()
                    messages.success(request, F"La tarea ha sido agregada")
                else:
                    messages.error(request, F"La tarea no ha sido agregada")


        proyectoparti = ParticipanteProyectos.objects.filter(participante_id = request.user.id)
    
        periodosenproyectoelparticipante = Periodo.objects.all()
        data = []
        for periodo in periodosenproyectoelparticipante:
            for proyecto in proyectoparti:
                if (periodo.proyecto == proyecto.proyecto):
                    objeto = periodo
                    data.append(objeto)
        periodosenproyectoelparticipante = data

        tareas = Tarea.objects.filter(timesheet=timesheet)

        return render(request,'editar_timesheet.html', {'timesheet' : timesheet, 'form' : form, 'form1' : form1, 'form2' : form2, 'proyectoparti' : proyectoparti, 'periodosenproyectoelparticipante' : periodosenproyectoelparticipante, 'tareas' : tareas})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_timesheet(request,pk):
    
    posee = Posee.objects.all()
    puede_editar=False
    for pos in posee:
        if pos.participanteproyectos.participante.username == request.user.username and pos.timesheet.id == pk:
            puede_editar = True
    
    if (request.user.is_authenticated and request.user.is_staff) or (request.user.is_authenticated and puede_editar):
        
        timesheet = Timesheet.objects.get(id=pk)
        
        
        messages.success(request, F"La timesheet {timesheet.nombretimesheet} ha sido eliminada !")
        timesheet.delete()
        return redirect('/timesheet/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def nuevo_programa(request):  
    if request.user.is_authenticated and request.user.is_staff:
        if request.method == "POST":
            
            form = ProgramaForm(request.POST)
            
            if form.is_valid() :
                programa = form.save(commit=False)
                programa.save()
                
                messages.success(request, F"El programa {programa.nombreprograma} ha sido creado")
                
            else:
                messages.error(request, F"Formulario de nuevo programa no válido")
        else:
            form = ProgramaForm()
            
        return render(request,'nuevo_programa.html', {'form' : form,})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_programa(request,pk):  
    if request.user.is_authenticated and request.user.is_staff:
        programa = Programa.objects.get(id=pk)
        form = ProgramaForm(instance=programa)
        
        if request.method == "POST":
               
            if request.POST.get('programaform'):
                form = ProgramaForm(request.POST, instance=programa)
                if form.is_valid():
                    form.save()
                    messages.success(request, F"El programa ha sido actualizado!")
                else:
                    messages.error(request, F"Fallo en el formulario")  
        return render(request,'editar_programa.html', {'programa' : programa,'form' : form,})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_programa(request,pk):
    if request.user.is_authenticated and request.user.is_staff:
        
        programa = Programa.objects.get(id=pk)
        
        
        messages.success(request, F"El programa {programa.nombreprograma} ha sido eliminado !")
        programa.delete()
        return redirect('/programas/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def nuevo_subprograma(request):  
    if request.user.is_authenticated and request.user.is_staff:
        if request.method == "POST":
            #form = NuevoProyecto(request.POST)
            form = SubprogramaForm(request.POST)
            form2 = ConvocatoriaConvocatoriasSubprogramasSinSubForm(request.POST)
            
            
            
            if form.is_valid() and form2.is_valid():
                subprograma = form.save(commit=False)
                if subprograma.padresubprograma != None:
                    subprograma.padreprograma = subprograma.padresubprograma.programa

                subprograma.save()

                enlaceconvo = form2.save(commit=False)
                enlaceconvo.subprograma = subprograma
                enlaceconvo.save()
                
                messages.success(request, F"El subprograma {subprograma.nombresubprograma} ha sido creado y agregado a la convocatoria {enlaceconvo.convocatoria} con exito")
            else:
                messages.error(request, F"Formulario de nuevo subprograma no válido")

        else:
            form = SubprogramaForm()
            form2 = ConvocatoriaConvocatoriasSubprogramasSinSubForm()
        return render(request,'nuevo_subprograma.html', {'form' : form, 'form2' : form2})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_subprograma(request,pk):  
    if request.user.is_authenticated and request.user.is_staff:
        subprograma = Subprograma.objects.get(id=pk)
        form = SubprogramaForm(instance=subprograma)
        form1 = ConvocatoriaConvocatoriasSubprogramasForm()
        if request.method == "POST":
               
            if request.POST.get('subprogramaform'):
                form = SubprogramaForm(request.POST, instance=subprograma)
                if form.is_valid():
                    subprograma = form.save(commit=False)
                    if subprograma.padresubprograma != "":
                        subprograma.padresubprograma = subprograma.padresubprograma.programa
                    subprograma.save()
                    
                    messages.success(request, F"El subprograma ha sido actualizado!")
                else:
                    messages.error(request, F"Fallo en el formulario")

            elif request.POST.get('convocatoriaconsubprogramasform'):
                form1 = ConvocatoriaConvocatoriasSubprogramasForm(request.POST)
                if form1.is_valid():
                    form1.save()
                    messages.success(request, F"La convocatoria ha sido agregada!")
                else:
                    messages.error(request, F"Formulario no válido")

            elif request.POST.get('eliminaconvocatoriaform'):
                subprogramaconvocatoriaaeliminar = ConvocatoriaConvocatoriasSubprogramas.objects.get(subprograma=pk, convocatoria=request.POST.get('id_convocatoria'))
                subprogramaconvocatoriaaeliminar.delete()
                messages.warning(request, F"La convocatoria ha sido eliminada del subprograma")

        convocatoriasubprogramaListadas = ConvocatoriaConvocatoriasSubprogramas.objects.filter(subprograma=pk)
        data=[]
        for convocatoriasubprograma in convocatoriasubprogramaListadas:
            objeto = Convocatoria.objects.get(id=convocatoriasubprograma.convocatoria_id)
            data.append(objeto)
        convocatoriasubprogramaListadas = data

        return render(request,'editar_subprograma.html', {'subprograma' : subprograma, 'convocatoriasubprogramaListadas' : convocatoriasubprogramaListadas,'form' : form, 'form1' : form1})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_subprograma(request,pk):
    if request.user.is_authenticated and request.user.is_staff:       
        subprograma = Subprograma.objects.get(id=pk)
        messages.success(request, F"El subprograma {subprograma.nombresubprograma} ha sido eliminado !")
        subprograma.delete()
        return redirect('/subprogramas/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def nueva_convocatoria(request):  
    if request.user.is_authenticated and request.user.is_staff:
        if request.method == "POST":
            
            form = ConvocatoriaForm(request.POST)
        
            
            if form.is_valid():
                convocatoria = form.save(commit=False)
                convocatoria.save()

                
                messages.success(request, F"La convocatoria ha sido creada con éxito")
            else:
                messages.error(request, F"Formulario de nuevo subprograma no válido")
        else:
            form = ConvocatoriaForm()
            
        return render(request,'nueva_convocatoria.html', {'form' : form})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def editar_convocatoria(request,pk):  
    if request.user.is_authenticated and request.user.is_staff:
        convocatoria = Convocatoria.objects.get(id=pk)
        form = ConvocatoriaForm(instance=convocatoria)
        form1 = ConvocatoriaConvocatoriasSubprogramasForm()


        if request.method == "POST":
            
            
            if request.POST.get('convocatoriaform'):
                form = ConvocatoriaForm(request.POST, instance=convocatoria)
                if form.is_valid():
                    form.save()
                    messages.success(request, F"La convocatoria ha sido actualizado!")
                else:
                    messages.error(request, F"Fallo en el formulario")
            
            
            elif request.POST.get('subprogramaenconvocatoriaform'):
                form1 =  ConvocatoriaConvocatoriasSubprogramasForm(request.POST)
                if form1.is_valid():
                    form1.save()
                    messages.success(request, F"El subprograma ha sido agregado!")
                else:
                    messages.error(request, F"Formulario no válido")
            
            elif request.POST.get('eliminasubprogramaconvocatoriaform'):
                subprogramaconvocatoriaaeliminar = ConvocatoriaConvocatoriasSubprogramas.objects.get(convocatoria=pk, subprograma=request.POST.get('id_subprogramaconvocatoria'))
                if ConvocatoriaConvocatoriasSubprogramas.objects.filter(convocatoria_id=pk).count() <= 1:
                    messages.error(request, F"No puedes eliminar el único que tiene")
                else:
                    sepresenta = Sepresenta.objects.filter(convocatoriasubprogramas=subprogramaconvocatoriaaeliminar)
                    for sepre in sepresenta:
                        proyectoaborrar = sepre.proyecto
                        proyectoaborrar.delete()
                    subprogramaconvocatoriaaeliminar.delete()
                    messages.warning(request, F"El subprograma ha sido eliminado de la institucion")


        subprogramasListados = ConvocatoriaConvocatoriasSubprogramas.objects.filter(convocatoria_id=pk)
        data=[]
        for subprogramalis in subprogramasListados:
            objeto = Subprograma.objects.get(id=subprogramalis.subprograma_id) 
            data.append(objeto)
        subprogramasListados = data
                
        return render(request,'editar_convocatoria.html', {'convocatoria' : convocatoria, 'subprogramasListados' : subprogramasListados,'form' : form, 'form1' : form1})
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_convocatoria(request,pk):
    if request.user.is_authenticated and request.user.is_staff:   
        convocatoria = Convocatoria.objects.get(id=pk)
        messages.success(request, F"La convocatoria {convocatoria.anio} ha sido eliminado !")
        convocatoria.delete()
        return redirect('/convocatorias/')
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_archivo(request,pk):
    if request.user.is_authenticated and request.user.is_staff:
        archivo = File.objects.get(id=pk)
        archivo.delete()
        messages.success(request, F"El archivo ha sido eliminado!")
        return redirect('/editar_proyecto/'+str(pk))
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

@login_required
def borrar_tarea(request,pk):

    tarea = Tarea.objects.get(id=pk)
    timesheet = tarea.timesheet

    posee = Posee.objects.all()
    puede_editar=False
    for pos in posee:
        if pos.participanteproyectos.participante.username == request.user.username and pos.timesheet.id == timesheet.id:
            puede_editar = True 

    if request.user.is_authenticated and (request.user.is_staff or puede_editar):
        #tarea = Tarea.objects.get(id=pk)
        tarea.delete()
        messages.success(request, F"La tarea ha sido eliminada!")
        return redirect('/editar_timesheet/'+str(timesheet.id))
    else:
        messages.warning(request, "No tienes permisos")
        return redirect('/dashboard')

#Área admin



#EXTRA

@login_required
def informacion(request):
    return render(request,'información.html', {})
    
def contacto(request):
    return render(request,'contacto.html', {})

def error_404(request, exception):
    return render(request, 'error404.html')
