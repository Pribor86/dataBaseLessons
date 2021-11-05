
CREATE TABLE departments(
    depart_id INT NOT NULL PRIMARY KEY,
    depart_name CHAR(20) NOT NULL
);

CREATE TABLE education(
    edu_id INT NOT NULL PRIMARY KEY,
    edu_category CHAR(20) NOT NULL
);

CREATE TABLE employees(
    empl_id INT NOT NULL PRIMARY KEY,
    empl_depart_num INT NOT NULL REFERENCES departments(depart_id),
    empl_name CHAR(50) NOT NULL,
    empl_gender CHAR(1) DEFAULT 'M',
    empl_birthday DATE,
    empl_education INT REFERENCES education(edu_id),
    empl_position CHAR(30) NOT NULL
);



CREATE TABLE children(
    child_id INT NOT NUll PRIMARY KEY,
    empl_id INT NOT NULL REFERENCES employees(empl_id),
    child_name CHAR(50) NOT NULL,
    child_birthday DATE NOT NULL
);

INSERT INTO departments(depart_id, depart_name)
VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'Managers');

INSERT INTO education(edu_id, edu_category)
VALUES
('1', 'bachelor'),
('2', 'master'),
('3', 'doctor');

INSERT INTO employees(empl_id, empl_depart_num,
empl_name, empl_gender, empl_birthday, empl_education, empl_position)
VALUES
('1', '1', 'Valera Loginov', 'M', 
TO_DATE('1986-09-21', 'yyyy-mm-dd'), '3', 'Engener'),
('2', '2', 'Dmitry Ivanov', 'M', 
TO_DATE('1982-10-30', 'yyyy-mm-dd'), '2', 'Manager'),
('3', '1', 'Olesja Pavlova', 'F', 
TO_DATE('2000-08-10', 'yyyy-mm-dd'), '1', 'Programmer');

INSERT INTO children(child_id, empl_id, 
child_name, child_birthday)
VALUES
('1','1','Olivia',TO_DATE('2010-02-21', 'yyyy-mm-dd')),
('2','2','Mark',TO_DATE('2018-04-25', 'yyyy-mm-dd')),
('3','2','Denis',TO_DATE('2020-01-15', 'yyyy-mm-dd')),
('4','1','Vasilii',TO_DATE('2005-02-21', 'yyyy-mm-dd'));




-- сотрудников с детьми от 3 до 12 лет включительно;

SELECT empl_name, employees.empl_id, children.child_name
FROM employees, children
WHERE employees.empl_id = children.empl_id
AND 
children.child_birthday <= CURRENT_DATE - INTERVAL '3' YEAR
AND
children.child_birthday >= CURRENT_DATE - INTERVAL '12' YEAR;


-- отделов, в которых нет сотрудников.

SELECT departments.depart_id, departments.depart_name
FROM departments
LEFT JOIN employees
ON departments.depart_id = employees.empl_depart_num
WHERE employees.empl_id IS NULL;

--Посчитать количество сотрудников с разными уровнями образования.

SELECT education.edu_category, COUNT(employees.empl_id)
FROM education, employees
WHERE education.edu_id = employees.empl_education
GROUP BY education.edu_category;

--1. "Отделы и сотрудники" (поля обоих отношений без повторов).
CREATE VIEW departempl AS
SELECT employees.*, depart_name
FROM departments, employees
WHERE departments.depart_id = employees.empl_depart_num;

--"Бездетные сотрудники" (все поля отношения "Сотрудники").
CREATE VIEW withOutChildren AS
SELECT employees.empl_id, empl_depart_num,
empl_name, empl_gender, empl_birthday, empl_education, empl_position
FROM employees
LEFT JOIN children
ON employees.empl_id = children.empl_id
WHERE children.empl_id IS NULL;

--3. "Образовательный уровень сотрудников" (уровень образования, количе- ство мужчин, количество женщин).

CREATE VIEW educationlevel AS
SELECT edu_category, COUNT(CASE WHEN empl_gender = 'M' THEN 1 END) AS malecount, 
COUNT(CASE WHEN empl_gender = 'F' THEN 1 END) AS femalecount
FROM education, employees
WHERE education.edu_id = employees.empl_education
GROUP by edu_category;
