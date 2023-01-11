CREATE TABLE abroncs(
       id number primary key,
       tulaj_id number,
       felni_id number,
       evszak varchar2(250) not null,
       betarolas_ideje date not null,
       gyarto varchar2(250) not null,
       meret number not null,
       profilarany number not null,
       atmero number not null,
       terheles_index number,
       sebesseg_index varchar2(2),
       profilmelyseg number,
       dotszam number
       ) tablespace users;
CREATE TABLE tulaj(
       id number primary key,
       vezetek_nev varchar2(250) not null,
       kereszt_nev varchar2(250) not null,
       telefonszam varchar2(250) not null,
       email varchar2(250) not null
       )tablespace users;
CREATE TABLE felni(
       id number primary key,
       osztaskor_atmeroje number not null,
       atmero number not null,
       szelesseg number not null,
       csavarok_szama number not null
       ) tablespace users;
CREATE TABLE jarmu(
       rendszam varchar2(7),
       tulaj_id number,
       jarmu_sulya number,
       jarmu_max_sebbesege number
       ) tablespace users;
ALTER TABLE abroncs ADD CONSTRAINT fk_tulaj_id
FOREIGN KEY(tulaj_id) REFERENCES tulaj(id);
ALTER TABLE abroncs ADD CONSTRAINT fk_felni_id
FOREIGN KEY(felni_id) REFERENCES felni(id);
ALTER TABLE jarmu ADD CONSTRAINT fk_jarmu_tulaj_id
FOREIGN KEY(tulaj_id) REFERENCES tulaj(id);
