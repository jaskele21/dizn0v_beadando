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
