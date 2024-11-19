create database AutoRental;

use AutoRental;

create table empleado (
	id_empleado int primary key auto_increment,
    cedula int(15),
    nombre varchar(30),
    apellido varchar(30),
    direccion varchar(60),
    ciudad_residencia varchar(30),
    celular varchar(20),
    correo_electronico varchar(100)
);

create table cliente (
	id_cliente int primary key auto_increment,
    cedula int(15),
    nombre varchar(30),
    apellido varchar(30),
    direccion varchar(60),
	ciudad_residencia varchar(30),
    celular varchar(30),
    correo_electronico varchar(100)
);

create table vehiculos (
	id_vehiculos int primary key auto_increment,
    tipo_vehiculo varchar(20),
    placa varchar(10),
    referencia varchar(40),
    modelo int(10),
    puertas varchar(20),
    capacidad int(10),
    sunroof varchar(10),
    motor varchar(10),
    color varchar(20)
);

create table sucursal (
	id_sucursal int primary key auto_increment,
    ciudad varchar(30),
    direccion varchar(60),
    telefono_fijo varchar(20),
    celular varchar(20),
    correo_electronico varchar(100),
    id_vehiculo int,
    foreign key (id_vehiculo) references vehiculos(id_vehiculos)
);

create table alquileres (
	id_alquiler int primary key auto_increment,
    vehiculo varchar(40),
    nombre_cliente varchar(40),
    apellido_cliente varchar(40),
    nombre_empleado varchar(40),
    apellido_empleado varchar(40),
    sucursal varchar(40),
    fecha_salida varchar(20),
    fecha_llegada varchar(20),
    valor_alquiler int(30),
    porcentaje_descuento int(40),
    valor_cotizado int(20),
    valor_pagado int(20),
    id_cliente int,
    id_sucursal int,
    id_empleado int,
    id_vehiculo int,
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_sucursal) references sucursal(id_sucursal),
    foreign key (id_empleado) references empleado(id_empleado),
    foreign key (id_vehiculo) references vehiculos(id_vehiculos)
);

create table sucursal_alquiler (
	id_sucursal_alquiler int primary key auto_increment,
    id_alquiler int,
    id_sucursal int,
    foreign key (id_alquiler) references alquileres(id_alquiler),
    foreign key (id_sucursal) references sucursal(id_sucursal)
);

create table empleado_alquiler (
	id_empleado_alquiler int primary key auto_increment,
    id_empleado int,
    id_alquiler int,
    foreign key (id_empleado) references empleado(id_empleado),
    foreign key (id_alquiler) references alquileres(id_alquiler)
);

create table alquiler_cliente (
	id_alquiler_cliente int primary key auto_increment,
    id_alquiler int,
    id_cliente int,
    foreign key (id_alquiler) references alquileres(id_alquiler),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table vehiculo_alquiler (
	id_vehiculo_alquiler int primary key auto_increment,
    id_alquiler int,
    id_vehiculo int,
    foreign key (id_alquiler) references alquileres(id_alquiler),
    foreign key (id_vehiculo) references vehiculos(id_vehiculos)
);

INSERT INTO vehiculos (tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) VALUES
('Sedán', 'ABC123', 'Toyota Corolla', 2022, 4, 5, 'Sí', '1.8L', 'Blanco'),
('SUV', 'DEF456', 'Honda CR-V', 2023, 5, 7, 'Sí', '2.4L', 'Negro'),
('Camioneta', 'GHI789', 'Ford F-150', 2021, 2, 3, 'No', '5.0L', 'Azul'),
('Sedán', 'JKL012', 'Chevrolet Spark', 2020, 4, 5, 'No', '1.2L', 'Rojo'),
('SUV', 'MNO345', 'Nissan X-Trail', 2022, 5, 7, 'Sí', '2.0L', 'Gris'),
('Camioneta', 'PQR678', 'Ram 1500', 2023, 4, 5, 'No', '3.6L', 'Blanco'),
('Sedán', 'STU901', 'Hyundai Elantra', 2021, 4, 5, 'No', '1.6L', 'Negro'),
('SUV', 'VWX234', 'Kia Sportage', 2022, 5, 7, 'Sí', '2.4L', 'Verde'),
('Camioneta', 'YZA567', 'Chevrolet Silverado', 2021, 4, 6, 'No', '5.3L', 'Gris'),
('Sedán', 'BCD890', 'Mazda 3', 2020, 4, 5, 'No', '2.0L', 'Rojo'),
('SUV', 'EFG123', 'Ford Escape', 2023, 5, 7, 'Sí', '2.5L', 'Azul'),
('Camioneta', 'HIJ456', 'Toyota Hilux', 2022, 4, 5, 'No', '2.8L', 'Negro'),
('Sedán', 'KLM789', 'Nissan Sentra', 2021, 4, 5, 'No', '1.8L', 'Blanco'),
('SUV', 'NOP012', 'Mazda CX-5', 2023, 5, 7, 'Sí', '2.5L', 'Gris'),
('Camioneta', 'QRS345', 'Honda Pilot', 2020, 5, 7, 'Sí', '3.5L', 'Rojo'),
('Sedán', 'TUV678', 'Subaru Impreza', 2022, 4, 5, 'No', '2.0L', 'Azul'),
('SUV', 'WXY901', 'Hyundai Tucson', 2021, 5, 7, 'Sí', '2.0L', 'Verde'),
('Camioneta', 'ZAB234', 'GMC Sierra', 2020, 4, 6, 'No', '5.3L', 'Gris'),
('Sedán', 'CDE567', 'Volkswagen Jetta', 2022, 4, 5, 'No', '1.4L', 'Negro'),
('SUV', 'FGH890', 'Jeep Grand Cherokee', 2023, 5, 7, 'Sí', '3.6L', 'Blanco'),
('Camioneta', 'HIJ123', 'Toyota Tacoma', 2021, 4, 5, 'No', '2.7L', 'Rojo'),
('Sedán', 'KLM456', 'Honda Accord', 2020, 4, 5, 'No', '1.5L', 'Gris'),
('SUV', 'MNO789', 'Chevrolet Equinox', 2023, 5, 7, 'Sí', '2.0L', 'Verde'),
('Camioneta', 'PQR012', 'Ram 2500', 2021, 4, 5, 'No', '6.4L', 'Negro'),
('Sedán', 'RST345', 'Hyundai Sonata', 2022, 4, 5, 'No', '2.5L', 'Blanco'),
('SUV', 'TUV678', 'Kia Sorento', 2023, 5, 7, 'Sí', '3.3L', 'Azul'),
('Camioneta', 'XYZ901', 'Ford Ranger', 2021, 4, 5, 'No', '2.3L', 'Rojo'),
('Sedán', 'BCD234', 'Mazda 6', 2020, 4, 5, 'No', '2.5L', 'Gris'),
('SUV', 'EFG567', 'Chevrolet Blazer', 2022, 5, 7, 'Sí', '2.5L', 'Negro'),
('Camioneta', 'HIJ890', 'Toyota Tundra', 2023, 4, 6, 'No', '5.7L', 'Blanco'),
('Sedán', 'KLM123', 'Nissan Altima', 2021, 4, 5, 'No', '2.5L', 'Rojo'),
('SUV', 'NOP456', 'Jeep Cherokee', 2022, 5, 7, 'Sí', '3.2L', 'Verde'),
('Camioneta', 'QRS789', 'Honda Ridgeline', 2020, 4, 5, 'No', '3.5L', 'Azul'),
('Sedán', 'TUV012', 'Subaru Legacy', 2023, 4, 5, 'No', '2.4L', 'Gris'),
('SUV', 'WXY345', 'Ford Bronco', 2021, 5, 7, 'Sí', '2.7L', 'Negro'),
('Camioneta', 'ZAB678', 'Chevrolet Colorado', 2022, 4, 5, 'No', '2.5L', 'Rojo'),
('Sedán', 'CDE901', 'Volkswagen Passat', 2020, 4, 5, 'No', '2.0L', 'Blanco'),
('SUV', 'FGH234', 'Hyundai Santa Fe', 2023, 5, 7, 'Sí', '2.5L', 'Gris'),
('Camioneta', 'HIJ567', 'Ram 3500', 2021, 4, 6, 'No', '6.7L', 'Negro'),
('Sedán', 'KLM890', 'Toyota Camry', 2022, 4, 5, 'No', '2.5L', 'Verde'),
('SUV', 'MNO123', 'Kia Niro', 2020, 5, 7, 'Sí', '1.6L', 'Rojo'),
('Camioneta', 'PQR234', 'Chevrolet Tahoe', 2023, 4, 5, 'No', '6.2L', 'Blanco'),
('Sedán', 'RST567', 'Mazda 2', 2021, 4, 5, 'No', '1.5L', 'Azul'),
('SUV', 'TUV890', 'Honda CR-V Hybrid', 2022, 5, 7, 'Sí', '2.0L', 'Negro'),
('Camioneta', 'XYZ123', 'Nissan Frontier', 2020, 4, 5, 'No', '2.5L', 'Gris'),
('Sedán', 'BCD456', 'Ford Fusion', 2023, 4, 5, 'No', '2.0L', 'Verde'),
('SUV', 'EFG789', 'Chevrolet Trailblazer', 2022, 5, 7, 'Sí', '1.3L', 'Blanco'),
('Camioneta', 'HIJ012', 'Ram 1500 Classic', 2021, 4, 5, 'No', '5.7L', 'Rojo'),
('Sedán', 'KLM345', 'Subaru Outback', 2020, 4, 5, 'No', '2.5L', 'Gris'),
('SUV', 'NOP678', 'Mazda CX-3', 2023, 5, 7, 'Sí', '2.0L', 'Negro'),
('Camioneta', 'QRS901', 'Ford F-250', 2022, 4, 6, 'No', '6.7L', 'Verde'),
('Sedán', 'TUV234', 'Hyundai Accent', 2021, 4, 5, 'No', '1.6L', 'Rojo'),
('SUV', 'WXY567', 'Jeep Wrangler', 2023, 5, 7, 'Sí', '2.0L', 'Azul'),
('Camioneta', 'ZAB890', 'Chevrolet Express', 2020, 4, 5, 'No', '4.3L', 'Blanco'),
('Sedán', 'CDE123', 'Volkswagen Golf', 2022, 4, 5, 'No', '1.6L', 'Gris'),
('SUV', 'FGH456', 'Toyota 4Runner', 2021, 5, 7, 'Sí', '4.0L', 'Negro'),
('Camioneta', 'HIJ789', 'GMC Canyon', 2023, 4, 5, 'No', '3.6L', 'Rojo'),
('Sedán', 'KLM012', 'Chevrolet Malibu', 2020, 4, 5, 'No', '1.5L', 'Blanco'),
('SUV', 'MNO345', 'Ford Explorer', 2022, 5, 7, 'Sí', '3.5L', 'Gris'),
('Camioneta', 'PQR678', 'Honda CR-V', 2021, 4, 5, 'No', '1.5L', 'Verde'),
('Sedán', 'RST901', 'Kia Forte', 2023, 4, 5, 'No', '2.0L', 'Negro'),
('SUV', 'TUV234', 'Jeep Renegade', 2020, 5, 7, 'Sí', '1.3L', 'Rojo'),
('Camioneta', 'XYZ567', 'Ram 1500 Limited', 2023, 4, 5, 'No', '5.7L', 'Azul'),
('Sedán', 'BCD890', 'Nissan Maxima', 2021, 4, 5, 'No', '3.5L', 'Blanco'),
('SUV', 'EFG123', 'Honda HR-V', 2022, 5, 7, 'Sí', '1.8L', 'Gris'),
('Camioneta', 'HIJ456', 'Ford Super Duty', 2023, 4, 5, 'No', '6.7L', 'Negro');

INSERT INTO cliente (cedula, nombre, apellido, direccion, ciudad_residencia, celular, correo_electronico) VALUES
('100000001', 'Juan', 'Gómez', 'Calle 1 #1-2', 'Cúcuta', '3001112233', 'carlos.gomez@cliente.com'),
('100000002', 'Ana', 'García', 'Calle 2 #2-3', 'Cali', '3001122334', 'maria.rodriguez@cliente.com'),
('100000003', 'Juan', 'Martínez', 'Calle 3 #3-4', 'Medellín', '3001133445', 'juan.martinez@cliente.com'),
('100000004', 'María', 'Rodríguez', 'Calle 4 #4-5', 'Barranquilla', '3001144556', 'ana.lopez@cliente.com'),
('100000005', 'Luis', 'Hernández', 'Calle 5 #5-6', 'Cartagena', '3001155667', 'luis.hernandez@cliente.com'),
('100000006', 'José', 'Mendoza', 'Calle 6 #6-7', 'Bucaramanga', '3001166778', 'elena.perez@cliente.com'),
('100000007', 'Pedro', 'González', 'Calle 7 #7-8', 'Pereira', '3001177889', 'pedro.gonzalez@cliente.com'),
('100000008', 'Laura', 'Sánchez', 'Calle 8 #8-9', 'Santa Marta', '3001188990', 'laura.sanchez@cliente.com'),
('100000009', 'Jorge', 'Rodríguez', 'Calle 9 #9-10', 'Ibagué', '3001199001', 'jorge.rodriguez@cliente.com'),
('100000010', 'Lucía', 'González', 'Calle 10 #10-11', 'Neiva', '3001200112', 'lucia.gonzalez@cliente.com'),
('100000011', 'Carlos', 'Vargas', 'Calle 11 #11-12', 'Manizales', '3001211223', 'carlos.vargas@cliente.com'),
('100000012', 'Isabel', 'Díaz', 'Calle 12 #12-13', 'Pasto', '3001222334', 'isabel.diaz@cliente.com'),
('100000013', 'José', 'Cabrera', 'Calle 13 #13-14', 'Pereira', '3001233445', 'jose.cabrera@cliente.com'),
('100000014', 'Francisca', 'Ramírez', 'Calle 14 #14-15', 'Valledupar', '3001244556', 'francisca.ramirez@cliente.com'),
('100000015', 'Raúl', 'Morales', 'Calle 15 #15-16', 'Montería', '3001255667', 'raul.morales@cliente.com'),
('100000016', 'Martín', 'Torres', 'Calle 16 #16-17', 'San Andrés', '3001266778', 'martin.torres@cliente.com'),
('100000017', 'Marta', 'Suárez', 'Calle 17 #17-18', 'Popayán', '3001277889', 'marta.suarez@cliente.com'),
('100000018', 'Víctor', 'Ramírez', 'Calle 18 #18-19', 'Cúcuta', '3001288990', 'victor.ramirez@cliente.com'),
('100000019', 'Felipe', 'Gómez', 'Calle 19 #19-20', 'Bello', '3001299001', 'felipe.gomez@cliente.com'),
('100000020', 'Elena', 'Fernández', 'Calle 20 #20-21', 'Girardot', '3001300112', 'elena.fernandez@cliente.com'),
('100000021', 'Javier', 'Reyes', 'Calle 21 #21-22', 'Tuluá', '3001311223', 'javier.reyes@cliente.com'),
('100000022', 'Claudia', 'Vega', 'Calle 22 #22-23', 'San Gil', '3001322334', 'claudia.vega@cliente.com'),
('100000023', 'Roberto', 'Méndez', 'Calle 23 #23-24', 'Villavicencio', '3001333445', 'roberto.mendez@cliente.com'),
('100000024', 'José', 'Jiménez', 'Calle 24 #24-25', 'Tuluá', '3001344556', 'jose.jimenez@cliente.com'),
('100000025', 'Sofía', 'Vargas', 'Calle 25 #25-26', 'Bucaramanga', '3001355667', 'sofia.vargas@cliente.com'),
('100000026', 'Felipe', 'Vega', 'Calle 26 #26-27', 'Barranquilla', '3001366778', 'felipe.vega@cliente.com'),
('100000027', 'Isabel', 'Cordero', 'Calle 27 #27-28', 'Cali', '3001377889', 'isabel.cordero@cliente.com'),
('100000028', 'Antonio', 'López', 'Calle 28 #28-29', 'Cúcuta', '3001388990', 'antonio.lopez@cliente.com'),
('100000029', 'Carmen', 'Ramírez', 'Calle 29 #29-30', 'Medellín', '3001399001', 'carmen.ramirez@cliente.com'),
('100000030', 'Raúl', 'Alvarado', 'Calle 30 #30-31', 'Bucaramanga', '3001400112', 'raul.alvarado@cliente.com'),
('100000031', 'Lucía', 'Salazar', 'Calle 31 #31-32', 'Bello', '3001411223', 'lucia.salazar@cliente.com'),
('100000032', 'Pedro', 'Sánchez', 'Calle 32 #32-33', 'Cartagena', '3001422334', 'pedro.sanchez@cliente.com'),
('100000033', 'Nicolás', 'González', 'Calle 33 #33-34', 'Ibagué', '3001433445', 'nicolas.gonzalez@cliente.com'),
('100000034', 'Ana', 'Jiménez', 'Calle 34 #34-35', 'Cúcuta', '3001444556', 'ana.jimenez@cliente.com'),
('100000035', 'Joaquín', 'Gutiérrez', 'Calle 35 #35-36', 'Neiva', '3001455667', 'joaquin.gutierrez@cliente.com'),
('100000036', 'María', 'Rojas', 'Calle 36 #36-37', 'Cali', '3001466778', 'maria.rojas@cliente.com'),
('100000037', 'José', 'Sánchez', 'Calle 37 #37-38', 'Manizales', '3001477889', 'jose.sanchez@cliente.com'),
('100000038', 'Miguel', 'Torres', 'Calle 38 #38-39', 'Cúcuta', '3001488990', 'miguel.torres@cliente.com'),
('100000039', 'Lucía', 'Cordero', 'Calle 39 #39-40', 'Pereira', '3001499001', 'lucia.cordero@cliente.com'),
('100000040', 'Ricardo', 'López', 'Calle 40 #40-41', 'Barranquilla', '3001500112', 'ricardo.lopez@cliente.com'),
('100000041', 'Alejandra', 'Morales', 'Calle 41 #41-42', 'Santa Marta', '3001511223', 'alejandra.morales@cliente.com'),
('100000042', 'Adriana', 'Ramírez', 'Calle 42 #42-43', 'Montería', '3001522334', 'adriana.ramirez@cliente.com'),
('100000043', 'David', 'Martínez', 'Calle 43 #43-44', 'Pasto', '3001533445', 'david.martinez@cliente.com'),
('100000044', 'Patricia', 'Hernández', 'Calle 44 #44-45', 'Cali', '3001544556', 'patricia.hernandez@cliente.com'),
('100000045', 'Marta', 'Gómez', 'Calle 45 #45-46', 'Bucaramanga', '3001555667', 'marta.gomez@cliente.com'),
('100000046', 'Luis', 'Ramírez', 'Calle 46 #46-47', 'Ibagué', '3001566778', 'luis.ramirez@cliente.com'),
('100000047', 'Marcela', 'Torres', 'Calle 47 #47-48', 'Pereira', '3001577889', 'marcela.torres@cliente.com'),
('100000048', 'Carlos', 'Ríos', 'Calle 48 #48-49', 'Cúcuta', '3001588990', 'carlos.rios@cliente.com'),
('100000049', 'Ana', 'Cabrera', 'Calle 49 #49-50', 'Montería', '3001599001', 'ana.cabrera@cliente.com'),
('100000050', 'Pedro', 'Fernández', 'Calle 50 #50-51', 'Valledupar', '3001600112', 'pedro.fernandez@cliente.com'),
('100000051', 'Laura', 'Moreno', 'Calle 51 #51-52', 'San Andrés', '3001611223', 'laura.moreno@cliente.com'),
('100000052', 'Javier', 'Vega', 'Calle 52 #52-53', 'San Gil', '3001622334', 'javier.vega@cliente.com'),
('100000053', 'Daniela', 'Serrano', 'Calle 53 #53-54', 'Girardot', '3001633445', 'daniela.serrano@cliente.com'),
('100000054', 'Rafael', 'González', 'Calle 54 #54-55', 'Villavicencio', '3001644556', 'rafael.gonzalez@cliente.com'),
('100000055', 'Ricardo', 'Serrano', 'Calle 55 #55-56', 'Bucaramanga', '3001655667', 'ricardo.serrano@cliente.com'),
('100000056', 'Carolina', 'Sánchez', 'Calle 56 #56-57', 'Popayán', '3001666778', 'carolina.sanchez@cliente.com'),
('100000057', 'David', 'González', 'Calle 57 #57-58', 'Cali', '3001677889', 'david.gonzalez@cliente.com'),
('100000058', 'Esteban', 'López', 'Calle 58 #58-59', 'Manizales', '3001688990', 'esteban.lopez@cliente.com'),
('100000059', 'María', 'Vargas', 'Calle 59 #59-60', 'Tuluá', '3001699001', 'maria.vargas@cliente.com'),
('100000060', 'Felipe', 'Hernández', 'Calle 60 #60-61', 'Montería', '3001700112', 'felipe.hernandez@cliente.com'),
('100000061', 'Sandra', 'Sánchez', 'Calle 61 #61-62', 'Cúcuta', '3001711223', 'sandra.sanchez@cliente.com'),
('100000062', 'Luis', 'Martínez', 'Calle 62 #62-63', 'Bucaramanga', '3001722334', 'luis.martinez@cliente.com'),
('100000063', 'Mariana', 'Reyes', 'Calle 63 #63-64', 'Ibagué', '3001733445', 'mariana.reyes@cliente.com'),
('100000064', 'Carlos', 'Pérez', 'Calle 64 #64-65', 'Pasto', '3001744556', 'carlos.perez@cliente.com'),
('100000065', 'Javier', 'Ríos', 'Calle 65 #65-66', 'Girardot', '3001755667', 'javier.rios@cliente.com'),
('100000066', 'Lucía', 'López', 'Calle 66 #66-67', 'Medellín', '3001766778', 'lucia.lopez@cliente.com'),
('100000067', 'Pedro', 'Morales', 'Calle 67 #67-68', 'Cali', '3001777889', 'pedro.morales@cliente.com'),
('100000068', 'Patricia', 'Cordero', 'Calle 68 #68-69', 'Barranquilla', '3001788990', 'patricia.cordero@cliente.com'),
('100000069', 'Luis', 'González', 'Calle 69 #69-70', 'Popayán', '3001799001', 'luis.gonzalez@cliente.com'),
('100000070', 'Marta', 'Gutiérrez', 'Calle 70 #70-71', 'Tuluá', '3001800112', 'marta.gutierrez@cliente.com'),
('100000071', 'Antonio', 'Vega', 'Calle 71 #71-72', 'Neiva', '3001811223', 'antonio.vega@cliente.com'),
('100000072', 'Marta', 'López', 'Calle 72 #72-73', 'Valledupar', '3001822334', 'marta.lopez@cliente.com'),
('100000073', 'Raúl', 'Fernández', 'Calle 73 #73-74', 'Cúcuta', '3001833445', 'raul.fernandez@cliente.com'),
('100000074', 'Carmen', 'Moreno', 'Calle 74 #74-75', 'Montería', '3001844556', 'carmen.moreno@cliente.com'),
('100000075', 'María', 'Alvarado', 'Calle 75 #75-76', 'San Andrés', '3001855667', 'maria.alvarado@cliente.com'),
('100000076', 'Juan', 'Ramírez', 'Calle 76 #76-77', 'Manizales', '3001866778', 'juan.ramirez@cliente.com'),
('100000077', 'Luis', 'Serrano', 'Calle 77 #77-78', 'Cali', '3001877889', 'luis.serrano@cliente.com'),
('100000078', 'Sara', 'Ríos', 'Calle 78 #78-79', 'Barranquilla', '3001888990', 'sara.rios@cliente.com'),
('100000079', 'José', 'Torres', 'Calle 79 #79-80', 'Pereira', '3001899001', 'jose.torres@cliente.com'),
('100000080', 'Andrés', 'Martínez', 'Calle 80 #80-81', 'Bucaramanga', '3001900112', 'andres.martinez@cliente.com'),
('100000081', 'Isabel', 'González', 'Calle 81 #81-82', 'Medellín', '3001911223', 'isabel.gonzalez@cliente.com'),
('100000082', 'David', 'Sánchez', 'Calle 82 #82-83', 'Cúcuta', '3001922334', 'david.sanchez@cliente.com'),
('100000083', 'Juan', 'Hernández', 'Calle 83 #83-84', 'Cartagena', '3001933445', 'juan.hernandez@cliente.com'),
('100000084', 'Pedro', 'Ramírez', 'Calle 84 #84-85', 'Bucaramanga', '3001944556', 'pedro.ramirez@cliente.com'),
('100000085', 'Andrea', 'López', 'Calle 85 #85-86', 'Medellín', '3001955667', 'andrea.lopez@cliente.com'),
('100000086', 'Carlos', 'Serrano', 'Calle 86 #86-87', 'Ibagué', '3001966778', 'carlos.serrano@cliente.com'),
('100000087', 'Patricia', 'Reyes', 'Calle 87 #87-88', 'Cali', '3001977889', 'patricia.reyes@cliente.com'),
('100000088', 'Miguel', 'Vega', 'Calle 88 #88-89', 'Cúcuta', '3001988990', 'miguel.vega@cliente.com'),
('100000089', 'Javier', 'Martínez', 'Calle 89 #89-90', 'Popayán', '3001999001', 'javier.martinez@cliente.com'),
('100000090', 'Mariana', 'Pérez', 'Calle 90 #90-91', 'Barranquilla', '3002000112', 'mariana.perez@cliente.com'),
('100000091', 'Nicolás', 'Ramírez', 'Calle 91 #91-92', 'Bucaramanga', '3002011223', 'nicolas.ramirez@cliente.com'),
('100000092', 'Carolina', 'Gómez', 'Calle 92 #92-93', 'Neiva', '3002022334', 'carolina.gomez@cliente.com'),
('100000093', 'Carlos', 'Torres', 'Calle 93 #93-94', 'Santa Marta', '3002033445', 'carlos.torres@cliente.com'),
('100000094', 'Pedro', 'Sánchez', 'Calle 94 #94-95', 'Cúcuta', '3002044556', 'pedro.sanchez@cliente.com'),
('100000095', 'Elena', 'Vega', 'Calle 95 #95-96', 'Medellín', '3002055667', 'elena.vega@cliente.com'),
('100000096', 'Antonio', 'Martínez', 'Calle 96 #96-97', 'Ibagué', '3002066778', 'antonio.martinez@cliente.com'),
('100000097', 'Isabel', 'Torres', 'Calle 97 #97-98', 'Popayán', '3002077889', 'isabel.torres@cliente.com'),
('100000098', 'Laura', 'Serrano', 'Calle 98 #98-99', 'Cali', '3002088990', 'laura.serrano@cliente.com'),
('100000099', 'Carlos', 'Gutiérrez', 'Calle 99 #99-100', 'Manizales', '3002099001', 'carlos.gutierrez@cliente.com'),
('100000100', 'Lucía', 'Ramírez', 'Calle 100 #100-101', 'Bucaramanga', '3002100112', 'lucia.ramirez@cliente.com');

INSERT INTO alquileres (vehiculo, nombre_cliente, apellido_cliente, nombre_empleado, apellido_empleado, sucursal, fecha_salida, fecha_llegada, valor_alquiler, porcentaje_descuento, valor_cotizado, valor_pagado) VALUES
('ABC123', 'Juan', 'Gómez', 'Carlos', 'Gómez', 'Sucursal 1', '2024-11-01', '2024-11-10', 100, 5, 95, 90),
('DEF456', 'Ana', 'García', 'Luis', 'Martínez', 'Sucursal 2', '2024-11-02', '2024-11-12', 150, 10, 135, 120),
('GHI789', 'Juan', 'Martínez', 'Pedro', 'Sánchez', 'Sucursal 3', '2024-11-03', '2024-11-14', 200, 15, 170, 160),
('JKL012', 'María', 'Rodríguez', 'José', 'Vega', 'Sucursal 4', '2024-11-04', '2024-11-15', 80, 0, 80, 80),
('MNO345', 'Luis', 'Hernández', 'Ana', 'Díaz', 'Sucursal 5', '2024-11-05', '2024-11-16', 120, 5, 114, 110),
('PQR678', 'Lucía', 'Fernández', 'Juan', 'Álvarez', 'Sucursal 1', '2024-11-06', '2024-11-17', 90, 10, 81, 80),
('STU901', 'José', 'Mendoza', 'Manuel', 'Torres', 'Sucursal 2', '2024-11-07', '2024-11-18', 110, 5, 104, 100),
('VWX234', 'Pedro', 'Jiménez', 'Raúl', 'Moreno', 'Sucursal 3', '2024-11-08', '2024-11-19', 130, 15, 110, 105),
('YZA567', 'Raquel', 'Sánchez', 'Paola', 'Gutiérrez', 'Sucursal 4', '2024-11-09', '2024-11-20', 140, 10, 126, 120),
('BCD890', 'Esteban', 'Torres', 'Víctor', 'Suárez', 'Sucursal 5', '2024-11-10', '2024-11-21', 160, 0, 160, 160),
('EFG123', 'Clara', 'Vargas', 'Carlos', 'Hernández', 'Sucursal 1', '2024-11-11', '2024-11-22', 170, 5, 161, 155),
('HIJ456', 'Antonio', 'Ruiz', 'Luis', 'Rodríguez', 'Sucursal 2', '2024-11-12', '2024-11-23', 180, 10, 162, 150),
('KLM789', 'Isabel', 'González', 'Pedro', 'Jiménez', 'Sucursal 3', '2024-11-13', '2024-11-24', 200, 15, 170, 160),
('NOP012', 'José', 'Ramírez', 'José', 'Pérez', 'Sucursal 4', '2024-11-14', '2024-11-25', 210, 0, 210, 210),
('QRS345', 'María', 'López', 'Ana', 'Molina', 'Sucursal 5', '2024-11-15', '2024-11-26', 220, 5, 209, 200),
('TUV678', 'Pedro', 'Pérez', 'Raúl', 'Rojas', 'Sucursal 1', '2024-11-16', '2024-11-27', 230, 10, 207, 200),
('WXY901', 'Raquel', 'Luna', 'Manuel', 'García', 'Sucursal 2', '2024-11-17', '2024-11-28', 240, 15, 204, 195),
('ZAB234', 'Marcos', 'Martínez', 'Carlos', 'Moreno', 'Sucursal 3', '2024-11-18', '2024-11-29', 250, 0, 250, 250),
('CDE567', 'Beatriz', 'Pérez', 'Pedro', 'González', 'Sucursal 4', '2024-11-19', '2024-11-30', 260, 5, 247, 240),
('FGH890', 'Javier', 'Gutiérrez', 'Ana', 'Ruiz', 'Sucursal 5', '2024-11-20', '2024-12-01', 270, 10, 243, 230),
('HIJ123', 'Cristina', 'Sánchez', 'Raúl', 'Rodríguez', 'Sucursal 1', '2024-11-21', '2024-12-02', 280, 15, 238, 225),
('KLM456', 'David', 'Martínez', 'Víctor', 'González', 'Sucursal 2', '2024-11-22', '2024-12-03', 290, 0, 290, 290),
('NOP789', 'Lucía', 'Rodríguez', 'Carlos', 'Vega', 'Sucursal 3', '2024-11-23', '2024-12-04', 300, 5, 285, 275),
('QRS012', 'Antonio', 'Mendoza', 'José', 'Sánchez', 'Sucursal 4', '2024-11-24', '2024-12-05', 310, 10, 279, 270),
('TUV345', 'Esteban', 'Vargas', 'Manuel', 'Pérez', 'Sucursal 5', '2024-11-25', '2024-12-06', 320, 15, 272, 260),
('WXY678', 'Carlos', 'Ramírez', 'Pedro', 'Torres', 'Sucursal 1', '2024-11-26', '2024-12-07', 330, 0, 330, 330),
('ZAB901', 'Beatriz', 'González', 'Ana', 'Molina', 'Sucursal 2', '2024-11-27', '2024-12-08', 340, 5, 323, 315),
('CDE234', 'Isabel', 'Jiménez', 'Raúl', 'Díaz', 'Sucursal 3', '2024-11-28', '2024-12-09', 350, 10, 315, 305),
('FGH567', 'José', 'Torres', 'José', 'Ruiz', 'Sucursal 4', '2024-11-29', '2024-12-10', 360, 15, 306, 295),
('HIJ890', 'Ana', 'Vega', 'Carlos', 'Ramírez', 'Sucursal 5', '2024-11-30', '2024-12-11', 370, 0, 370, 370),
('JKL123', 'Juan', 'Álvarez', 'Carlos', 'Pérez', 'Sucursal 1', '2024-12-01', '2024-12-12', 380, 5, 361, 350),
('MNO456', 'Marcos', 'Hernández', 'Luis', 'Rodríguez', 'Sucursal 2', '2024-12-02', '2024-12-13', 390, 10, 351, 340),
('PQR789', 'José', 'Sánchez', 'Pedro', 'Torres', 'Sucursal 3', '2024-12-03', '2024-12-14', 400, 15, 340, 330),
('STU012', 'Clara', 'Jiménez', 'Carlos', 'Sánchez', 'Sucursal 4', '2024-12-04', '2024-12-15', 410, 0, 410, 410),
('VWX345', 'Ana', 'Rodríguez', 'Raúl', 'Gutiérrez', 'Sucursal 5', '2024-12-05', '2024-12-16', 420, 5, 399, 390),
('YZA678', 'María', 'Pérez', 'Víctor', 'Molina', 'Sucursal 1', '2024-12-06', '2024-12-17', 430, 10, 387, 375),
('BCD901', 'Raúl', 'Moreno', 'José', 'López', 'Sucursal 2', '2024-12-07', '2024-12-18', 440, 15, 374, 365);

INSERT INTO empleado (cedula, nombre, apellido, direccion, ciudad_residencia, celular, correo_electronico) VALUES
('10000001', 'José', 'Martínez', 'Calle 101 #111-121', 'Barranquilla', '3000000101', 'jose.martinez101@example.com'),
('10000002', 'Carolina', 'Suárez', 'Calle 102 #112-122', 'Manizales', '3000000102', 'carolina.suarez102@example.com'),
('10000003', 'Ricardo', 'Rodríguez', 'Calle 103 #113-123', 'Cali', '3000000103', 'ricardo.rodriguez103@example.com'),
('10000004', 'Ana', 'Gómez', 'Calle 104 #114-124', 'Medellín', '3000000104', 'ana.gomez104@example.com'),
('10000005', 'Carlos', 'Pérez', 'Calle 105 #115-125', 'Pereira', '3000000105', 'carlos.perez105@example.com'),
('10000006', 'Verónica', 'Hernández', 'Calle 106 #116-126', 'Cartagena', '3000000106', 'veronica.hernandez106@example.com'),
('10000007', 'Fernando', 'Ramírez', 'Calle 107 #117-127', 'Bucaramanga', '3000000107', 'fernando.ramirez107@example.com'),
('10000008', 'Margarita', 'López', 'Calle 108 #118-128', 'Armenia', '3000000108', 'margarita.lopez108@example.com'),
('10000009', 'Luis', 'Vega', 'Calle 109 #119-129', 'Neiva', '3000000109', 'luis.vega109@example.com'),
('10000010', 'Sofía', 'Díaz', 'Calle 110 #120-130', 'Ibagué', '3000000110', 'sofia.diaz110@example.com'),
('10000011', 'Gabriel', 'Moreno', 'Calle 11 #21-31', 'Neiva', '3000000011', 'gabriel.moreno11@example.com'),
('10000012', 'Raquel', 'Ortiz', 'Calle 12 #22-32', 'Popayán', '3000000012', 'raquel.ortiz12@example.com'),
('10000013', 'Fernando', 'Vega', 'Calle 13 #23-33', 'Armenia', '3000000013', 'fernando.vega13@example.com'),
('10000014', 'Lucía', 'Ramírez', 'Calle 14 #24-34', 'Tunja', '3000000014', 'lucia.ramirez14@example.com'),
('10000015', 'Camilo', 'Flores', 'Calle 15 #25-35', 'Villavicencio', '3000000015', 'camilo.flores15@example.com'),
('10000016', 'Esteban', 'Rivera', 'Calle 16 #26-36', 'Cúcuta', '3000000016', 'esteban.rivera16@example.com'),
('10000017', 'Lorena', 'Peña', 'Calle 17 #27-37', 'Bogotá', '3000000017', 'lorena.pena17@example.com'),
('10000018', 'Oscar', 'Lara', 'Calle 18 #28-38', 'Manizales', '3000000018', 'oscar.lara18@example.com'),
('10000019', 'Rosa', 'Mora', 'Calle 19 #29-39', 'Barranquilla', '3000000019', 'rosa.mora19@example.com'),
('10000020', 'Álvaro', 'Cardozo', 'Calle 20 #30-40', 'Bucaramanga', '3000000020', 'alvaro.cardozo20@example.com'),
('10000021', 'Marcela', 'Montoya', 'Calle 21 #31-41', 'Medellín', '3000000021', 'marcela.montoya21@example.com'),
('10000022', 'Pablo', 'Beltrán', 'Calle 22 #32-42', 'Cali', '3000000022', 'pablo.beltran22@example.com'),
('10000023', 'Isabel', 'Castillo', 'Calle 23 #33-43', 'Cartagena', '3000000023', 'isabel.castillo23@example.com'),
('10000024', 'David', 'Soto', 'Calle 24 #34-44', 'Pereira', '3000000024', 'david.soto24@example.com'),
('10000025', 'Carmen', 'Arias', 'Calle 25 #35-45', 'Ibagué', '3000000025', 'carmen.arias25@example.com'),
('10000026', 'Felipe', 'Campos', 'Calle 26 #36-46', 'Montería', '3000000026', 'felipe.campos26@example.com'),
('10000027', 'Verónica', 'Guerrero', 'Calle 27 #37-47', 'Pasto', '3000000027', 'veronica.guerrero27@example.com'),
('10000028', 'Rafael', 'Ospina', 'Calle 28 #38-48', 'Buga', '3000000028', 'rafael.ospina28@example.com'),
('10000029', 'Natalia', 'Paredes', 'Calle 29 #39-49', 'Cali', '3000000029', 'natalia.paredes29@example.com'),
('10000030', 'Javier', 'Jiménez', 'Calle 30 #40-50', 'Santa Marta', '3000000030', 'javier.jimenez30@example.com'),
('10000031', 'Juliana', 'Martínez', 'Calle 31 #41-51', 'Neiva', '3000000031', 'juliana.martinez31@example.com'),
('10000032', 'Sergio', 'Guzmán', 'Calle 32 #42-52', 'Cúcuta', '3000000032', 'sergio.guzman32@example.com'),
('10000033', 'Elena', 'Salinas', 'Calle 33 #43-53', 'Manizales', '3000000033', 'elena.salinas33@example.com'),
('10000034', 'Iván', 'Contreras', 'Calle 34 #44-54', 'Villavicencio', '3000000034', 'ivan.contreras34@example.com'),
('10000035', 'Patricia', 'López', 'Calle 35 #45-55', 'Barranquilla', '3000000035', 'patricia.lopez35@example.com'),
('10000036', 'Guillermo', 'Álvarez', 'Calle 36 #46-56', 'Tunja', '3000000036', 'guillermo.alvarez36@example.com'),
('10000037', 'Alejandro', 'Bravo', 'Calle 37 #47-57', 'Bucaramanga', '3000000037', 'alejandro.bravo37@example.com'),
('10000038', 'Silvia', 'Méndez', 'Calle 38 #48-58', 'Armenia', '3000000038', 'silvia.mendez38@example.com'),
('10000039', 'Diego', 'Paz', 'Calle 39 #49-59', 'Popayán', '3000000039', 'diego.paz39@example.com'),
('10000040', 'Adriana', 'García', 'Calle 40 #50-60', 'Cartagena', '3000000040', 'adriana.garcia40@example.com'),
('10000041', 'Luis', 'Escobar', 'Calle 41 #51-61', 'Ibagué', '3000000041', 'luis.escobar41@example.com'),
('10000042', 'Lina', 'Bautista', 'Calle 42 #52-62', 'Pereira', '3000000042', 'lina.bautista42@example.com'),
('10000043', 'Manuel', 'Gómez', 'Calle 43 #53-63', 'Montería', '3000000043', 'manuel.gomez43@example.com'),
('10000044', 'Beatriz', 'Morales', 'Calle 44 #54-64', 'Buga', '3000000044', 'beatriz.morales44@example.com'),
('10000045', 'Rodrigo', 'Delgado', 'Calle 45 #55-65', 'Santa Marta', '3000000045', 'rodrigo.delgado45@example.com'),
('10000046', 'Andrea', 'Sánchez', 'Calle 46 #56-66', 'Bogotá', '3000000046', 'andrea.sanchez46@example.com'),
('10000047', 'Mónica', 'Padilla', 'Calle 47 #57-67', 'Cali', '3000000047', 'monica.padilla47@example.com'),
('10000048', 'Ricardo', 'Linares', 'Calle 48 #58-68', 'Medellín', '3000000048', 'ricardo.linares48@example.com'),
('10000049', 'Gabriela', 'Valencia', 'Calle 49 #59-69', 'Cartagena', '3000000049', 'gabriela.valencia49@example.com'),
('10000050', 'José', 'Rivas', 'Calle 50 #60-70', 'Pasto', '3000000050', 'jose.rivas50@example.com'),
('10000051', 'Rosa', 'Pérez', 'Calle 51 #61-71', 'Cali', '3000000051', 'rosa.perez51@example.com'),
('10000052', 'Miguel', 'Castro', 'Calle 52 #62-72', 'Pereira', '3000000052', 'miguel.castro52@example.com'),
('10000053', 'Diana', 'Jiménez', 'Calle 53 #63-73', 'Barranquilla', '3000000053', 'diana.jimenez53@example.com'),
('10000054', 'Carlos', 'Martínez', 'Calle 54 #64-74', 'Medellín', '3000000054', 'carlos.martinez54@example.com'),
('10000055', 'Sonia', 'Mejía', 'Calle 55 #65-75', 'Manizales', '3000000055', 'sonia.mejia55@example.com'),
('10000056', 'Alberto', 'Vargas', 'Calle 56 #66-76', 'Cartagena', '3000000056', 'alberto.vargas56@example.com'),
('10000057', 'Sara', 'Muñoz', 'Calle 57 #67-77', 'Ibagué', '3000000057', 'sara.munoz57@example.com'),
('10000058', 'Eduardo', 'Vega', 'Calle 58 #68-78', 'Popayán', '3000000058', 'eduardo.vega58@example.com'),
('10000059', 'Marcela', 'Ortiz', 'Calle 59 #69-79', 'Armenia', '3000000059', 'marcela.ortiz59@example.com'),
('10000060', 'Patricio', 'Navarro', 'Calle 60 #70-80', 'Santa Marta', '3000000060', 'patricio.navarro60@example.com'),
('10000061', 'Rocío', 'Zambrano', 'Calle 61 #71-81', 'Neiva', '3000000061', 'rocio.zambrano61@example.com'),
('10000062', 'Mario', 'González', 'Calle 62 #72-82', 'Tunja', '3000000062', 'mario.gonzalez62@example.com'),
('10000063', 'Jimena', 'Blanco', 'Calle 63 #73-83', 'Villavicencio', '3000000063', 'jimena.blanco63@example.com'),
('10000064', 'Felipe', 'Acosta', 'Calle 64 #74-84', 'Cúcuta', '3000000064', 'felipe.acosta64@example.com'),
('10000065', 'Claudia', 'Santos', 'Calle 65 #75-85', 'Bucaramanga', '3000000065', 'claudia.santos65@example.com'),
('10000066', 'Rafael', 'Moreno', 'Calle 66 #76-86', 'Buga', '3000000066', 'rafael.moreno66@example.com'),
('10000067', 'Elvira', 'Ferrer', 'Calle 67 #77-87', 'Pasto', '3000000067', 'elvira.ferrer67@example.com'),
('10000068', 'Ricardo', 'Calle', 'Calle 68 #78-88', 'Cali', '3000000068', 'ricardo.calle68@example.com'),
('10000069', 'Nidia', 'Molina', 'Calle 69 #79-89', 'Bogotá', '3000000069', 'nidia.molina69@example.com'),
('10000070', 'Manuel', 'Arango', 'Calle 70 #80-90', 'Cartagena', '3000000070', 'manuel.arango70@example.com'),
('10000071', 'Lucía', 'Gaviria', 'Calle 71 #81-91', 'Medellín', '3000000071', 'lucia.gaviria71@example.com'),
('10000072', 'Rodolfo', 'Montoya', 'Calle 72 #82-92', 'Barranquilla', '3000000072', 'rodolfo.montoya72@example.com'),
('10000073', 'Vanessa', 'Aguirre', 'Calle 73 #83-93', 'Pereira', '3000000073', 'vanessa.aguirre73@example.com'),
('10000074', 'Tomás', 'Carvajal', 'Calle 74 #84-94', 'Buga', '3000000074', 'tomas.carvajal74@example.com'),
('10000075', 'Silvia', 'Benítez', 'Calle 75 #85-95', 'Cúcuta', '3000000075', 'silvia.benitez75@example.com'),
('10000076', 'Jaime', 'Ávila', 'Calle 76 #86-96', 'Neiva', '3000000076', 'jaime.avila76@example.com'),
('10000077', 'Tatiana', 'Rojas', 'Calle 77 #87-97', 'Pasto', '3000000077', 'tatiana.rojas77@example.com'),
('10000078', 'Rogelio', 'Bernal', 'Calle 78 #88-98', 'Popayán', '3000000078', 'rogelio.bernal78@example.com'),
('10000079', 'Luz', 'Márquez', 'Calle 79 #89-99', 'Ibagué', '3000000079', 'luz.marquez79@example.com'),
('10000080', 'Guillermo', 'Trujillo', 'Calle 80 #90-100', 'Santa Marta', '3000000080', 'guillermo.trujillo80@example.com'),
('10000081', 'Lorena', 'Pérez', 'Calle 81 #91-101', 'Tunja', '3000000081', 'lorena.perez81@example.com'),
('10000082', 'Fernando', 'León', 'Calle 82 #92-102', 'Villavicencio', '3000000082', 'fernando.leon82@example.com'),
('10000083', 'Ana', 'Quintero', 'Calle 83 #93-103', 'Bucaramanga', '3000000083', 'ana.quintero83@example.com'),
('10000084', 'Ernesto', 'Cárdenas', 'Calle 84 #94-104', 'Armenia', '3000000084', 'ernesto.cardenas84@example.com'),
('10000085', 'Karla', 'Velásquez', 'Calle 85 #95-105', 'Cali', '3000000085', 'karla.velasquez85@example.com'),
('10000086', 'Pedro', 'Lozano', 'Calle 86 #96-106', 'Bogotá', '3000000086', 'pedro.lozano86@example.com'),
('10000087', 'Paola', 'Villalobos', 'Calle 87 #97-107', 'Manizales', '3000000087', 'paola.villalobos87@example.com'),
('10000088', 'Liliana', 'Morales', 'Calle 88 #98-108', 'Cartagena', '3000000088', 'liliana.morales88@example.com'),
('10000089', 'Sebastián', 'Caicedo', 'Calle 89 #99-109', 'Barranquilla', '3000000089', 'sebastian.caicedo89@example.com'),
('10000090', 'Raúl', 'Fonseca', 'Calle 90 #100-110', 'Bucaramanga', '3000000090', 'raul.fonseca90@example.com'),
('10000091', 'Cecilia', 'Valle', 'Calle 91 #101-111', 'Pereira', '3000000091', 'cecilia.valle91@example.com'),
('10000092', 'Héctor', 'Angulo', 'Calle 92 #102-112', 'Montería', '3000000092', 'hector.angulo92@example.com'),
('10000093', 'Olga', 'Mesa', 'Calle 93 #103-113', 'Neiva', '3000000093', 'olga.mesa93@example.com'),
('10000094', 'Cristina', 'Loaiza', 'Calle 94 #104-114', 'Tunja', '3000000094', 'cristina.loaiza94@example.com'),
('10000095', 'Germán', 'Aldana', 'Calle 95 #105-115', 'Villavicencio', '3000000095', 'german.aldana95@example.com'),
('10000096', 'Elsa', 'Barreto', 'Calle 96 #106-116', 'Cúcuta', '3000000096', 'elsa.barreto96@example.com'),
('10000097', 'Luis', 'Salazar', 'Calle 97 #107-117', 'Santa Marta', '3000000097', 'luis.salazar97@example.com'),
('10000098', 'Victoria', 'González', 'Calle 98 #108-118', 'Pasto', '3000000098', 'victoria.gonzalez98@example.com'),
('10000099', 'Andrés', 'Torres', 'Calle 99 #109-119', 'Popayán', '3000000099', 'andres.torres99@example.com'),
('10000100', 'Beatriz', 'Figueroa', 'Calle 100 #110-120', 'Ibagué', '3000000100', 'beatriz.figueroa100@example.com');

INSERT INTO sucursal (ciudad, direccion, telefono_fijo, celular, correo_electronico) VALUES
('Cúcuta', 'Calle 1 #10-20', '072-5550001', '3005550001', 'sucursal1@empresa.com'),
('Bogotá', 'Carrera 2 #20-30', '072-5550002', '3005550002', 'sucursal2@empresa.com'),
('Medellín', 'Calle 3 #30-40', '072-5550003', '3005550003', 'sucursal3@empresa.com'),
('Cali', 'Calle 4 #40-50', '072-5550004', '3005550004', 'sucursal4@empresa.com'),
('Barranquilla', 'Calle 5 #50-60', '072-5550005', '3005550005', 'sucursal5@empresa.com'),
('Cartagena', 'Calle 6 #60-70', '072-5550006', '3005550006', 'sucursal6@empresa.com'),
('Bucaramanga', 'Calle 7 #70-80', '072-5550007', '3005550007', 'sucursal7@empresa.com'),
('Pereira', 'Calle 8 #80-90', '072-5550008', '3005550008', 'sucursal8@empresa.com'),
('Santa Marta', 'Calle 9 #90-100', '072-5550009', '3005550009', 'sucursal9@empresa.com'),
('Ibagué', 'Calle 10 #100-110', '072-5550010', '3005550010', 'sucursal10@empresa.com'),
('Neiva', 'Calle 11 #110-120', '072-5550011', '3005550011', 'sucursal11@empresa.com'),
('Armenia', 'Calle 12 #120-130', '072-5550012', '3005550012', 'sucursal12@empresa.com'),
('Pasto', 'Calle 13 #130-140', '072-5550013', '3005550013', 'sucursal13@empresa.com'),
('Manizales', 'Calle 14 #140-150', '072-5550014', '3005550014', 'sucursal14@empresa.com'),
('Cúcuta', 'Calle 15 #150-160', '072-5550015', '3005550015', 'sucursal15@empresa.com'),
('Villavicencio', 'Calle 16 #160-170', '072-5550016', '3005550016', 'sucursal16@empresa.com'),
('Soledad', 'Calle 17 #170-180', '072-5550017', '3005550017', 'sucursal17@empresa.com'),
('Palmira', 'Calle 18 #180-190', '072-5550018', '3005550018', 'sucursal18@empresa.com'),
('Valledupar', 'Calle 19 #190-200', '072-5550019', '3005550019', 'sucursal19@empresa.com'),
('Montería', 'Calle 20 #200-210', '072-5550020', '3005550020', 'sucursal20@empresa.com'),
('San Andrés', 'Calle 21 #210-220', '072-5550021', '3005550021', 'sucursal21@empresa.com'),
('Popayán', 'Calle 22 #220-230', '072-5550022', '3005550022', 'sucursal22@empresa.com'),
('Tuluá', 'Calle 23 #230-240', '072-5550023', '3005550023', 'sucursal23@empresa.com'),
('Cúcuta', 'Calle 24 #240-250', '072-5550024', '3005550024', 'sucursal24@empresa.com'),
('Bello', 'Calle 25 #250-260', '072-5550025', '3005550025', 'sucursal25@empresa.com'),
('Tunja', 'Calle 26 #260-270', '072-5550026', '3005550026', 'sucursal26@empresa.com'),
('Pereira', 'Calle 27 #270-280', '072-5550027', '3005550027', 'sucursal27@empresa.com'),
('La Dorada', 'Calle 28 #280-290', '072-5550028', '3005550028', 'sucursal28@empresa.com'),
('Bucaramanga', 'Calle 29 #290-300', '072-5550029', '3005550029', 'sucursal29@empresa.com'),
('Cali', 'Calle 30 #300-310', '072-5550030', '3005550030', 'sucursal30@empresa.com'),
('Valledupar', 'Calle 31 #310-320', '072-5550031', '3005550031', 'sucursal31@empresa.com'),
('Cartagena', 'Calle 32 #320-330', '072-5550032', '3005550032', 'sucursal32@empresa.com'),
('Cali', 'Calle 33 #330-340', '072-5550033', '3005550033', 'sucursal33@empresa.com'),
('Santa Marta', 'Calle 34 #340-350', '072-5550034', '3005550034', 'sucursal34@empresa.com'),
('Villavicencio', 'Calle 35 #350-360', '072-5550035', '3005550035', 'sucursal35@empresa.com'),
('San Andrés', 'Calle 36 #360-370', '072-5550036', '3005550036', 'sucursal36@empresa.com'),
('Quibdó', 'Calle 37 #370-380', '072-5550037', '3005550037', 'sucursal37@empresa.com'),
('Neiva', 'Calle 38 #380-390', '072-5550038', '3005550038', 'sucursal38@empresa.com'),
('San Juan de Pasto', 'Calle 39 #390-400', '072-5550039', '3005550039', 'sucursal39@empresa.com'),
('Tunja', 'Calle 40 #400-410', '072-5550040', '3005550040', 'sucursal40@empresa.com'),
('Cúcuta', 'Calle 41 #410-420', '072-5550041', '3005550041', 'sucursal41@empresa.com'),
('Popayán', 'Calle 42 #420-430', '072-5550042', '3005550042', 'sucursal42@empresa.com'),
('Cali', 'Calle 43 #430-440', '072-5550043', '3005550043', 'sucursal43@empresa.com'),
('Barranquilla', 'Calle 44 #440-450', '072-5550044', '3005550044', 'sucursal44@empresa.com'),
('Tuluá', 'Calle 45 #450-460', '072-5550045', '3005550045', 'sucursal45@empresa.com'),
('Ibagué', 'Calle 46 #460-470', '072-5550046', '3005550046', 'sucursal46@empresa.com'),
('San Gil', 'Calle 47 #470-480', '072-5550047', '3005550047', 'sucursal47@empresa.com'),
('Bello', 'Calle 48 #480-490', '072-5550048', '3005550048', 'sucursal48@empresa.com'),
('Girardot', 'Calle 49 #490-500', '072-5550049', '3005550049', 'sucursal49@empresa.com'),
('Barranquilla', 'Calle 50 #500-510', '072-5550050', '3005550050', 'sucursal50@empresa.com'),
('Cúcuta', 'Calle 51 #510-520', '072-5550051', '3005550051', 'sucursal51@empresa.com'),
('Medellín', 'Calle 52 #520-530', '072-5550052', '3005550052', 'sucursal52@empresa.com'),
('Cali', 'Calle 53 #530-540', '072-5550053', '3005550053', 'sucursal53@empresa.com'),
('Barranquilla', 'Calle 54 #540-550', '072-5550054', '3005550054', 'sucursal54@empresa.com'),
('Cartagena', 'Calle 55 #550-560', '072-5550055', '3005550055', 'sucursal55@empresa.com'),
('Bucaramanga', 'Calle 56 #560-570', '072-5550056', '3005550056', 'sucursal56@empresa.com'),
('Pereira', 'Calle 57 #570-580', '072-5550057', '3005550057', 'sucursal57@empresa.com'),
('Santa Marta', 'Calle 58 #580-590', '072-5550058', '3005550058', 'sucursal58@empresa.com'),
('Ibagué', 'Calle 59 #590-600', '072-5550059', '3005550059', 'sucursal59@empresa.com'),
('Neiva', 'Calle 60 #600-610', '072-5550060', '3005550060', 'sucursal60@empresa.com'),
('Armenia', 'Calle 61 #610-620', '072-5550061', '3005550061', 'sucursal61@empresa.com'),
('Pasto', 'Calle 62 #620-630', '072-5550062', '3005550062', 'sucursal62@empresa.com'),
('Manizales', 'Calle 63 #630-640', '072-5550063', '3005550063', 'sucursal63@empresa.com'),
('Cúcuta', 'Calle 64 #640-650', '072-5550064', '3005550064', 'sucursal64@empresa.com'),
('Villavicencio', 'Calle 65 #650-660', '072-5550065', '3005550065', 'sucursal65@empresa.com'),
('Soledad', 'Calle 66 #660-670', '072-5550066', '3005550066', 'sucursal66@empresa.com'),
('Palmira', 'Calle 67 #670-680', '072-5550067', '3005550067', 'sucursal67@empresa.com'),
('Valledupar', 'Calle 68 #680-690', '072-5550068', '3005550068', 'sucursal68@empresa.com'),
('Montería', 'Calle 69 #690-700', '072-5550069', '3005550069', 'sucursal69@empresa.com'),
('San Andrés', 'Calle 70 #700-710', '072-5550070', '3005550070', 'sucursal70@empresa.com'),
('Popayán', 'Calle 71 #710-720', '072-5550071', '3005550071', 'sucursal71@empresa.com'),
('Tuluá', 'Calle 72 #720-730', '072-5550072', '3005550072', 'sucursal72@empresa.com'),
('Cúcuta', 'Calle 73 #730-740', '072-5550073', '3005550073', 'sucursal73@empresa.com'),
('Bello', 'Calle 74 #740-750', '072-5550074', '3005550074', 'sucursal74@empresa.com'),
('Tunja', 'Calle 75 #750-760', '072-5550075', '3005550075', 'sucursal75@empresa.com'),
('Pereira', 'Calle 76 #760-770', '072-5550076', '3005550076', 'sucursal76@empresa.com'),
('La Dorada', 'Calle 77 #770-780', '072-5550077', '3005550077', 'sucursal77@empresa.com'),
('Bucaramanga', 'Calle 78 #780-790', '072-5550078', '3005550078', 'sucursal78@empresa.com'),
('Cali', 'Calle 79 #790-800', '072-5550079', '3005550079', 'sucursal79@empresa.com'),
('Valledupar', 'Calle 80 #800-810', '072-5550080', '3005550080', 'sucursal80@empresa.com'),
('Cartagena', 'Calle 81 #810-820', '072-5550081', '3005550081', 'sucursal81@empresa.com'),
('Cali', 'Calle 82 #820-830', '072-5550082', '3005550082', 'sucursal82@empresa.com'),
('Santa Marta', 'Calle 83 #830-840', '072-5550083', '3005550083', 'sucursal83@empresa.com'),
('Villavicencio', 'Calle 84 #840-850', '072-5550084', '3005550084', 'sucursal84@empresa.com'),
('San Andrés', 'Calle 85 #850-860', '072-5550085', '3005550085', 'sucursal85@empresa.com'),
('Quibdó', 'Calle 86 #860-870', '072-5550086', '3005550086', 'sucursal86@empresa.com'),
('Neiva', 'Calle 87 #870-880', '072-5550087', '3005550087', 'sucursal87@empresa.com'),
('San Juan de Pasto', 'Calle 88 #880-890', '072-5550088', '3005550088', 'sucursal88@empresa.com'),
('Tunja', 'Calle 89 #890-900', '072-5550089', '3005550089', 'sucursal89@empresa.com'),
('Cúcuta', 'Calle 90 #900-910', '072-5550090', '3005550090', 'sucursal90@empresa.com'),
('Popayán', 'Calle 91 #910-920', '072-5550091', '3005550091', 'sucursal91@empresa.com'),
('Cali', 'Calle 92 #920-930', '072-5550092', '3005550092', 'sucursal92@empresa.com'),
('Barranquilla', 'Calle 93 #930-940', '072-5550093', '3005550093', 'sucursal93@empresa.com'),
('Tuluá', 'Calle 94 #940-950', '072-5550094', '3005550094', 'sucursal94@empresa.com'),
('Ibagué', 'Calle 95 #950-960', '072-5550095', '3005550095', 'sucursal95@empresa.com'),
('San Gil', 'Calle 96 #960-970', '072-5550096', '3005550096', 'sucursal96@empresa.com'),
('Bello', 'Calle 97 #970-980', '072-5550097', '3005550097', 'sucursal97@empresa.com'),
('Girardot', 'Calle 98 #980-990', '072-5550098', '3005550098', 'sucursal98@empresa.com'),
('Barranquilla', 'Calle 99 #990-1000', '072-5550099', '3005550099', 'sucursal99@empresa.com'),
('Medellín', 'Calle 100 #1000-1010', '072-5550100', '3005550100', 'sucursal100@empresa.com');

-- 1. Devuelva el nombre en una sola columna acopañado del numero de celular de todos los empleados
select e.id_empleado,
	concat(e.nombre,e.apellido) as nombre_completo,
    e.celular
from empleado e;

-- 2. Devuelva el nombre de todos los empleados que son de barranquilla
select empleado.id_empleado, empleado.nombre
from empleado where ciudad_residencia = 'Barranquilla';

-- 3. Devuelve el nombre, apellido, ciudad de residencia y el celular de los primeros 20 empleados
select empleado.id_empleado,
	empleado.nombre,
    empleado.apellido,
    empleado.ciudad_residencia,
    empleado.celular
from empleado limit 20;

-- 4. Devuelve el nombre y la direccion de los ultimos 10 empleados
select empleado.id_empleado id,
	empleado.nombre nombre,
    empleado.direccion direccion
from empleado order by id desc limit 10;

-- 5. Devuelve la informacion de contacto de todos los empleados(nombre, celular y correo electronico)
select empleado.id_empleado,
	empleado.nombre,
    empleado.celular,
    empleado.correo_electronico
from empleado;

-- 1. Devuleve el id, referencia, modelo, motor y el color de todos los vehiculos
select vehiculos.id_vehiculos,
	vehiculos.referencia,
    vehiculos.modelo,
    vehiculos.motor,
    vehiculos.color
from vehiculos;

-- 2. Devuelve la capacidad de todos los vehiculos del 2020
select vehiculos.id_vehiculos,
	vehiculos.referencia,
    vehiculos.modelo,
    vehiculos.capacidad
from vehiculos where modelo = '2020';

-- 3. Devuelve el tipo de vehiculo, modelo, motor y el color de todos los vehiculos que tengan 5 puertas
select vehiculos.tipo_vehiculo,
	vehiculos.modelo,
    vehiculos.motor,
    vehiculos.color
from vehiculos where puertas = '5';

-- 4. Devuelve el tipo de vehiculo, placa del mismo y la refencia ordenando de forma ascendente
select vehiculos.tipo_vehiculo,
	vehiculos.placa,
    vehiculos.referencia
from vehiculos order by referencia asc;

-- 5. Devuelve el numero total de los vehiculos que tienen 4 puertas
select
    vehiculos.puertas, 
    count(puertas) as total_vehiculos
from vehiculos where puertas = 4 group by 1;

-- 1. Devuelve toas las sucursales que estan en barranquilla
select sucursal.ciudad,
	count(ciudad) as total_sucursales
from sucursal where ciudad = 'Barranquilla';

-- 2. Devuelve la ciudad, celular y el correo electronico de todas las sucursales que estan en Bucaramanga
select sucursal.ciudad,
	sucursal.celular,
    sucursal.correo_electronico
from sucursal where ciudad = 'Bucaramanga';

-- 3. Devuleve la informacion de contacto de todas las sucursales de medellin
select sucursal.ciudad,
	sucursal.telefono_fijo,
    sucursal.celular,
    sucursal.correo_electronico
from sucursal where ciudad = 'Medellin';

-- 4. Devulve todas las sucursales ordenadas de forma ascendente
select sucursal.ciudad,
	sucursal.direccion,
    sucursal.telefono_fijo,
    sucursal.celular,
    sucursal.correo_electronico
from sucursal order by ciudad asc;

-- 5. Devuelve el correo electronico, direccion y el telefono fijo de todas las sucursales de Cucuctá
select sucursal.correo_electronico,
	sucursal.direccion,
    sucursal.telefono_fijo
from sucursal where ciudad = 'Cucutá';
	
-- 1. Devuelve el nombre y apellido en una sola columna de los primeros 10 clientes
select concat(cliente.nombre, cliente.apellido) as nombre_completo
from cliente order by nombre_completo desc limit 10;

-- 2. Devuelve el nombre de todos los clientes que son de Cali
select * from cliente where ciudad_residencia = 'Cali';

-- 3. Devuelve el numero total de clientes que son de Bello
select cliente.ciudad_residencia, count(ciudad_residencia) as clientes from cliente where ciudad_residencia = 'Bello';

-- 4. Devuelve toda la infromacion de contacto de todos los clientes que son de cucutá
select cliente.nombre,
	cliente.apellido,
    cliente.ciudad_residencia,
    cliente.celular,
    cliente.correo_electronico
from cliente where ciudad_residencia = 'Cucutá';

-- 5. Devuelve el numero total de clientes que son de Pereira
select cliente.ciudad_residencia, count(ciudad_residencia) as total_clientes from cliente where ciudad_residencia = 'Pereira';

-- 1. Devuelve el nombre de los primeros 10 clientes que alquilaron sus vehiculos en la sucursal 1
select alquileres.nombre_cliente from alquileres where sucursal = 'Sucursal 1' limit 10;

-- 2. Devuelve el nombre, apellido del cliente y el nombre del empleado que le alquilaron vehiculos en la sucursal 4
select alquileres.nombre_cliente, alquileres.apellido_cliente, alquileres.nombre_empleado, sucursal 
from alquileres where sucursal = 'Sucursal 4';

-- 3. Devuelve el nombre del cliente y los valores del alquiler de forma ascendente
select alquileres.id_alquiler, alquileres.nombre_cliente, alquileres.valor_alquiler
from alquileres order by valor_alquiler asc;

-- 4. Devuelve el nombre, apellido y el valor pagado de forma descendiente
select alquileres.nombre_cliente, alquileres.apellido_cliente, alquileres.valor_pagado
from alquileres order by valor_pagado desc;

-- 5. Devuelve el nombre, apellido, sucursal y la fecha de salida y llegada
select alquileres.nombre_cliente, alquileres.apellido_cliente, alquileres.sucursal, alquileres.fecha_salida, alquileres.fecha_llegada
from alquileres;

-- 1. Crea una funcion que calcule el descuento del alquiler

DELIMITER //

create function calcular_descuento(valor_alquiler int, p_descuento int)
returns int
deterministic
begin
    declare descuento int;
    set descuento = (valor_alquiler / 100) * p_descuento;
    return descuento;
end//

DELIMITER ;

select calcular_descuento(1000, 5) as Descuento; -- 1000 es el valor del alquiler y 5 es el descuento que se le aplicara

-- 2. Crea una funcion que calcule la diferencia en dias entre dos fechas
DELIMITER //

create function Fecha(primera_fecha int, segunda_fecha int)
returns int
deterministic
begin
	declare fecha int;
    set fecha = (primera_fecha - segunda_fecha);
	return fecha;
end// 

DELIMITER ;

select Fecha(21, 02) as Resultado;

-- 3. Crea una funcion que calcule el total que deben pagar los clientes que se pasaron las fechas de alquilere


-- 4. Crea una funcion que devuelva los vehiculos disponibles para alquilar

-- 5. Crea una funcion que devuelva el alquiler mas caro que ha realizado un cliente