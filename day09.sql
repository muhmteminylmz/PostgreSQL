
/*=====================================EXISTS============================================================

 

Subquery'lerde kullanılır. Mevcut ise getir anlamında kullanılır.

EXISTS veya NOT EXISTS ifadeleri alt sorgudan getirilen degerlerin içerisinde bir degerin
olması veya olmaması durumunda işlem yapılmasını saglar

========================================================================================================*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');

select * from mart;

select * from nisan;

-- SORU1:  MART ve NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id'lerini
-- ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 

select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id = nisan.urun_id);

-- SORU2: MART ve NİSAN aylarında aynı urun_isim'i ile satılan ürünlerin urun_isim'lerini                  
-- ve aynı zamanda bu ürünleri NİSAN ayında alan musteri_isim'lerini listeleyiniz

select musteri_isim,urun_isim from nisan
where exists (select musteri_isim from mart where mart.urun_isim = nisan.urun_isim);

--MART ve NİSAN aylarında aynı urun_id ile satılmayan ürünlerin urun_id'lerini
--ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 

select musteri_isim,urun_id from mart
where not exists (select urun_id from nisan where mart.urun_id= nisan.urun_id);

create table memurlar
(
id int,
isim varchar(20),
soyisim varchar(25),
maas int,
sicil_notu int
);


insert into memurlar values(1,'Ali','Ozturk',50000,100);
insert into memurlar values(2,'Adem','Tan',40000,90);
insert into memurlar values(3,'Halit','Ozyıldızlı',35000,85);
insert into memurlar values(4,'Hasan','Oz',45000,95);
insert into memurlar values(5,'Recep','Cicek',30000,80);
insert into memurlar values(6,'Harun','Sever',20000,70);
insert into memurlar values(7,'Hatice','Tarkan',25000,75);
insert into memurlar values(8,'Poyraz','Yuzbası',10000,60);
insert into memurlar values(9,'Ayse','Karlı',15000,65);
insert into memurlar values(10,'Adem','Akmaz',9000,55);

-- SORU1: memurlar tablosunda id'si 5'den buyuk olan,
-- ilk 2 veriyi listeleyiniz

select * from memurlar where id > 5 limit 2;
--2.YOL
select * from memurlar where id > 5 fetch next 2 row only;

-- SORU2: memurlar tablosunda sicil_notu en yuksek 3 kisinin bilgilerini listeleyiniz

select * from memurlar order by sicil_notu desc limit 3;
--2.YOL
select * from memurlar order by sicil_notu desc fetch next 3 row only;

-- SORU3: memurlar tablosunda maas'ı en dusuk 2 kisinin bilgilerini listeleyiniz

select * from memurlar order by maas limit 2;

select * from memurlar order by maas fetch next 2 row only;

-- SORU4: memurlar tablosunda sicil_notu en yuksek 3.4.5. kişilerin bilgilerini listeleyiniz

select * from memurlar order by sicil_notu desc offset 2 limit 3;

-- SORU5: memurlar tablosunda soyisim'i en uzun ilk 2 kisinin bilgilerini listeleyiniz

select * from memurlar order by length(soyisim) desc limit 2;

select * from memurlar order by length(soyisim) desc fetch next 2 row only;

CREATE TABLE calisanlar 
(
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar VALUES('Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES('Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES('Nisa Can', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES('Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

--SORU1 : Çalisan sayisi 15.000’den cok olan 'isyeri' lerini,
--calisanlarin 'isim' lerini ve 'maas' larini listeleyin.

select isim,maas,isyeri from calisanlar
where isyeri in('Pierre Cardin','LCWaikiki');
--Dinamik Hali
select isim,maas,isyeri from calisanlar
where isyeri in(select marka_isim from markalar where calisan_sayisi > 15000);

--SORU2 : marka id'si 101'den buyuk olan 'isyeri' lerini,
--calisanlarin 'isim' lerini, 'maas' larini ve 'sehir' lerini listeleyiniz 

select isim,sehir,maas,isyeri from calisanlar
where isyeri in(select marka_isim from markalar where marka_id > 101);


--SORU3: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni 
-- ve o markalara ait toplam maas'ı listeleyiniz

select marka_isim,calisan_sayisi,(select sum(maas) as toplam_maas from calisanlar where marka_isim = isyeri) from markalar

-- SORU4: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni 
-- ve o markalara ait max ve min maas'ı listeleyiniz 

select marka_isim,calisan_sayisi,(select max(maas) as max_maas from calisanlar where isyeri = marka_isim),(select min(maas) as min_maas from calisanlar where isyeri = marka_isim) from markalar
