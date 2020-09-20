/* 8.1 Для каждого сотрудника посчитать сколько заказов он выполнил*/
create view staff_v as
   select s.staff_last_name || ' ' ||s.staff_first_name|| ' ' || s.staff_father_name   "Staff_Name",
   count(o.order_staff_id ) "Count_order"
   from staff s
   inner join orders o
    on s.staff_id =o.order_staff_id
    group by s.staff_last_name , s.staff_first_name, s.staff_father_name;

select * from staff_v;

/*8.2 Для каждого города посчитать сколько объектов было арендовано и какого типа*/
create view objects_v as
   select o.object_type, o.object_city, count(t.treaty_object_id )  from objects o
   inner join treaties t
    on o.object_id = t.treaty_object_id
   group by o.object_type, o.object_city