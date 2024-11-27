
/*----------------------------FOREIGN KEY---------------------------------------------------

	FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
	Böylelikle, tablolar arasında parent - child ilişkisi oluşur.
	
	FOREIGN KEY'in bulundugu tablo Child tablodur.
	PRIMARY KEY'in bulundugu tablo ise Parent tablodur.

	FOREIGN KEY KISITLAMASI SAYESİNDE:
	---------------------------------
	
	1-) parent tabloda olmayan primary key ile, child tabloya veri girişi yapılamaz.
	(child tablo null deger kabul eder)

	2-) child tablodaki veri silinmeden, parent tablodaki veri silinemez

	3-) child tablo silinmeden, parent tablo silinemez
----------------------------------------------------------------------------------------------*/


create table hastaneler
(
hastane_adi varchar(30) PRIMARY KEY,
adres varchar(30),
alan_kodu int
);
insert into hastaneler values('Meddem', 'Isparta', '0246');
insert into hastaneler values('Sifa', 'Ankara', '0236');
insert into hastaneler values('Davraz', 'Istanbul', '0216');
insert into hastaneler values('Deva', 'Antalya', '0242');


create table doktorlar
(
gorev_yeri varchar(30),
doktor_adi varchar(30),
diploma_no int,
brans_adı varchar(30),

CONSTRAINT fk FOREIGN KEY(gorev_yeri) REFERENCES hastaneler(hastane_adi)	
	
);	
insert into doktorlar values('Meddem', 'Hasan Bal', '123456', 'psikiyatri');
insert into doktorlar values('Sifa', 'Vedat Sen', '123865', 'pediatri');
insert into doktorlar values('Davraz', 'Huseyin Oz', '123568', 'noroloji');
insert into doktorlar values('Deva', 'Ahmet Kar', '123852', 'dahiliye');
insert into doktorlar values('Meddem', 'Hakan Kar', '123369', 'dermatoloji');
insert into doktorlar values('Sifa', 'Ramiz Kara', '123147', 'anestezi');
insert into doktorlar values('Davraz', 'Okan Pul', '123147', 'ortopedi');


select * from doktorlar;

--SORU 1: doktorlar tablosuna gorev_yeri 'Meddem' olan veri girişi yapınız

insert into doktorlar values('Meddem','Burcu',147852,'noroloji');

--SORU 2: .doktorlar tablosuna gorev_yeri 'Okmeydanı' olan veri girişi yapınız.
--parent tabloda olmayan primary key ile child tabloya veri girisi yapılamaz.
insert into doktorlar values('Okmeydan','Hatice Kar',159741,'ortopedi');

select * from doktorlar;

--SORU 3: doktorlar tablosuna gorev_yeri null olan veri girişi yapınız
--> child tablo null deger kabul eder

insert into doktorlar values(null,'Mehmet',758964,'noroloji');

--SORU 4: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz. 

--> child tablodaki veri silinmeden parent tablodaki veri silinemez
delete from hastaneler where hastane_adi = 'Meddem';

--SORU 5: doktorlar tablosundaki gorev_yeri 'Meddem' olan verileri siliniz

delete from doktorlar where gorev_yeri = 'Meddem';

select * from doktorlar;

--SORU 6: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz. 

delete from hastaneler where hastane_adi = 'Meddem';

select * from doktorlar;

--SORU 7: .hastaneler tablosunu siliniz. 

--> child tablo silinmeden parent tablo silinemez;
drop table hastaneler;

select * from doktorlar;

--SORU 8: doktorlar tablosunu siliniz 

drop table doktorlar;

--SORU 9: .hastaneler tablosunu siliniz. 

drop table hastaneler;



/*--------------------ON DELETE CASCADE---------------------------------------------


ON DELETE CASCADE komutu sayesinde;

 
Direk parent tablodaki veriyi silebiliyoruz

Ayrıca,

Direk parent tabloyu silebiliyoruz

Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutu yazmamız yeterli

-------------------------------------------------------------------------------------*/

CREATE TABLE parent 
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent VALUES (104, 'Apple', 'Mick Jackson');



CREATE TABLE child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),

CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
ON DELETE CASCADE

);    
    
INSERT INTO child VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from parent;

--SORU1: parent tablosundaki tum verileri siliniz  

delete from parent;

--> ON DELETE CASCADE sayesinde child tablodaki veri silinmeden Parent tablodaki
--> veri silinmeye calisildiginda error vermez.
-->Fakat bu durumda Child tablodaki veri de silinir.

--SORU2: parent tablosunu siliniz..

drop table parent cascade;

--SORU3: child tablosunu siliniz

drop table child;


-- ÖZET
/*

FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILMAZSA

1-) Child tablo silinmeden Parent tablo silinmeye çalışıldıgında PgAdmin Eror verir.
yani Child tablo silinmeden Parent tablo silinemez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında Pg Admin Eror verir.
yani Child tablodaki veri silinmeden Parent tablodaki veri silinemez






FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
PgAdmin Eror vermez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında PgAdmin Eror vermez
Parent tablodaki veriyi siler.
Fakat bu durumda Child tablodaki veride silinir.

*/





















/*------------ AGGREGATE METHOD KULLANIMI ---------------------------

AGGREGATE METHODLARI:  Tek bir deger elde etmek istedigimizde kullanılır.

sum() ==>   Verilerin toplamını alır.
count() ==> Verilerin sayisini alır.
min() ==>   Verilerden en kücük degeri alır.
max() ==>   Verilerden en büyük degeri alır.
avg() ==>   Verilerin ortalamasını alır.

--------------------------------------------------------------------*/


create table arac
(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);

insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

select * from arac;

--SORU1 : arac tablosundaki en yüksek fiyat'ı listele

select max(fiyat) as enyuksek_fiyat from arac;

--SORU2 : arac tablosundaki en düşük fiyat'ı listele

select min(fiyat) as endusuk_fiyat from arac;

--SORU3 : arac tablosundaki fiyatların toplamını listele

select sum(fiyat) as toplam_fiyat from arac;

--SORU4 : arac tablosundaki fiyat ortalamalarını listele

select avg(fiyat) as ortalama_fiyat from arac;

--> round() ortalama degerdeki ondalıkli kismi siler.
select round(avg(fiyat)) as ortalama_fiyat from arac;

--> istersek gene round() ile kac basamak alacagimizi da secebiliriz.
select round(avg(fiyat),2) as ortalama_fiyat from arac;


--SORU5 : arac tablosunda kaç tane araç oldugunu listele

select count(marka) as arac_sayisi from arac;--> buraya null veri ekledik
--> satır sayisinin 1 eksigini verdi cunku count() veri sayisi verir.
--> null i saymaz.
select count(model) as arac_sayisi from arac;
select count(id) as arac_sayisi from arac;
select count(fiyat) as arac_sayisi from arac;
select count(kilometre) as arac_sayisi from arac;
select count(vites) as arac_sayisi from arac;

select count(*) as arac_sayisi from arac;


insert into arac values(106,null,'porsche',145000,4000,'otomatik');

