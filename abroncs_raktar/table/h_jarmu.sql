CREATE TABLE h_jarmu(
       rendszam varchar2(7),
       tulaj_id number,
       jarmu_sulya number,
       jarmu_max_sebbesege number,
       modosito_user varchar2(250),
       modositasi_ido timestamp(6),
       keszito_user varchar2(250),
       keszito_ido timestamp(6),
       dml_tipus char(1),
       sor_verzio number
       ) tablespace users;
