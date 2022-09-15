CREATE TABLE teachers (
id serial NOT NULL PRIMARY KEY,
employmentdate date NOT NULL,
name varchar (100) NOT NULL,
premium money NOT NULL DEFAULT 0,
	salary money NOT NULL,
	surname varchar (100) NOT NULL,
	CHECK (employmentdate >'1990.01.01'),
	CHECK (name !=''),
	CHECK (surname !=''),
CHECK (premium >= '0'),
	CHECK (salary > '0')
 );

	CREATE TABLE faculties (
    id serial NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL ,
    	UNIQUE (name),
    	CHECK (name != ''))
    	;

    	CREATE TABLE departmens (
        id serial NOT NULL PRIMARY KEY,
        name varchar(100) NOT NULL ,
        financing money DEFAULT 0 NOT NULL,
        	UNIQUE (name),
        	CHECK (financing > '0'))
        	;

        	CREATE TABLE groups (
            id serial NOT NULL PRIMARY KEY,
            name varchar(10) NOT NULL ,
            rating integer NOT NULL,
            	year integer NOT NULL,
            	UNIQUE (name),
            	CHECK (rating >=0 AND rating <=5),
            	CHECK (year >=1 AND year <=5)
            );

            SET lc_monetary TO "en_US.UTF-8";

INSERT INTO departmens VALUES (1,'Software Development','1000');
INSERT INTO departmens VALUES (2,'Chemistry','10000');
INSERT INTO departmens VALUES (3,'History','5000');
INSERT INTO departmens VALUES (4,'Physics','1000');
INSERT INTO departmens VALUES (5,'Mathematic','6000');
INSERT INTO gdepartmens VALUES (6,'Literature','9000');
INSERT INTO departmens VALUES (7,'Astronomy','80000');
INSERT INTO departmens VALUES (8,'Mechanics','800');
INSERT INTO departmens VALUES (9,'English language','100');
INSERT INTO departmens VALUES (10,'Geometry','1000');
INSERT INTO departmens VALUES (11,'German laungauge','100');


            INSERT INTO groups VALUES (1,'201',0,1);
            INSERT INTO groups VALUES (2,'211',0,2);
            INSERT INTO groups VALUES (3,'221',1,2);
            INSERT INTO groups VALUES (4,'171',1,3);
            INSERT INTO groups VALUES (5,'202',2,3);
            INSERT INTO groups VALUES (6,'181',2,1);
            INSERT INTO groups VALUES (7,'191',3,2);
            INSERT INTO groups VALUES (8,'161',4,5);
            INSERT INTO groups VALUES (9,'212',4,4);
            INSERT INTO groups VALUES (10,'162',5,1);
            INSERT INTO groups VALUES (11,'172',5,2);

            INSERT INTO teachers VALUES (1,'2010/1/26','Cемен',100,700,'Маркович');
            INSERT INTO teachers VALUES (2,'2010/1/26','Фима',100,700,'Петров');
            INSERT INTO teachers VALUES (3,'2010/1/26','Давид',300,700,'Штехель');
            INSERT INTO teachers VALUES (4,'2010/1/26','Давид',100,700,'Гоцман');
            INSERT INTO teachers VALUES (5,'2000-3-6','Виталий',100,700,'Кречетов');
            INSERT INTO teachers VALUES (6,'2020-8-15','Антонина',100,700,'Царько');
            INSERT INTO teachers VALUES (7,'2018-7-9','Ида',100,700,'Кашетинская');

            INSERT INTO faculties VALUES (1,'Computer Science');
            INSERT INTO faculties VALUES (2,'Faculty of Mathematics');
            INSERT INTO faculties VALUES (3,'Faculty of Natural Sciences');

            ALTER TABLE faculties ADD COLUMN dean  text NOT NULL DEFAULT 'Виктор Ивунин';

SELECT * FROM departmens ORDER BY name ASC; //Вывести таблицу кафедр, но расположить ее поля в обратном порядке.
SELECT (name || ' group')AS Название_группы,rating AS рейтинг FROM groups; //Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы
ALTER TABLE teachers ADD COLUMN isAssistant  boolean NOT NULL DEFAULT false;
ALTER TABLE teachers ADD COLUMN isProfessor  boolean NOT NULL DEFAULT false;
ALTER TABLE teachers ADD COLUMN position varchar (30) NOT NULL DEFAULT ' ';
ALTER TABLE teachers ADD COLUMN rate money NOT NULL DEFAULT '0';


UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'преподаватель',rate='50' WHERE id =1;
UPDATE teachers SET isAssistant = false,isProfessor=true,position = 'профессор',rate='300' WHERE id =2;
UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'преподаватель',rate='50' WHERE id =3;
UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'преподаватель',rate='50' WHERE id =4;
UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'преподаватель',rate='50' WHERE id =5;
UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'завуч',rate='50' WHERE id =6;
UPDATE teachers SET isAssistant = true,isProfessor=false,position = 'преподаватель',rate='50' WHERE id =7;

UPDATE teachers SET salary=rate+premium WHERE id =1;
UPDATE teachers SET salary=rate+premium WHERE id =2;
UPDATE teachers SET salary=rate+premium WHERE id =3;
UPDATE teachers SET salary=rate+premium WHERE id =4;
UPDATE teachers SET salary=rate+premium WHERE id =5;
UPDATE teachers SET salary=rate+premium WHERE id =6;
UPDATE teachers SET salary=rate+premium WHERE id =7;



SELECT surname,((rate/premium)*100) AS Отношение_cтавки_к_надбавке FROM teachers;
--процент ставки по отношению к надбавке

SELECT surname,((rate/salary)*100) AS Отношение_cтавки_к_зарплате FROM teachers;
-- процент ставки по отношению  к зарплате (сумма ставки и надбавки)

SELECT concat ('The dean of faculty ', name ,' is ',dean) AS Таблица_факультетов FROM faculties;
--Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [facult

SELECT surname FROM teachers WHERE rate>'200' AND isprofessor=true;
--Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 200.

SELECT name FROM departmens WHERE financing <'11000' OR financing >'25000';
--Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.

SELECT name FROM faculties WHERE name != 'Computer
Science';
--Вывести названия факультетов кроме факультета “Computer Science”.

SELECT surname,position  FROM teachers WHERE isprofessor=false;
--Вывести фамилии и должности преподавателей, которые не являются профессорам

SELECT surname,position,rate,premium  FROM teachers WHERE isAssistant=true AND premium>'160' AND premium <'550';
--Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550

SELECT surname,rate  FROM teachers WHERE isAssistant=true ;
--Вывести фамилии и ставки ассистентов

SELECT surname,position  FROM teachers WHERE employmentdate<'2010.01.01';
--Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2010.

SELECT name AS Name_of_Department FROM departmens WHERE name < 'Software Development' ORDER BY name ASC ;
--Вывести названия кафедр, которые в алфавитном порядке
--  располагаются до кафедры “Software Development”. Выводимое поле должно иметь название “Name of Department

SELECT surname  FROM teachers WHERE isAssistant=true AND salary<='1200';
--Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200

SELECT name FROM groups WHERE (rating >=2 AND rating<=4) AND year=5;
--Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4

SELECT surname  FROM teachers WHERE isAssistant=true AND (rate <'1200' AND premium < '200');
--Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.