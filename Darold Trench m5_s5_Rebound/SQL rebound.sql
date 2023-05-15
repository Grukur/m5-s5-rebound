-- crear tabla editorial --
create table editoriales(
	id serial primary key,
	nombre varchar(100)
);

-- crear tabla libros --
create table libros(
	id serial primary key,
	titulo varchar(100) not null,
	id_editorial integer not null references editoriales(id)
);

-- insertar editoriales --
insert into editoriales values(default, 'Anaya'),(default, 'Andina'), (default, 'SM');

-- insertar libros --
insert into libros values(default, 'Don Quijote de La Mancha I', 1),
(default, 'El principito', 2),(default, 'El príncipe', 3),
(default, 'Diplomacia', 3),(default, 'Don Quijote de La Mancha II ', 1);

select * from libros;

-- alterar tabla libros y agregar columna autor y precio --
alter table libros add column autor varchar(50);
alter table libros add column precio numeric;

-- agregar autor y precio a los libros ya ingresados --
update libros set autor = 'Miguel de Cervantes', precio = 150 where id = 1;
update libros set autor = 'Antoine SaintExupery', precio = 120 where id = 2;
update libros set autor = 'Maquiavelo', precio = 180 where id = 3;
update libros set autor = 'Henry Kissinger', precio = 170 where id = 4;
update libros set autor = 'Miguel de Cervantes', precio = 140 where id = 5;


-- insertar 2 libros y modificacion posterior XD--
insert into libros values(default, 'Quinto elemento', 3), (default, 'La ola', 2);

update libros set autor = 'Henry Kissinger', precio = 120 where id = 6;
update libros set autor = 'Jhon Fevrau', precio = 140 where id = 7;

begin;
delete from libros where id_editorial = 1;
rollback;

begin;
update editoriales set nombre = 'Mountain' where nombre = 'SM';
savepoint primer_save;
update editoriales set nombre = 'Iberlibro' where nombre = 'Andina'
rollback to primer_save;


