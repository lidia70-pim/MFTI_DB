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