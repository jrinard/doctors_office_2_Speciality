Set up database

CREATE DATABASE doctors_office;

/c doctors_office

CREATE TABLE doctors (id serial PRIMARY KEY, name varchar, specialty_id int);

CREATE TABLE patients (id serial PRIMARY KEY, name varchar, birthdate date, doctor_id int);

CREATE TABLE specialties (id serial PRIMARY KEY, specialty varchar);

CREATE DATABASE doctors_office_test WITH TEMPLATE doctors_office
