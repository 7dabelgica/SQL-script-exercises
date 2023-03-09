INSERT into users (first_name, last_name, email, password_hash)
values 
("ricardo", "teixeira", "ricardo@email.com", "012232435fvdsv"),
("maria", "carla", "maria@email.com", "112232435fvdsv"),
("pedro", "raul", "pedro@email.com", "212232435fvdsv"),
("viviane", "silva", "viviane@email.com", "312232435fvdsv"),
("roberto", "carlos", "roberto1@email.com", "412232435fvdsv");

UPDATE users u set salary = round(rand() * 10000, 2)
order by created_at DESC
limit 5;

INSERT into profiles (bio, description, user_id)
select 
CONCAT("bio de ", first_name),
CONCAT("description de ",first_name),
id 
from users
order by created_at desc
limit 5;

INSERT into users_roles (user_id, role_id)
select id,
(SELECT id from roles r order by RAND() limit 1) as qualquer
from users u
order by created_at DESC
limit 5;

SELECT * from users
order by created_at DESC
limit 5;

UPDATE users set salary = round(rand() * 10000, 2)
where id = 113;

DELETE from users_roles 
WHERE user_id = 5
and role_id = 4;

DELETE from users_roles
WHERE user_id = 32
and role_id = 3;

SELECT u.id uid, u.first_name, u.last_name, p.bio, p.description, p.id pId, ur.role_id from users u
join profiles p
on p.user_id = u.id
join users_roles ur
on ur.user_id = u.id;

SELECT u.id uid, u.first_name, u.last_name, p.bio, p.description, p.id pId, ur.role_id, u.salary from users u
join profiles p
on p.user_id = u.id
join users_roles ur
on ur.user_id = u.id
order by u.salary DESC;
