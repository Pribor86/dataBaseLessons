## No1. Создание и заполнение таблиц (отношений).

1. Отношение "Отделы" ("Номер отдела", "Название отдела"). 
```sql
CREATE TABLE departments(
    depart_id INT NOT NULL PRIMARY KEY,
    depart_name CHAR(20) NOT NULL
);
```
2. Отношение "Сотрудники" (основное):
![descpic](./descpic.png)
```sql
CREATE TABLE employees(
    empl_id INT NOT NULL PRIMARY KEY,
    empl_depart_num INT NOT NULL REFERENCES departments(depart_id),
    empl_name CHAR(50) NOT NULL,
    empl_gender CHAR(1) DEFAULT 'M',
    empl_birthday DATE,
    empl_education INT REFERENCES education(edu_id),
    empl_position CHAR(30) NOT NULL
);
```

3. Отношение "Дети" (внешний ключ к отношению "Сотрудники", "Имя", "Дата рождения").
```sql
CREATE TABLE children(
    child_id INT NOT NUll PRIMARY KEY,
    empl_id INT NOT NULL REFERENCES employees(empl_id),
    child_name CHAR(50) NOT NULL,
    child_birthday DATE NOT NULL
);
```

## No2. Выборка данных.
  Создать упорядоченные списки:
1. Сотрудников с детьми от 3 до 12 лет включительно;
2. Отделов, в которых нет сотрудников;
3. Посчитать количество сотрудников с разными уровнями образования;

## No3. Работа с представлениями.
  Создать представления:

1. "Отделы и сотрудники" (поля обоих отношений без повторов);
2. "Бездетные сотрудники" (все поля отношения "Сотрудники");
3. "Образовательный уровень сотрудников" (уровень образования, количе- ство мужчин, количество женщин);

