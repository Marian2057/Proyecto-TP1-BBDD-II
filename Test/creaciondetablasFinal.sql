CREATE DATABASE BBDDTP1;

USE  BBDDTP1;

CREATE TABLE Participante (
  id_participante INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45),
  apellido VARCHAR(45),
  dni INT,
  PRIMARY KEY (id_participante)
  );


CREATE TABLE Proyecto (
  id_proyecto INT(11) NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(150),
  costo_proyecto int,
  PRIMARY KEY (id_proyecto)
  );

CREATE TABLE Cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre_entidad VARCHAR(50),
  direccion_entidad VARCHAR(100),
  telefono INT,
  email VARCHAR(60),
  localidad VARCHAR(100),
  PRIMARY KEY (id_cliente)
  );

CREATE TABLE Rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(100),
  valor_hora INT,
  PRIMARY KEY (id_rol)
  );
CREATE TABLE Detalle_Hora (
  id_detalle_hora INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(100),
  PRIMARY KEY (id_detalle_hora)
  );
  
CREATE TABLE Rendir_Hora (
  id_rendir_hora INT NOT NULL AUTO_INCREMENT,
  cantidad_hora INT,
  fecha DATE,
  id_proyecto INT,
  FOREIGN KEY (id_proyecto)  REFERENCES proyecto (id_proyecto),
  id_participante INT,
  FOREIGN KEY (id_participante)  REFERENCES participante (id_participante),
  id_rol INT,
  FOREIGN KEY (id_rol)  REFERENCES rol (id_rol),
  id_cliente INT,
  FOREIGN KEY (id_cliente)  REFERENCES cliente (id_cliente),
  id_detalle_hora INT,
  FOREIGN KEY (id_detalle_hora)  REFERENCES detalle_hora (id_detalle_hora),
  PRIMARY KEY (id_rendir_hora)
  );

  
  CREATE TABLE Asignacion_hora (
  id_asignacion_hora INT NOT NULL AUTO_INCREMENT,
  horas_asignadas_proyecto DATETIME,
  id_participante INT,
  FOREIGN KEY (id_participante)  REFERENCES id_participante (id_participante),
  id_proyecto INT,
  FOREIGN KEY (id_proyecto)  REFERENCES id_proyecto (id_proyecto),
  PRIMARY KEY (asignacion_hora)
  );
  
CREATE TABLE Ajuste (
  id_ajuste INT NOT NULL AUTO_INCREMENT,
  fecha DATETIME,
  id_LiqMensual INT,
  FOREIGN KEY (id_LiqMensual)  REFERENCES LiqMensual (id_LiqMensual),
  diferenciaHoras INT,
  PRIMARY KEY (id_ajuste)
  );

CREATE TABLE Facturacion (
  id_facturacion INT NOT NULL AUTO_INCREMENT,
  total_horas INT,
  fecha_inicio DATETIME,
  fecha_final DATETIME,
  id_cliente INT,
  FOREIGN KEY (id_cliente)  REFERENCES Cliente (id_cliente),
  id_proyecto INT,
  FOREIGN KEY (id_proyecto)  REFERENCES Proyecto (id_proyecto),
  id_rol INT,
  FOREIGN KEY (id_rol)  REFERENCES Proyecto (id_rol),
  total_factutado int,
  PRIMARY KEY (id_liqmensual)
  );


CREATE TABLE LiqMensual (
  id_liqmensual INT NOT NULL AUTO_INCREMENT,
  total_horas INT,
  fecha_inicio DATETIME,
  fecha_final DATETIME,
  id_cliente INT,
  FOREIGN KEY (id_cliente)  REFERENCES Cliente (id_cliente),
  id_proyecto INT,
  FOREIGN KEY (id_proyecto)  REFERENCES Proyecto (id_proyecto),
  PRIMARY KEY (id_liqmensual)
  );

/*INSERT ROL*/
INSERT INTO rol(descripcion, valor_hora) VALUES ('Desarrollador BackEnd', 500);
INSERT INTO rol(descripcion, valor_hora)VALUES ('Tester', 400);
INSERT INTO rol(descripcion, valor_hora)VALUES ('Project Manager', 1000);
INSERT INTO rol(descripcion, valor_hora)VALUES('Diseñador UX', 450);
INSERT INTO rol(descripcion, valor_hora)VALUES('Analista de Sistemas', 500);
INSERT INTO rol(descripcion, valor_hora)VALUES('Desarrolador FrontEnd',480);

/*INSERT PARTICIPANTE*/
INSERT INTO participante(nombre, apellido, dni) VALUES('Rodolfo', 'Tapia', 25482515);
INSERT INTO participante(nombre, apellido, dni)VALUES('Esther', 'Del Rio', 35151845);
INSERT INTO participante(nombre, apellido, dni)VALUES('Milka', 'Oyhenart', 37252529);
INSERT INTO participante(nombre, apellido, dni)VALUES('Agustina', 'Suarez',36252728);
INSERT INTO participante(nombre, apellido, dni)VALUES('Sergio', 'Paso', 45241819);
INSERT INTO participante(nombre, apellido, dni)VALUES('Lucas', 'Gomez', 29241518);
INSERT INTO participante(nombre, apellido, dni)VALUES('Sofia', 'Machado', 29272918);
INSERT INTO participante(nombre, apellido, dni)VALUES('Gabriela', 'Crementi', 28564847);
INSERT INTO participante(nombre, apellido, dni)VALUES('Leonardo', 'Cramer', 29478591);
                
/*INSERT PROYECTO*/
INSERT INTO proyecto(descripcion, costo_proyecto)VALUES('Web',35000);
INSERT INTO proyecto(descripcion, costo_proyecto)VALUES('intranet',27000);
INSERT INTO proyecto(descripcion,costo_proyecto)VALUES('Art9', 90000);
INSERT INTO proyecto(descripcion,costo_proyecto)VALUES('Matriz de Riesgo', 250000);
INSERT INTO proyecto(descripcion,costo_proyecto)VALUES('SistemaAdea', 200000);

                    
/*INSERT CLIENTE*/
INSERT INTO cliente(nombre_entidad, direccion_entidad, telefono, email, localidad) VALUES('San Jorge', 'Av. Los Incas 24', 43042747, 'sanjorge@info.com','CABA');
INSERT INTO cliente(nombre_entidad, direccion_entidad, telefono, email, localidad)VALUES('Giulyana', 'Av. Corrientes 27', 43053724, 'giulyana@gmail.com','CABA');
INSERT INTO cliente(nombre_entidad, direccion_entidad, telefono, email, localidad)VALUES('San Roque S.A.', 'Tres Arrollo 28', 46123246, 'sanroque@sanroque.com','CABA');
INSERT INTO cliente(nombre_entidad, direccion_entidad, telefono, email, localidad)VALUES('Mutual Catalino', 'Av. Belgrano 785', 47152846, 'informes@mcatalino.com','CABA');
INSERT INTO cliente(nombre_entidad, direccion_entidad, telefono, email, localidad)VALUES('Adea', 'San Antonio 1589', 49042747, 'informes@adea.com','CABA');


/*INSERT DETALLE_HORA*/
INSERT INTO detalle_hora(descripcion)VALUES('Hora_dia');
INSERT INTO detalle_hora(descripcion)VALUES('Horas_Semanales');
INSERT INTO detalle_hora(descripcion)VALUES('Horas_Mensuales' );

/*INSERT HORAS ASIGNADAS*//*proyecto 1*/
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 1, 60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 2, 60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 3, 30.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 4, 40.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 7, 10.00);

/*INSERT LIQMENSUAL*/

INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_fin, id_cliente, id_proyecto)VALUES( );
INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_fin, id_cliente, id_proyecto)VALUES( );
INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_fin, id_cliente, id_proyecto)VALUES( );
INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_fin, id_cliente, id_proyecto)VALUES( );
INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_fin, id_cliente, id_proyecto)VALUES( );



















/*INSERT RENDIR_HORA*//*Rendir hora por proyecto1*/

INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,1,2,40,'2022-04-01');  
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,2,2,40,'2022-04-04');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha )VALUES(1,3,1,8,'2022-04-07');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,4,3,80,'2022-04-09');
/*INSERT RENDIR_HORA*//*Rendir hora por proyecto2*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,6,2,15,'2022-04-04');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,5,2,10,'2022-04-08');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,3,3,80,'2022-04-07');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,4,1,8,'2022-04-06');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,1,1,8,'2022-04-04');

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto3*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,1,1,8,'2022-04-04' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,2,2,40,'2022-04-04' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,4,2,10,'2022-04-04' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,5,3,40,'2022-04-07' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,6,1,8,'2022-04-06' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,3,1,8,'2022-04-05' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,7,1,8,'2022-04-07' );

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto4*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,3,1,8,'2022-04-05' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,4,2,40,'2022-04-06' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,5,3,20,'2022-04-04' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,6,1,8,'2022-04-05' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,7,2,10,'2022-04-05' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,1,2,10,'2022-04-05' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,2,2,10,'2022-04-05' );

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto5*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,1,1,2,'2022-04-16' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,2,3,12,'2022-04-17' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,3,2,17,'2022-04-17' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,4,3,7,'2022-04-15' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,6,1,6,'2022-04-15' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,4,1,6,'2022-04-16' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,6,1,6,'2022-04-17' );















/*INSERT ADM_PROYECTO*//*proyecto 1*/
INSERT INTO rendir_hora(cantidad_hora, fecha, id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(40,'2022-04-04',1, 1, 1, 2, 2);
INSERT INTO rendir_hora(cantidad_hora, fecha,id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(20,'2022-04-05',1,2 , 1, 2, 2);
INSERT INTO rendir_hora(cantidad_hora, fecha,id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(10,'2022-04-06',1, 3, 4, 2, 1);
INSERT INTO rendir_hora(cantidad_hora, fecha,id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(30,'2022-04-07',1, 4, 6, 2, 3);
INSERT INTO rendir_hora(cantidad_hora, fecha,id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(25,'2022-04-08',1, 7, 6, 2, 1);

/*INSERT ADM_PROYECTO*//*proyecto 2*/
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(2, 6, 1, 1, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(2, 5, 1, 1, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(2, 3, 3, 1, 3);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(2, 4, 6, 1, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(2, 1, 6, 1, 1);

/*INSERT ADM_PROYECTO*//*proyecto 3*/
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 1, 1, 3, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 2, 1, 3, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 4, 2, 3, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 5, 3, 3, 3);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 6, 4, 3, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 3, 5, 3, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(3, 7, 6, 3, 1);

/*INSERT ADM_PROYECTO*//*proyecto 4*/
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 3, 1, 4, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 4, 1, 4, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 5, 2, 4, 3);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 6, 3, 4, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 7, 4, 4, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 1, 5, 4, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(4, 2, 6, 4, 2);

/*INSERT ADM_PROYECTO*//*proyecto 5*/
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 1, 1, 5, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 2, 1, 5, 3);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 3, 2, 5, 2);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 4, 3, 5, 3);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 6, 4, 5, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 4, 5, 5, 1);
INSERT INTO adm_proyecto(id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)VALUES(5, 6, 6, 5, 1);













































/*INSERT RENDIR_HORA*//*Rendir hora por proyecto1*/

INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,1,2,40,'2022-04-01');  
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,2,2,40,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha )VALUES(1,3,1,8,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(1,4,3,80,'2022-04-01');
/*INSERT RENDIR_HORA*//*Rendir hora por proyecto2*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,6,2,15,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,5,2,10,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,3,3,80,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,4,1,8,'2022-04-01');
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(2,1,1,8,'2022-04-01');

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto3*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,1,1,8,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,2,2,40,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,4,2,10,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,5,3,40,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,6,1,8,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,3,1,8,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(3,7,1,8,'2022-04-01' );

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto4*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,3,1,8,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,4,2,40,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,5,3,20,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,6,1,8,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,7,2,10,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,1,2,10,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(4,2,2,10,'2022-04-01' );

/*INSERT RENDIR_HORA*//*Rendir hora por proyecto5*/
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,1,1,2,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,2,3,12,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,3,2,17,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,4,3,7,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,6,1,6,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,4,1,6,'2022-04-01' );
INSERT INTO rendir_hora(id_proyecto, id_participante, id_detalle_hora, cantidad_hora, fecha)VALUES(5,6,1,6,'2022-04-01' );
