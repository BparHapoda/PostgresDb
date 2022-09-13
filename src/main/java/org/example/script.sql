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

	CREATE TABLE faculties    (
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
