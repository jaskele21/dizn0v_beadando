CREATE  TABLE jarmu(
       rendszam varchar2(7) primary key,
       tulaj_id number not null,
       jarmu_sulya number,
       jarmu_max_sebbesege number
       ) tablespace users;
