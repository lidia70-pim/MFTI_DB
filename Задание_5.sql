/* 5.1 Поиск свободных на текущую дату сотрудников*/
select * from staff
where Staff_ID not in
    (select order_staff_id
        from orders
        where (Order_Start_Date<=now())
        and
         (Order_End_Date>=now())
        )
;
-- 5.2 Поиск объектов с гаражом
select Object_City,object_address from objects
    where Object_Garage_Type>0;

-- 5.3 Все свободные на сегодня объекты
select * from objects
where Object_ID   in
      (select Treaty_Tenant_ID
       from treaties
       where (Treaty_End_Date <= now())
      )
;
-- 5.4 Все занятые на сегодня объекты
select * from objects
where Object_ID  not in
      (select Treaty_Tenant_ID
       from treaties
       where (Treaty_End_Date <= now())
      )
;

--5.5 какой объект на какой срок кем арендован
select  o.object_type, o.object_address, t2.tenant_name, t2.Tenant_Org_Name,
    age(t.treaty_end_date,  t.treaty_begin_date) tenancy
     from objects o
     inner join treaties t
      on o.object_id = t.treaty_object_id
     inner join tenats t2
    on t2.tenant_id = t.treaty_tenant_id;