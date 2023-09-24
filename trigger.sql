create database supermercado;
use supermercado;
create table Departamento(ID_Departamento int primary key,nombre varchar(45));

create table Empleado(ID_Empleado int primary key,Nombre varchar(45), Apellido varchar(45),
Direccion varchar(45),Telefono int, Puesto varchar(20),ID_Sucursal int);

create table Cliente (Cliente int primary key, Nombre varchar(45), Apellido varchar(45),
Direccion varchar(45),Telefono int);

create table Producto( ID_Producto int primary key, nombre varchar (45),precio int,ID_Departamento int);

create table Inventario(ID_inventario int primary key, cantidad int, ID_Sucursal int,ID_Producto int);

create table Venta( ID_Venta int primary key, fecha date, ID_Cliente int,ID_Sucursal int,valor_factura int );

create table Detalle_Venta(ID_Detalle_Venta int primary key,cantidad int, precio_unitario int, ID_Venta int,Id_Producto int,
cantidad_vendida int, valor_producto varchar(45));

CREATE TABLE tabla (ID_Tabla int primary key, tabla_auditoria varchar(45), fecha date, usuario varchar(45),operacion varchar (60));  
CREATE TABLE Tabla_Auditoria (ID_Tabla_Auditoria int primary key, fecha date, usuario varchar(45),operacion varchar (60));  


drop table Detalle_Venta;

DELIMITER //
CREATE TRIGGER actualizar_inventario AFTER INSERT ON Venta FOR EACH ROW 
BEGIN 
UPDATE Inventario SET cantidad = cantidad - NEW.cantidad_vendida
WHERE ID_Producto = NEW. ID_Producto;
END;
//

DELIMITER //
CREATE TRIGGER auditoria AFTER INSERT ON 
 tabla 
 FOR EACH ROW BEGIN 
 INSERT INTO tabla_auditoria (fecha, usuario, operacion) 
VALUES (NOW(), USER(), 'Venta');
END
 // 

DELIMITER //
CREATE TRIGGER calcular_factura AFTER INSERT ON Detalle_venta FOR EACH ROW BEGIN  
update Venta set valor_factura =new.valor_producto * NEW.cantidad_vendida * 1.19 
where id_venta=1;
 end
 //

CREATE TRIGGER generar_informe_venta_comision AFTER INSERT ON Ventas FOR EACH ROW  BEGIN
END



CREATE TABLE Tabla_Auditoria (ID_Tabla_Auditoria int primary key, fecha date, usuario varchar(45),operacion varchar (60));  
