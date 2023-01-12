CREATE TABLE h_tulaj(
       id number,
       vezetek_nev varchar2(250) not null,
       kereszt_nev varchar2(250) not null,
       telefonszam varchar2(250) not null,
       email varchar2(250) not null,
       modosito_user varchar2(250),
       modositasi_ido timestamp(6),
       keszito_user varchar2(250),
       keszito_ido timestamp(6),
       dml_tipus char(1),
       sor_verzio number
       )tablespace users;
