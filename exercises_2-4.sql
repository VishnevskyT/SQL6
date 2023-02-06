USE MyJoinsDB;					-- Завдання 2: Зайдите в базу данных “MyJoinsDB”, под созданным в предыдущем уроке пользователем. Проанализируйте, какие типы индексов заданы на созданных в предыдущем домашнем задании таблицах. 

SELECT * FROM general;

SELECT * FROM personal_data;

SELECT * FROM staff;

EXPLAIN SELECT * FROM general;				-- Завдання 3: Задайте свои индексы на таблицах, созданных в предыдущем домашнем задании и обоснуйте их необходимость.
EXPLAIN SELECT * FROM personal_data;

EXPLAIN SELECT * FROM staff WHERE person_id IN (2,4);

EXPLAIN SELECT * FROM staff WHERE position = 'manager';

CREATE INDEX position ON staff(position);


EXPLAIN SELECT * FROM general WHERE name = 'Izya';

ALTER TABLE general ADD UNIQUE (phone);

CREATE INDEX name ON general(name);

EXPLAIN SELECT * FROM personal_data WHERE person_id IN (1,3);


					-- Завдання 4: Создайте представления для таких заданий: 1. Необходимо узнать контактные данные сотрудников (номера телефонов, место жительства).

DROP VIEW contacts;

CREATE VIEW contacts
AS SELECT id, phone, address
FROM general
JOIN personal_data
WHERE general.id = personal_data.person_id;

SELECT * FROM contacts;

			-- Завдання 4: 2. Необходимо узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников.

DROP VIEW free_birthday;

CREATE VIEW free_birthday
AS SELECT name, birthday, phone
FROM general
JOIN personal_data
ON general.id = personal_data.person_id
WHERE personal_data.status = 'free'; 

SELECT * FROM free_birthday;

			-- 3. Необходимо узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.
            
DROP VIEW manager_view;

DROP VIEW manager_view;

CREATE VIEW manager_view
AS SELECT name, birthday, position, phone
FROM general
JOIN personal_data
ON general.id = personal_data.person_id
JOIN staff
ON general.id = staff.person_id
WHERE position = 'manager';

SELECT * FROM manager_view;