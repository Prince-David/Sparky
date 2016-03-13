drop table if exists staff;
create table staff (
    id integer primary key autoincrement,
    firstname text not null,
    lastname text not null,
    title text not null,
    speciality text
);

drop table if exists patient;
create table patient (
    id integer primary key autoincrement,
    username text not null,
    fhirid text not null
);

drop table if exists wardstaff;
create table wardstaff (
    id integer primary key autoincrement,
    wardid integer not null,
    staffid integer not null
);

drop table if exists patientward;
create table patientward (
    id integer primary key autoincrement,
    patientid integer, 
    wardid integer not null
);

insert into staff (firstname, lastname, title, speciality) 
VALUES 
('Sarah', 'Arthur', 'Doctor', 'Physician'),
('John', 'Smith', 'Doctor', 'Surgeon'),
('Sally', 'Webber', 'Nurse', 'Anesthetics'),
('Julia', 'Brown', 'Nurse', 'Cardio');

insert into patient (username, fhirid)
VALUES
('shondak','56cb4089b5d8bf3b53f5a114');

insert into wardstaff (wardid, staffid) 
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3);

insert into patientward (patientid, wardid) 
VALUES
(1,1);


