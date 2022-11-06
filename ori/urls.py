from django.urls import path

from . import views

urlpatterns = [
    #Área user normal
    path('', views.portada, name="portada"),
    path('dashboard/', views.dashboard, name="dashboard"),

    path('proyectos/', views.proyectos, name="proyectos"),
    path('ver_proyecto/<int:pk>', views.ver_proyecto, name="ver_proyecto"),

    path('participantes/', views.participantes, name="participantes"),
    path('ver_participante/<int:pk>', views.ver_participante, name="ver_participante"),

    path('timesheet/', views.timesheet, name="timesheet"),
    path('ver_timesheet/<int:pk>', views.ver_timesheet, name="ver_timesheet"),

    path('convocatorias/', views.convocatorias, name="convocatorias"),
    path('ver_convocatoria/<int:pk>', views.ver_convocatoria, name="ver_convocatoria"),

    path('programas/', views.programas, name="programas"),
    path('ver_programa/<int:pk>', views.ver_programa, name="ver_programa"),

    path('subprogramas/', views.subprogramas, name="subprogramas"),
    path('ver_subprograma/<int:pk>', views.ver_subprograma, name="ver_subprograma"),
    
    path('ver_perfil/', views.ver_perfil, name="ver_perfil"),
    path('editar_perfil/', views.editar_perfil, name="editar_perfil"),
    path('eliminar_perfil/', views.eliminar_perfil, name="eliminar_perfil"),

    #Área Staff
    path('nuevo_proyecto/', views.nuevo_proyecto, name="nuevo_proyecto"),
    path('editar_proyecto/<int:pk>', views.editar_proyecto, name="editar_proyecto"),
    path('borrar_proyecto/<int:pk>', views.borrar_proyecto, name="borrar_proyecto"),

    path('nuevo_participante/', views.nuevo_participante, name="nuevo_participante"),
    path('editar_participante/<int:pk>', views.editar_participante, name="editar_participante"),
    path('borrar_participante/<int:pk>', views.borrar_participante, name="borrar_participante"),

    path('nueva_timesheet/', views.nueva_timesheet, name="nueva_timesheet"),
    path('editar_timesheet/<int:pk>', views.editar_timesheet, name="editar_timesheet"),
    path('borrar_timesheet/<int:pk>', views.borrar_timesheet, name="borrar_timesheet"),

    path('nuevo_programa/', views.nuevo_programa, name="nuevo_programa"),
    path('editar_programa/<int:pk>', views.editar_programa, name="editar_programa"),
    path('borrar_programa/<int:pk>', views.borrar_programa, name="borrar_programa"),

    path('nuevo_subprograma/', views.nuevo_subprograma, name="nuevo_subprograma"),
    path('editar_subprograma/<int:pk>', views.editar_subprograma, name="editar_subprograma"),
    path('borrar_subprograma/<int:pk>', views.borrar_subprograma, name="borrar_subprograma"),

    path('nueva_convocatoria/', views.nueva_convocatoria, name="nueva_convocatoria"),
    path('editar_convocatoria/<int:pk>', views.editar_convocatoria, name="editar_convocatoria"),
    path('borrar_convocatoria/<int:pk>', views.borrar_convocatoria, name="borrar_convocatoria"),

    path('borrar_archivo/<int:pk>', views.borrar_archivo, name="borrar_archivo"),
    path('borrar_tarea/<int:pk>', views.borrar_tarea, name="borrar_tarea"),

    #Área del Admin 

    #EXTRA
    path('información/', views.informacion, name="informacion"),
    path('contacto/', views.contacto, name="contacto"),
]
