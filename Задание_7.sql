--7.1 маскировка
create view o_type as
   select ob.object_type "Тип объекта", ob.Object_City "Город",
     overlay( ob.Object_Address placing '***-**-**' from 4 for 16) "Адрес объекта"
     from objects ob
     where ob.Object_Address is not null;