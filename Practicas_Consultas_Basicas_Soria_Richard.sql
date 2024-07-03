-- Crear base de datos banco
create database banco;

use banco;

-- Crear tabla cliente
create table cliente(
id_cliente int auto_increment primary key,
nombre_cliente varchar(25) not null,
email_cliente varchar(50) not null);

-- Crear tabla cuenta
create table cuenta(
id_cuenta int auto_increment primary key,
saldo_cuenta decimal(10, 2) not null,
id_cliente int not null,
foreign key (id_cliente) references cliente(id_cliente));

-- Crear tabla transaccion
create table transaccion(
id_transaccion int auto_increment primary key,
monto_transaccion decimal(10, 2) not null,
fecha_transaccion date not null,
id_cuenta int not null,
foreign key (id_cuenta) references cuenta(id_cuenta));

-- Insertar 20 registro en las tablas
insert into cliente(nombre_cliente, email_cliente) values
('Juan Perez', 'juan.perez@example.com'),
('Maria Lopez', 'maria.lopez@example.com'),
('Carlos Sanchez', 'carlos.sanchez@example.com'),
('Ana Fernandez', 'ana.fernandez@example.com'),
('Luis Gomez', 'luis.gomez@example.com'),
('Sofia Ramirez', 'sofia.ramirez@example.com'),
('Jorge Diaz', 'jorge.diaz@example.com'),
('Marta Torres', 'marta.torres@example.com'),
('Pedro Ruiz', 'pedro.ruiz@example.com'),
('Lucia Flores', 'lucia.flores@example.com'),
('Miguel Vega', 'miguel.vega@example.com'),
('Laura Castillo', 'laura.castillo@example.com'),
('Ricardo Jimenez', 'ricardo.jimenez@example.com'),
('Carmen Morales', 'carmen.morales@example.com'),
('Alberto Rios', 'alberto.rios@example.com'),
('Gloria Castro', 'gloria.castro@example.com'),
('Enrique Herrera', 'enrique.herrera@example.com'),
('Patricia Guzman', 'patricia.guzman@example.com'),
('Francisco Ortiz', 'francisco.ortiz@example.com'),
('Veronica Silva', 'veronica.silva@example.com');

insert into cuenta(saldo_cuenta, id_cliente) values
(1000.50, 1),
(2000.75, 2),
(1500.30, 3),
(2500.10, 4),
(3000.60, 5),
(3500.80, 6),
(4000.40, 7),
(4500.70, 8),
(5000.20, 9),
(5500.90, 10),
(6000.00, 11),
(6500.25, 12),
(7000.35, 13),
(7500.50, 14),
(8000.65, 15),
(8500.75, 16),
(9000.85, 17),
(9500.95, 18),
(10000.00, 19),
(10500.10, 20);

insert into transaccion(monto_transaccion, fecha_transaccion, id_cuenta) values
(100.50, '2024-07-01', 1),
(200.75, '2024-07-03', 2),
(150.30, '2024-07-05', 3),
(250.10, '2024-07-07', 4),
(300.60, '2024-07-09', 5),
(350.80, '2024-07-11', 6),
(400.40, '2024-07-13', 7),
(450.70, '2024-07-15', 8),
(500.20, '2024-07-17', 9),
(550.90, '2024-07-19', 10),
(600.00, '2024-07-21', 11),
(650.25, '2024-07-23', 12),
(700.35, '2024-07-25', 13),
(750.50, '2024-07-27', 14),
(800.65, '2024-07-29', 15),
(850.75, '2024-07-31', 16),
(900.85, '2024-08-02', 17),
(950.95, '2024-08-04', 18),
(1000.00, '2024-08-06', 19),
(1050.10, '2024-08-08', 20);

-- Ejercicio 1: Selección y Filtración Básica
-- 	Selecciona el id_cuenta y el saldo de todas las cuentas.
select id_cuenta, saldo_cuenta from cuenta;

-- 	Filtra las cuentas que tienen un saldo mayor a 4000.
select id_cuenta, saldo_cuenta from cuenta where saldo_cuenta > 4000;

-- 	Seleccionar las cuentas con saldo menor a 2000
select id_cuenta, saldo_cuenta from cuenta where saldo_cuenta < 2000;

-- 	Mostrar los nombres de los clientes y la longitud de sus nombres
select nombre_cliente, length(nombre_cliente) as longuitd_nombre from cliente;

-- 	Seleccionar las cuentas con saldo entre 1000 y 3000
select id_cuenta, saldo_cuenta from cuenta where saldo_cuenta between 1000 and 3000;

-- 	Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL 
select cliente.id_cliente, cliente.nombre_cliente, cuenta.saldo_cuenta from cliente left join cuenta on cliente.id_cliente = cuenta.id_cliente;

-- 	Concatenar el nombre del cliente y su email con un separador
select concat(nombre_cliente, " " ,email_cliente) as nombre_correo_cliente from cliente;

-- 	Extraer los últimos 3 caracteres del email de cada cliente
select nombre_cliente, email_cliente, substring(email_cliente, -3) as ultimos_3_caracteres from cliente;

-- 	Convertir el nombre del cliente a minúsculas
select nombre_cliente, lower(nombre_cliente) as nombre_minusculas from cliente;

-- 	Convertir el nombre del cliente a mayúsculas
select nombre_cliente, upper(nombre_cliente) as nombre_mayusculas from cliente;

-- 	Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10
select id_transaccion, monto_transaccion, fecha_transaccion from transaccion order by monto_transaccion desc limit 10;

-- 	Calcular el saldo de cada cuenta después de aplicar un interés del 5%
select id_cuenta, saldo_cuenta, round(saldo_cuenta + (saldo_cuenta*0.05), 2) as interes_5 from cuenta;

-- 	Reemplazar el dominio del email de los clientes: email, '@example.com', '@newdomain.com'
update cliente set email_cliente = replace(email_cliente, '@example.com', '@newdomain.com');
select * from cliente;

-- Ejercicio 2: Uso de Funciones de Cadena
-- 	Selecciona el nombre de cada cliente.
select nombre_cliente from cliente;

-- 	Añade una columna que muestre el email del cliente en el formato Correo: [email].
select nombre_cliente, concat("Correo: ", email_cliente) as correo_cliente from cliente;

-- 	Mostrar los emails de los clientes en minúsculas
select nombre_cliente, lower(email_cliente) as email_minusculas from cliente;

-- 	Mostrar el nombre del cliente en mayúsculas
select nombre_cliente, upper(nombre_cliente) as nombre_mayusculas from cliente;

-- Ejercicio 3: Agregación de Datos
-- 	Selecciona el id_cuenta.
select id_cuenta from cuenta;

-- 	Calcula el total de las transacciones realizadas en cada cuenta.
select cuenta.id_cuenta, count(transaccion.id_transaccion) as cantidad_transacciones from cuenta left join transaccion on cuenta.id_cuenta = transaccion.id_transaccion group by cuenta.id_cuenta;

-- 	Calcular el saldo total de todas las cuentas
select sum(saldo_cuenta) as saldo_total_cuentas from cuenta;

-- 	Calcular el monto total de todas las transacciones
select sum(monto_transaccion) as monto_total_transaccion from transaccion;

-- 	Calcular el monto promedio de las transacciones
select round(avg(monto_transaccion), 2) as promedio_monto_transaccion from transaccion;

-- Ejercicio 4: Funciones de Fecha: 
-- 	Selecciona el id_transaccion y la fecha de todas las transacciones.
select id_transaccion, fecha_transaccion from transaccion;

-- 	Extraer el año de la fecha de cada transacción
select fecha_transaccion, year(fecha_transaccion) as anio_transaccion from transaccion;

-- 	Extraer el mes de la fecha de cada transacción
select fecha_transaccion, monthname(fecha_transaccion) as mes_transaccion from transaccion;

-- 	Extraer el día de la semana de la fecha de cada transacción
select fecha_transaccion, dayname(fecha_transaccion) as dia_semana_transaccion from transaccion;

-- 	Filtra las transacciones que se realizaron en el año 2024.
select id_transaccion, fecha_transaccion from transaccion where year(fecha_transaccion) = 2024;

-- 	Seleccionar las transacciones realizadas en 2023.
select id_transaccion, fecha_transaccion from transaccion where year(fecha_transaccion) = 2023;

-- 	Seleccionar las transacciones realizadas en el mes de junio de cualquier año
select id_transaccion, fecha_transaccion from transaccion where monthname(fecha_transaccion) = "June";

-- 	Seleccionar las transacciones realizadas el 15 de cada mes
select fecha_transaccion, dayofmonth(fecha_transaccion) as dia_semana_transaccion from transaccion where dayofmonth(fecha_transaccion) = 15;

-- Ejercicio 5: Agrupación y Contar Resultados
-- 	Selecciona el id_cuenta.
select id_cuenta from cuenta;

-- 	Cuenta el número de transacciones realizadas en cada cuenta.
select cuenta.id_cuenta, count(transaccion.id_transaccion) as cantidad_transacciones from cuenta left join transaccion on cuenta.id_cuenta = transaccion.id_transaccion group by cuenta.id_cuenta;

-- 	Calcular el saldo promedio de todas las cuentas.
select round(avg(saldo_cuenta), 2) as promedio_saldo_cuenta from cuenta;

-- Ejercicio 6: Filtración con Condiciones
-- 	Seleccionar las transacciones con un monto negativo
select id_transaccion, monto_transaccion from transaccion where monto_transaccion < 0;

-- 	Seleccionar las transacciones con un monto positivo
select id_transaccion, monto_transaccion from transaccion where monto_transaccion > 0;

--  Ejercicio 7: Ordenamiento
-- 	Seleccionar todos los clientes ordenados alfabéticamente por nombre
select id_cliente, nombre_cliente from cliente order by nombre_cliente asc;

-- 	Seleccionar las transacciones realizadas en 2023
select id_transaccion, fecha_transaccion from transaccion where year(fecha_transaccion) = 2023;

-- 	Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
select saldo_cuenta from cuenta order by saldo_cuenta desc limit 5;

-- Ejercicio 8: Contar Resultados
-- 	Contar el número total de clientes
select count(id_cliente) as total_clientes from cliente;

-- 	Contar el número total de cuentas
select count(id_cuenta) as total_cuentas from cuenta;

-- 	Contar el número total de transacciones
select count(id_transaccion) as total_transacciones from transaccion;

-- 	Redondear el saldo de cada cuenta a dos decimales
select id_cuenta, round(saldo_cuenta, 2) as saldo_cuenta_redondeado from cuenta;

-- Ejercicio 9: Máximos y Mínimos
-- 	Encontrar la cuenta con el saldo más alto
select id_cuenta, saldo_cuenta as cuenta_saldo_alto from cuenta where saldo_cuenta = (select max(saldo_cuenta) from cuenta);

-- 	Encontrar la cuenta con el saldo más bajo
select id_cuenta, saldo_cuenta as cuenta_saldo_bajo from cuenta where saldo_cuenta = (select min(saldo_cuenta) from cuenta);

-- 	Encontrar la transacción con el monto más alto
select id_transaccion, monto_transaccion as monto_transaccion_alto from transaccion where monto_transaccion = (select max(monto_transaccion) from transaccion);

-- 	Encontrar la transacción con el monto más bajo
select id_transaccion, monto_transaccion as monto_transaccion_bajo from transaccion where monto_transaccion = (select min(monto_transaccion) from transaccion);