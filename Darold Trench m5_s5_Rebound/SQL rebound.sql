create table editoriales(
	id serial primary key,
	nombre varchar(100)
);

create table libros(
	id serial primary key,
	titulo varchar(100) not null,
	id_editorial integer not null references editoriales(id)
);

insert into editoriales values(default, 'Anaya'),(default, 'Andina'), (default, 'SM');

insert into libros values(default, 'Don Quijote de La Mancha I', 1),
(default, 'El principito', 2),(default, 'El príncipe', 3),
(default, 'Diplomacia', 3),(default, 'Don Quijote de La Mancha II ', 1);

select * from editoriales;

alter table libros add column autor varchar(50);
alter table libros add column precio numeric;

insert into libros values(default, 'Quinto elemento', 3), (default, 'La ola', 2);

begin;
delete from libros where id_editorial = 1;
rollback;

begin;
update editoriales set nombre = 'Mountain' where nombre = 'SM';
savepoint primer_save;
update editoriales set nombre = 'Iberlibro' where nombre = 'Andina'
rollback to primer_save;


