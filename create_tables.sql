create table users
(
    id            serial,
    username      text,
    picture       text,
    email         text,
    password_hash text,
    client_id     text,
    login_type    text
);

create table category
(
    id          serial,
    name        text,
    description text
);

create table item
(
    id          serial,
    categoryid  integer,
    name        text,
    description text,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_id   text
);
