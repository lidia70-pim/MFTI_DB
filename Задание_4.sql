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