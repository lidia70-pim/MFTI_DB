create schema Rent;
Set search_path =rent, public;

create table Rent.REQUESTS
(
  Request_ID  integer not null primary key ,
  Request_Date date not null ,
  Request_Time time not null,
  Request_Object_ID  integer,
  Request_Description varchar(30),
  Request_Order_No integer
)
;  
--select * from Rent.REQUESTS;
--drop table Rent.objects;
create table Rent.objects
(
    Object_ID               integer       not null primary key ,
    Object_Address          varchar(30)   not null,
    Object_City             varchar(20)   not null ,
    Object_Zip              varchar(6)    not null,
    Object_Type             varchar(8)    not null default 'Квартира' ,
    Object_Bedrooms         smallint      not null default 0,
    Object_Livingrooms      smallint      not null default 1,
    Object_Bathrooms        smallint      not null default 1,
    Object_Garage_Type      smallint      not null default 0 ,
    Object_Refrigerator     boolean       not null default true,
    Object_Dish_Washer      boolean       not null default false,
    Object_Central_Heat     boolean       not null default true,
    Object_Air_Conditioners boolean       not null default false,
    Object_Hot_Washer       boolean       not null default true,
    Object_Gas              boolean       not null default false,
    Object_Phone            boolean       not null default true,
    Object_Rent             decimal(7, 2) not null,
    Object_Deposit          decimal(7, 2),
    check (Object_City in ('Чехов', 'Подольск', 'Серпухов' )),
    check (Object_Type in ('Квартира', 'Дом')),
    check (Object_Garage_Type in (0,1,2))

)

--select * from Rent.objects;

create table Rent.tenats (
   Tenant_ID integer not null primary key ,
    Tenant_Name varchar(30)   not null,
    Tenant_Org_Name varchar(30),
    Tenant_Address varchar(30),
    Tenant_Org_City varchar(20),
    Tenant_Org_Zip varchar(6),
    Tenant_Home_Phone varchar(20),
    Tenant_Work_Phone varchar(20),
    Tenant_Cell_Phone varchar(20),
    Tenant_Comments varchar(100)
)
;

--select * from Rent.tenats;
create table rent.TREATIES(
    Treaty_No integer not null primary key,
    Treaty_Tenant_ID integer not null,
    Treaty_Object_ID integer not null,
    Treaty_Begin_Date date not null,
    Treaty_End_Date date not null,
    Treaty_Move_In_Date date not null,
    Treaty_Move_Out_Date date not null,
    Treaty_Deposit decimal(7,2) ,
    Treaty_Rent decimal(7,2) not null,
    Treaty_Rent_A_Day decimal(7,2),
    Treaty_Comments varchar(100)
);
--select * from rent.TREATIES;

create table rent.orders(
      Order_No integer primary key not null,
      Order_Start_Date date not null,
      Order_End_Date date not null,
      Order_Staff_ID integer not null,
      Order_Object_ID integer not null,
      Order_Comments varchar(100)
);
--drop  table rent.Tasks;
create table rent.Tasks(
    Task_Order_No integer  not null,
    Task_Code smallint  not null,
    Task_Description varchar(100) not null,
    Task_Duration smallint not null,
   primary key (Task_Order_No, Task_Code)
)
;
--select * from rent.Tasks;
create table rent.staff(
    Staff_ID integer primary key not null,
    Staff_Last_Name varchar(20) not null,
    Staff_First_Name varchar(20) not null,
    Staff_Father_Name varchar(20) not null
)
;
--select * from rent.staff;

ALTER TABLE rent.REQUESTS
      ADD CONSTRAINT FK_REQUEST_OBJECTS
      FOREIGN KEY (Request_Object_ID)
      REFERENCES rent.objects(Object_ID);

ALTER TABLE rent.REQUESTS
    ADD CONSTRAINT FK_REQUEST_ORDERS
    FOREIGN KEY (Request_Order_No)
    REFERENCES rent.orders (Order_No) ;

ALTER TABLE rent.orders
    ADD CONSTRAINT FK_ORDERS_OBJECTS
    FOREIGN KEY (Order_Object_ID)
    REFERENCES OBJECTS(Object_ID);

ALTER TABLE rent.orders
    ADD CONSTRAINT FK_ORDERS_STAFF
    FOREIGN KEY (Order_Staff_ID)
    REFERENCES rent.staff (Staff_ID) ;

ALTER TABLE rent.treaties
    ADD CONSTRAINT FK_TREATIES_OBJECTS
    FOREIGN KEY (Treaty_Object_ID)
    REFERENCES rent.objects (Object_ID);

ALTER TABLE rent.treaties
    ADD CONSTRAINT FK_TREATIES_TENANTS
    FOREIGN KEY (Treaty_Tenant_ID)
    REFERENCES rent.tenats (Tenant_ID);

ALTER TABLE rent.tasks
    ADD CONSTRAINT FK_TASKS__ORDERS
    FOREIGN KEY (Task_Order_No)
    REFERENCES rent.orders (Order_No);

insert into rent.staff values (1, 'Сидоров', 'Сергей', 'Петрович');
insert into rent.staff values (2, 'Иванов', 'Андрей', 'Сергеевич');
insert into rent.staff values (3, 'Чернов', 'Максим', 'Иванович');
insert into rent.staff values (4, 'Мягков', 'Виталий', 'Олегович');
insert into rent.staff values (5, 'Симатов', 'Андрей', 'Анатольевич');


--delete from rent.objects where Object_ID > 0;

insert into rent.objects values (1,'ул. Ленина, 20','Чехов', '142300', 'Дом',3,1,1,0, true, false,true,true,true,true,true, 40000.5,20000);
insert into rent.objects values (2,'ул. Московская, 105','Чехов', '142300', 'Квартира',1,1,1,0, false, true,false,true,true,false,true, 15000,7500);
insert into rent.objects values (3,'ул. Ленина, 10','Серпухов', '142200', 'Квартира',1,1,1,0, false, true,false,true,true,false,true, 12000,6000);
insert into rent.objects values (4,'ул. Высотная, 17','Подольск', '142116', 'Дом',5,2,2,2, true, true,true,true,true,true,true, 80000,40000);
insert into rent.objects values (5,'ул. Весенняя, 41','Серпухов', '142200', 'Квартира',1,1,1,0, false, true,false,true,true,false,true, 12000,6000);

--select * from rent.objects;
--delete from rent.tenats where Tenant_ID>0;
insert into rent.tenats values (1,'Федотов А.С',null,null,null,null,'41-76-78',null,'8-905-1234',null);
insert into rent.tenats values (2,'Петров А.В.','ООО МИР','ул. Мира, 20','Чехов','142300',null,' 8 302378562','8-925-1234',null);
insert into rent.tenats values (3,'Иваненко А.Н.','ИП Иваненко','ул. Вишнёвая, 45','Серпухов','142200',null,' 8 34568562','8-925-7896',null);
insert into rent.tenats values (4,'Петров А.В.','ИППетров','ул. Ленина, 102','Чехов','142300',null,' 8 302456289','8-925-0000',null);
insert into rent.tenats values (5,'Яковлев Е.Н.',null,null,null,null,'48-96-31',null,'8-915-1111',null);



insert into treaties values (1,1,2,'2020-05-03','2020-08-30', '2020-05-03','2020-08-30',null,40000.5,1000,null);
insert into treaties values (2,5,1,'2020-01-30','2020-12-30', '2020-01-30','2020-12-28',null,40000.5,500,null);
insert into treaties values (3,5,3,'2020-09-01','2020-12-30', '2020-09-15','2020-12-30',null,12000,6000,null);
insert into treaties values (4,2,4,'2020-07-01','2020-12-30', '2020-07-01','2020-12-30',null,80000,40000,null);
insert into treaties values (5,3,5,'2020-07-01','2020-11-30', '2020-07-10','2020-11-30',null,12000,6000,null);



insert into orders values (1,'2020-09-01','2020-09-02',1,1,null);
insert into orders values (2,'2020-09-01','2020-09-02',2,2,null);
insert into orders values (3,'2020-09-01','2020-09-02',3,3,null);
insert into orders values (4,'2020-09-01','2020-09-02',4,4,null);
insert into orders values (5,'2020-09-01','2020-09-02',5,5,null);
insert into orders values (6,'2020-09-20','2020-09-30',5,5,null);


insert into Tasks values (1,101,'Ремонт смесителя',1);
insert into Tasks values (2,102,'Ремонт санузла',1);
insert into Tasks values (3,201,'Регулировка окна',1);
insert into Tasks values (4,202,'Регулировка дверей',1);
insert into Tasks values (5,301,'Уборка',2);



--select * from orders;

insert into REQUESTS values (1,'2020-09-20','12:00',1,'Поломка',1);
insert into REQUESTS values (2,'2020-09-20','10:00',1,'Поломка',2);
insert into REQUESTS values (3,'2020-09-20','12:00',1,'Поломка',3);
insert into REQUESTS values (4,'2020-09-20','12:00',1,'Поломка',4);
insert into REQUESTS values (5,'2020-09-20','19:00',1,'Поломка',5);

--select * from REQUESTS;
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
   group by o.object_type, o.object_city;


--7.1 маскировка
create view o_type as
   select ob.object_type "Тип объекта", ob.Object_City "Город",
     overlay( ob.Object_Address placing '***-**-**' from 4 for 16) "Адрес объекта"
     from objects ob
     where ob.Object_Address is not null;


/*
 create view supplier_v as

select s.сompany_title  "Название компании", s.contact_name "Контактное лицо",

overlay( s.phone_no placing '***-**-**' from 8 for 16) "Номер телефона"

from supplier s

where s.phone_no is not null
 */

 --6.1 Для сотрудников, у которых фамилия начинается на С изменить имя на Иван
update staff
   set staff_first_name ='Иван'
   where staff_last_name like 'С%';
select * from staff;

--6.2Удалить задачу 'Ремонт смесителя'

delete from tasks
    where task_description ='Ремонт смесителя';

select * from tasks;

--6.3 Вывести всю информацию о сотрудниках

select * from staff;



--6.4 Добавить новую задачу 'Уборка окон'

 insert into Tasks values (6,302,'Уборка окон',1);

select * from tasks;