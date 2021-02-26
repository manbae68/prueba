Prueba git
use evadoc;

create table rol (
    id int primary key, 
    nombre varchar(30)
); 

insert into rol ( id, nombre ) values (1,'Docente');
insert into rol ( id, nombre ) values (2,'Coordinador Facultad');
insert into rol ( id, nombre ) values (3,'Director Programa');
insert into rol ( id, nombre ) values (4,'Decano Facultad');
insert into rol ( id, nombre ) values (5,'Coordinador Institución');
insert into rol ( id, nombre ) values (6,'Director Institución');
insert into rol ( id, nombre ) values (7,'Coordinador Escuela');

create table facultad(
    id int auto_increment primary key,
    nombre varchar(60)
);

create table escuela(
    id int auto_increment primary key,
    nombre varchar(75),
    idFacultad int,
    foreign key (idFacultad) references facultad(id)
);

create table usuario(
    id bigint auto_increment primary key,
    nombre varchar(30),
    apellido varchar(30),
    usuario varchar(20) unique,
    clave text(40),
    fechaRegistro date,
    idFacultad int,
    idEscuela int,    
    idRol int,
    idTutor bigint
);

create table sede (id int primary key, descripcion varchar(20));
INSERT INTO sede (ID,DESCRIPCION) VALUES (1,'Bogotá');
INSERT INTO sede (ID,DESCRIPCION) VALUES (2,'Cali');
INSERT INTO sede (ID,DESCRIPCION) VALUES (3,'Medellin');

create table cargo (id int primary key, descripcion varchar(40));
INSERT INTO cargo (ID,DESCRIPCION) VALUES (1,'PMT AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (2,'PROFESOR CATEDRA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (3,'PTC ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (4,'PTC ASOCIADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (5,'PTC AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (6,'PTC AUXILIAR - CONSEJERO ACADEMICO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (7,'PTC AUXILIAR - COOR. ACREDITACION PROGRA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (8,'PTC AUXILIAR - COOR. AUTOEVALUACION PREG');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (9,'PTC AUXILIAR - COOR. DESARROLLO DOCENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (10,'PTC AUXILIAR - COOR. FOMENTO INVESTIGACI');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (11,'PTC AUXILIAR - COOR. GEST Y COOP NAL/INT');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (12,'PTC AUXILIAR - COOR. PROCESOS INDUSTRIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (13,'PTC AUXILIAR - COORDINADOR PRACTICAS');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (14,'PTC AUXILIAR  COORDINADOR RC PREGRADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (15,'PTC FORMACION');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (16,'PTC FORMACION CONSEJERO ACADEMICO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (17,'PTC INICIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (18,'PTC INICIAL - COOR. ASESORIA PEDAG/ESCEN');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (19,'PTC INICIAL - COORDINADOR RC POSGRADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (20,'PTC INICIAL- COOR. GESTION CONOCIMIENTO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (21,'PTC TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (22,'PTC TITULAR -  - COOR ARTES DE LA ESCENA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (23,'PTC TITULAR -  COOR OFICINA DE INCLUSION');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (24,'PTCI ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (25,'PTCI ASOCIADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (26,'PTCI ASOCIADO - COOR LABORATORIO EXP.INM');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (27,'PTCI AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (28,'PTCI TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (29,'PTCV ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (30,'PTCV AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (31,'PTCV AUXILIAR - COOR. PROYECTOS ESPECIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (32,'PTCV AUXILIAR CV - COOR VIRTUAL FACULTAD');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (33,'PTCV INICIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (34,'PTCV TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (35,'TMT VIRTUAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (36,'TUTOR VIRTUAL');


create table estado (id int primary key, descripcion varchar(10));
insert into estado (id,descripcion) values (1,'Activo');
insert into estado (id,descripcion) values (2,'Inactivo');

create table tutor(
    id bigint primary key, 
    usuario varchar(20) unique, 
    nombre varchar(30),
    apellido varchar(30),
    telefono varchar(20),
    idEscuela int,
    idSede int,
    idCargo int,
    idEstado int,
    foreign key (idEscuela) references escuela(id),
    foreign key (idSede) references sede(id),    
    foreign key (idCargo) references cargo(id),
    foreign key (idEstado) references estado(id)   
);
 
create table criterio (
    id int primary key, 
    descripcion varchar(40),
    criterio varchar(255)
);

insert into criterio (id,
    descripcion,
    criterio
    )
    values ( 1,
    'No Revisión Semana Cero',
    'El tutor cumple con la revisión y aceptación de el (los) módulo(s) durante la semana 0.'
    );

insert into criterio (id,
    descripcion,
    criterio
    )
    values (2,
    'Tiene Casos CRM',
    'El tutor atiende los requerimientos que se reportan a través del CRM o de las alertas tempranas en relación con su actividad docente en el aula virtual.'    
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (3,
    'No Ingreso frecuente a Módulos ',
    'El tutor ingresa con frecuencia, no mayor a 48 horas, a los módulos que están a su cargo.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (4,
    'Calificaciones fuera de los tiempos',
    'El tutor califica y retroalimenta  los trabajos dentro de los tiempos establecidos.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (5,
    'Anuncios, Mensajes y Foros',
    'El tutor maneja adecuadamente los recursos del módulo:  anuncios,  mensajes etc.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (6,
    'Encuentros Sincrónicos',
    'El tutor cumple con los encuentros sincrónicos programados acorde con la ruta tutorial.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (7,
    'Entrega Oportuna Requerimientos',
    'El tutor entrega oportunamente los informes solicitados por la Coordinación Virtual, la Dirección de Escuela y/o la Decanatura.'
    );

 insert into criterio (id,
    descripcion,
    criterio
     )
    values (8,
    'Retroalimenta Actividades Evaluativas',
    'El tutor  presenta reportes y retroalimentaciones de calidad para las actividades evaluativas ( bancos de preguntas PIF).'
    );
    
   insert into criterio (id,
    descripcion,
    criterio
     )
    values (9,
    'Apoya al Equipo en las Actividades',
    'El tutor contribuye y/o apoya al equipo de trabajo en las actividades requeridas (revisión aulas master, estrategia TAV, acompañamiento sincrónico, actualización de módulos, entre otros).'
    );
    
    
create table cohorte (
    id int auto_increment primary key, 
    nombre varchar(6),
    anyo int,
    cohorte int
);    

create table evaluaciondocvir(
    id int auto_increment primary key, 
    idTutor bigint,
    anyo int,
    semestre int,
    cohorte int,
    bloque int,
    idCriterio int,
    cantidadModulos int,
    numeroCaso varchar(20),
    observaciones varchar(80),
    puntajeProceso int,
    puntajeEncuentro int,
    puntajeInforme int,
    puntajeRetro int,
    puntajeApoyo int,
    puntajeCualifica int,
    puntajeSancion int,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,
    foreign key (idTutor) references tutor(id),
    foreign key (idCriterio) references criterio(id),
    index (idTutor)
);
      
create table rubrica (idCriterio int, puntaje int, indicador varchar(82),valIni int, valFin int,
    primary key (idCriterio,puntaje),
    foreign key (idCriterio) references criterio(id));

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,5,'Ningún reporte.',0,0);    
    
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,1,'Más de 6 casos.',7,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,2,'5 o 6 casos.',5,6);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,3,'3 o 4 casos.',3,4);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,4,'1 o 2 casos.',1,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,5,'No se reportan casos.',0,0);

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,5,'Ningún reporte.',0,0);

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,5,'Ningún reporte.',0,0);

insert into rubrica (idCriterio, puntaje, indicador) values (5,1,'Cumple con menos del 25% de los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,2,'Cumple con el 25% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,3,'Cumple con el 50% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,4,'Cumple con el 75% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,5,'Cumple con el 100% con los niveles establecidos en la ruta tutorial.');

insert into rubrica (idCriterio, puntaje, indicador) values (6,1,'No realiza encuentros sincrónicos.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,2,'Realiza el 25% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,3,'Realiza el 50% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,4,'Realiza el 75% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,5,'Realiza el 100% de los encuentros, de acuerdo con la ruta tutorial.');

insert into rubrica (idCriterio, puntaje, indicador) values (7,1,'No entrega informes oportunamente.');
insert into rubrica (idCriterio, puntaje, indicador) values (7,3,'Entrega parcialmente los informes solicitados, dentro de los tiempos establecidos.');
insert into rubrica (idCriterio, puntaje, indicador) values (7,5,'Entrega todos los informes solicitados oportunamente.');

insert into rubrica (idCriterio, puntaje, indicador) values (8,1,'No retroalimenta las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,2,'Retrolimenta el 25% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,3,'Retrolimenta el 50% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,4,'Retrolimenta el 75% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,5,'Retrolimenta el 100% de las actividades.');

insert into rubrica (idCriterio, puntaje, indicador) values (9,1,'No apoya al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,2,'Apoya en un 25% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,3,'Apoya en un 50% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,4,'Apoya en un 75% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,5,'Apoya en un 100% al equipo de trabajo.');

create table imptutor(
    id bigint primary key, 
    correo varchar(40),
    nombre varchar(30),
    apellido varchar(30),
    telefono varchar(20),
    sede varchar(20),
    cargo varchar(50),
    idUsuario int
);

create table dimension (    
    id int primary key, 
    descripcion  varchar(20));
    
insert into dimension (id, descripcion) values (1, 'Comunicativa');
insert into dimension (id, descripcion) values (2, 'Planificación');
insert into dimension (id, descripcion) values (3, 'Pedagógica');
insert into dimension (id, descripcion) values (4, 'Servicio');
insert into dimension (id, descripcion) values (5, 'Trabajo en equipo');
insert into dimension (id, descripcion) values (6, 'Gestión de Procesos');
insert into dimension (id, descripcion) values (7, 'Investigación');
insert into dimension (id, descripcion) values (8, 'Innovación');
insert into dimension (id, descripcion) values (9, 'Mot Logro');
insert into dimension (id, descripcion) values (10, 'Adaptabilidad');
insert into dimension (id, descripcion) values (11, 'AZ');
insert into dimension (id, descripcion) values (12, 'AZ Continuo');
insert into dimension (id, descripcion) values (13, 'Digital');
insert into dimension (id, descripcion) values (14, 'Calidad');
insert into dimension (id, descripcion) values (15, 'Gestión');

create table unidad (id int primary key, descripcion varchar(15));
insert into unidad (id,descripcion) values (1,'Estudiante Pre');
insert into unidad (id,descripcion) values (2,'Estudiante Vir');
insert into unidad (id,descripcion) values (3,'Profesor Pre');
insert into unidad (id,descripcion) values (4,'Profesor Vir');
insert into unidad (id,descripcion) values (5,'Direccion Pre');
insert into unidad (id,descripcion) values (6,'Direccion Vir');
insert into unidad (id,descripcion) values (7,'Acad-Admin Pre');
insert into unidad (id,descripcion) values (8,'Acad-Admin Vir');
insert into unidad (id,descripcion) values (9,'Labor Pre');
insert into unidad (id,descripcion) values (10,'Labor Vir');

 create table itemautoevaluacionvir (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id)  
    );
 
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (1,4,1,"Utilizo la sección de anuncios para publicar información relevante.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (2,4,1,"El mensaje de bienvenida incluye las recomendaciones generales del módulo y el logro de las competencias.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (3,4,1,"Respondo oportunamente  las  inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (4,4,1,"Respondo respetuosamente las  inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (5,4,1,"Respondo de manera clara las inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (6,4,1,"Publico oportunamente los horarios de encuentros sincrónicos.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (7,4,2,"Programo los encuentros sincrónicos acorde con la ruta tutorial.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (8,4,2,"Cumplo con los horarios establecidos para los encuentros sincrónicos.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (9,4,3,"Desarrollo las sesiones sincrónicas dando valor agregado al aprendizaje del estudiante.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (10,4,1,"Retroalimento oportunamente las distintas actividades.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (11,4,3,"Envío recordatorios de las distintas actividades evaluativas.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (12,4,3,"Doy a conocer los criterios de evaluación para cada una de las actividades.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (13,4,3,"Fomento el uso de recursos  y  material bibliográfico adicionales como apoyo o complemento para el logro de los objetivos de aprendizaje.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (14,4,3,"Empleo distintas estrategias para facilitar el desarrollo de las competencias del módulo.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (15,4,3,"Ofrezco acompañamiento frecuente y oportuno durante el desarrollo de las actividades del módulo  (casos, proyectos, foros, talleres, trabajos, entre otros).");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (16,4,3,"Doy aportes y sugerencias con relación a materiales, evaluaciones y enfoque del módulo.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (17,4,3,"Participo activamente en los diferentes comités o reuniones convocados por las coordinaciones virtuales, la Escuela y/o la Facultad.");

create table autoevaluacionvir (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    cohorte int,
    bloque int,
    semestre int,
    usuario varchar(20),    
    puntaje1 int,
    puntaje2 int,
    puntaje3 int,
    puntaje4 int,
    puntaje5 int,
    puntaje6 int,
    puntaje7 int,
    puntaje8 int,
    puntaje9 int,
    puntaje10 int,
    puntaje11 int,
    puntaje12 int,
    puntaje13 int,
    puntaje14 int,
    puntaje15 int,
    puntaje16 int,
    puntaje17 int,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,   
    primary key (idTutor,anyo,cohorte,bloque) 
    );

 create table itemautoevaluacionpre (
    id int primary key, 
    idUnidad int,  
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );

insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (1,3,3,"Oriento el proceso de aprendizaje con seguridad y claridad, cuando un concepto no queda claro, lo explico de otra manera.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (2,3,3,"Me preocupo por realizar clases interesantes y motivadoras para los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (3,3,3,"Asisto a clase y/o encuentros sincrónicos puntualmente y cumplo con el horario establecido");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (4,3,3,"Promuevo la reflexión sobre las implicaciones o aplicaciones prácticas de lo tratado en clase.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (5,3,3,"Entrego durante la primera semana al estudiante y a la dirección de la Escuela, el sílabo de las asignaturas a mi  cargo.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (6,3,3,"Reporto en la plataforma y el sistema académico oportunamente las notas de los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (7,3,3,"Hago seguimiento de los procesos de aprendizaje de los estudiantes y los informo a la dirección de la Escuela o Decanatura");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (8,3,3,"Participo activamente en los diferentes comités o reuniones convocados por la escuela, la Facultad y la institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (9,3,3,"Utilizo y  fomento el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas de clase");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (10,3,3,"Diseño y aplico instrumentos evaluación basados en la interpretación, el análisis, el juicio y la creatividad que valoren los conocimientos, las aptitudes y las actitudes de los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (11,3,3,"Devuelvo con comentarios u observaciones los trabajos o evaluaciones escritas y realizo observaciones y retroalimentación a los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (12,3,3,"Planifico y realizo actividades donde el estudiante logra fortalecer su proceso de aprendizaje.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (13,3,7,"La orientación que imparto permite en los estudiantes el análisis, desarrollo del pensamiento  crítico  de acuerdo con sus intereses.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (14,3,7,"Promuevo en el aula la identificación de problemas que pueden ser abordados con base en los conocimientos adquiridos por los estudiantes en el marco de los procesos formativos");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (15,3,7,"Me intereso en desarrollar procesos de pensamiento complejo y análisis crítico y motivo al estudiante para hacerlo.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (16,3,7,"Asisto a las actividades de investigación convocadas por la Escuela, la Facultad o la Institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (17,3,7,"Me intereso en promover la participación de mis estudiantes en proyectos de investigación de la Escuela, Facultad o la Institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (18,3,11,"Implemento acciones inmediatas para resolver una situación determinada, relacionada con mi labor.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (19,3,11,"Me intereso por aprender nuevos conocimientos relacionados con mi área de desempeño personal o profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (20,3,11,"Realizo procesos de evaluación de mis desempeños para evidenciar mis aciertos y desaciertos con el fin de mejorar mis acciones personales y profesionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (21,3,12,"Asisto a cursos, seminarios, congresos o demás eventos académicos mínimo una vez al año con el fin de actualizar mi saber disciplinar");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (22,3,12,"Identifico e incorporo en mis acciones, las buenas prácticas apropiadas por los pares referentes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (23,3,12,"Adelanto planes de mejoramiento y fortalecimiento de mis competencias.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (24,3,12,"Me esfuerzo por mejorar o satisfacer un determinado criterio de excelencia a pesar de los obstáculos y los contratiempos.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (25,3,12,"Tengo un plan de formación posgradual que me permita cumplir con mis desempeños personales y profesionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (26,3,12,"Me capacito en temas relacionados con mis funciones de docencia, investigación, extensión e innovación.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (27,3,12,"Aprendo uno o varios idiomas diferentes al de mi dominio");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (28,3,8,"Promuevo la creatividad e innovación para la solución de problemas o necesidades propias de las áreas de formación");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (29,3,8,"Promuevo el desarrollo de actividades académicas y evaluativas para resolver necesidades del sector real en nuestras áreas de formación");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (30,3,9,"Logro motivar a mis estudiantes para realizar modificaciones a sus conductas y actitudes a nivel personal y profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (31,3,9,"Me esfuerzo por trascender el ejercicio pedagógico de aula y virtual y preocuparme por el desarrollo integral de mis estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (32,3,10,"Adapto las metodologías de enseñanza, aprendizaje y evaluación, a las diferentes manifestaciones culturales encontradas en los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (33,3,10,"Acepto en los otros, las diferentes formas de ver y abordar el mundo, de vivir, de pensar y de concebir la vida.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (34,3,10,"Me adapto a grupos con expresiones culturales diferentes a la mía.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (35,3,10,"Modifico mis métodos y/o actitudes cuando he acordado hacer cambios con mis estudiantes o con la dirección de programa o de Escuela");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (36,3,10,"Mi actuar es congruente con los elementos de la cultura institucional, me siento reconocido e integrado. ");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (37,3,1,"Utilizo en clase un lenguaje sencillo y comprensible para el estudiante.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (38,3,1,"Mi lenguaje verbal y no verbal, facilita mi interacción con los estudiantes, docentes y administrativos de la institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (39,3,1,"Escucho y reflexiono las propuestas y opiniones de los estudiantes, respecto a las distintas actividades desarrolladas en clase y extraclase.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (40,3,4,"Comprendo las diferentes situaciones de los estudiantes y los ayudo a tomar las mejores decisiones para su bienestar personal y profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (41,3,5,"Trabajo en equipo compartiendo la responsabilidad del trabajo y gestiono acciones y proyectos con mi área u otras áreas institucionales para alcanzar las metas trazadas");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (42,3,5,"Promuevo el desarrollo de espacios de trabajo colaborativo en función de enriquecer mi quehacer disciplinar con diferentes áreas, escuelas y saberes institucionales o interinstitucionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (43,3,13,"Propongo, utilizo y aplico actividades formativas que involucran el uso de TIC, a los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (44,3,13,"Mantengo actualizado el Sílabo con actividades que permiten apoyar el trabajo en clase como simuladores, herramientas virtuales y herramientas tecnológicas para  el aprendizaje autónomo y colaborativo de los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (45,3,13,"Tengo una actitud positiva hacia las TIC");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (46,3,14,"Realizo mi trabajo de manera organizada y presto atención a los detalles para garantizar altos estánderes de calidad");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (47,3,14,"Aprendo de mis errores y trato de buscar soluciones basadas en la experiencia buscando siempre mi mejor actuar");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (48,3,2,"Organizo mi trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos, y, realizo seguimiento permanente de su cumplimiento");

create table autoevaluacionpre (
	id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    usuario varchar(20),    
    semestre int,
    puntaje1 int,
    puntaje2 int,
    puntaje3 int,
    puntaje4 int,
    puntaje5 int,
    puntaje6 int,
    puntaje7 int,
    puntaje8 int,
    puntaje9 int,
    puntaje10 int,
    puntaje11 int,
    puntaje12 int,
    puntaje13 int,
    puntaje14 int,
    puntaje15 int,
    puntaje16 int,
    puntaje17 int,
    puntaje18 int,
    puntaje19 int,
    puntaje20 int,
    puntaje21 int,
    puntaje22 int,
    puntaje23 int,
    puntaje24 int,
    puntaje25 int,
    puntaje26 int,
    puntaje27 int,
    puntaje28 int,
    puntaje29 int,
    puntaje30 int,
    puntaje31 int,
    puntaje32 int,
    puntaje33 int,
    puntaje34 int,
    puntaje35 int,
    puntaje36 int,
    puntaje37 int,
    puntaje38 int,
    puntaje39 int,
    puntaje40 int,
    puntaje41 int,
    puntaje42 int,
    puntaje43 int,
    puntaje44 int,
    puntaje45 int,
    puntaje46 int,
    puntaje47 int,
    puntaje48 int,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );

 create table itemevaestvirtual (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)         
    );
 
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (1,2,2,"El mensaje de bienvenida enviado por el tutor incluye las recomendaciones generales del módulo y el logro de las competencias.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (2,2,1,"El tutor responde oportunamente mis inquietudes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (3,2,1,"El tutor responde respetuosamente mis inquietudes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (4,2,1,"El tutor publica oportunamente los horarios de encuentros sincrónicos.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (5,2,3,"El tutor responde de manera clara las inquietudes de todos los estudiantes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (6,2,2,"El tutor da cumplimiento a los horarios establecidos para las tutorías sincrónicas.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (7,2,3,"Las sesiones sincrónicas se planean adecuadamente y suma valor agregado para mi aprendizaje.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (8,2,3,"El tutor ofrece retroalimentación oportuna a las distintas actividades.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (9,2,2,"El tutor envía recordatorios de las distintas actividades evaluativas.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (10,2,3,"El tutor da a conocer los criterios de evaluación para cada una de las actividades.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (11,2,3,"El tutor fomenta el uso de recursos  y  material bibliográfico adicionales que apoyan o complementan la comprensión de las temáticas del módulo");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (12,2,3,"El tutor utiliza distintas estrategias para facilitar el desarrollo de las competencias");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (13,2,3,"Las actividades académicas  (casos, proyectos, foros, talleres, trabajos, entre otros) son guiadas de manera clara y permanente por parte del tutor.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (14,2,3,"El tutor logra despertar mi interés por profundizar en las temáticas del módulo.");
  
 create table evaluacionestvirtual (
     id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    cohorte int,
    bloque int,
    modulo varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (anyo,cohorte,bloque,modulo,usuario) 
    );

 create table impevaestvirtual(
    id bigint auto_increment primary key, 
    anysemcohblo varchar(50),
    anyo int,
    semestre int,
    cohorte int,
    bloque int,   
    modulo varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    promedio float,
    idUsuario int
);   
   
 create table itemevaestpresencial (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)        
    );
 
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (1,1,3,"El profesor expone claramente los temas de la asignatura, soluciona nuestras dudas y proporciona apoyo para nuestra comprensión.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (2,1,3,"El profesor consigue que estemos motivados e interesados en el transcurso del semestre.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (3,1,3,"Las clases y/o encuentros sincrónicos están bien preparados, organizados, estructurados y se cumplen puntualmente.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (4,1,3,"El profesor relaciona los conocimientos teóricos con la práctica y la realidad.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (5,1,3,"El profesor al inicio de la asignatura da a conocer y explica el sílabo.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (6,1,3,"El profesor realiza realimentación oportuna de los trabajos y evaluaciones realizadas.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (7,1,3,"Las evaluaciones realizadas por el profesor se basan en los temas establecidos en el silabo.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (8,1,3,"El profesor utiliza y fomenta el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas trabajados en clase o encuentros sincrónicos.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (9,1,3,"El profesor mantiene actualizado el Sílabo con actividades que permiten apoyar el trabajo en clase como simuladores, herramientas virtuales y herramientas tecnológicas para  motivar mi aprendizaje.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (10,1,7,"El profesor promueve actividades que estimulan mi deseo e  interés por la búsqueda de soluciones argumentadas y con fundamentos teóricos.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (11,1,7,"El profesor estimula mi capacidad para resolver situaciones relacionadas con los contenidos de mi programa.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (12,1,11,"El profesor implementa acciones inmediatas para resolver un conflicto académico o actitudinal.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (13,1,8,"El profesor promueve en sus clases la creatividad e innovación para la solución de problemas o necesidades de nuestra área de formación.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (14,1,8,"El profesor promueve el desarrollo de actividades académicas y evaluativas para resolver necesidades del sector real en nuestras áreas de formación.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (15,1,9,"El profesor con su desempeño logra motivar en mi el desarrollo de cambios y transformaciones a nivel personal y profesional.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (16,1,10,"Me siento reconocido, integrado y respetado en sus clases.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (17,1,1,"El profesor utiliza un lenguaje sencillo y comprensible, acorde con el tema de las clases.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (18,1,4,"El profesor comprende las diferentes situaciones que se presentan y nos ayuda para tomar decisiones acertadas.");
    
create table evaluacionestpresencial (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    asignatura varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    puntaje15 float,
    puntaje16 float,
    puntaje17 float,
    puntaje18 float,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );

 create table impevaestpresencial(
    id bigint auto_increment primary key,
    idTutor bigint,
    nomapeTutor varchar(60),
    anyosemestre varchar(6),
    asignatura varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    puntaje15 float,
    puntaje16 float,
    puntaje17 float,
    puntaje18 float,    
    promedio float,
    idUsuario int
);       

-- Evaluación Facultad Presencial

 create table itemevafacultadpre (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );
 
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (1,5,3,"El profesor hace seguimiento de los procesos de aprendizaje de los estudiantes y los informa a la dirección de la Escuela o Decanatura");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (2,5,3,"El profesor utiliza y  fomenta el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas de clase");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (3,5,7,"El profesor se interesa por promover la participación de los estudiantes proyectos de investigación de la Escuela, Faculta  o la Institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (4,5,11,"El profesor se interesa por aprender nuevos conocimientos relacionados con su área de desempeño profesional o personal");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (5,5,8,"El profesor promueve la gestión de proyectos o ideas transformadoras e innovadoras para el desarrollo del programa, la Escuela o la Facultad");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (6,5,9,"El profesor se esfuerza por trascender el ejercicio pedagógico de aula y virtual y preocuparse por el desarrollo integral de sus estudiantes");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (7,5,10,"El profesor escucha y acoge las instrucciones y observaciones del Director de Escuela o Decano de Facultad, respecto a su desempeño");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (8,5,10,"El profesor muestra congurencia entre su actuar y los elementos de la cultura organizacional POLI.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (9,5,1,"El profesor con su lenguaje verbal y no verbal, facilita la interacción con los estudiantes, docentes y administrativos de la institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (10,5,5,"El profesor trabaja en equipo compartiendo la responsabilidad del trabajo y gestiona acciones y poryectos con su área u otras áreas institucionales para alcanzar las metas trazadas");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (11,5,13,"El profesor tiene una actitud positiva hacia las TIC y las implementa en sus procesos académicos y administrativos");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (12,5,14,"El profesor realiza su trabajo de manera organizada y presta atención a los detalles para garantizar altos estánderes de calidad");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (13,7,3,"El profesor asiste a clase y/o encuentros sincrónicos puntualmente y cumple con el horario establecido");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (14,7,3,"El profesor propone actualizaciones de los sílabos de las asignaturas o módulos a su cargo. ");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (15,7,3,"El profesor reporta oportunamente las notas en el sistema y físicas a la dirección de la Escuela o Facultad.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (16,7,3,"El profesor participa activamente en los diferentes inducciones, comités o reuniones convocados por la Escuela, Decanatura y el Poli");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (17,7,7,"El profesor asiste a las actividades de investigación y proyección social convocadas por el Programa, la Escuela, la Facultad o la Institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (18,7,12,"El profesor cumple con los planes de mejoramiento derivados de los procesos de evaluación docente.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (19,7,12,"El profesor desarrolla los cursos de formación ofrecidos en el Plan de Cualificación Institucional");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (20,7,15,"El profesor tiene llamados de atención o sanciones disciplinarias durante el último semestre");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (21,7,15,"El profesor tiene la hoja de vida actualizada de acuerdo con los respectivos soportes");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (22,9,6,"El profesor cumple con el horario previsto para el desarrollo de las actividades de la Labor Académica Docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (23,9,2,"El profesor organiza su trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (24,9,2,"El profesor realiza seguimiento permanente al cumplimiento de los objetivos previstos en la labor docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (25,9,2,"El profesor cumple con la entrega de los avances esperados en cada una de las fases previstas para el desarrollo de su labor docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (26,9,2,"El profesor cumple con la entrega final prevista de la labor docente asignada durante el periodo académico");

create table evaluacionfacultadpre (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    usuario varchar(20),
    puntaje1 int,puntaje2 int,puntaje3 int,puntaje4 int,puntaje5 int,puntaje6 int,puntaje7 int,
    puntaje8 int,puntaje9 int,puntaje10 int,puntaje11 int,puntaje12 int,puntaje13 int,puntaje14 int,
    puntaje15 int,puntaje16 int,puntaje17 int,puntaje18 int,puntaje19 int,puntaje20 int,puntaje21 int,
    puntaje22 int,puntaje23 int,
    promedioDoc float , promedioLabor float, promedioAcaAdm float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );

-- Evaluación RRHH Presencial

 create table itemevarrhhpre (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );

insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (1,7,12,"El profesor desarrolla los cursos de formación ofrecidos en el Plan de Cualificación Institucional");
insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (2,7,6,"El profesor tiene llamados de atención o sanciones disciplinarias durante el último semestre");
insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (3,7,6,"El profesor tiene la hoja de vida actualizada de acuerdo con los respectivos soportes");

create table evaluacionrrhh (
	id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    usuario varchar(20),
    puntaje1 int,puntaje2 int,puntaje3 int,promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );
    
-- Evaluación Facultad Virtual

 create table itemevafacultadvir (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );
 
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (1,6,2,"El tutor cumple con la revisión y aceptación de el (los) módulo(s) durante la semana 0.  ");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (2,6,4,"El tutor ingresa con frecuencia, no mayor a 48 horas, a los módulos que están a su cargo.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (3,6,3,"El tutor califica y retroalimenta  los trabajos dentro de los tiempos establecidos.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (4,6,3,"El tutor maneja adecuadamente los recursos del módulo:  anuncios,  mensajes etc.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (5,6,3,"El tutor cumple con los encuentros sincrónicos programados acorde con la ruta tutorial.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (6,6,3,"El tutor  presenta reportes y retroalimentaciones de calidad para las actividades evaluativas ( bancos de preguntas PIF)");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (7,6,5,"El tutor contribuye y/o apoya al equipo de trabajo en las actividades requeridas (revisión aulas master, estrategia TAV, acompañamiento sincrónico, actualización de módulos, entre otros)");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (8,6,4,"El tutor entrega oportunamente los informes solicitados por la Coordinación Virtual, la Dirección de Escuela y/o la Decanatura.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (9,6,4,"El tutor atiende los requerimientos que se reportan a través del CRM o de las alertas tempranas en relación con su actividad docente en el aula virtual");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (10,6,2,"El tutor participa en los planes de cualificación institucionales");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (11,6,15,"El tutor tiene llamados de atención o sanciones disciplinarias durante el último semestre");

insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (12,10,6,"El tutor cumple con el horario previsto para el desarrollo de las actividades de la Labor Académica Docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (13,10,2,"El tutor organiza su trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (14,10,2,"El tutor realiza seguimiento permanente al cumplimiento de los objetivos previstos en la labor docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (15,10,2,"El tutor cumple con la entrega de los avances esperados en cada una de las fases previstas para el desarrollo de su labor docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (16,10,2,"El tutor cumple con la entrega final prevista de la labor docente asignada durante el periodo académico");

create table evaluacionfacultadvir (
	id bigint auto_increment unique,  
    idTutor bigint,
    anyo int,
    cohorte int,
    bloque int,
    semestre int, 
    usuario varchar(20),
    puntaje1 int, puntaje2 int, puntaje3 int, puntaje4 int, puntaje5 int, puntaje6 int, puntaje7 int, puntaje8 int, 
    puntaje9 int, puntaje10 int, puntaje11 int, puntaje12 int, puntaje13 int, puntaje14 int, 
    promedioDoc float, promedioLabor float, promedioAcaAdm float,   
    usuarioRegistro varchar(20),   fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre,cohorte,bloque) 
    );
    
-- Insertar las facultades y escuelas 
INSERT INTO facultad (ID,NOMBRE) VALUES (1,'FACULTAD DE INGENIERIA DISEÑO E INNOVACION');
INSERT INTO facultad (ID,NOMBRE) VALUES (2,'FACULTAD DE NEGOCIOS GESTIÓN Y SOSTENIBILIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (3,'FACULTAD DE SOCIEDAD, CULTURA Y CREATIVIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (4,'GERENCIA DE SERVICIO Y PERMANENCIA');
INSERT INTO facultad (ID,NOMBRE) VALUES (5,'DIRECCION ASEGURAMIENTO DE LA CALIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (6,'DIRECCION BIENESTAR UNIVERSITARIO Y HUELLA GRANCOLOMBIANA');
INSERT INTO facultad (ID,NOMBRE) VALUES (7,'DIRECCION DE CURRICULO PRESENCIAL Y VIRTUAL');
INSERT INTO facultad (ID,NOMBRE) VALUES (8,'DIRECCION DE GESTION DOCENTE');
INSERT INTO facultad (ID,NOMBRE) VALUES (9,'DIRECCION INVESTIGACION INNOVACION Y CREACION');

INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,3,'ESCUELA DE CIENCIAS BASICAS (ESCUELA CB)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,4,'ESCUELA DE DISEÑO (ESCUELA D)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,2,'ESCUELA DE OPTIMIZACION INFRAESTRUCTURA Y AUTOMATIZACION (ESCUELA OPINA)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,1,'ESCUELA DE TECNOLOGIAS DE LA INFORMACION Y LAS COMUNICACIONES (ESCUELA TIC)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,5,'FACULTAD INGENIERIA DISENO E INNOVACION');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,6,'ESCUELA DE ADMINISTRACION Y COMPETITIVIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,7,'ESCUELA DE CONTABILIDAD INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,8,'ESCUELA DE NEGOCIOS Y DESARROLLO INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,9,'ESCUELA COMUNICACIÓN ARTES VISUALES Y DIGITALES');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,10,'ESCUELA DE DERECHO Y GOBIERNO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,11,'ESCUELA DE EDUCACION E INNOVACION');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,12,'ESCUELA DE ESTUDIOS EN PSICOLOGIA TALENTO HUMANO Y SOCIEDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,13,'ESCUELA DE MARKETING Y BRANDING');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,14,'ESCUELA DE NEGOCIOS Y DESARROLLO INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,15,'ESCUELA DERECHO Y GOBIERNO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,16,'FACULTAD SOCIEDAD CULTURA Y CREATIVIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,17,'SERVICIOS Y PERMANENCIA CENTRO-ORIENTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,18,'SERVICIOS Y PERMANENCIA NORTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,19,'SERVICIOS Y PERMANENCIA OCCIDENTE-SUR');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (5,20,'ASEGURAMIENTO DE LA CALIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (6,21,'BIENESTAR UNIVERSITARIO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,22,'DESARROLLO VIRTUAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,23,'LABORATORIO VIRTUAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,24,'PRODUCCION DE CONTENIDOS');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (8,25,'GESTION DOCENTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (9,26,'INVESTIGACION INNOVACION Y CREACION');

-- INSERTAR TUTORES 2020
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52113306,'ACHAPPEC','ANGELICA','CHAPPE CHAPPE','573102896467','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51703654,'MZAMBRAN','MARTHA HELENA','ZAMBRANO VALENTIN','573112789171','3','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79394908,'MABERNAL','MIGUEL ANGEL','BERNAL YERMANOS','573144928639','3','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52469370,'LIDIOPRI','LIDIOLA','PRIETO PULIDO','573163019182','6','1','6','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79567350,'CHERMIDA','CAMILO ERNESTO','HERMIDA BENITEZ','573108098358','4','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80003087,'ACHAVARR','ANDRES','CHAVARRO VELANDIA','573202333461','6','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79737385,'MTRUJILO','LUIS MARTIN','TRUJILLO FLOREZ','573134196117','23','1','26','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80063309,'JAPOSADA','JAIME ANDRES','POSADA RESTREPO','573203409657','3','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17320240,'CFMARTIN','CARLOS FERNANDO','MARTINEZ ROCHA','573012392032','8','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79433572,'JROMEROG','JAIME ORLANDO','ROMERO GUAQUETA','3115032936','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52878436,'P_JIMENA','JIMENA MARCELA','PERDOMO','3156358958','18','1','16','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020716193,'DRICCIUL','DAVID','RICCIULLI DUARTE','3203486406','26','1','10','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (34562162,'MFERNAND','MONICA LUCIA','FERNANDEZ MUNOZ','573115458741','15','1','25','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80180987,'LORTEGON','EDWIN LEONARDO','ORTEGON CORTAZAR','3015315340','13','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (12115957,'GROACAST','GUILLERMO','ROA CASTILLO','573143210482','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17323522,'AROMERO','ROMAN ENRIQUE ANDRES','ROMERO BALTODANO','573142193427','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19411159,'RVEGAROD','RICARDO ARTURO','VEGA RODRIGUEZ','573174006061','13','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (35476437,'CORODRIG','MARIA CONSTANZA','RODRIGUEZ BARON','573173076980','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51802754,'MBARONPU','MIREYA','BARON PULIDO','573105635016','9','1','25','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52419888,'mcasasbu','MARIA JOSE','CASASBUENAS ORTIZ','573113545073','4','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79147951,'DIEGOCAR','DIEGO FRANCISCO','CARRIZOSA POSADA','3203458029','9','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79421284,'MCACERES','ELIECER','CACERES MARTIN','300 517 22 20','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79521428,'HERODRIG','HENRY','RODRIGUEZ GRANOBLES','573118089547','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79568443,'ALLERENA','ALFONSO JAVIER','LLERENA POLO','3143346259','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79661012,'caquinones','CESAR AUGUSTO','QUINONES SEGURA','573003458969','3','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79695418,'AERODRIGUEZ','ALVARO ENRIQUE','RODRIGUEZ HERNANDEZ','573163717863','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79750915,'JCASTROM','JAIME ALBERTO','CASTRO MARTINEZ','573152209263','12','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80132016,'CSIERRAV','CESAR AUGUSTO','SIERRA VARON','3104540076','12','3','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80842991,'EANINOVE','EDWIN ANDRES','NINO VELASQUEZ','3112323026','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (9532154,'NJHERNANDEZ','NESTOR JULIAN','HERNANDEZ RINCON','573132544722','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19276210,'RVARGASV','RODOLFO','VARGAS VALLECILLA','3163095574','13','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (14899099,'JAARIASS','JULIAN ANDRES','ARIAS SALAZAR','573162948710','13','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52269525,'SGONZALE','SANDRA PATRICIA','GONZALEZ SALAZAR','316499920','13','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80795877,'WJAIMESF','WILMAR','JAIMES FERNANDEZ','3014091555','1','1','21','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (63529691,'LFMARTINEZR','LUISA FERNANDA','MARTINEZ ROJAS','573162243915','3','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51562841,'MRODRIGU','MARIA CRISTINA','RODRIGUEZ RODRIGUEZ','319 5217372 ','8','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52867933,'MAPINEDA','MARIA ALEJANDRA','PINEDA ESCOBAR','573173731165','8','1','28','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (7300564,'MLARAMAR','MIGUEL ANGEL','LARA MARTINEZ','573107933632','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79642459,'HLOPEZPE','HECTOR LEONARDO','LOPEZ PENUELA','573212351381','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79957495,'GAPIEDRAHITA','GIOVANNY ANDRES','PIEDRAHITA SOLORZANO','573112410530','1','1','25','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80793412,'CARAMIREZS','CAMILO ANDRES','RAMIREZ SANCHEZ','573164185522','3','1','34','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79492984,'OGOMEZAN','OMAR','GOMEZ ANZOLA','573057126868','3','1','6','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (24333647,'jcastell','JULIANA','CASTELLANOS DIAZ','3115023777','9','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52848495,'DVELASQUEZ','DIANA SHIRLEY','VELASQUEZ ROJAS','3132150763','3','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79798291,'GBAQUERO','GIOVANNY ALEXANDER','BAQUERO VILLAMIL','573012389181','2','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80017129,'JSOLERRO','JAIME RODOLFO','SOLER ROLDAN','573005572848','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79380090,'AHILARION','ALVARO ENRIQUE','HILARION MADARIAGA','3152394634','2','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52216715,'ALEONGUA','AIDA XIMENA','LEON GUATAME','3105759945','13','1','27','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (41783433,'CPINEDAM','CECILIA','PINEDA MARIN','573138443986','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80056941,'JNINOVEL','JAVIER FERNANDO','NINO VELASQUEZ','573106664366','1','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79672519,'CAMISACH','CAMILO ANDRES','SANCHEZ RAMOS','3118386030','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19379348,'JCOVEZDY','JALILY','COVEZDY ROJAS','573125960499','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026252411,'AZAMUDIOC','ANDRES IGNACIO','ZAMUDIO CASTRO','573005355820','2','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79751429,'LETABOADA','LUIS ENRIQUE','TABOADA ROJAS','573125866589','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80047995,'cmgranados','CESAR MANUEL','GRANADOS LEON','3138776144','13','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79880055,'nariasv','NICOLAS','ARIAS VELANDIA','3133771524','11','1','27','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030537054,'HUA_MART','DEISY ANDREA','HUACA MARTINEZ','3208775220','2','1','13','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (319306,'SKERAJ','SOKOL','KERAJ','3157133174','9','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79745877,'HACEROOR','HENRY','ACERO ORTEGA','573106953965','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51601883,'OCHOASER','ANGELA CRISTINA','OCHOA SERRANO','573103354679','6','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79487415,'HESPITIA','HERNANDO','ESPITIA LOPEZ','573164711671','6','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52513968,'PHACOSTA','PAOLA HELENA DE LAS MERCED','ACOSTA SIERRA','573182981493','9','1','22','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79843140,'OSROBAYO','OSCAR JAVIER','ROBAYO PINZON','3123004854','13','1','28','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (10784319,'RALVARAD','ROGELIO MANUEL','ALVARADO MARTINEZ','573013930782','3','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (13844262,'AROJASCO','ALEXIS','ROJAS CORDERO','3136522359','1','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79792080,'DMONTALV','DARIO ALBERTO','MONTALVO ABELLA','573017367264','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79939051,'JRPEREA','JULIAN RAUL','PEREA GOMEZ','573112366319','13','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1090385880,'gyanezba','GABRIEL MAURICIO','YANEZ BARRETO','573007517447','2','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020720802,'DCJURADOB','DIANA CAROLINA','JURADO BERNAL','573103044397','21','1','23','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51851821,'CIGARCIAV','CLARA INES','GARCIA VALENCIA','573133501969','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51893342,'CAULLOA','CLAUDIA ANDREA','ULLOA ROMERO','3118489876','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52987366,'CRINCONR','CLAUDIA PATRICIA','RINCON RODRIGUEZ','301 6323610','5','1','32','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79745939,'JLZUNIGA','JAVIER LEONARDO','ZUNIGA MARTIN','3124779594','12','1','13','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79806071,'RDMARTINEZ','RUBEN DARIO','MARTINEZ AMADO','573006157766','6','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79854863,'HAGUZMANU','HUGO ARMANDO','GUZMAN USECHE','573134420248','6','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026250892,'FAMENDOZA','FREDERICK ANDRES','MENDOZA LOZANO','573183672050','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52795939,'CAVIEDEC','NANCY PATRICIA','CAVIEDES CASTILLO','573214494737','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79540230,'MARODRIG','MARIO RAFAEL','RODRIGUEZ CLAVIJO','573183083837','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026250250,'GKVELANDIA','GISETTE KATHERINE','VELANDIA VARGAS','3014148175','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79442754,'MEBAEZ','MANUEL EBERTO','BAEZ MANCERA','573002116313','1','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52795724,'LPARRAPE','LAURA VICTORIA','PARRA PERILLA','573125877011','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79400673,'JROJASMA','JOSE ARTURO','ROJAS MARTINEZ','573174528424','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80888341,'DRUIZQUI','DANIEL RICARDO','RUIZ QUINTERO','573008227107','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (23624150,'SMONDRAG','SONIA ALEXANDRA','MONDRAGON HERNANDEZ','573168326144','7','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52478780,'abautist','ALEJANDRA CAROLINA','BAUTISTA GODOY','573043533281','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (29820488,'SLOPEZRE','SONIA','LOPEZ RENDON','573206447940','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1053787971,'MPACHONR','MATEO','PACHON RINCON','3136744902','2','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52064060,'VCALLYNSON','ALLYSON KAREN','VENEGAS CAMARGO','573105634969','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1023874909,'DLCRUZ','DIEGO LEONARDO','CRUZ SERRANO','3132003480','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (20678552,'ASASTOQU','AMPARO','SASTOQUE ROMERO','513112783488','24','1','31','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52954556,'MZTRUJILLO','MAGDA ZULENA','TRUJILLO RODRIGUEZ','3123680840','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (35512606,'DMSALASC','DIANA MARIA','SALAS CADAVID','3102552853','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52937154,'LARAMIRE','LADY JOHANNA','RAMIREZ MORENO','3102506228','11','1','11','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (4407720,'JGARCIA','JOHANN','GARCIA LOPEZ','573102301799','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80875272,'JCASTROH','JAIME RAFAEL','CASTRO HURTADO','3138775665','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79391628,'JSALINASR','JAVIER','RODRIGUEZ SALINAS','3103351151','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79867268,'CAHERNANDEZO','CESAR AUGUSTO','HERNANDEZ OCAMPO','573002037359','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52726730,'SROJASTO','SANDRA MILENA','ROJAS TOLOSA','573173800583','3','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (40027082,'MGONZALEZM','MARIA GLORIA','GONZALEZ MOLINA','573153154758','6','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79789197,'GCASTROC','GERMAN ANDRES','CASTRO CABAL','573102062943','13','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11324293,'ALGOMEZRRODR','RODRIGUEZ ALFREDO','GOMEZ RODRIGUEZ','3118980246','13','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79747402,'IBARREROR','ISRAEL','BARRERO RAMIREZ','573214460658','13','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52424853,'AKBOHOR','ANDREA KAROLINA','BOHORQUEZ TORRES','573003244455','13','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51899998,'mimorenom','MARTHA INES','MORENO MEDEL','573175127688','7','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (41798773,'tninoben','TERESA DEL PILAR','NINO BENAVIDES','573134240340','9','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52795062,'YVARGASL','YOLANDA ROCIO','VARGAS LEGUIZAMON','573014519898','6','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79431883,'RGOMEZZA','ROBERTO ANTONIO','GOMEZ ZAMBRANO','3108600744','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79553647,'JCROJASPA','JUAN CARLOS','ROJAS PAREDES','573202511626','6','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1073692746,'KROCUADR','KATHERINE','ROZO CUADROS','573013106008','13','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1036614136,'DBOTEROZ','DIANA MARCELA','BOTERO ZULUAGA','3006413773','15','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52966912,'AMPENAP','ANA MARIA','PENA PINEDA','573017156396','16','1','32','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (36303363,'CRODRIGUEZA','CAROLINA','RODRIGUEZ AMAYA','573125000914','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (10294129,'jebucheli','JULIAN EDUARDO','BUCHELI SANDOVAL','573006870122','13','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52106547,'snacunam','SANDRA NAYIBE','ACUNA MOLANO','573158109945','13','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79531115,'gescobarg','GODWARD','ESCOBAR GALVIS','3014933450','4','1','12','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (22668473,'smchicas','SANDRA MILENA','CHICAS SIERRA','3003180039','8','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52232540,'cvelasquez','CLARA ISABEL','VELASQUEZ CASTANEDA','3202446544','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030603005,'JMAREVALOPA','JESSICA MARCELA','AREVALO PARRA','573045235565','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52210279,'oachaparror','OFIR AURORA','CHAPARRO ROJAS','5713125738412','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52728313,'dguerrerop','DIANA LETICIA','GUERRERO PINEDA','3134539465','17','1','6','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018434837,'ltimaran','LEIDY TATIANA','TIMARAN CHAVARRO','3013644913','19','1','6','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11276599,'ITUNJANO','IVAN FRANCISCO','TUNJANO PINZON','3222637385','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1010176077,'LGAITAN','LUIS ALBERTO','ROJAS GAITAN','3132287114','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018457332,'JSMARTINEZ','JUAN SEBASTIAN','MARTINEZ GRISALES','573163081863','2','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020742215,'JPGUTIERREZC','JUAN PABLO','GUTIERREZ CARVAJAL','3134676117','2','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80147641,'JCGUTIERREZ','JUAN CARLOS','GUTIERREZ VANEGAS','3013370645','2','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52514281,'sprojasa','SONIA PATRICIA','ROJAS ALVAREZ','3115526163','7','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71266594,'CZULUAGA','CHRISTIAN DAVID','ZULUAGA ESCOBAR','573007641932','3','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019026575,'jahernandezgom','JULIAN ANDRES','HERNANDEZ GOMEZ','3103372138','12','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52422828,'dpcastaneda','DIANA PATRICIA','CASTANEDA GUERRERO','3124798659','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52428784,'jilguerrero','ANDREA LORENA','GUERRERO JIMENEZ','3167850143','4','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52032535,'VPETERSR','VICTORIA EUGENIA','PETERS RADA','3192512444','4','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52326759,'mtellezp','MARCELA FERNANDA','TELLEZ PEDRAZA','3005557484','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1090411740,'casadiegor','RODOLFO','CASADIEGO ALZATE','3223107121','20','3','8','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52715983,'MORTEGON','MARY NATALIA','ORTEGON CIFUENTES','3124741096','12','1','29','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (32150840,'stejadaf','SORANNY YISETH','TEJADA FLOREZ','573502894636','15','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017153331,'yagudelo','YURY CATALINA','AGUDELO HENAO','3013736000','11','3','11','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79567084,'ARGONZALEZT','ANTONIO RICARDO','GONZALEZ TORRES','5733052520506','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026268827,'LMORTEGON','LINA MARIA','ORTEGON SUAREZ','3007979462','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (39645849,'erlassos','EDEL ROCIO','LASSO SILVA','3016575944','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019002414,'tzabala','TATIANA DULIMA','ZABALA LEAL','3124605838','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53050258,'imahecha','ISABEL ANDREA','MAHECHA NIETO','3108549507','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032367367,'FRGONZAL','FRANCISCO JAVIER','GONZALEZ AGUIRRE','3144731597','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (10015565,'alvarezla','LUIS ANIBAL','ALVAREZ BARRAGAN','573012470168','6','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128055436,'acabarcas','AURA BEATRIZ','CABARCAS ORTEGA','3114698433','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80062205,'RAGUILAR','RAMON GABRIEL','AGUILAR VEGA','573177718709','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52799933,'jpuentesb','JANETH','PUENTES BEDOYA','3103165028','4','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52355652,'jjrodriguez','JENNY JULIANA','JIMENEZ RODRIGUEZ','3102975672','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018457913,'evagnoni','EMILIANO','VAGNONI MONDRAGON','3158357757','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79883166,'JMCAMARGO','JAVIER MAURICIO','CAMARGO RUIZ','573208995383','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43270561,'cgalileo','CATERINE JOHANA','GALILEO','3127044272','18','3','6','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1047379786,'cdmaldonado','CRISTIAN DAVID','MALDONADO PEDROZA','3058125768','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1126422754,'mgramos','MARIA GABRIELA','RAMOS BARRERA','3103335105','8','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79672484,'gclavijom','EDWIN GABRIEL','CLAVIJO MARTIN','573114528601','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032448026,'smaguilarq','SANDRA MILENA','AGUILAR QUEMBA','3102089587','6','1','13','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014200955,'JGRANADO','JOAQUIN MANUEL','GRANADOS RODRIGUEZ','3132613290','6','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52808492,'atovarcifuentes','ALEJANDRA','TOVAR CIFUENTES','3153988905','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014225693,'lcardenas','LUISA FERNANDA','CARDENAS RODRIGUEZ','3112214446','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (72205809,'jacosta','JOAQUIN EMILIO','ACOSTA RODRIGUEZ','3124336599','15','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030571592,'nturriago','NATALIA','TURRIAGO GALVEZ','+573134795432','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1066096432,'jgarmendia','JUAN CARLOS','GARMENDIA MORA','3122344544','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52816926,'cmpico','CLAUDIA MILENA','PICO BONILLA','3057666547','8','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (75102454,'jarias','JULIAN ANDRES','ARIAS VERA','3148287906','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71777352,'MGOMEZVA','MAURICIO','GOMEZ VASQUEZ','3005674685','2','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (91521236,'icabeza','IVAN ORLANDO','CABEZA ROJAS','3003846347','3','1','24','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014217014,'ciriverap','CARLOS IVAN','RIVERA PARRA','3008017325','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152437191,'dmvaldes','DIANA MERCEDES','VALDES MOSQUERA','3123538602','8','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030523706,'mmendez','MANUEL LIOMER','MENDEZ PINZON','3192730900','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016046852,'sramirezl','STEFANIA','RAMIREZ LOPEZ','3058113132','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79720273,'rlvillarreal','ROMAN LEONARDO','VILLARREAL RAMOS','3203465640','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79961224,'jamorales','JOSE ALEXANDER','MORALES CARVAJAL','3002303958','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1037627128,'jdarias','JUAN DAVID','ARIAS SUAREZ','3015564896','7','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (12134327,'rvargas','RAMIRO','VARGAS DIAZ','3168321784','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (40610179,'papiza','PAOLA ANDREA','PIZA','3105578537','20','1','14','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1110467381,'jquinterop','JOSE WILMAR','QUINTERO PENA','3127689970','8','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1054708602,'kcastillo','KAREN NATALIA','CASTILLO PRADA','3144576684','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71387084,'JPVELEZU','JUAN PABLO','VELEZ URIBE','573014012031','2','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43983267,'JLOPERAN','JOHANNA MARCELA','LOPERA NARVAEZ','573003039084','15','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018415343,'ezapata','EDWIN HERNANDO','ZAPATA CIFUENTES','3157008096','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52718871,'adpcanal','ANDREA DEL PILAR','CANAL TORRES','3002095702','15','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52489596,'palizarazom','PILAR ASTRID','LIZARAZO MACIAS','3106093156','15','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1033706860,'cgiraldo','CRISTIAN IVAN','GIRALDO LEON','3178952814','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80424779,'iaruiz','IVAN ALBERTO','RUIZ PARRA','3133014998','13','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017133200,'abalzan','ALEXANDER','BALZAN','3002161746','8','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43586911,'lmvalenciag','LINA MARIA','VALENCIA GALLO','3155132153','15','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (8027554,'jchernandezz','JOSE CARLOS','HERNANDEZ ZULUAGA','3166245720','15','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128047135,'lmjimenezr','LUISA MARIA','JIMENEZ RAMOS','3016557008','1','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128401087,'JBERRIOL','JUAN PABLO','BERRIO LOPEZ','573044397353','1','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80074492,'hbaccamo','HENRY DAVID','BACCA MORALES','3173645395','3','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (86065704,'jamartinezrin','JULIAN ANDRES','MARTINEZ RINCON','3503481931','12','1','33','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52832701,'jkbautista','JENNY KARINA','BAUTISTA SABOGAL','3162550392','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52547762,'dlgarcia','DORIS LISED','GARCIA ORTIZ','3123540311','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52715915,'ediazm','EVELYN IVONNE','DIAZ MONTANO','3133844777','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (34317784,'dmaya','DIANA XIMENA','MAYA TOBAR','3166427234','25','1','9','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1094929415,'bcepeda','BENJAMIN GIOVANNI','CEPEDA RAMIREZ','3178867520','20','1','7','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1087996821,'omsalazar','OSCAR MAURICIO','SALAZAR LOAIZA','3128086987','22','1','18','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80111685,'GAVILABU','GABRIEL EDUARDO','AVILA BUITRAGO','573002875618','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016022789,'mquirozr','MONICA MARIA','QUIROZ RUBIANO','3017421124','12','1','33','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79626316,'wcardenas','WILSON ANDRES','CARDENAS POLANIA','3204577011','13','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032450063,'hequinones','HELENA ESPERANZA','QUINONES AGUJA','3008451555','20','1','19','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026262606,'ecaro','EDGAR ANDRES','CARO PERALTA','3118882446','11','1','15','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018413579,'lvelasquez','LINA XIMENA','VELASQUEZ TORRES','3138464719','15','1','15','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80797035,'ratehortua','RODRIGO','ATEHORTUA SANTAMARIA','3057120178','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018447724,'aglozano','ANGELA GISSELLE','LOZANO RUIZ','3214345303','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1140834437,'rfmartinez','RODRIGO FRANCISCO','MARTINEZ MORENO','3045774690','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52865088,'lcristancho','LAURA ANDREA','CRISTANCHO GIRALDO','3105819360','8','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (91532266,'olacevedo','OSCAR LEONARDO','ACEVEDO PABON','3176574459','3','1','4','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017153895,'scastaneda','SERGIO','CASTANEDA RAMIREZ','3136533642','3','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152436759,'LESPINAL','LUISA FERNANDA','ESPINAL RAMIREZ','3013371481','12','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52810456,'aramosl','ANGELA','RAMOS LOPEZ','3108808010','4','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014183231,'agcarod','ANGELA GISSETTE','CARO DELGADO','3108042413','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52982263,'YEPERDOMO','YURY ESTEFANIA','PERDOMO JURADO','3103109454','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53165227,'jubejara','JUANITA DEL PILAR','BEJARANO CELIS','573192271117','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032439556,'jdsuarezm','JUAN DAVID','SUAREZ MORENO','3003945786','2','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128227748,'ccadenas','CARMELINA ROSARIO','CADENAS ANAYA','3232046401','2','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018444599,'yparedes','YENNY ALEXANDRA','PAREDES ASTUDILLO','3218422869','2','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1098640740,'garaque','GUSTAVO ANDRES','ARAQUE GONZALEZ','3184001589','2','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43750201,'memorales','MARIA EUGENIA','MORALES SIERRA','3146195219','6','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71293780,'JOVELASQ','JORGE ALBERTO','VELASQUEZ CASTRILLON','3117270373','12','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017170445,'lcastaneda','LEIDY TATIANA','CASTANEDA QUIRAMA','3017240223','12','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80124975,'FCACERES','FELIPE ANDRES','CACERES BERNAL','573167556820','11','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80420494,'aduque','ALVARO ENRIQUE','DUQUE SOTO','31242383835','9','1','3','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79955605,'rdiaz','RAFAEL FRANCISCO','DIAZ VASQUEZ','3196899479','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030550448,'jvelandia','JEINER LEANDRO','VELANDIA SANABRIA','3213117887','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52881810,'NHERNAND','NYDIA CONSUELO','HERNANDEZ MORA','573112542588','6','1','32','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52956899,'hrodriguez','HAIDY JOHANNA','RODRIGUEZ SANCHEZ','3136522359','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52896326,'mcifuentes','MARTHA JANETH','CIFUENTES IZQUIERDO','3114567744','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79689944,'oaparicio','OSCAR YECID','APARICIO GOMEZ','3165750210','12','1','28','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1075232353,'jsolorzano','JHON HENRY','SOLORZANO LOZANO','3013057205','20','1','20','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1024491031,'ecamargoc','CALA EVELYN','CAMARGO CALA','3138674008','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79626295,'vdiaz','VLADIMIR','DIAZ MESA','3155484716','13','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017230375,'ibuiles','ISABELLA','BUILES ROLDAN','3116401599','12','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43739193,'abarrera','ADRIANA MARIA','BARRERA MONTOYA','3103744089','12','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019022379,'lmsegovia','LAURA MILENA','SEGOVIA NIETO','3155298218','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98558296,'jtamayo','JAIRO ALEJANDRO','TAMAYO BUSTAMENTE','3133503013','13','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53037585,'msarmiento','MARIA FERNANDA','SARMIENTO BONILLA','3219714680','9','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79797634,'dduque','DIEGO FERNANDO','DUQUE RAMIREZ','3052313416','7','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1125599277,'makiyama','MINORU ENRIQUE','AKIYAMA FIGUEROA','3214934828','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80041587,'rcastellanos','RODRIGO','CASTELLANOS CARO','3103210313','3','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (91528031,'asuarez','ALBEIRO HERNAN','SUAREZ HERNANDEZ','3165783872','2','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80881074,'jneira','JAVIER ORLANDO','NEIRA RUEDA','+573005065820','2','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1015406027,'vpedraza','VICTOR AUGUSTO','PEDRAZA BONILLA','3003334060','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1071328608,'jchauta','JOSE MANUEL','CHAUTA TORRES','3023336523','1','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (848997,'tcano','TULIO ENRIQUE','CANO VELAZQUEZ','3213321802','1','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80226149,'WJORTIZA','WILINTON JAVIER','ORTIZ AMADOR','573003597641','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1235252376,'lmolero','LISBETH MARINA','MOLERO SUAREZ','3116693758','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152692584,'dlcastaneda','DIEGO LEON','CASTANEDA SALDARRIAGA','+573183851528','3','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014233287,'jnavarrete','JHON ERIK','NAVARRETE GOMEZ','3157353966','1','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52102488,'lrianoma','LENYD ANGELICA','RIANO MARTINEZ','3132078457','8','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (32257009,'pvelasquez','PAULA ANDREA','VELASQUEZ CALLE','3105176268','13','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1005696161,'orodriguez','OSCAR JAVIER','RODRIGUEZ RIVEROS','3108554898','12','1','15','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79390018,'rcepero','RAMOS RICARDO','CEPERO RAMOS','3125480638','12','1','15','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030537312,'jdiaz','JUAN PABLO','DIAZ RODRIGUEZ','3133210360','11','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43188604,'emontoya','ELIZABETH','MONTOYA VELEZ','3002304874','4','3','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (72199701,'cmartinez','CARLOS ARTURO','MARTINEZ GARCIA','3008104393','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (37860723,'cserrano','CLAUDIA JOHANNA','SERRANO RODRIGUEZ','3166184690','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (67002385,'MMALAGON','MARIA ALEXANDRA','MALAGON TORRES','573152022050','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1069583463,'dzamora','ROMERO DERLY','ZAMORA ROMERO','3202268725','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52223708,'lgarciag','LISBETH','GARCIA GUERRERO','3174393359','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52529367,'kgutierrez','KAROL LILIAN','GUTIERREZ RUBIANO','31312841470','12','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (36697842,'zponce','ZULLY HELENA','PONCE PALACIO','3114514175','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79953038,'RBALLENM','RAUL CAMILO','BALLEN MENDIVELSO','573195306027','9','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52328478,'mmalaver','MARLENY NATALIA','MALAVER ROJAS','3138301316','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80895279,'jwilches','JAIME ANDRES','WILCHES TINJACA','3006749275','6','1','27','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80757978,'gtoca','GIOVANNY ALEJANDRO','TOCA CAMARGO','3163774014','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (416925,'mevega','MARIA EUGENIA','VEGA','3166181646','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (23180770,'cdiazg','CAROLYN','DIAZ GARCIA','3045800366','12','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1100948211,'ejgomez','EDINSON JOHAN','GOMEZ SOLANO','3166294565','12','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (42690189,'pusquiano','PAULA ANDREA','USQUIANO YEPES','3103872901','15','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (14702245,'facardonaq','FERNAN ALONSO','CARDONA QUINTERO','3164102957','7','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80857330,'hdavila','HERMAN EDUARDO','DAVILA AGUJA','3144427263','6','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014181816,'gmachuca','GERARDO ANDRES','MACHUCA TELLEZ','3185057354','11','1','30','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1075217017,'jmtrivino','JOHANNA MARCELA','TRIVINO JAIMES','3208039916','12','1','15','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1033749789,'kserrano','KEVIN ANDRES','SERRANO BURGOS','3214355666','15','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (32244296,'crendon','CAROLINA','RENDON GARCES','3127750331','4','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80230380,'JMORTIGO','JAIME ANDRES','MORTIGO MURCIA','573103438254','9','1','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43615743,'lsanabria','LUISA FERNANDA','SANABRIA CORREA','3218179461','12','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1044505765,'fmazo','FERNANDO','MAZO PUERTA','3104512507','12','3','17','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014205169,'ldpoveda','DEL PILAR','POVEDA PARRA','3112896338','15','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1010176898,'npjimenez','NAYIBE PAOLA','JIMENEZ RODRIGUEZ','3118063131','10','1','5','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (5750840,'JMERCHAN','JAIME ORLANDO','MERCHAN VILLAMIL','573045302318','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017125986,'vzrobinson','ROBINSON','VILLA ZULUAGA','3017891746','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1098673079,'DCASTRIL','DAVID MAURICIO','CASTRILLON KERRIGAN','3144855773','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11301339,'LFTRUJI','LUIS FERNANDO','TRUJILLO','573102317226','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17123889,'JUJOVEGO','JUAN JOSE','VEJARANO GONZALEZ','573165363181','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19107692,'GUGARCIA','GUILLERMO','GARCIA PEDRAZA','573115792754','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (35463921,'MELVIRAM','MARIA ELVIRA','MORA CAMARGO','573123627938','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (41797190,'EARARATA','ESTHER JULIA','ARARAT ARCOS','573134058034','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52223453,'YLEMUSHE','YENNY GISELA','LEMUS HERRERA','573204947681','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52267923,'MGUTIERREZ','MONICA ANDREA','GUTIERREZ ESPINOSA','573138253416','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52458225,'DCBARRETO','DIANA CAROLINA','BARRETO REYES','573208217157','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52705909,'acaballero','NUBIA ANGELICA','CABALLERO PEDRAZA','573112579028','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (70330050,'FSERNAGI','FRANCISCO JAVIER','SERNA GIRALDO','573003467330','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71332254,'ADUQUEGA','ANDRES ANTONIO','DUQUE GARCIA','573005744242','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79408435,'JCOLIMON','JULES MICHEL','COLIMON MENDEZ','573204480632','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79442808,'JAHUERFANO','JORGE ARTURO','HUERFANO MENDEZ','573138060240','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79470710,'ARIA_BEC','JULIO ERNESTO','ARIAS BECERRA','573153258586','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79553664,'JOMTORRES','JORGE MARIO','TORRES MESA','573152050696','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79571098,'LGOMEZME','LUIS ALEJANDRO','GOMEZ MELO','573115044084','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79876389,'DMNAVASN','DANIEL MAURICIO','NAVAS NAVARRO','573133610345','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79965211,'jahernan','JAIRO ALBERTO','HERNANDEZ HERRERA','573005505366','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80036763,'JEGAITAN','JORGE ELIECER','GAITAN RIVERA','3168309336','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80726115,'DAGUIRRE','DAVID ORLANDO','AGUIRRE FRANCO','573105703031','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (35513846,'MMARINMA','MARGARITA MARIA','MARIN MARIN','573216415379','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (70220185,'MONCADAORLANDO','DUQUEIRO ORLANDO','MONCADA ARBOLEDA','573014585555','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (70417944,'JFACEVEDO','JHON FREDY','ACEVEDO RESTREPO','3023714922','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71766387,'FCRUZARB','FERNANDO DE JESUS','CRUZ ARBOLEDA','573046831524','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79779125,'JCARANGO','JUAN CARLOS','ARANGO ESPITIA','573014494498','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1022389613,'ABOLIVAR','ANA MARIA','BOLIVAR MUNAR','573013374296','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79683741,'GQUIROSCA','GERARDO ALBERTO','QUIROS CAICEDO','3144353748','13','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51840522,'mromeroc','MARTHA CECILIA','ROMERO COLINA','573212899824','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1075257863,'DMARINMO','DIEGO FERNANDO','MARIN MONJE','573112502549','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1035421817,'ngomezhe','NATHALY','GOMEZ HENAO','573183900818','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (32182949,'apradaca','ANGELA MARIA','PRADA CADAVID','3113666096','15','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80217063,'DALVARAD','DAIRO JIMMY','ALVARADO NINO','573014370266','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016012889,'javaronga','JORGE AUGUSTO','VARON GAONA','5713163851484','13','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80822338,'OSALAVARRIETA','OSCAR FELIPE','SALVARRIETA DIAZ','3002261911','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (14638243,'ALOPEZLO','ANDRES FELIPE','LOPEZ LOPEZ','573168594932','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020727905,'JRPARDOF','JONATHAN RAMIRO','PARDO FUENTES','3113005025','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1031135321,'laxiguatavita','LAURA XIMENA','GUATAVITA ORDONEZ','3186219027','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52963877,'mverague','MANUELA ELISA','VERA GUERRERO','3162562062','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80538076,'jquevedo','JOHANN OSWALDO','QUEVEDO SANCHEZ','3138689318','2','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43541306,'SBETANCU','ECHAVARRIA SORAYA','BETANCUR ECHAVARRIA','573103986392','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (75081637,'etobonve','EDGAR ANDRES','TOBON VERGARA','3104053452','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1088242491,'jerincons','JORGE EDUARDO','RINCON SANZ','3116461577','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (75089416,'jfsotod','JOHN FREDY','SOTO DUQUE','3147711025','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1095800777,'ymbarreto','YULY MARCELA','BARRETO BASTO','3213964340','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020720091,'chromeros','CESAR HERNANDO','ROMERO SIERRA','3224010939','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11346585,'MIRODRIG','MIGUEL ANGEL','RODRIGUEZ CASTELLANOS','573168240845','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52528159,'CJMEJIAG','CLAUDIA JENNY','MEJIA GOMEZ','3114611457','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71783951,'jagarcesva','JORGE ALBERTO','GARCES VASQUEZ','3158399361','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79571362,'jvalbuena','JAVIER LEONARDO','VALBUENA OLIVOS','3133496878','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79683090,'JURIBEVE','JESUS DARIO','URIBE VERU','573044175625','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52382776,'sjasanchez','SANDRA JOHANNA','SANCHEZ RUSSI','3108810262','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020751881,'ATELLOARDILA','ANDRES','TELLO ARDILA','3143823594','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80473281,'freyquinones','FEDERICO','REY QUINONES','3156093524','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19346895,'alrivero','ALFONSO','RIVEROS LEON','3106971646','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79968187,'arriverosa','ANDRES RICARDO','RIVEROS AVILA','3112283655','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17077100,'josgomez','JOSE MIGUEL','GOMEZ OLAYA','3208465002','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152437244,'CRAMIREZ','CAROLINA','RAMIREZ ZULETA','573013493024','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79231409,'jaldanav','JUAN CARLOS','ALDANA VEGA','3162454298','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79505441,'gabrielq','ALBERTO MARTIN','QUESADA GOERNITZ','573192285437','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52986041,'jgiraldop','JUANITA','GIRALDO POLANCO','3103408158','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98648168,'waescobarh','WILMAN ANDRES','ESCOBAR HINCAPIE','3113783757','3','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43580923,'cpcardonaz','CLAUDIA PATRICIA','CARDONA ZULETA','3102320618','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1039452695,'lfgonzalez','LUIS FELIPE','GONZALEZ GALLEGO','3017539702','3','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71772503,'afvelasquezp','ANDRES FELIPE','VELASQUEZ PELAEZ','3024441811','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98588908,'slmarinc','SERGIO LEON','MARIN CANO','3183930098','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71490646,'lgmarin','LEON GUILLERMO','MARIN ORTEGA','3217426370','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1015399664,'jkgarcia','JULY KATHERINE','GARCIA VARGAS','3213026559','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032386501,'jcetinas','JUANITA','CETINA SEGURA','3123865013','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (73133851,'gavillazonh','GUSTAVO ADOLFO','VILLAZON HITURRIAGO','3127365573','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1102816494,'jenavarrog','JAVIER ALEJANDRO','NAVARRO GONZALEZ','3008486514 ','11','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43524727,'acarboleda','ANA CAROLINA','ARBOLEDA GALLO','3002104076','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (3383917,'jcperezh','JUAN CAMILO','PEREZ HERNANDEZ','3116128640','11','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128476607,'yagomezz','YESSICA ALEXANDRA','GOMEZ ZULUAGA','3143655962','11','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1037611142,'yzuluagac','YESICA','ZULUAGA CASTANO','3108304291','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71273568,'rvasquez','PEREZ REYNEL','VASQUEZ PEREZ','3017981262','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128408207,'ebenjumea','ELIZABETH','BENJUMEA LOPEZ','3012740435','13','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1026135298,'dfvelez','DANIEL FRANCISCO','VELEZ HOYOS','3234523916','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80040671,'fdavilaz','FELIPE','DAVILA ZABALA','3123043966','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80419227,'JDUARTEG','JOSE ALFONSO','DUARTE GOMEZ','573504333123','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018434238,'cdtorrest','CRISTIAN DAVID','TORRES TORRES','3214487678','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71388239,'gaycardy','GIANI RICARDO','AYCARDY MONTOYA','3005765658','13','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017125982,'clujan','CATALINA','LUJAN GOMEZ','3045488569','11','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79626628,'lcquintero','LUIS CARLOS','QUINTERO BOTERO','3205759034','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43599038,'smhenao','SILVIA MARCELA','HENAO VILLA','3146748977','1','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98552006,'bmrevelo','BORIS MAURICIO','REVELO RENDON','3103765761','1','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (16076658,'JNPUERTA','JORGE NELSON','PUERTA LOPERA','573147055706','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80875350,'amorales','ANDRES FELIPE','MORALES DUARTE','3173685351','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (330798,'mthomas','THOMAS','SMITH MALCOLM','15107351193','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79909149,'fvergara','LOMBANA FELIPE','VERGARA LOMBANA','3163050299','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016053632,'carguello','CATALINA','ARGUELLO DUARTE','3212587382','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020727052,'mepedraza','MARCIA ESTEFANIA','PEDRAZA SIERRA','3043792874','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52532186,'laarenas','LILIAM ALICIA','ARENAS PEREZ','0','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (2236557,'rhernandez','RAFAEL','HERNANDEZ CASTELLANOS','3133888952','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1010182693,'stsilva','SHAMEEL','THAHIR SILVA','3103492006','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019027936,'nzorro','NICOLAS CAMILO','ZORRO LOPEZ','3176983081','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1093741669,'NJCASTANEDA','NINI JOHANNA','CASTANEDA QUINTERO','573208618931','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1015999519,'mlprieto','MARTHA LILIA','PRIETO MATIZ','3003003543','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43528078,'mbetancur','MIGDALIA MARIA','BETANCUR SEPULVEDA','3122584775','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1039683222,'arubio','ALEJANDRA','RUBIO ARIAS','3205404063','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (24348492,'agiraldo','ALEJANDRA MARIA','GIRALDO RAVE','3013032155','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79510282,'jsanchezs','JAVIER','SANCHEZ SOSA','3004927926','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128280181,'lgonzalez','LUIS MIGUEL','GONZALEZ RODRIGUEZ','3006118490','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128442058,'javalencia','JOHN ANDERSSON','VALENCIA PALACIO','3136353867','2','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (70879670,'jcriveram','JULIO CESAR','RIVERA MOLINA','3006791889','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (394366,'pziemicki','TOMASZ','ZIEMICKI PAWEL','3132134460','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79721581,'acastiblancoc','ALEJANDRO','CASTIBLANCO CARO','3112938315 ','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79876883,'CTOROCUE','CARLOS ERNESTO','TORO CUERVO','573112024360','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79787338,'ecardena','EDGAR FERNANDO','CARDENAS ANGEL','573115770977','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79630659,'esanchezv','ELENA','SANCHEZ VELANDIA','3046088261','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52454204,'dsocha','DIANA YULIETH','SOCHA HERNANDEZ','3105679421','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79938880,'jlbalaguera','JORGE LUIS','BALAGUERA JIMENEZ','3112345678','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1036632721,'misvillada','MARIA ISABEL','VILLADA GIL','3046774048','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71363638,'jlopera','JORGE MARIO','LOPERA CARMONA','3113791011','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71759725,'jmesa','JUAN CARLOS','MESA SALAZAR','3103709892','15','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (8104285,'DRIVASSU','DANIEL JOSE','RIVAS SUAREZ','573006513684','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1094893354,'apacheco','ANDRES FELIPE','PACHECO PEREZ','3103832798','11','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79473945,'ilopez','MAURICIO FERNANDO','LOPEZ FORERO','3014508171','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152189853,'mtulcan','MONICA ANDREA','TULCAN MUNOZ','3148392461','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80034022,'mecheverri','MARIO ALBERTO','ECHEVERRI BRAVO','3185481346','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80037406,'hvalencia','HENRY','VALENCIA CASTILLO','3182616919','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51557839,'gacevedo','GLORIA ISABEL','ACEVEDO DUARTE','3108033664','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79712843,'jejimenez','JAVIER ENRIQUE','JIMENEZ HURTADO','3012320000','4','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80770620,'mhernandezn','MICHAEL ANDRES','HERNANDEZ NAVAS','573013367617','1','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1126588220,'jcohecha','JULIAN ANDRES','COHECHA OCAMPO','3203980129','12','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1069471702,'nvergara','NEIDER XAVIER','VERGARA HUMANEZ','3205328964','1','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (379320,'sedwards','SIMON MARK','EDWARDS','3004489059','8','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98635000,'EGIRALDO','EMERSON ANDRES','GIRALDO BETANCUR','573002738152','2','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98714866,'jlondono','JOSE LUIS','LONDONO CORREA','3127916142','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1036928411,'jfranco','JUAN CAMILO','FRANCO JARAMILLO','3216390830','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (9738254,'jrios','JULIAN ANDRES','RIOS OBANDO','3148931879','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1146435118,'ndiaz','NATALIA','DIAZ OSORIO','3057679439','9','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017226638,'abedoyar','ALEJANDRA','BEDOYA RESTREPO','3122686153','13','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43253190,'vciro','VIVIANA','CIRO RAMIREZ','3192474772','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (98588111,'lbetancur','LUIS GUILLERMO','BETANCUR ARTEAGA','3113189327','6','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71669230,'jpelaeza','JUAN CARLOS','PELAEZ AGUDELO','3108213516','10','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71681566,'abohorquezr','ANDRES ALBERTO','BOHORQUEZ RAMIREZ','3165300119','2','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43580706,'gmonsalve','GISELA PATRICIA','MONSALVE FONNEGRA','3167527863','2','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79450594,'HMMONROY','HEVER','MIGUEZ MONROY','573138300192','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17319676,'hcolmenaresf','HUGO ARMANDO','COLMENARES FERRER','573102652903','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1075217624,'iquintero','INGRID LORENA','QUINTERO BASTIDAS','3212351176','15','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79501639,'JAVIERSA','JAVIER','SANCHEZ CASTANEDA','573125494077','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018416904,'jpdiaz','JOHANA PAOLA','DIAZ VALERA','3105878254','6','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79111663,'jcobadel','JUAN ANTONIO','COBALEDA MONTEALEGRE','3108097901','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (91507885,'omoreno','OSCAR ANDRES','MORENO QUINTERO','3164521934','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020791872,'asamudio','ARMANDO','SAMUDIO MEJIA','3115987763','9','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71173050,'jdiossa','JOHN FERNANDO','DIOSSA CASTRO','3235781266','7','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017217612,'krendon','KRISTIAN','RENDON SERNA','3146021296','13','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1128387829,'mcerodriguez','MILTON CESAR','RODRIGUEZ GARCIA','3053073473','13','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (15877847,'vgodoy','VICTOR ALEJANDRO','GODOY LOPEZ','3132491528','8','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1017152270,'avilla','ALVARO ALEJANDRO','VILLA GARZON','3015459665','1','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (93235912,'jzuniga','JULIAN AUGUSTO','ZUNIGA UPEGUI','3015199236','8','3','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52104439,'ebernalm','ELIANA MARCELA','BERNAL MORALES','3164735687','7','1','2','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79390354,'ralbarra','RAUL HUMBERTO','ALBARRACIN BALAQUERA','396062847','3','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43279000,'bquintero','BLANCA YUDY','QUINTERO OSORIO','3103777639','7','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79295192,'JACASTRO','JAIRO','CASTRO RODRIGUEZ','573124351971','4','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80026838,'hjguzman','HEINZ','JANY GUZMAN','3183364675','4','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (63499994,'MMTOLOZA','MARIA MERCEDES','TOLOZA ROJAS','3057533157','4','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (15458241,'jovasquez','JAIME ORLANDO','VASQUEZ ROJAS','3008831217','1','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43734396,'mpuerta','MARTA LUZ','PUERTA MEJIA','321 800 14 83','13','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (71338206,'jabetancur','JAVIER ALBERTO','BETANCUR SALAZAR','3003110680','13','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (42874500,'pbustamantem','PATRICIA','BUSTAMANTE MARIN','3208342554','13','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52504256,'VANESSAP','VANESSA','PLATA PENAFORT','573107970656','9','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52530370,'DRRODRIGUEZ','DEISSY YOLIMA','RODRIGUEZ RODRIGUEZ','573178622966','9','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (93290315,'JORGESAN','JORGE ANDRES','SANCHEZ CALVO','573102359514','9','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52928030,'KAREVALO','KATHERINE','AREVALO SANCHEZ','573142630617','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80472408,'JUANCVAR','JUAN CARLOS','VARGAS DE MENDOZA','573183889885','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (13542910,'IVANJREY','IVAN JULIAN','REY TELLEZ','3188619627','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (393719,'SIMOHILL','CHARLES','HILL SIMON','573193658935','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19351811,'LO_BELTR','JAVIER','LOPEZ BELTRAN','573102376288','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52503623,'LSARMIEN','LUISA FERNANDA','SARMIENTO SENIOR','573168733565','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80213338,'cusecher','CHRISTIAN DARIO','USECHE RAMIREZ','573112478289','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79960168,'JAIGUILA','JAIME ERNESTO','AGUILAR GIL','573112836469','11','1','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1037597821,'DSTAMAYOURIBE','DAVID SANTIAGO','TAMAYO URIBE','3043361200','11','3','1','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79287695,'ARCASTIL','ARTURO','CASTILLO IBARRA','573142267413','1','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (4252246,'joblanco','JORGE IGNACIO','BLANCO JORGE','573057042987','1','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79956411,'DHROAOR','DIEGO HERNAN','ROA ORDONEZ','573012550220','1','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52290995,'mcastanedaca','MARITZA','CASTANEDA CARDENAS','3196740650 ','11','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (3192182,'CABALLESTEROS','CARLOS ALIRIO','BALLESTEROS TORRES','3006826920','3','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52704519,'DCELISVA','DIANA CONSTANZA','CELIS VARGAS','573114926181','6','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52303166,'RRINCONGOMEZ','RUBIELA','RINCON GOMEZ','573165270028','6','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (85151444,'SROBLESG','SERGIO ANDRES','ROBLES GUEVARA','573004945686','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51611196,'DCAICEDT','DORIS','CAICEDO TORRES','573113972266','6','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80503874,'dseligma','CARLOS DAVID','SELIGMANN TRUJILLO','573012406374','1','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (9273440,'hmirandaa','HENRY','MIRANDA AREVALO','3118012772','15','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (88162327,'GACACERES','GILBERTO ARNULFO','CACERES CRISTANCHO','3132463274','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030630407,'bbeltranr','BRIAN','BELTRAN RICAURTE','3204782110','2','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11429061,'mbernal','MANUEL','BERNAL GARZON','3155583622','8','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (63502044,'iroortizr','IVONNE ROSIO','ORTIZ RUIZ','3163524084','9','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (60361234,'AMERCEDESS','ANA MERCEDES','SUAREZ OSPINA','573132926656','9','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (40049797,'dcruzort','DIANA ANGELICA','CRUZ ORTEGA','573125825478','1','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53048000,'CNINOP','DIANA CAROLINA','NINO PENA','573203050549','11','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020773677,'alaverde','ANA CAMILA','LAVERDE HERNANDEZ','3507765938','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52257862,'maarangoa','MARIA ADELAIDA','ARANGO ARANGO','3158464372','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (33369940,'nrondon','NOHORA JOHANNA','RONDON VARGAS','3102823001','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1022367169,'LSMASMELA','LAURA ESTEFANY','MASMELA ROJAS','3122983528','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79713998,'fmontejo','FERNANDO AUGUSTO','MONTEJO ANGEL','3138525851','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (16288682,'ALASPRIL','ANDRES FELIPE','LASPRILLA PAZ','+34644869705','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52256289,'saisazac','SANDRA MILENA','ISAZA CUELLAR','3103213862','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52701875,'dchernandez','DIANA CAROLINA','HERNANDEZ GUALDRON','3002152811','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018406072,'nguevara','NICOLAS','GUEVARA RAMIREZ','3105749977','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52885729,'mjguayacundo','MABEL JANETH','GUAYACUNDO RAMOS','3214733249','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80217821,'jaranzalez','JOHN FREDY','ARANZALEZ GUERRERO','3016982396','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1010193708,'scarvajal','STEPHANIA','CARVAJAL CHAVES','3114944130','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52707460,'ycastroc','YIRA MARIETA','CASTRO CASTIBLANCO','3186696471','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1060943,'JACAMEJO','ARMANDO JOSE','CAMEJO RUIZ','3005485404','15','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11276054,'FEESPITI','FERNANDO ISIDRO','ESPITIA CASTANEDA','573134700668','3','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80122813,'HEARAMIREZ','HECTOR ALFREDO','RAMIREZ VACA','573212061347','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014185005,'jkromero','JOHANNA KATHERYNE','ROMERO ARIZA','3142565136','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032451495,'svbaronc','SARAH VANESSA','BARON CASTRO','3174405051','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11221861,'RODRIANO','RODRIGO LUPERCIO','RIANO PINEDA','525535720849','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018410287,'csantana','YULY CAROLINA','SANTANA RAMIREZ','3123891318','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1144151960,'xramos','XIMENA STEPHANY','RAMOS ARANA','3162788125','6','2','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (63396857,'MJAIMESH','LIZETH MARCELA','JAIMES HERRERA','3105803754','8','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018411629,'kguerrero','KETTY MARGARITA','GUERRERO ARDILA','3013864799','15','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016010255,'JNINOROD','JOHAN PAOLA','NINO RODRIGUEZ','573202012195','11','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1107052941,'lmamontenegro','LINA MARIANNE','MONTENEGRO CETINA','3006591091','6','2','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032419117,'llleal','LEIDY LILIANA','LEAL DIAZ','3164457922','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43220520,'HURREGOV','HEIDI JACQUELINE','URREGO VALENCIA','573007755826','12','3','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53028240,'yquintero','YUDY AMANDA','QUINTERO PULGAR','3107833674','12','1','35','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51718881,'ICSANCHEZ','IRMA CRISTINA','SANCHEZ BARREIRO','573208515377','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80070314,'operez','OSCAR EDUARDO','PEREZ RODRIGUEZ','3143703533','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80094522,'dneira','DIEGO GUSTAVO','NEIRA BERMUDEZ','3057975780 ','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80222738,'aapulidoc','ALVARO ANDRES','PULIDO CASTRILLON','3164663441','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80821114,'IMENDIVELSOB','IGNACIO ALBERTO','MENDIVELSO BERNAL','3202741190','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19285610,'JSUAREZB','JULIO CESAR','SUAREZ BELTRAN','573012358881','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79576158,'cbernall','CESAR AUGUSTO','BERNAL DIAZ','3132838578','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79120790,'alareval','ALVARO HERNANDO','AREVALO','3005503991','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19176991,'FDIAGOFR','FRANCISCO EDUARDO','DIAGO FRANCO','573188153399','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19415907,'j_guzman','HERNANDO AUGUSTO','JIMENEZ GUZMAN','573108836281','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (41648540,'CTORRESC','MARIA CONSUELO','TORRES DE CUBILLOS','573123861250','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51668602,'albaluci','ALBA LUCIA','ECHEVERRI BARRAGAN','573184351874','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51726645,'amalagon','MARTHA ALEXANDRA','MALAGON DUQUE','3004422674','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79483556,'CLCASTROC','CESAR LEONARDO','CASTRO CASTRO','573124825059','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51900246,'LRUEDAVE','LILIANA INES','RUEDA DIAZ','573212029836','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52026153,'OPCASTRO','OLGA PATRICIA','CASTRO ALVAREZ','573196092228','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (11255678,'JOLARTE','JOHN ALIRIO','OLARTE RAMOS','573002675545','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52844085,'laldana','LADY CAROLINA','ALDANA MELO','3112241856','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (37896254,'amasilva','ALEXANDRA MARIA','SILVA MONSALVE','3174503505','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52885850,'makarina','ANA KARINA','MONTES','573017281618','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52893538,'lvramirez','LINA VICTORIA','RAMIREZ PINEROS','3108809230','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (53013421,'vabril','VIVIANA ALEXANDRA','ABRIL LOPEZ','3177068885','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (59822866,'ADTORRESM','ADRIANA LUCIA','TORRES MATTA','573102089476','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79411732,'fhernandezda','FELIPE','HERNANDEZ DE ALBA ALBORNOZ','573208321093','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52263123,'BETACHA','BLANCA ELENA','TACHA RAYO','573103089737','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79581757,'igonzale','IVAN JAVIER','GONZALEZ ABELLO','3157935908','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79629855,'mmontejomoreno','BERNARDO ROBERTO','MONTEJO MORENO','3155191545','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79837102,'JUMONROY','JUAN PABLO','MONROY PEDRAZA','573017630328','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (13957578,'RTELLEZN','ROMAN FRANCISCO','TELLEZ NAVARRO','573114814650','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79852862,'aariveras','ALVARO ANDRES','RIVERA SANCHEZ','3115617519','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79861818,'RAFOREROR','RAFAEL ANDRES','FORERO RODRIGUEZ','573105744474','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (17649656,'GBECERRA','GERMAN ADOLFO','BECERRA DAZA','3112574874','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (35319610,'MYGARCIA','MYRIAM','GARCIA CASTANEDA','573112752734','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79891854,'japenacarreno','JOHN ALBEYRO','PENA CARRENO','3162346496','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80151941,'FABININO','FABIAN LEONARDO','NINO','573196886120','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51938674,'cpgarciar','CLAUDIA PATRICIA','GARCIA ROCHA','3118338596','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1022351645,'jsantana','JAVIER ENRIQUE','SANTANA LOZANO','573124390997','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1031122508,'mcmartinezr','MARIA CAROLINA','MARTINEZ REYES','3158624633','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51939440,'MLBARROST','MARTHA LUZ','BARROS TOVAR','573112225013','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032437415,'ovelasquez','OSCAR ANDRES','VELASQUEZ SANCHEZ','3045458322','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (23497524,'VPCANCELADO','VIANNEY PAOLA','CANCELADO ORTIZ','3106074896','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1152184237,'cquiroz','CARLOS ANDRES','QUIROZ CASTELLANOS','3144860073','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52854520,'rygranja','ROSA YELENA','GRANJA RODRIGUEZ','3124901487','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52928292,'MFGARCIAV','MARIA FERNANDA','GARCIA VILLALOBOS','57 3103452353','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (74184272,'jcgrosso','JUAN CARLOS','GROSSO HOLGUIN','3133769937','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80083468,'JPABONRE','JAVIER DARIO','PABON REVEREND','3102997104','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (89004607,'jbuitrag','JHON CARLOS','BUITRAGO MONCALEANO','3168761837','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1010186825,'kperezp','KATHERINE','PEREZ PERDOMO','3107712188','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1013656720,'dcbociga','DIANA CAROLINA','BOCIGA GELVEZ','3043891207','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1015409161,'irodrigu','IVAN DARIO','RODRIGUEZ BUSTAMANTE','3013079860','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019068529,'cagudelog','CAMILO','AGUDELO GUZMAN','3115925308','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020717793,'mdorjuelaa','MAURICIO DAVID','ORJUELA ARENAS','3208645418','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020728383,'jssanchez','JUAN SEBASTIAN','SANCHEZ VARGAS','3175675173','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032438046,'DRODRIGU','DIANA CAROLINA','RODRIGUEZ RAMOS','573138940838','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1053766233,'jdgiraldo','JUAN DAVID','GIRALDO HENAO','+57964467970','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1113037684,'nrodriguezj','NATALY','RODRIGUEZ JARAMILLO','3102299376','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (13862352,'LACARVAJALR','LUIS ALFREDO','CARVAJAL RINCON','3184389622','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52052718,'sprpcabraf','PATRICIA ROCIO DEL P','CABRA FLOREZ','573108199175','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52069863,'DOTALORA','DOLORES','OTALORA GONZALEZ','573105672962','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79652640,'jmartinezm','JAVIER RAUL','MARTINEZ MARTINEZ','3134700519','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79977578,'arodriguezr','ANDRES','RODRIGUEZ RUBIO','3166906616','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80440131,'fmcastrob','FRANZ MAURICIO','CASTRO BARAHONA','3143507655','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80732041,'jcbenavides','JUAN CAMILO','BENAVIDES ROJAS','3187174894','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80799606,'iroa','IVAN ERNESTO','ROA OVALLE','3058564291','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80920178,'jortegon','JUAN CAMILO','ORTEGON GUTIERREZ','3012588906','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1018416740,'ajaramillo','ANTONIO','JARAMILLO ARANGO','3194187568','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1090394598,'yarmesto','YANETH PATRICIA','ARMESTO PABON','3114861388','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52151826,'tmanrique','TATIANA','MANRIQUE ZULUAGA','3178866270','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (41628879,'BLRACHE','BLANCA LUZ','RACHE DE CAMARGO','573108199828','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79644884,'GBUENAVE','GERMAN ALFREDO','BUENAVENTURA CARDENAS','3208006524','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (14221423,'joviesor','JAIME OCTAVIO','OVIES ORDONEZ','3105720001','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (23913905,'mavellanedav','MARGARITA','AVELLANEDA VARGAS','3202336905','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51777221,'mcascantem','MARCELA','CASCANTE MONTOYA','3219903936','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52866254,'EPENASUA','ERICA YAZMIN','PENA SUAZO','573125373715','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79293440,'NPEREZEC','NELSON ORLANDO','PEREZ ECHEVERRI','573002884997','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79832273,'eadurangarcia','EDWIN ALEXANDER','DURAN GARCIA','3143906193','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80057641,'wsoto','WILSON EDUARDO','SOTO FORERO','3023705246','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80727053,'OVARGASM','OSCAR','VARGAS MOLINA','573123378499','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1098651664,'namartinro','NATALIA','MARTINEZ ROJAS','573133484020','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (5660094,'lalvarez','LUIS EVELIO','ALVAREZ ARDILA','573103269132','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (9868363,'sbolivara','STEVENSON','BOLIVAR ATUESTA','3014656632','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (13723483,'eparra','EDWARD','PARRA FLOREZ','3167468697','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (36308869,'mpramirez','MARIA PAULA','RAMIREZ TOVAR','3003954392','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52390740,'jmgomeza','JENNY MARIBEL','GOMEZ ALDANA','3112315046','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79749832,'faguilar','FRANKLIN ROLANDO','AGUILAR TRIANA','3023566478','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79954934,'lruiz','LEONARDO','RUIZ MIRANDA','3232169715','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79981970,'EVARGASH','ENRIQUE','VARGAS HERNANDEZ','3173316952','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80094780,'cmontoyac','CARLOS EDUARDO','MONTOYA CASAS','3153721102','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80165230,'yhortua','YIMMY ALEXANDER','HORTUA HERNANDEZ','3172896114','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80729291,'JTELLOPO','JULIAN FELIPE','TELLO POSADA','573043394969','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (88033215,'RABELLO','RAY ALFREDO','BELLO DAVILA','573123518082','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1013648165,'smeza','SEBASTIAN MATEO','MEZA VILLALBA','3123892253','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014209639,'jedsuarez','JOSE EDUARDO','SUAREZ VARGAS','3046361967','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1016062055,'JULIANRODRIGU','ERIC JULIAN','RODRIGUEZ MARTINEZ','573212443209','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020795963,'mrestrepo','MARIA ALEJANDRA','RESTREPO TROMPA','3006650948','1','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1065600678,'akrodriguez','ALMA KARINA','RODRIGUEZ QUINTERO','3002283394','2','3','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1070916681,'ecastrom','ESTEBAN GUILLERMO','CASTRO MORA','3142919952','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1088250309,'LMMONTOYA','LINA MARCELA','MONTOYA HENAO','573148638394','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79621473,'LJARJONA','LUIS JEFFERSON','ARJONA VIDAL','573156485591','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52357526,'plarrart','PATRICIA','LARRARTE CASTANEDA','3103000101','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (29873490,'MMALOPEN','MARIA PRESENTACION','MALO PENICHE','573146183655','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79519106,'hholguin','HARRY','HOLGUIN LAGOS','+573204026653','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52218247,'vivianaarias','VIVIANA CECILIA','ARIAS','3133462489','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79939023,'mhernandez','EDISON MARCOS','HERNANDEZ MARTINEZ','573187073328','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52330996,'cpena','CLAUDIA LUCIA','PENA PINEDA','3022163014','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020743468,'lmontoyac','LAURA','MONTOYA UPEGUI','3122867373','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (18402262,'japenafiel','JHON ALEXANDER','PENAFIEL CASTRO','3222008116','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19438904,'lblanco','LUIS ALBERTO','BLANCO LOPEZ','3102754224','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52047021,'MRINCONC','MARCELA DEL PILAR','RINCON CASTRO','573142510289','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79484831,'JMMARTI','JOHN MARIO','MARTINEZ PINEDA','573106890394','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (93385030,'HEVASQUEZL','HERNANDO EVELIO','LEYTON VASQUEZ','3208575213','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (15506861,'lnorena','LUIS FERNANDO','NORENA QUINTERO','3165562479','6','3','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80025758,'jpalarcons','JUAN PABLO','ALARCON SIERRA','3123896235','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80122860,'jlmendoza','JULIAN LEONARDO','MENDOZA SALAZAR','3003241353','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (32784162,'LYAMAYA','LILIANA YANETH','AMAYA GUTIERREZ','573012206675','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020412935,'jebaenag','JOHN EDWIN','BAENA GALLEGO','3004917790','8','3','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (4556650,'MCEBALLO','MARIO CENON','CEBALLOS VASQUEZ','573138463783','8','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79950384,'jcipamoc','JAVIER VICENTE','CIPAMOCHA LEGUIZAMON','3208399583','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1019075609,'frodriguez','FERNANDO','RODRIGUEZ AVELLANEDA','3133456506','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1036929802,'sfrancoc','SEBASTIAN','FRANCO CASTANO','3207211912','6','3','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (3020996,'GGUEVARAI','GUSTAVO','GUEVARA ICO','573125321646','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80196885,'oherran','OMAR ANTONIO','HERRAN PINZON','3152340789','15','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (43575203,'alramirez','ANA LUCIA','RAMIREZ ORREGO','3004626572','6','3','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80232501,'LRINCONV','LUIS EDUARDO','RINCON VALERO','3046084926','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032431998,'jsanchezl','LUQUERNA JAIRO','SANCHEZ LUQUERNA','3102028902','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (79797539,'casandoval','CARLOS ANDRES','SANDOVAL VARGAS','3015520968','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (31973456,'MMUNOZRA','MABEL','MUNOZ RAMIREZ','3102463857','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52803334,'brodriguez','BLANCA LILIANA','RODRIGUEZ CASAS','3114080725','12','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (14398885,'CARLOSCRUZL','CARLOS ANDRES','CRUZ LUNA','573174329451','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (19487812,'MHGONZAL','MARIO HERNAN','GONZALEZ BRINEZ','573004966256','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (23324676,'CYPUENTESC','CLARA YANETH','PUENTES CEPEDA','573208096739','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (37722705,'VMONSALV','VERONICA','MONSALVE RANGEL','573152831333','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (40439796,'ELECHAVARRIAR','ELISABETH','ECHAVARRIA RODRIGUEZ','573102060243','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (51949278,'szambrano','SANDRA LILIANA','ZAMBRANO ARTUNDUAGA','3118515831','6','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (52164403,'bibejarano','BLANCA INES','BEJARANO','573125491697','7','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (80233012,'ssaenzbr','SEUL','SAENZ BRAVO','3133518000','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1014204127,'RAPINERO','RAUL EDUARDO','PINEROS REVELO','573133958531','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1020731402,'paguillermo','ANDRES GUILLERMO','GUZMAN DURAN','3185023033','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030529111,'carincon','CARLOS ANDRES','RINCON ARIAS','3144064355','11','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1030567798,'DCHINCAPIE','DIANA CAROLINA','HINCAPIE TORRES','3165790576','3','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032395453,'jcaballero','JOSE LUIS','CABALLERO GOMEZ','3186998504','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1032424183,'ftmorenod','FRANCY TATIANA','MORENO DUARTE','3105810679','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1075625034,'jcortesl','JAIRO RAFAEL','CORTES LIZARAZO','3114538610','2','1','36','1');
INSERT INTO tutor (ID,USUARIO,NOMBRE,APELLIDO,TELEFONO,IDESCUELA,IDSEDE,IDCARGO,IDESTADO) VALUES (1076648714,'SFMORAM','FRANCISCO HERNANDO','MORA MARTINEZ','573203430278','3','1','36','1');

INSERT INTO usuario (USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL,CLAVE) VALUES ('admin','Manuel','Báez','0','0','0','d033e22ae348aeb5660fc2140aec35850c4da997');
INSERT INTO usuario (USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES ('system','Manuel','Báez','0','0','0');

-- Inserta usuario con clave y fecha vacia 
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52113306,'ACHAPPEC','ANGELICA','CHAPPE CHAPPE','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51703654,'MZAMBRAN','MARTHA HELENA','ZAMBRANO VALENTIN','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79394908,'MABERNAL','MIGUEL ANGEL','BERNAL YERMANOS','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52469370,'LIDIOPRI','LIDIOLA','PRIETO PULIDO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79567350,'CHERMIDA','CAMILO ERNESTO','HERMIDA BENITEZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80003087,'ACHAVARR','ANDRES','CHAVARRO VELANDIA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79737385,'MTRUJILO','LUIS MARTIN','TRUJILLO FLOREZ','7','23','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80063309,'JAPOSADA','JAIME ANDRES','POSADA RESTREPO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17320240,'CFMARTIN','CARLOS FERNANDO','MARTINEZ ROCHA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79433572,'JROMEROG','JAIME ORLANDO','ROMERO GUAQUETA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52878436,'P_JIMENA','JIMENA MARCELA','PERDOMO','4','18','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020716193,'DRICCIUL','DAVID','RICCIULLI DUARTE','9','26','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (34562162,'MFERNAND','MONICA LUCIA','FERNANDEZ MUNOZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80180987,'LORTEGON','EDWIN LEONARDO','ORTEGON CORTAZAR','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (12115957,'GROACAST','GUILLERMO','ROA CASTILLO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17323522,'AROMERO','ROMAN ENRIQUE ANDRES','ROMERO BALTODANO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19411159,'RVEGAROD','RICARDO ARTURO','VEGA RODRIGUEZ','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (35476437,'CORODRIG','MARIA CONSTANZA','RODRIGUEZ BARON','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51802754,'MBARONPU','MIREYA','BARON PULIDO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52419888,'mcasasbu','MARIA JOSE','CASASBUENAS ORTIZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79147951,'DIEGOCAR','DIEGO FRANCISCO','CARRIZOSA POSADA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79421284,'MCACERES','ELIECER','CACERES MARTIN','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79521428,'HERODRIG','HENRY','RODRIGUEZ GRANOBLES','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79568443,'ALLERENA','ALFONSO JAVIER','LLERENA POLO','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79661012,'caquinones','CESAR AUGUSTO','QUINONES SEGURA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79695418,'AERODRIGUEZ','ALVARO ENRIQUE','RODRIGUEZ HERNANDEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79750915,'JCASTROM','JAIME ALBERTO','CASTRO MARTINEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80132016,'CSIERRAV','CESAR AUGUSTO','SIERRA VARON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80842991,'EANINOVE','EDWIN ANDRES','NINO VELASQUEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (9532154,'NJHERNANDEZ','NESTOR JULIAN','HERNANDEZ RINCON','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19276210,'RVARGASV','RODOLFO','VARGAS VALLECILLA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (14899099,'JAARIASS','JULIAN ANDRES','ARIAS SALAZAR','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52269525,'SGONZALE','SANDRA PATRICIA','GONZALEZ SALAZAR','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80795877,'WJAIMESF','WILMAR','JAIMES FERNANDEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (63529691,'LFMARTINEZR','LUISA FERNANDA','MARTINEZ ROJAS','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51562841,'MRODRIGU','MARIA CRISTINA','RODRIGUEZ RODRIGUEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52867933,'MAPINEDA','MARIA ALEJANDRA','PINEDA ESCOBAR','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (7300564,'MLARAMAR','MIGUEL ANGEL','LARA MARTINEZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79642459,'HLOPEZPE','HECTOR LEONARDO','LOPEZ PENUELA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79957495,'GAPIEDRAHITA','GIOVANNY ANDRES','PIEDRAHITA SOLORZANO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80793412,'CARAMIREZS','CAMILO ANDRES','RAMIREZ SANCHEZ','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79492984,'OGOMEZAN','OMAR','GOMEZ ANZOLA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (24333647,'jcastell','JULIANA','CASTELLANOS DIAZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52848495,'DVELASQUEZ','DIANA SHIRLEY','VELASQUEZ ROJAS','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79798291,'GBAQUERO','GIOVANNY ALEXANDER','BAQUERO VILLAMIL','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80017129,'JSOLERRO','JAIME RODOLFO','SOLER ROLDAN','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79380090,'AHILARION','ALVARO ENRIQUE','HILARION MADARIAGA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52216715,'ALEONGUA','AIDA XIMENA','LEON GUATAME','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (41783433,'CPINEDAM','CECILIA','PINEDA MARIN','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80056941,'JNINOVEL','JAVIER FERNANDO','NINO VELASQUEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79672519,'CAMISACH','CAMILO ANDRES','SANCHEZ RAMOS','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19379348,'JCOVEZDY','JALILY','COVEZDY ROJAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026252411,'AZAMUDIOC','ANDRES IGNACIO','ZAMUDIO CASTRO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79751429,'LETABOADA','LUIS ENRIQUE','TABOADA ROJAS','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80047995,'cmgranados','CESAR MANUEL','GRANADOS LEON','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79880055,'nariasv','NICOLAS','ARIAS VELANDIA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030537054,'HUA_MART','DEISY ANDREA','HUACA MARTINEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (319306,'SKERAJ','SOKOL','KERAJ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79745877,'HACEROOR','HENRY','ACERO ORTEGA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51601883,'OCHOASER','ANGELA CRISTINA','OCHOA SERRANO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79487415,'HESPITIA','HERNANDO','ESPITIA LOPEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52513968,'PHACOSTA','PAOLA HELENA DE LAS MERCED','ACOSTA SIERRA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79843140,'OSROBAYO','OSCAR JAVIER','ROBAYO PINZON','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (10784319,'RALVARAD','ROGELIO MANUEL','ALVARADO MARTINEZ','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (13844262,'AROJASCO','ALEXIS','ROJAS CORDERO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79792080,'DMONTALV','DARIO ALBERTO','MONTALVO ABELLA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79939051,'JRPEREA','JULIAN RAUL','PEREA GOMEZ','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1090385880,'gyanezba','GABRIEL MAURICIO','YANEZ BARRETO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020720802,'DCJURADOB','DIANA CAROLINA','JURADO BERNAL','6','21','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51851821,'CIGARCIAV','CLARA INES','GARCIA VALENCIA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51893342,'CAULLOA','CLAUDIA ANDREA','ULLOA ROMERO','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52987366,'CRINCONR','CLAUDIA PATRICIA','RINCON RODRIGUEZ','1','5','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79745939,'JLZUNIGA','JAVIER LEONARDO','ZUNIGA MARTIN','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79806071,'RDMARTINEZ','RUBEN DARIO','MARTINEZ AMADO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79854863,'HAGUZMANU','HUGO ARMANDO','GUZMAN USECHE','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026250892,'FAMENDOZA','FREDERICK ANDRES','MENDOZA LOZANO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52795939,'CAVIEDEC','NANCY PATRICIA','CAVIEDES CASTILLO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79540230,'MARODRIG','MARIO RAFAEL','RODRIGUEZ CLAVIJO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026250250,'GKVELANDIA','GISETTE KATHERINE','VELANDIA VARGAS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79442754,'MEBAEZ','MANUEL EBERTO','BAEZ MANCERA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52795724,'LPARRAPE','LAURA VICTORIA','PARRA PERILLA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79400673,'JROJASMA','JOSE ARTURO','ROJAS MARTINEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80888341,'DRUIZQUI','DANIEL RICARDO','RUIZ QUINTERO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (23624150,'SMONDRAG','SONIA ALEXANDRA','MONDRAGON HERNANDEZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52478780,'abautist','ALEJANDRA CAROLINA','BAUTISTA GODOY','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (29820488,'SLOPEZRE','SONIA','LOPEZ RENDON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1053787971,'MPACHONR','MATEO','PACHON RINCON','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52064060,'VCALLYNSON','ALLYSON KAREN','VENEGAS CAMARGO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1023874909,'DLCRUZ','DIEGO LEONARDO','CRUZ SERRANO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (20678552,'ASASTOQU','AMPARO','SASTOQUE ROMERO','7','24','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52954556,'MZTRUJILLO','MAGDA ZULENA','TRUJILLO RODRIGUEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (35512606,'DMSALASC','DIANA MARIA','SALAS CADAVID','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52937154,'LARAMIRE','LADY JOHANNA','RAMIREZ MORENO','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (4407720,'JGARCIA','JOHANN','GARCIA LOPEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80875272,'JCASTROH','JAIME RAFAEL','CASTRO HURTADO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79391628,'JSALINASR','JAVIER','RODRIGUEZ SALINAS','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79867268,'CAHERNANDEZO','CESAR AUGUSTO','HERNANDEZ OCAMPO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52726730,'SROJASTO','SANDRA MILENA','ROJAS TOLOSA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (40027082,'MGONZALEZM','MARIA GLORIA','GONZALEZ MOLINA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79789197,'GCASTROC','GERMAN ANDRES','CASTRO CABAL','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11324293,'ALGOMEZRRODR','RODRIGUEZ ALFREDO','GOMEZ RODRIGUEZ','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79747402,'IBARREROR','ISRAEL','BARRERO RAMIREZ','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52424853,'AKBOHOR','ANDREA KAROLINA','BOHORQUEZ TORRES','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51899998,'mimorenom','MARTHA INES','MORENO MEDEL','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (41798773,'tninoben','TERESA DEL PILAR','NINO BENAVIDES','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52795062,'YVARGASL','YOLANDA ROCIO','VARGAS LEGUIZAMON','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79431883,'RGOMEZZA','ROBERTO ANTONIO','GOMEZ ZAMBRANO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79553647,'JCROJASPA','JUAN CARLOS','ROJAS PAREDES','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1073692746,'KROCUADR','KATHERINE','ROZO CUADROS','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1036614136,'DBOTEROZ','DIANA MARCELA','BOTERO ZULUAGA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52966912,'AMPENAP','ANA MARIA','PENA PINEDA','3','16','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (36303363,'CRODRIGUEZA','CAROLINA','RODRIGUEZ AMAYA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (10294129,'jebucheli','JULIAN EDUARDO','BUCHELI SANDOVAL','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52106547,'snacunam','SANDRA NAYIBE','ACUNA MOLANO','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79531115,'gescobarg','GODWARD','ESCOBAR GALVIS','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (22668473,'smchicas','SANDRA MILENA','CHICAS SIERRA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52232540,'cvelasquez','CLARA ISABEL','VELASQUEZ CASTANEDA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030603005,'JMAREVALOPA','JESSICA MARCELA','AREVALO PARRA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52210279,'oachaparror','OFIR AURORA','CHAPARRO ROJAS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52728313,'dguerrerop','DIANA LETICIA','GUERRERO PINEDA','4','17','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018434837,'ltimaran','LEIDY TATIANA','TIMARAN CHAVARRO','4','19','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11276599,'ITUNJANO','IVAN FRANCISCO','TUNJANO PINZON','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1010176077,'LGAITAN','LUIS ALBERTO','ROJAS GAITAN','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018457332,'JSMARTINEZ','JUAN SEBASTIAN','MARTINEZ GRISALES','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020742215,'JPGUTIERREZC','JUAN PABLO','GUTIERREZ CARVAJAL','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80147641,'JCGUTIERREZ','JUAN CARLOS','GUTIERREZ VANEGAS','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52514281,'sprojasa','SONIA PATRICIA','ROJAS ALVAREZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71266594,'CZULUAGA','CHRISTIAN DAVID','ZULUAGA ESCOBAR','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019026575,'jahernandezgom','JULIAN ANDRES','HERNANDEZ GOMEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52422828,'dpcastaneda','DIANA PATRICIA','CASTANEDA GUERRERO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52428784,'jilguerrero','ANDREA LORENA','GUERRERO JIMENEZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52032535,'VPETERSR','VICTORIA EUGENIA','PETERS RADA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52326759,'mtellezp','MARCELA FERNANDA','TELLEZ PEDRAZA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1090411740,'casadiegor','RODOLFO','CASADIEGO ALZATE','5','20','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52715983,'MORTEGON','MARY NATALIA','ORTEGON CIFUENTES','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (32150840,'stejadaf','SORANNY YISETH','TEJADA FLOREZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017153331,'yagudelo','YURY CATALINA','AGUDELO HENAO','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79567084,'ARGONZALEZT','ANTONIO RICARDO','GONZALEZ TORRES','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026268827,'LMORTEGON','LINA MARIA','ORTEGON SUAREZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (39645849,'erlassos','EDEL ROCIO','LASSO SILVA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019002414,'tzabala','TATIANA DULIMA','ZABALA LEAL','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53050258,'imahecha','ISABEL ANDREA','MAHECHA NIETO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032367367,'FRGONZAL','FRANCISCO JAVIER','GONZALEZ AGUIRRE','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (10015565,'alvarezla','LUIS ANIBAL','ALVAREZ BARRAGAN','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128055436,'acabarcas','AURA BEATRIZ','CABARCAS ORTEGA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80062205,'RAGUILAR','RAMON GABRIEL','AGUILAR VEGA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52799933,'jpuentesb','JANETH','PUENTES BEDOYA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52355652,'jjrodriguez','JENNY JULIANA','JIMENEZ RODRIGUEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018457913,'evagnoni','EMILIANO','VAGNONI MONDRAGON','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79883166,'JMCAMARGO','JAVIER MAURICIO','CAMARGO RUIZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43270561,'cgalileo','CATERINE JOHANA','GALILEO','4','18','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1047379786,'cdmaldonado','CRISTIAN DAVID','MALDONADO PEDROZA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1126422754,'mgramos','MARIA GABRIELA','RAMOS BARRERA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79672484,'gclavijom','EDWIN GABRIEL','CLAVIJO MARTIN','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032448026,'smaguilarq','SANDRA MILENA','AGUILAR QUEMBA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014200955,'JGRANADO','JOAQUIN MANUEL','GRANADOS RODRIGUEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52808492,'atovarcifuentes','ALEJANDRA','TOVAR CIFUENTES','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014225693,'lcardenas','LUISA FERNANDA','CARDENAS RODRIGUEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (72205809,'jacosta','JOAQUIN EMILIO','ACOSTA RODRIGUEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030571592,'nturriago','NATALIA','TURRIAGO GALVEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1066096432,'jgarmendia','JUAN CARLOS','GARMENDIA MORA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52816926,'cmpico','CLAUDIA MILENA','PICO BONILLA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (75102454,'jarias','JULIAN ANDRES','ARIAS VERA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71777352,'MGOMEZVA','MAURICIO','GOMEZ VASQUEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (91521236,'icabeza','IVAN ORLANDO','CABEZA ROJAS','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014217014,'ciriverap','CARLOS IVAN','RIVERA PARRA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152437191,'dmvaldes','DIANA MERCEDES','VALDES MOSQUERA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030523706,'mmendez','MANUEL LIOMER','MENDEZ PINZON','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016046852,'sramirezl','STEFANIA','RAMIREZ LOPEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79720273,'rlvillarreal','ROMAN LEONARDO','VILLARREAL RAMOS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79961224,'jamorales','JOSE ALEXANDER','MORALES CARVAJAL','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1037627128,'jdarias','JUAN DAVID','ARIAS SUAREZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (12134327,'rvargas','RAMIRO','VARGAS DIAZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (40610179,'papiza','PAOLA ANDREA','PIZA','5','20','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1110467381,'jquinterop','JOSE WILMAR','QUINTERO PENA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1054708602,'kcastillo','KAREN NATALIA','CASTILLO PRADA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71387084,'JPVELEZU','JUAN PABLO','VELEZ URIBE','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43983267,'JLOPERAN','JOHANNA MARCELA','LOPERA NARVAEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018415343,'ezapata','EDWIN HERNANDO','ZAPATA CIFUENTES','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52718871,'adpcanal','ANDREA DEL PILAR','CANAL TORRES','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52489596,'palizarazom','PILAR ASTRID','LIZARAZO MACIAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1033706860,'cgiraldo','CRISTIAN IVAN','GIRALDO LEON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80424779,'iaruiz','IVAN ALBERTO','RUIZ PARRA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017133200,'abalzan','ALEXANDER','BALZAN','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43586911,'lmvalenciag','LINA MARIA','VALENCIA GALLO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (8027554,'jchernandezz','JOSE CARLOS','HERNANDEZ ZULUAGA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128047135,'lmjimenezr','LUISA MARIA','JIMENEZ RAMOS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128401087,'JBERRIOL','JUAN PABLO','BERRIO LOPEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80074492,'hbaccamo','HENRY DAVID','BACCA MORALES','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (86065704,'jamartinezrin','JULIAN ANDRES','MARTINEZ RINCON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52832701,'jkbautista','JENNY KARINA','BAUTISTA SABOGAL','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52547762,'dlgarcia','DORIS LISED','GARCIA ORTIZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52715915,'ediazm','EVELYN IVONNE','DIAZ MONTANO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (34317784,'dmaya','DIANA XIMENA','MAYA TOBAR','8','25','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1094929415,'bcepeda','BENJAMIN GIOVANNI','CEPEDA RAMIREZ','5','20','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1087996821,'omsalazar','OSCAR MAURICIO','SALAZAR LOAIZA','7','22','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80111685,'GAVILABU','GABRIEL EDUARDO','AVILA BUITRAGO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016022789,'mquirozr','MONICA MARIA','QUIROZ RUBIANO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79626316,'wcardenas','WILSON ANDRES','CARDENAS POLANIA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032450063,'hequinones','HELENA ESPERANZA','QUINONES AGUJA','5','20','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026262606,'ecaro','EDGAR ANDRES','CARO PERALTA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018413579,'lvelasquez','LINA XIMENA','VELASQUEZ TORRES','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80797035,'ratehortua','RODRIGO','ATEHORTUA SANTAMARIA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018447724,'aglozano','ANGELA GISSELLE','LOZANO RUIZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1140834437,'rfmartinez','RODRIGO FRANCISCO','MARTINEZ MORENO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52865088,'lcristancho','LAURA ANDREA','CRISTANCHO GIRALDO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (91532266,'olacevedo','OSCAR LEONARDO','ACEVEDO PABON','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017153895,'scastaneda','SERGIO','CASTANEDA RAMIREZ','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152436759,'LESPINAL','LUISA FERNANDA','ESPINAL RAMIREZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52810456,'aramosl','ANGELA','RAMOS LOPEZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014183231,'agcarod','ANGELA GISSETTE','CARO DELGADO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52982263,'YEPERDOMO','YURY ESTEFANIA','PERDOMO JURADO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53165227,'jubejara','JUANITA DEL PILAR','BEJARANO CELIS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032439556,'jdsuarezm','JUAN DAVID','SUAREZ MORENO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128227748,'ccadenas','CARMELINA ROSARIO','CADENAS ANAYA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018444599,'yparedes','YENNY ALEXANDRA','PAREDES ASTUDILLO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1098640740,'garaque','GUSTAVO ANDRES','ARAQUE GONZALEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43750201,'memorales','MARIA EUGENIA','MORALES SIERRA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71293780,'JOVELASQ','JORGE ALBERTO','VELASQUEZ CASTRILLON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017170445,'lcastaneda','LEIDY TATIANA','CASTANEDA QUIRAMA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80124975,'FCACERES','FELIPE ANDRES','CACERES BERNAL','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80420494,'aduque','ALVARO ENRIQUE','DUQUE SOTO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79955605,'rdiaz','RAFAEL FRANCISCO','DIAZ VASQUEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030550448,'jvelandia','JEINER LEANDRO','VELANDIA SANABRIA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52881810,'NHERNAND','NYDIA CONSUELO','HERNANDEZ MORA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52956899,'hrodriguez','HAIDY JOHANNA','RODRIGUEZ SANCHEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52896326,'mcifuentes','MARTHA JANETH','CIFUENTES IZQUIERDO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79689944,'oaparicio','OSCAR YECID','APARICIO GOMEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1075232353,'jsolorzano','JHON HENRY','SOLORZANO LOZANO','5','20','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1024491031,'ecamargoc','CALA EVELYN','CAMARGO CALA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79626295,'vdiaz','VLADIMIR','DIAZ MESA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017230375,'ibuiles','ISABELLA','BUILES ROLDAN','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43739193,'abarrera','ADRIANA MARIA','BARRERA MONTOYA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019022379,'lmsegovia','LAURA MILENA','SEGOVIA NIETO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98558296,'jtamayo','JAIRO ALEJANDRO','TAMAYO BUSTAMENTE','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53037585,'msarmiento','MARIA FERNANDA','SARMIENTO BONILLA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79797634,'dduque','DIEGO FERNANDO','DUQUE RAMIREZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1125599277,'makiyama','MINORU ENRIQUE','AKIYAMA FIGUEROA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80041587,'rcastellanos','RODRIGO','CASTELLANOS CARO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (91528031,'asuarez','ALBEIRO HERNAN','SUAREZ HERNANDEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80881074,'jneira','JAVIER ORLANDO','NEIRA RUEDA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1015406027,'vpedraza','VICTOR AUGUSTO','PEDRAZA BONILLA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1071328608,'jchauta','JOSE MANUEL','CHAUTA TORRES','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (848997,'tcano','TULIO ENRIQUE','CANO VELAZQUEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80226149,'WJORTIZA','WILINTON JAVIER','ORTIZ AMADOR','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1235252376,'lmolero','LISBETH MARINA','MOLERO SUAREZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152692584,'dlcastaneda','DIEGO LEON','CASTANEDA SALDARRIAGA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014233287,'jnavarrete','JHON ERIK','NAVARRETE GOMEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52102488,'lrianoma','LENYD ANGELICA','RIANO MARTINEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (32257009,'pvelasquez','PAULA ANDREA','VELASQUEZ CALLE','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1005696161,'orodriguez','OSCAR JAVIER','RODRIGUEZ RIVEROS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79390018,'rcepero','RAMOS RICARDO','CEPERO RAMOS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030537312,'jdiaz','JUAN PABLO','DIAZ RODRIGUEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43188604,'emontoya','ELIZABETH','MONTOYA VELEZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (72199701,'cmartinez','CARLOS ARTURO','MARTINEZ GARCIA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (37860723,'cserrano','CLAUDIA JOHANNA','SERRANO RODRIGUEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (67002385,'MMALAGON','MARIA ALEXANDRA','MALAGON TORRES','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1069583463,'dzamora','ROMERO DERLY','ZAMORA ROMERO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52223708,'lgarciag','LISBETH','GARCIA GUERRERO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52529367,'kgutierrez','KAROL LILIAN','GUTIERREZ RUBIANO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (36697842,'zponce','ZULLY HELENA','PONCE PALACIO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79953038,'RBALLENM','RAUL CAMILO','BALLEN MENDIVELSO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52328478,'mmalaver','MARLENY NATALIA','MALAVER ROJAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80895279,'jwilches','JAIME ANDRES','WILCHES TINJACA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80757978,'gtoca','GIOVANNY ALEJANDRO','TOCA CAMARGO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (416925,'mevega','MARIA EUGENIA','VEGA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (23180770,'cdiazg','CAROLYN','DIAZ GARCIA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1100948211,'ejgomez','EDINSON JOHAN','GOMEZ SOLANO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (42690189,'pusquiano','PAULA ANDREA','USQUIANO YEPES','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (14702245,'facardonaq','FERNAN ALONSO','CARDONA QUINTERO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80857330,'hdavila','HERMAN EDUARDO','DAVILA AGUJA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014181816,'gmachuca','GERARDO ANDRES','MACHUCA TELLEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1075217017,'jmtrivino','JOHANNA MARCELA','TRIVINO JAIMES','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1033749789,'kserrano','KEVIN ANDRES','SERRANO BURGOS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (32244296,'crendon','CAROLINA','RENDON GARCES','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80230380,'JMORTIGO','JAIME ANDRES','MORTIGO MURCIA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43615743,'lsanabria','LUISA FERNANDA','SANABRIA CORREA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1044505765,'fmazo','FERNANDO','MAZO PUERTA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014205169,'ldpoveda','DEL PILAR','POVEDA PARRA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1010176898,'npjimenez','NAYIBE PAOLA','JIMENEZ RODRIGUEZ','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (5750840,'JMERCHAN','JAIME ORLANDO','MERCHAN VILLAMIL','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017125986,'vzrobinson','ROBINSON','VILLA ZULUAGA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1098673079,'DCASTRIL','DAVID MAURICIO','CASTRILLON KERRIGAN','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11301339,'LFTRUJI','LUIS FERNANDO','TRUJILLO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17123889,'JUJOVEGO','JUAN JOSE','VEJARANO GONZALEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19107692,'GUGARCIA','GUILLERMO','GARCIA PEDRAZA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (35463921,'MELVIRAM','MARIA ELVIRA','MORA CAMARGO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (41797190,'EARARATA','ESTHER JULIA','ARARAT ARCOS','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52223453,'YLEMUSHE','YENNY GISELA','LEMUS HERRERA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52267923,'MGUTIERREZ','MONICA ANDREA','GUTIERREZ ESPINOSA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52458225,'DCBARRETO','DIANA CAROLINA','BARRETO REYES','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52705909,'acaballero','NUBIA ANGELICA','CABALLERO PEDRAZA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (70330050,'FSERNAGI','FRANCISCO JAVIER','SERNA GIRALDO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71332254,'ADUQUEGA','ANDRES ANTONIO','DUQUE GARCIA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79408435,'JCOLIMON','JULES MICHEL','COLIMON MENDEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79442808,'JAHUERFANO','JORGE ARTURO','HUERFANO MENDEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79470710,'ARIA_BEC','JULIO ERNESTO','ARIAS BECERRA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79553664,'JOMTORRES','JORGE MARIO','TORRES MESA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79571098,'LGOMEZME','LUIS ALEJANDRO','GOMEZ MELO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79876389,'DMNAVASN','DANIEL MAURICIO','NAVAS NAVARRO','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79965211,'jahernan','JAIRO ALBERTO','HERNANDEZ HERRERA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80036763,'JEGAITAN','JORGE ELIECER','GAITAN RIVERA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80726115,'DAGUIRRE','DAVID ORLANDO','AGUIRRE FRANCO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (35513846,'MMARINMA','MARGARITA MARIA','MARIN MARIN','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (70220185,'MONCADAORLANDO','DUQUEIRO ORLANDO','MONCADA ARBOLEDA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (70417944,'JFACEVEDO','JHON FREDY','ACEVEDO RESTREPO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71766387,'FCRUZARB','FERNANDO DE JESUS','CRUZ ARBOLEDA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79779125,'JCARANGO','JUAN CARLOS','ARANGO ESPITIA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1022389613,'ABOLIVAR','ANA MARIA','BOLIVAR MUNAR','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79683741,'GQUIROSCA','GERARDO ALBERTO','QUIROS CAICEDO','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51840522,'mromeroc','MARTHA CECILIA','ROMERO COLINA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1075257863,'DMARINMO','DIEGO FERNANDO','MARIN MONJE','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1035421817,'ngomezhe','NATHALY','GOMEZ HENAO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (32182949,'apradaca','ANGELA MARIA','PRADA CADAVID','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80217063,'DALVARAD','DAIRO JIMMY','ALVARADO NINO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016012889,'javaronga','JORGE AUGUSTO','VARON GAONA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80822338,'OSALAVARRIETA','OSCAR FELIPE','SALVARRIETA DIAZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (14638243,'ALOPEZLO','ANDRES FELIPE','LOPEZ LOPEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020727905,'JRPARDOF','JONATHAN RAMIRO','PARDO FUENTES','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1031135321,'laxiguatavita','LAURA XIMENA','GUATAVITA ORDONEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52963877,'mverague','MANUELA ELISA','VERA GUERRERO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80538076,'jquevedo','JOHANN OSWALDO','QUEVEDO SANCHEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43541306,'SBETANCU','ECHAVARRIA SORAYA','BETANCUR ECHAVARRIA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (75081637,'etobonve','EDGAR ANDRES','TOBON VERGARA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1088242491,'jerincons','JORGE EDUARDO','RINCON SANZ','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (75089416,'jfsotod','JOHN FREDY','SOTO DUQUE','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1095800777,'ymbarreto','YULY MARCELA','BARRETO BASTO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020720091,'chromeros','CESAR HERNANDO','ROMERO SIERRA','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11346585,'MIRODRIG','MIGUEL ANGEL','RODRIGUEZ CASTELLANOS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52528159,'CJMEJIAG','CLAUDIA JENNY','MEJIA GOMEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71783951,'jagarcesva','JORGE ALBERTO','GARCES VASQUEZ','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79571362,'jvalbuena','JAVIER LEONARDO','VALBUENA OLIVOS','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79683090,'JURIBEVE','JESUS DARIO','URIBE VERU','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52382776,'sjasanchez','SANDRA JOHANNA','SANCHEZ RUSSI','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020751881,'ATELLOARDILA','ANDRES','TELLO ARDILA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80473281,'freyquinones','FEDERICO','REY QUINONES','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19346895,'alrivero','ALFONSO','RIVEROS LEON','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79968187,'arriverosa','ANDRES RICARDO','RIVEROS AVILA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17077100,'josgomez','JOSE MIGUEL','GOMEZ OLAYA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152437244,'CRAMIREZ','CAROLINA','RAMIREZ ZULETA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79231409,'jaldanav','JUAN CARLOS','ALDANA VEGA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79505441,'gabrielq','ALBERTO MARTIN','QUESADA GOERNITZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52986041,'jgiraldop','JUANITA','GIRALDO POLANCO','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98648168,'waescobarh','WILMAN ANDRES','ESCOBAR HINCAPIE','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43580923,'cpcardonaz','CLAUDIA PATRICIA','CARDONA ZULETA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1039452695,'lfgonzalez','LUIS FELIPE','GONZALEZ GALLEGO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71772503,'afvelasquezp','ANDRES FELIPE','VELASQUEZ PELAEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98588908,'slmarinc','SERGIO LEON','MARIN CANO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71490646,'lgmarin','LEON GUILLERMO','MARIN ORTEGA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1015399664,'jkgarcia','JULY KATHERINE','GARCIA VARGAS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032386501,'jcetinas','JUANITA','CETINA SEGURA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (73133851,'gavillazonh','GUSTAVO ADOLFO','VILLAZON HITURRIAGO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1102816494,'jenavarrog','JAVIER ALEJANDRO','NAVARRO GONZALEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43524727,'acarboleda','ANA CAROLINA','ARBOLEDA GALLO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (3383917,'jcperezh','JUAN CAMILO','PEREZ HERNANDEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128476607,'yagomezz','YESSICA ALEXANDRA','GOMEZ ZULUAGA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1037611142,'yzuluagac','YESICA','ZULUAGA CASTANO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71273568,'rvasquez','PEREZ REYNEL','VASQUEZ PEREZ','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128408207,'ebenjumea','ELIZABETH','BENJUMEA LOPEZ','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1026135298,'dfvelez','DANIEL FRANCISCO','VELEZ HOYOS','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80040671,'fdavilaz','FELIPE','DAVILA ZABALA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80419227,'JDUARTEG','JOSE ALFONSO','DUARTE GOMEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018434238,'cdtorrest','CRISTIAN DAVID','TORRES TORRES','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71388239,'gaycardy','GIANI RICARDO','AYCARDY MONTOYA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017125982,'clujan','CATALINA','LUJAN GOMEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79626628,'lcquintero','LUIS CARLOS','QUINTERO BOTERO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43599038,'smhenao','SILVIA MARCELA','HENAO VILLA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98552006,'bmrevelo','BORIS MAURICIO','REVELO RENDON','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (16076658,'JNPUERTA','JORGE NELSON','PUERTA LOPERA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80875350,'amorales','ANDRES FELIPE','MORALES DUARTE','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (330798,'mthomas','THOMAS','SMITH MALCOLM','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79909149,'fvergara','LOMBANA FELIPE','VERGARA LOMBANA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016053632,'carguello','CATALINA','ARGUELLO DUARTE','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020727052,'mepedraza','MARCIA ESTEFANIA','PEDRAZA SIERRA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52532186,'laarenas','LILIAM ALICIA','ARENAS PEREZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (2236557,'rhernandez','RAFAEL','HERNANDEZ CASTELLANOS','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1010182693,'stsilva','SHAMEEL','THAHIR SILVA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019027936,'nzorro','NICOLAS CAMILO','ZORRO LOPEZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1093741669,'NJCASTANEDA','NINI JOHANNA','CASTANEDA QUINTERO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1015999519,'mlprieto','MARTHA LILIA','PRIETO MATIZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43528078,'mbetancur','MIGDALIA MARIA','BETANCUR SEPULVEDA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1039683222,'arubio','ALEJANDRA','RUBIO ARIAS','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (24348492,'agiraldo','ALEJANDRA MARIA','GIRALDO RAVE','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79510282,'jsanchezs','JAVIER','SANCHEZ SOSA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128280181,'lgonzalez','LUIS MIGUEL','GONZALEZ RODRIGUEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128442058,'javalencia','JOHN ANDERSSON','VALENCIA PALACIO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (70879670,'jcriveram','JULIO CESAR','RIVERA MOLINA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (394366,'pziemicki','TOMASZ','ZIEMICKI PAWEL','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79721581,'acastiblancoc','ALEJANDRO','CASTIBLANCO CARO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79876883,'CTOROCUE','CARLOS ERNESTO','TORO CUERVO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79787338,'ecardena','EDGAR FERNANDO','CARDENAS ANGEL','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79630659,'esanchezv','ELENA','SANCHEZ VELANDIA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52454204,'dsocha','DIANA YULIETH','SOCHA HERNANDEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79938880,'jlbalaguera','JORGE LUIS','BALAGUERA JIMENEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1036632721,'misvillada','MARIA ISABEL','VILLADA GIL','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71363638,'jlopera','JORGE MARIO','LOPERA CARMONA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71759725,'jmesa','JUAN CARLOS','MESA SALAZAR','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (8104285,'DRIVASSU','DANIEL JOSE','RIVAS SUAREZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1094893354,'apacheco','ANDRES FELIPE','PACHECO PEREZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79473945,'ilopez','MAURICIO FERNANDO','LOPEZ FORERO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152189853,'mtulcan','MONICA ANDREA','TULCAN MUNOZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80034022,'mecheverri','MARIO ALBERTO','ECHEVERRI BRAVO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80037406,'hvalencia','HENRY','VALENCIA CASTILLO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51557839,'gacevedo','GLORIA ISABEL','ACEVEDO DUARTE','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79712843,'jejimenez','JAVIER ENRIQUE','JIMENEZ HURTADO','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80770620,'mhernandezn','MICHAEL ANDRES','HERNANDEZ NAVAS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1126588220,'jcohecha','JULIAN ANDRES','COHECHA OCAMPO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1069471702,'nvergara','NEIDER XAVIER','VERGARA HUMANEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (379320,'sedwards','SIMON MARK','EDWARDS','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98635000,'EGIRALDO','EMERSON ANDRES','GIRALDO BETANCUR','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98714866,'jlondono','JOSE LUIS','LONDONO CORREA','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1036928411,'jfranco','JUAN CAMILO','FRANCO JARAMILLO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (9738254,'jrios','JULIAN ANDRES','RIOS OBANDO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1146435118,'ndiaz','NATALIA','DIAZ OSORIO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017226638,'abedoyar','ALEJANDRA','BEDOYA RESTREPO','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43253190,'vciro','VIVIANA','CIRO RAMIREZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (98588111,'lbetancur','LUIS GUILLERMO','BETANCUR ARTEAGA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71669230,'jpelaeza','JUAN CARLOS','PELAEZ AGUDELO','3','10','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71681566,'abohorquezr','ANDRES ALBERTO','BOHORQUEZ RAMIREZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43580706,'gmonsalve','GISELA PATRICIA','MONSALVE FONNEGRA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79450594,'HMMONROY','HEVER','MIGUEZ MONROY','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17319676,'hcolmenaresf','HUGO ARMANDO','COLMENARES FERRER','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1075217624,'iquintero','INGRID LORENA','QUINTERO BASTIDAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79501639,'JAVIERSA','JAVIER','SANCHEZ CASTANEDA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018416904,'jpdiaz','JOHANA PAOLA','DIAZ VALERA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79111663,'jcobadel','JUAN ANTONIO','COBALEDA MONTEALEGRE','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (91507885,'omoreno','OSCAR ANDRES','MORENO QUINTERO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020791872,'asamudio','ARMANDO','SAMUDIO MEJIA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71173050,'jdiossa','JOHN FERNANDO','DIOSSA CASTRO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017217612,'krendon','KRISTIAN','RENDON SERNA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1128387829,'mcerodriguez','MILTON CESAR','RODRIGUEZ GARCIA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (15877847,'vgodoy','VICTOR ALEJANDRO','GODOY LOPEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1017152270,'avilla','ALVARO ALEJANDRO','VILLA GARZON','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (93235912,'jzuniga','JULIAN AUGUSTO','ZUNIGA UPEGUI','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52104439,'ebernalm','ELIANA MARCELA','BERNAL MORALES','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79390354,'ralbarra','RAUL HUMBERTO','ALBARRACIN BALAQUERA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43279000,'bquintero','BLANCA YUDY','QUINTERO OSORIO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79295192,'JACASTRO','JAIRO','CASTRO RODRIGUEZ','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80026838,'hjguzman','HEINZ','JANY GUZMAN','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (63499994,'MMTOLOZA','MARIA MERCEDES','TOLOZA ROJAS','1','4','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (15458241,'jovasquez','JAIME ORLANDO','VASQUEZ ROJAS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43734396,'mpuerta','MARTA LUZ','PUERTA MEJIA','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (71338206,'jabetancur','JAVIER ALBERTO','BETANCUR SALAZAR','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (42874500,'pbustamantem','PATRICIA','BUSTAMANTE MARIN','3','13','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52504256,'VANESSAP','VANESSA','PLATA PENAFORT','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52530370,'DRRODRIGUEZ','DEISSY YOLIMA','RODRIGUEZ RODRIGUEZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (93290315,'JORGESAN','JORGE ANDRES','SANCHEZ CALVO','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52928030,'KAREVALO','KATHERINE','AREVALO SANCHEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80472408,'JUANCVAR','JUAN CARLOS','VARGAS DE MENDOZA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (13542910,'IVANJREY','IVAN JULIAN','REY TELLEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (393719,'SIMOHILL','CHARLES','HILL SIMON','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19351811,'LO_BELTR','JAVIER','LOPEZ BELTRAN','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52503623,'LSARMIEN','LUISA FERNANDA','SARMIENTO SENIOR','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80213338,'cusecher','CHRISTIAN DARIO','USECHE RAMIREZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79960168,'JAIGUILA','JAIME ERNESTO','AGUILAR GIL','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1037597821,'DSTAMAYOURIBE','DAVID SANTIAGO','TAMAYO URIBE','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79287695,'ARCASTIL','ARTURO','CASTILLO IBARRA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (4252246,'joblanco','JORGE IGNACIO','BLANCO JORGE','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79956411,'DHROAOR','DIEGO HERNAN','ROA ORDONEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52290995,'mcastanedaca','MARITZA','CASTANEDA CARDENAS','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (3192182,'CABALLESTEROS','CARLOS ALIRIO','BALLESTEROS TORRES','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52704519,'DCELISVA','DIANA CONSTANZA','CELIS VARGAS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52303166,'RRINCONGOMEZ','RUBIELA','RINCON GOMEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (85151444,'SROBLESG','SERGIO ANDRES','ROBLES GUEVARA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51611196,'DCAICEDT','DORIS','CAICEDO TORRES','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80503874,'dseligma','CARLOS DAVID','SELIGMANN TRUJILLO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (9273440,'hmirandaa','HENRY','MIRANDA AREVALO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (88162327,'GACACERES','GILBERTO ARNULFO','CACERES CRISTANCHO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030630407,'bbeltranr','BRIAN','BELTRAN RICAURTE','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11429061,'mbernal','MANUEL','BERNAL GARZON','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (63502044,'iroortizr','IVONNE ROSIO','ORTIZ RUIZ','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (60361234,'AMERCEDESS','ANA MERCEDES','SUAREZ OSPINA','3','9','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (40049797,'dcruzort','DIANA ANGELICA','CRUZ ORTEGA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53048000,'CNINOP','DIANA CAROLINA','NINO PENA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020773677,'alaverde','ANA CAMILA','LAVERDE HERNANDEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52257862,'maarangoa','MARIA ADELAIDA','ARANGO ARANGO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (33369940,'nrondon','NOHORA JOHANNA','RONDON VARGAS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1022367169,'LSMASMELA','LAURA ESTEFANY','MASMELA ROJAS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79713998,'fmontejo','FERNANDO AUGUSTO','MONTEJO ANGEL','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (16288682,'ALASPRIL','ANDRES FELIPE','LASPRILLA PAZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52256289,'saisazac','SANDRA MILENA','ISAZA CUELLAR','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52701875,'dchernandez','DIANA CAROLINA','HERNANDEZ GUALDRON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018406072,'nguevara','NICOLAS','GUEVARA RAMIREZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52885729,'mjguayacundo','MABEL JANETH','GUAYACUNDO RAMOS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80217821,'jaranzalez','JOHN FREDY','ARANZALEZ GUERRERO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1010193708,'scarvajal','STEPHANIA','CARVAJAL CHAVES','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52707460,'ycastroc','YIRA MARIETA','CASTRO CASTIBLANCO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1060943,'JACAMEJO','ARMANDO JOSE','CAMEJO RUIZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11276054,'FEESPITI','FERNANDO ISIDRO','ESPITIA CASTANEDA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80122813,'HEARAMIREZ','HECTOR ALFREDO','RAMIREZ VACA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014185005,'jkromero','JOHANNA KATHERYNE','ROMERO ARIZA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032451495,'svbaronc','SARAH VANESSA','BARON CASTRO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11221861,'RODRIANO','RODRIGO LUPERCIO','RIANO PINEDA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018410287,'csantana','YULY CAROLINA','SANTANA RAMIREZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1144151960,'xramos','XIMENA STEPHANY','RAMOS ARANA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (63396857,'MJAIMESH','LIZETH MARCELA','JAIMES HERRERA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018411629,'kguerrero','KETTY MARGARITA','GUERRERO ARDILA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016010255,'JNINOROD','JOHAN PAOLA','NINO RODRIGUEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1107052941,'lmamontenegro','LINA MARIANNE','MONTENEGRO CETINA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032419117,'llleal','LEIDY LILIANA','LEAL DIAZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43220520,'HURREGOV','HEIDI JACQUELINE','URREGO VALENCIA','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53028240,'yquintero','YUDY AMANDA','QUINTERO PULGAR','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51718881,'ICSANCHEZ','IRMA CRISTINA','SANCHEZ BARREIRO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80070314,'operez','OSCAR EDUARDO','PEREZ RODRIGUEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80094522,'dneira','DIEGO GUSTAVO','NEIRA BERMUDEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80222738,'aapulidoc','ALVARO ANDRES','PULIDO CASTRILLON','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80821114,'IMENDIVELSOB','IGNACIO ALBERTO','MENDIVELSO BERNAL','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19285610,'JSUAREZB','JULIO CESAR','SUAREZ BELTRAN','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79576158,'cbernall','CESAR AUGUSTO','BERNAL DIAZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79120790,'alareval','ALVARO HERNANDO','AREVALO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19176991,'FDIAGOFR','FRANCISCO EDUARDO','DIAGO FRANCO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19415907,'j_guzman','HERNANDO AUGUSTO','JIMENEZ GUZMAN','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (41648540,'CTORRESC','MARIA CONSUELO','TORRES DE CUBILLOS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51668602,'albaluci','ALBA LUCIA','ECHEVERRI BARRAGAN','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51726645,'amalagon','MARTHA ALEXANDRA','MALAGON DUQUE','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79483556,'CLCASTROC','CESAR LEONARDO','CASTRO CASTRO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51900246,'LRUEDAVE','LILIANA INES','RUEDA DIAZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52026153,'OPCASTRO','OLGA PATRICIA','CASTRO ALVAREZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (11255678,'JOLARTE','JOHN ALIRIO','OLARTE RAMOS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52844085,'laldana','LADY CAROLINA','ALDANA MELO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (37896254,'amasilva','ALEXANDRA MARIA','SILVA MONSALVE','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52885850,'makarina','ANA KARINA','MONTES','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52893538,'lvramirez','LINA VICTORIA','RAMIREZ PINEROS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (53013421,'vabril','VIVIANA ALEXANDRA','ABRIL LOPEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (59822866,'ADTORRESM','ADRIANA LUCIA','TORRES MATTA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79411732,'fhernandezda','FELIPE','HERNANDEZ DE ALBA ALBORNOZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52263123,'BETACHA','BLANCA ELENA','TACHA RAYO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79581757,'igonzale','IVAN JAVIER','GONZALEZ ABELLO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79629855,'mmontejomoreno','BERNARDO ROBERTO','MONTEJO MORENO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79837102,'JUMONROY','JUAN PABLO','MONROY PEDRAZA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (13957578,'RTELLEZN','ROMAN FRANCISCO','TELLEZ NAVARRO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79852862,'aariveras','ALVARO ANDRES','RIVERA SANCHEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79861818,'RAFOREROR','RAFAEL ANDRES','FORERO RODRIGUEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (17649656,'GBECERRA','GERMAN ADOLFO','BECERRA DAZA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (35319610,'MYGARCIA','MYRIAM','GARCIA CASTANEDA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79891854,'japenacarreno','JOHN ALBEYRO','PENA CARRENO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80151941,'FABININO','FABIAN LEONARDO','NINO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51938674,'cpgarciar','CLAUDIA PATRICIA','GARCIA ROCHA','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1022351645,'jsantana','JAVIER ENRIQUE','SANTANA LOZANO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1031122508,'mcmartinezr','MARIA CAROLINA','MARTINEZ REYES','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51939440,'MLBARROST','MARTHA LUZ','BARROS TOVAR','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032437415,'ovelasquez','OSCAR ANDRES','VELASQUEZ SANCHEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (23497524,'VPCANCELADO','VIANNEY PAOLA','CANCELADO ORTIZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1152184237,'cquiroz','CARLOS ANDRES','QUIROZ CASTELLANOS','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52854520,'rygranja','ROSA YELENA','GRANJA RODRIGUEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52928292,'MFGARCIAV','MARIA FERNANDA','GARCIA VILLALOBOS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (74184272,'jcgrosso','JUAN CARLOS','GROSSO HOLGUIN','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80083468,'JPABONRE','JAVIER DARIO','PABON REVEREND','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (89004607,'jbuitrag','JHON CARLOS','BUITRAGO MONCALEANO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1010186825,'kperezp','KATHERINE','PEREZ PERDOMO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1013656720,'dcbociga','DIANA CAROLINA','BOCIGA GELVEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1015409161,'irodrigu','IVAN DARIO','RODRIGUEZ BUSTAMANTE','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019068529,'cagudelog','CAMILO','AGUDELO GUZMAN','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020717793,'mdorjuelaa','MAURICIO DAVID','ORJUELA ARENAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020728383,'jssanchez','JUAN SEBASTIAN','SANCHEZ VARGAS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032438046,'DRODRIGU','DIANA CAROLINA','RODRIGUEZ RAMOS','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1053766233,'jdgiraldo','JUAN DAVID','GIRALDO HENAO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1113037684,'nrodriguezj','NATALY','RODRIGUEZ JARAMILLO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (13862352,'LACARVAJALR','LUIS ALFREDO','CARVAJAL RINCON','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52052718,'sprpcabraf','PATRICIA ROCIO DEL P','CABRA FLOREZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52069863,'DOTALORA','DOLORES','OTALORA GONZALEZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79652640,'jmartinezm','JAVIER RAUL','MARTINEZ MARTINEZ','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79977578,'arodriguezr','ANDRES','RODRIGUEZ RUBIO','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80440131,'fmcastrob','FRANZ MAURICIO','CASTRO BARAHONA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80732041,'jcbenavides','JUAN CAMILO','BENAVIDES ROJAS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80799606,'iroa','IVAN ERNESTO','ROA OVALLE','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80920178,'jortegon','JUAN CAMILO','ORTEGON GUTIERREZ','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1018416740,'ajaramillo','ANTONIO','JARAMILLO ARANGO','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1090394598,'yarmesto','YANETH PATRICIA','ARMESTO PABON','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52151826,'tmanrique','TATIANA','MANRIQUE ZULUAGA','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (41628879,'BLRACHE','BLANCA LUZ','RACHE DE CAMARGO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79644884,'GBUENAVE','GERMAN ALFREDO','BUENAVENTURA CARDENAS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (14221423,'joviesor','JAIME OCTAVIO','OVIES ORDONEZ','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (23913905,'mavellanedav','MARGARITA','AVELLANEDA VARGAS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51777221,'mcascantem','MARCELA','CASCANTE MONTOYA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52866254,'EPENASUA','ERICA YAZMIN','PENA SUAZO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79293440,'NPEREZEC','NELSON ORLANDO','PEREZ ECHEVERRI','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79832273,'eadurangarcia','EDWIN ALEXANDER','DURAN GARCIA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80057641,'wsoto','WILSON EDUARDO','SOTO FORERO','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80727053,'OVARGASM','OSCAR','VARGAS MOLINA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1098651664,'namartinro','NATALIA','MARTINEZ ROJAS','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (5660094,'lalvarez','LUIS EVELIO','ALVAREZ ARDILA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (9868363,'sbolivara','STEVENSON','BOLIVAR ATUESTA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (13723483,'eparra','EDWARD','PARRA FLOREZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (36308869,'mpramirez','MARIA PAULA','RAMIREZ TOVAR','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52390740,'jmgomeza','JENNY MARIBEL','GOMEZ ALDANA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79749832,'faguilar','FRANKLIN ROLANDO','AGUILAR TRIANA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79954934,'lruiz','LEONARDO','RUIZ MIRANDA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79981970,'EVARGASH','ENRIQUE','VARGAS HERNANDEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80094780,'cmontoyac','CARLOS EDUARDO','MONTOYA CASAS','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80165230,'yhortua','YIMMY ALEXANDER','HORTUA HERNANDEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80729291,'JTELLOPO','JULIAN FELIPE','TELLO POSADA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (88033215,'RABELLO','RAY ALFREDO','BELLO DAVILA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1013648165,'smeza','SEBASTIAN MATEO','MEZA VILLALBA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014209639,'jedsuarez','JOSE EDUARDO','SUAREZ VARGAS','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1016062055,'JULIANRODRIGU','ERIC JULIAN','RODRIGUEZ MARTINEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020795963,'mrestrepo','MARIA ALEJANDRA','RESTREPO TROMPA','1','1','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1065600678,'akrodriguez','ALMA KARINA','RODRIGUEZ QUINTERO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1070916681,'ecastrom','ESTEBAN GUILLERMO','CASTRO MORA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1088250309,'LMMONTOYA','LINA MARCELA','MONTOYA HENAO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79621473,'LJARJONA','LUIS JEFFERSON','ARJONA VIDAL','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52357526,'plarrart','PATRICIA','LARRARTE CASTANEDA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (29873490,'MMALOPEN','MARIA PRESENTACION','MALO PENICHE','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79519106,'hholguin','HARRY','HOLGUIN LAGOS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52218247,'vivianaarias','VIVIANA CECILIA','ARIAS','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79939023,'mhernandez','EDISON MARCOS','HERNANDEZ MARTINEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52330996,'cpena','CLAUDIA LUCIA','PENA PINEDA','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020743468,'lmontoyac','LAURA','MONTOYA UPEGUI','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (18402262,'japenafiel','JHON ALEXANDER','PENAFIEL CASTRO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19438904,'lblanco','LUIS ALBERTO','BLANCO LOPEZ','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52047021,'MRINCONC','MARCELA DEL PILAR','RINCON CASTRO','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79484831,'JMMARTI','JOHN MARIO','MARTINEZ PINEDA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (93385030,'HEVASQUEZL','HERNANDO EVELIO','LEYTON VASQUEZ','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (15506861,'lnorena','LUIS FERNANDO','NORENA QUINTERO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80025758,'jpalarcons','JUAN PABLO','ALARCON SIERRA','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80122860,'jlmendoza','JULIAN LEONARDO','MENDOZA SALAZAR','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (32784162,'LYAMAYA','LILIANA YANETH','AMAYA GUTIERREZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020412935,'jebaenag','JOHN EDWIN','BAENA GALLEGO','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (4556650,'MCEBALLO','MARIO CENON','CEBALLOS VASQUEZ','2','8','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79950384,'jcipamoc','JAVIER VICENTE','CIPAMOCHA LEGUIZAMON','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1019075609,'frodriguez','FERNANDO','RODRIGUEZ AVELLANEDA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1036929802,'sfrancoc','SEBASTIAN','FRANCO CASTANO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (3020996,'GGUEVARAI','GUSTAVO','GUEVARA ICO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80196885,'oherran','OMAR ANTONIO','HERRAN PINZON','3','15','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (43575203,'alramirez','ANA LUCIA','RAMIREZ ORREGO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80232501,'LRINCONV','LUIS EDUARDO','RINCON VALERO','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032431998,'jsanchezl','LUQUERNA JAIRO','SANCHEZ LUQUERNA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (79797539,'casandoval','CARLOS ANDRES','SANDOVAL VARGAS','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (31973456,'MMUNOZRA','MABEL','MUNOZ RAMIREZ','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52803334,'brodriguez','BLANCA LILIANA','RODRIGUEZ CASAS','3','12','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (14398885,'CARLOSCRUZL','CARLOS ANDRES','CRUZ LUNA','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (19487812,'MHGONZAL','MARIO HERNAN','GONZALEZ BRINEZ','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (23324676,'CYPUENTESC','CLARA YANETH','PUENTES CEPEDA','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (37722705,'VMONSALV','VERONICA','MONSALVE RANGEL','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (40439796,'ELECHAVARRIAR','ELISABETH','ECHAVARRIA RODRIGUEZ','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (51949278,'szambrano','SANDRA LILIANA','ZAMBRANO ARTUNDUAGA','2','6','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (52164403,'bibejarano','BLANCA INES','BEJARANO','2','7','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (80233012,'ssaenzbr','SEUL','SAENZ BRAVO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1014204127,'RAPINERO','RAUL EDUARDO','PINEROS REVELO','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1020731402,'paguillermo','ANDRES GUILLERMO','GUZMAN DURAN','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030529111,'carincon','CARLOS ANDRES','RINCON ARIAS','3','11','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1030567798,'DCHINCAPIE','DIANA CAROLINA','HINCAPIE TORRES','1','3','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032395453,'jcaballero','JOSE LUIS','CABALLERO GOMEZ','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1032424183,'ftmorenod','FRANCY TATIANA','MORENO DUARTE','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1075625034,'jcortesl','JAIRO RAFAEL','CORTES LIZARAZO','1','2','1');
INSERT INTO usuario (IDTUTOR,USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL) VALUES (1076648714,'SFMORAM','FRANCISCO HERNANDO','MORA MARTINEZ','1','3','1');

use evadoc;
