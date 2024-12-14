create table customer(driver_id varchar(20) 
primary key, driver_name varchar(50), address 
varchar(100));

create table car(license varchar(20) 
primary key, model varchar(20), year int,driver_id varchar(20),FOREIGN KEY(driver_id) REFERENCES customer(driver_id));

create table accident(report_number varchar(20)
 primary key, accident_date date, location 
 varchar(50));

create table participated(driver_id varchar(20),license 
varchar(20), report_number 
varchar(20),damage_amount int,
primary key(driver_id,license,report_number),
FOREIGN KEY(driver_id)
REFERENCES customer(driver_id),FOREIGN KEY(license)
 REFERENCES car(license),FOREIGN KEY(report_number) 
 REFERENCES accident(report_number));

