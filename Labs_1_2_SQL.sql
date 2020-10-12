/*
Lab | SQL Intro
Instructions

1. Show tables in the database.
2. Explore tables. (select everything from each table)
3. Select one column from a table. Get film titles.
4. Select one column from a table and alias it. Get languages.
5. How many stores does the company have? How many employees? which are their names?
*/

use sakila;

#1. Show tables in the database.
show tables;

#2. Explore tables. (select everything from each table) - doing example for one
select * from actor;

#3. Select one column from a table. Get film titles.
select title from film;

#4. Select one column from a table and alias it. Get languages.
select name as language_name from sakila.language

#5. How many stores does the company have? How many employees? which are their names?
select count(*) FROM store;
select count(*) FROM staff;
select concat(first_name, ' ', last_name) as epm_name FROM staff; 


/*
Lab | SQL Queries 2
Instructions

1.Select all the actors with the first name ‘Scarlett’.
2.Select all the actors with the last name ‘Johansson’.
3.How many films (movies) are available for rent?
4.How many films have been rented?
5.What is the shortest and longest rental period?
6.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
7.What's the average movie duration?
8.What's the average movie duration expressed in format (hours, minutes)?
9.How many movies longer than 3 hours?
10.Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
11. What's the length of the longest film title?
*/

#1.Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor where  first_name in ("Scarlet");

#2.Select all the actors with the last name ‘Johansson’.
select * from sakila.actor where  last_name in ("Johansson");

#3.How many films (movies) are available for rent?
select count(title) from film;

#4.How many films have been rented?
select count(distinct inventory_id) from rental;

#6.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration, min(length) as min_duration from film;

#7.What's the average movie duration?
select avg(length) from film;

#8.What's the average movie duration expressed in format (hours, minutes)?
select concat( (floor(avg(length)/60)), 'h ',floor( mod(avg(length),60)), 'm' ) from film;

#9.How many movies longer than 3 hours?
select count(length) from film where length > 180;

#10.Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat( (left(first_name,1)), substr(lower(first_name),2), ' ',last_name, ' - ' ,lower(email) ) from customer;

#11. What's the length of the longest film title?
select max( length(title) ) from film;
