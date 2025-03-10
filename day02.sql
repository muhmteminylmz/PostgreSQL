/*==========================DELETE==================================


DML Grubundan ==> DELETE komutu Tablonun İcindeki Veriyi Siler.


Syntax:
------

delete from tablo_adi where şart;

=====================================================================*/

create table kursiyerler
(
id int,
isim varchar(20),
adres varchar(15),
sinav_notu int
);


insert into kursiyerler values(10, 'Arif Can', 'Burdur', 75);
insert into kursiyerler values(11, 'Vural Tur', 'Trabzon', 95);
insert into kursiyerler values(12, 'Aylin Tan', 'Bursa', 90);
insert into kursiyerler values(13, 'Derya Soylu', 'Istanbul', 80);
insert into kursiyerler values(14, 'Yavuz Bal', 'Ankara', 85);
insert into kursiyerler values(15, 'Eren Tan', 'Hatay', 90);
insert into kursiyerler values(16, 'Harun Reşit', 'Isparta', 100);
insert into kursiyerler values(17, 'Behlül Dana', 'Afyon', 100);

select * from kursiyerler;

--SORU1: kursiyerler tablosundaki sinav_notu 75 olan satırı siliniz

delete from kursiyerler where sinav_notu = 75;

--SORU2: kursiyerler tablosundaki adres'i 'Trabzon' olan satırı siliniz

delete from kursiyerler where adres = 'Trabzon';

--SORU3: kursiyerler tablosundaki isim'i 'Derya Soylu' veya 'Yavuz Bal' olan satırları siliniz

delete from kursiyerler where isim in('Derya Soylu','Yavuz Bal');

delete from kursiyerler where isim = 'Derya Soylu' or isim = 'Yavuz Bal');

--SORU4: kursiyerler tablosundaki sinav_notu 100 den küçük olan satırları siliniz

delete from kursiyerler where sinav_notu < 100;

select * from kursiyerler;

--SORU5: kursiyerler tablosundaki tüm verileri siliniz

delete from kursiyerler;

--SORU6: kursiyerler tablosunu siliniz

drop table kursiyerler;

/*==========================UPDATE===========================


DML Grubundan ==> UPDATE komutu Tablodaki Veriyi Günceller


Syntax:
------

update tablo_adi set sutun_adi=yeni_deger where şart;


==============================================================*/

create table film
(
film_no int,
film_ismi varchar(30),
film_turu varchar(30)
);

insert into film values (100, 'Eyvah Eyvah', 'Komedi');
insert into film values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into film values (300, 'Eltilerin Savasi', 'Komedi');
insert into film values (400, 'Aile Arasinda', 'Komedi');
insert into film values (500, 'GORA', 'Bilim Kurgu');
insert into film values (600, 'Organize Isler', 'Komedi');
insert into film values (700, 'Babam ve Oglum', 'Dram');

select * from film;

-- SORU1: film_no'su 300 olan film'in 
--film_ismi'ni 'Recep İvedik' olarak güncelleyeniz.

update film set film_ismi = 'Recep Ivedik' where film_no = 300 ;

--  SORU2: film tablosundaki tüm film_turu'nu 'Aksiyon' olarak güncelleyeniz.

update film set film_turu = 'Aksiyon';

-- SORU3: film_no'su 100 olan film'in 
--film_ismi'ni 'Cakallarla Dans' , film_turu'nu 'Komedi' olarak güncelleyiniz.

update film set film_ismi = 'Cakallarla Dans' , film_turu = 'Komedi' where film_no = 100;

-- SORU4: film_ismi 'Babam ve Oglum' olan film'in
--film_turu'nu 'Dram' olarak güncelleyiniz.

update film set film_turu = 'Dram' where film_ismi = 'Babam ve Oglum';

select * from film;

-- SORU5: film tablosundaki 'GORA' olan değeri,
-- 'AROG' olarak güncelleyiniz.

update film set film_ismi = 'AROG' where film_ismi = 'GORA';

-- SORU6: film tablosundaki film_no değeri 300'den büyük olanların,
 --film_no'sunu 1 artırarak güncelleyiniz.

update film set film_no = 1 + film_no where film_no > 300;

select * from film;

/*============================ALTER==================================

DDL Grubundan==> ALTER komutu tabloyu günceller.


add column ==> yeni sutun ekleyerek tabloda güncellemeler yapar

drop column ==> mevcut olan sutunu silerek tabloda güncellemeler yapar

rename column ==> sutunun ismini degistirerek tabloda güncellemeler yapar       

rename ==> tablonun ismini degistirerek tabloda güncellemeler yapar 


Syntax:
-------

alter table tablo_adi güncelleme;

=====================================================================*/

create table arabalar
(
id int,
marka varchar(20),
model varchar(20),
vites varchar(20),
fiyat int
);


insert into arabalar values(1,'Mercedes','C180','Otomatik',900000);
insert into arabalar values(2,'Toyota','Corolla','Otomatik',400000);
insert into arabalar values(3,'Honda','Civic','Otomatik',500000);
insert into arabalar values(4,'Citroen','C3','Manuel',450000);

select * from arabalar;

--SORU1: arabalar tablosuna kilometre varchar(10) seklinde yeni sutun ekleyiniz

alter table arabalar add column kilometre varchar(10); --column koymasamda çalışıyor

--SORU2: arabalar tablosuna  yas int seklinde yeni sutun ekleyiniz

alter table arabalar add column yas int;

--update arabalar set yas = 32 where id = 1;

--SORU3: arabalar tablosundan vites sutununu siliniz

alter table arabalar drop column vites;

select * from arabalar;

--SORU4: arabalar tablosundaki fiyat sutununun ismini bedel olarak güncelleyiniz

alter table arabalar rename column fiyat to bedel;

--SORU5: arabalar tablosunun ismini galeri olarak güncelleyiniz

alter table arabalar rename to galeri;

select * from galeri;