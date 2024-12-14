CREATE TABLE IF NOT EXISTS users
(user_id INT PRIMARY KEY AUTO_INCREMENT,
email_address VARCHAR(100),
first_name VARCHAR(45),
last_name VARCHAR(45)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS products
(product_id INT PRIMARY KEY,
product_name VARCHAR(45)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS downloads
(download_id INT PRIMARY KEY,
user_id INT,
download_date DATETIME,
filename VARCHAR(50),
product_id INT,
CONSTRAINT fk_downloads_users
FOREIGN KEY (user_id) REFERENCES user(user_id),
CONSTRAINT fk_downloads_products
FOREIGN KEY (product_id) REFERENCES products(product_id),
ENGINE;


insert into products values(1,'Local Music Vol. 1');
insert into products values(2,'Local Music Vol. 2');

insert into downloads values(1,1,now(),'pedals_are_falling.mp3',1);
insert into downloads values(2,2,now(),'turn_signal.mp3',1);
insert into downloads values(3,2,now(),'one_horse_town.mp3',2);

