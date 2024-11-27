/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  ALTER: Tabloyu günceller.
  DROP: Tabloyu siler.
  
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  UPDATE:Tablodaki verileri günceller
  DELETE:Tablodaki verileri siler
  

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

create table student(
student_tc char(11), --uzunlugu belli olan String veriler icin kullanilir
student_name varchar(20), -- uzunlugu belli olmayan String veriler icin kullanilir
not_ort real, -- ondalikli sayilar icin real kullanilir
kayit_tarih date -- tarih icin date data turu kullanilir
);

-- ogrenciler tablosundaki verileri listele 
-- (*) tum stunlardaki verileri listeler
-- from hangi liste icin islem yapacagimizi belirtir

select * from student;


-- talebeler tablosuna veri ekleyelim 

insert into student values('12345678912','Esma',90.5,'2020-02-14');

insert into student values('12345674596','Mustafa',+90.6,'2021-05-16')

insert into student values('12356896414','Yunus',86.5,'2022-02-25')


select * from student;

-- student tablosunu silelim

drop table student;


--SORU: ogretmenler isminde tablo olustur

create table teachers(
teacher_name varchar(15),
bransi varchar(25),
mezuniyet_derecesi varchar(20),
tel_no char(11),
maas int	
);

select * from teachers;

insert into teachers values('Esma','Matematik','Lisans','12345678965',30000);

insert into teachers values('Nalan','Edebiyat','Yüksek Lisans','15975328645',30000);

insert into teachers values('Ali','Tarih','Lisans','45612378996',32000);

select * from teachers;

drop table teachers;

/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/

create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

--SORU: ogrenciler tablosunun tum sutunlarindaki verileri listeleyiniz

select * from ogrenciler;

--SORU2: pgrenciler tablosundaki 'isim' stunundaki verileri listeleyiniz

select isim from ogrenciler;

--SORU3: ogrenciler tablosundaki 'adres' sutunundaki verileri listeleyiniz

select adres from ogrenciler;

--SORU3: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz

select sinav_notu from ogrenciler;

--SORU4: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz

select isim,sinav_notu from ogrenciler;

/*
where==> Şart belirtmemiz gerektiginde kullanilir
*/

--SORU6: ogrenciler tablosundaki sinav_notu 80'den buyuk olan ogrencilerin tum bilgilerini listele

select * from ogrenciler where sinav_notu>80;

--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ogrencilerin tum bilgilerini listele

select * from ogrenciler where adres='Ankara';

--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan ogrencin isim'ini listele

select isim from ogrenciler where sinav_notu<85 and adres='Ankara';

--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tum bilgilerini listele
--1.yol
select * from ogrenciler where sinav_notu=65 or sinav_notu=85;

-- in ==> Birden fazla ifade ile tanimlayabilecegimiz durumlari in komutuyla yazabiliriz.
-- 2.yol
select * from ogrenciler where sinav_notu in(65,85);






