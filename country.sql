SET SQL_SAFE_UPDATES=0;

-- Creating database
create database country;

use country;

-- country_detail table
--     id  integer primary key, 
--     name varchar(20) not null,
--     capital varchar(20) ,
--     currency varchar(3),
--     size(km2) decimal(10,5),
--     is_democracy boolean

-- Creating table
create table country_detail(
	id 			integer   		primary key,
    name 		varchar(20) 	not null,
    capital 	varchar(30),
    currency    varchar(3),
    size_km_square decimal(10,5),
    is_democracy 	boolean
);

select * from country_detail;

desc country_detail;

-- Altering the table
Alter table country_detail modify currency varchar(20);
desc country_detail;

Alter table country_detail add continent varchar(20);
desc country_detail;

Alter table country_detail drop capital ;
desc country_detail;

Alter table  country_detail modify size_km_square decimal(30,5);

-- Inserting the data
-- id , name , currency, size_km_square, is_democracy, continent
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
						value( 1, 'INDIA', 'Indian Rupee' , 80000.234, 1, 'Asia');
-- Error Code: 1264. Out of range value for column 'size_km_square' at row 1	
				
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
						value( 2, 'Nepal', 'Nepali Rupee' , 8000.234, 1, 'Asia');
                        
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (3, 'Argentina', 'Peso' , 78965.234, 1, 'South America'),
							(4, 'Canada', 'Canadian Dollar' , 23888.234, 1, 'North America');


insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (5, 'Singapore', 'Singapore Dollar' , 789.234, 1, 'Africa');
                      
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (6, 'Spain', 'Euro' , 7895.234, 1, 'Euproe'),
							(7, 'France', 'Rupee' , 23888.234, 1, 'Asia');
                            
select * from country_detail;

update country_detail
	set continent = "Asia" where id =5 ;
    
update country_detail
	set currency = "Euro" , continent = 'Europe'
    where id = 7 ;

update country_detail
	set currency = "Euro" , continent = 'Europe'
    where name = 'France' ;
    
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

select * from country_detail;


-- Questions
-- 1.  How many countries do we have in our records?
-- 2.  How many countries have currency with Euro?
-- 3. Which country have size greater than 50000 km square?
-- 4. Which country is  not decomcratic?
-- 5. Which country is in North america?
-- 6. How many country are there in Asia?
-- 7. Get the countries,size_km_suare and continent in decreasing order of size?

-- Solutions

-- 1.  How many countries do we have in our records?
-- All records are unique.
-- 7 countries in our record.

select * from country_detail;
select count(*) from country_detail;

-- count , question is about how many or where you need to provide count of something  [Count]

-- 2.  How many countries have currency with Euro?
-- 2 countries with currency Euro
select * 
	from country_detail 
where currency = 'Euro';

select count(*) from country_detail where currency = 'Euro';

-- 3. Which country have size greater than 50000 km square?

select
	name
from country_detail
where size_km_square > 50000;

-- 4. Which country is  not decomcratic?

select 
	name
from country_detail
	where is_democracy = 0;

-- 5. Which country is in North america?

select 
	name
from country_detail
	where continent = 'North America';

-- 6. How many country are there in Asia?
-- 3 countries

select 
	name 
from country_detail
	where continent = 'Asia';
    
select 
	count(name) 
from country_detail
	where continent = 'Asia';
    
-- 7. Get the countries,size_km_suare and continent in decreasing order of size?

select 
	name,
    size_km_square,
    continent
from country_detail
	order by size_km_square desc ;