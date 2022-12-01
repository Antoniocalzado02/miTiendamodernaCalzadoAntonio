CREATE DATABASE tienda;

CREATE USER 'javier'@'%' IDENTIFIED BY 'martinez';
GRANT ALL PRIVILEGES ON tienda.* to 'javier'@'%';

CREATE TABLE tienda.USER (
user_name	varchar(50),
password	varchar(50),
complete_name	varchar(50),
birthday	date,
gender		varchar(50),
admin		varchar(50)
);

ALTER TABLE tienda.USER ADD PRIMARY KEY (user_name);

CREATE TABLE tienda.CATEGORY (
id_cat		int,
name		varchar(30), 
description 	varchar(255)
);

ALTER TABLE tienda.CATEGORY ADD PRIMARY KEY (id_cat);


CREATE TABLE tienda.ARTICLE (
id 		int,
name 		varchar(40),
description 	varchar(255), 
price 		double,
id_cat 		int 
);

ALTER TABLE tienda.ARTICLE ADD stock int;
alter TABLE tienda.ARTICLE add img blob;
ALTER TABLE tienda.ARTICLE ADD PRIMARY KEY (id);
ALTER TABLE tienda.ARTICLE ADD FOREIGN KEY (id_cat) REFERENCES tienda.CATEGORY(id_cat);


CREATE TABLE tienda.BUY(
id_article	int,
user_name	varchar(50),
price 		double,
buy_date	datetime
);

alter table tienda.BUY add constraint pk_tienda.BUY primary key (id_article,user_name,buy_date);
alter table tienda.BUY add constraint fk_tienda.BUY foreign key (id_article) references tienda.ARTICLE(id);
alter table tienda.BUY add constraint fk_tienda.BUY2 foreign key (user_name) references tienda.USER(user_name);
alter TABLE tienda.BUY add cant int;
ALTER TABLE tienda.BUY DROP PRIMARY KEY, ADD PRIMARY KEY (id_article, user_name, buy_date) USING BTREE;




insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ugammon0', MD5('RhPSyNNCwU'), 'Ulises','2022-04-05', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('sandrichuk1', MD5('WVWId7Q'), 'Staci','2022-08-02', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('bstrickett2', MD5('GImdMnQ5If1q'), 'Basilius','2022-07-26', 'M', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('smckerlie3', MD5('lBLcrsVD1c'), 'Starlene','2021-12-21', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ssmithyman4', MD5('H2tJbE'), 'Skipper','2021-12-25', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('lhaukey5', MD5('nMnklCiT'), 'Leonard','2021-12-14', 'M', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('gmorratt6', MD5('w85TlGHp'), 'Gaye','2022-03-13', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('gguyonnet7', MD5('OAmJToS'), 'Gale','2022-08-10', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('cfensome8', MD5('pQoh5U36Zy'), 'Concettina','2022-06-18', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('bgilliatt9', MD5('Tq5CMukj'), 'Babara','2022-03-09', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('lstoadea', MD5('iTkrNyEy1PSN'), 'Leshia','2022-06-25', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('kbrameltb', MD5('pCeLS1iNG0Yv'), 'Kacie', '2022-01-19', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('rtreanorc', MD5('6orZIjyye'), 'Roland', '2022-06-26', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ajeandilloud', MD5('e7BUfD4Y'), 'Ailina',  '2022-02-14', 'F', true);


insert into tienda.CATEGORY (id_cat, name, description) values (1, 'video/x-mpeg', 'Etiam vel augue.');
insert into tienda.CATEGORY (id_cat, name, description) values (2, 'video/msvideo', 'Vestibulum sed magna at nunc commodo placerat.');
insert into tienda.CATEGORY (id_cat, name, description) values (3, 'application/pdf', 'Pellentesque at nulla.');
insert into tienda.CATEGORY (id_cat, name, description) values (4, 'video/x-mpeg', 'Integer tincidunt ante vel ipsum.');
insert into tienda.CATEGORY (id_cat, name, description) values (5, 'application/powerpoint', 'In hac habitasse platea dictumst.');
insert into tienda.CATEGORY (id_cat, name, description) values (6, 'application/powerpoint', 'Nunc rhoncus dui vel sem.');
insert into tienda.CATEGORY (id_cat, name, description) values (7, 'application/x-msexcel', 'Suspendisse ornare consequat lectus.');
insert into tienda.CATEGORY (id_cat, name, description) values (8, 'audio/mpeg3', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into tienda.CATEGORY (id_cat, name, description) values (9, 'video/mpeg', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.');
insert into tienda.CATEGORY (id_cat, name, description) values (10, 'application/pdf', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into tienda.CATEGORY (id_cat, name, description) values (11, 'video/quicktime', 'Nullam sit amet turpis elementum ligula vehicula consequat.');
insert into tienda.CATEGORY (id_cat, name, description) values (12, 'image/png', 'Nulla justo.');
insert into tienda.CATEGORY (id_cat, name, description) values (13, 'application/mspowerpoint', 'Vestibulum sed magna at nunc commodo placerat.');
insert into tienda.CATEGORY (id_cat, name, description) values (14, 'application/excel', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.');
insert into tienda.CATEGORY (id_cat, name, description) values (15, 'video/x-msvideo', 'Integer tincidunt ante vel ipsum.');





insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (1, 'Tampflex', 'Phasellus id sapien in sapien iaculis congue.', 6946.67, 13, 85);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (2, 'Job', 'Curabitur convallis.', 2422.74, 6, 99);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (3, 'Aerified', 'Mauris sit amet eros.', 3513.78, 14, 25);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (4, 'Tres-Zap', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 7239.61, 11, 56);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (5, 'Zoolab', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 8945.04, 6, 76);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (6, 'Bitchip', 'Nulla suscipit ligula in lacus.', 3727.74, 14, 85);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (7, 'Andalax', 'Etiam pretium iaculis justo.', 1259.56, 8, 79);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (8, 'Veribet', 'Donec quis orci eget orci vehicula condimentum.', 9186.58, 8, 76);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (9, 'Konklab', 'Curabitur gravida nisi at nibh.', 8568.99, 11, 48);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (10, 'Y-Solowarm', 'In hac habitasse platea dictumst.', 2263.45, 6, 21);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (11, 'Matsoft', 'Vestibulum sed magna at nunc commodo placerat.', 1790.42, 10, 63);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (12, 'Duobam', 'Phasellus sit amet erat.', 4966.14, 15, 5);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (13, 'Aerified', 'Pellentesque eget nunc.', 9458.52, 4, 94);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (14, 'Pannier', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 3916.03, 2, 54);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (15, 'Vagram', 'Etiam faucibus cursus urna.', 4144.6, 14, 22);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (16, 'Voltsillam', 'Nam nulla.', 5621.99, 4, 34);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (17, 'Home Ing', 'In congue.', 8058.71, 8, 58);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (18, 'Bitchip', 'Integer a nibh.', 7505.92, 2, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (19, 'Tampflex', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 1216.9, 9, 33);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (20, 'Tin', 'In hac habitasse platea dictumst.', 6246.18, 9, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (21, 'Daltfresh', 'Suspendisse potenti.', 9793.61, 2, 69);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (22, 'Prodder', 'Cras non velit nec nisi vulputate nonummy.', 9184.68, 14, 18);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (23, 'Namfix', 'Fusce consequat.', 3162.81, 13, 99);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (24, 'Tempsoft', 'In quis justo.', 3872.99, 7, 82);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (25, 'Sub-Ex', 'Duis consequat dui nec nisi volutpat eleifend.', 9507.74, 2, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (26, 'Y-Solowarm', 'Sed sagittis.', 4175.64, 5, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (27, 'Job', 'Nulla justo.', 8276.29, 2, 23);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (28, 'Quo Lux', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 4424.52, 2, 4);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (29, 'Redhold', 'Nunc purus.', 7096.51, 8, 65);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (30, 'Lotstring', 'Integer tincidunt ante vel ipsum.', 1850.57, 7, 36);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (31, 'Tampflex', 'Donec vitae nisi.', 5246.26, 8, 16);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (32, 'Bitchip', 'Quisque porta volutpat erat.', 427.97, 9, 81);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (33, 'Domainer', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 5439.0, 2, 62);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (34, 'Viva', 'Nam nulla.', 4322.53, 7, 83);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (35, 'Opela', 'Vivamus in felis eu sapien cursus vestibulum.', 7647.7, 3, 1);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (36, 'Sub-Ex', 'Integer non velit.', 5263.12, 6, 45);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (37, 'Flexidy', 'Duis mattis egestas metus.', 9275.09, 8, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (38, 'Pannier', 'Nulla mollis molestie lorem.', 3863.65, 6, 28);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (39, 'Holdlamis', 'In hac habitasse platea dictumst.', 2035.09, 10, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (40, 'Flowdesk', 'Etiam vel augue.', 6770.54, 13, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (41, 'Viva', 'Mauris sit amet eros.', 3116.72, 6, 53);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (42, 'Fintone', 'Fusce posuere felis sed lacus.', 8719.11, 15, 19);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (43, 'Kanlam', 'Donec vitae nisi.', 8071.33, 9, 14);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (44, 'Voyatouch', 'Donec semper sapien a libero.', 3984.52, 1, 23);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (45, 'It', 'Duis at velit eu est congue elementum.', 8183.92, 15, 91);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (46, 'Ventosanzap', 'Donec posuere metus vitae ipsum.', 9630.82, 14, 13);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (47, 'Asoka', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 6011.26, 6, 70);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (48, 'Bytecard', 'Vivamus tortor.', 7254.45, 12, 84);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (49, 'Temp', 'Vestibulum sed magna at nunc commodo placerat.', 9061.4, 1, 18);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (50, 'Sonair', 'In hac habitasse platea dictumst.', 1827.42, 9, 60);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (51, 'Bigtax', 'Morbi quis tortor id nulla ultrices aliquet.', 6758.25, 10, 28);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (52, 'Otcom', 'Nunc rhoncus dui vel sem.', 689.96, 11, 34);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (53, 'Pannier', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 9723.17, 10, 55);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (54, 'Home Ing', 'Nulla nisl.', 329.75, 1, 66);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (55, 'Transcof', 'Curabitur at ipsum ac tellus semper interdum.', 739.92, 10, 33);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (56, 'Opela', 'Vestibulum ac est lacinia nisi venenatis tristique.', 5732.14, 5, 43);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (57, 'Keylex', 'Suspendisse potenti.', 1064.38, 9, 80);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (58, 'Solarbreeze', 'Duis ac nibh.', 4651.28, 14, 67);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (59, 'Bytecard', 'Vestibulum sed magna at nunc commodo placerat.', 4977.28, 12, 66);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (60, 'Ronstring', 'Nunc rhoncus dui vel sem.', 7506.87, 7, 38);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (61, 'Solarbreeze', 'Mauris ullamcorper purus sit amet nulla.', 995.83, 2, 78);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (62, 'Sonair', 'Maecenas pulvinar lobortis est.', 3265.19, 6, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (63, 'Gembucket', 'In blandit ultrices enim.', 3714.77, 12, 46);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (64, 'Keylex', 'Etiam justo.', 9207.87, 12, 52);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (65, 'Voltsillam', 'Nunc rhoncus dui vel sem.', 4357.92, 13, 55);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (66, 'Sonair', 'Vivamus vestibulum sagittis sapien.', 708.5, 6, 77);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (67, 'Flowdesk', 'Vivamus tortor.', 6721.28, 13, 28);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (68, 'Subin', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 6121.75, 6, 60);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (69, 'Transcof', 'Duis aliquam convallis nunc.', 3064.37, 12, 86);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (70, 'Span', 'Phasellus id sapien in sapien iaculis congue.', 5444.41, 7, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (71, 'Tresom', 'In hac habitasse platea dictumst.', 779.24, 11, 46);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (72, 'Toughjoyfax', 'Maecenas ut massa quis augue luctus tincidunt.', 8774.27, 6, 4);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (73, 'Stronghold', 'Nullam molestie nibh in lectus.', 3584.0, 15, 75);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (74, 'Tampflex', 'Mauris lacinia sapien quis libero.', 3679.74, 1, 33);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (75, 'Konklab', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 7537.96, 4, 17);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (76, 'Regrant', 'Praesent lectus.', 2562.94, 9, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (77, 'Transcof', 'In eleifend quam a odio.', 5130.9, 6, 82);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (78, 'Toughjoyfax', 'Praesent id massa id nisl venenatis lacinia.', 6474.25, 7, 95);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (79, 'Bitchip', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 9667.96, 3, 95);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (80, 'Hatity', 'Aliquam sit amet diam in magna bibendum imperdiet.', 7043.28, 10, 45);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (81, 'Namfix', 'Mauris ullamcorper purus sit amet nulla.', 3400.07, 1, 13);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (82, 'Tampflex', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 377.79, 2, 22);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (83, 'Rank', 'Aliquam non mauris.', 3124.65, 15, 54);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (84, 'Bitwolf', 'Proin eu mi.', 7575.2, 4, 86);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (85, 'Wrapsafe', 'Pellentesque viverra pede ac diam.', 3365.09, 9, 90);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (86, 'Sub-Ex', 'Quisque porta volutpat erat.', 5522.97, 2, 62);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (87, 'Kanlam', 'Integer ac neque.', 2361.53, 15, 36);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (88, 'Bitwolf', 'Etiam justo.', 9770.9, 2, 89);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (89, 'Asoka', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 6654.21, 10, 99);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (90, 'Tres-Zap', 'In congue.', 1135.44, 1, 27);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (91, 'Bytecard', 'Nulla facilisi.', 7810.95, 9, 68);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (92, 'Namfix', 'Donec posuere metus vitae ipsum.', 2508.64, 14, 93);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (93, 'Sonair', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 6692.6, 1, 56);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (94, 'Otcom', 'Nullam porttitor lacus at turpis.', 9830.91, 10, 32);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (95, 'Opela', 'Pellentesque eget nunc.', 5567.91, 14, 100);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (96, 'Daltfresh', 'Phasellus id sapien in sapien iaculis congue.', 9223.33, 2, 33);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (97, 'Konklux', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 7764.51, 14, 23);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (98, 'Fix San', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 3179.31, 8, 80);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (99, 'Y-find', 'Cras in purus eu magna vulputate luctus.', 3359.94, 14, 21);
insert into tienda.ARTICLE (id, name, description, price, id_cat, stock) values (100, 'Y-find', 'Maecenas ut massa quis augue luctus tincidunt.', 345.65, 13, 46);