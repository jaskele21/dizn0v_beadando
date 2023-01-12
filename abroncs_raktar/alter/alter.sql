ALTER TABLE abroncs ADD CONSTRAINT fk_tulaj_id
FOREIGN KEY(tulaj_id) REFERENCES tulaj(id);
ALTER TABLE abroncs ADD CONSTRAINT fk_felni_id
FOREIGN KEY(felni_id) REFERENCES felni(id);
ALTER TABLE jarmu ADD CONSTRAINT fk_jarmu_tulaj_id
FOREIGN KEY(tulaj_id) REFERENCES tulaj(id);
ALTER TABLE tulaj ADD CONSTRAINT uq_email UNIQUE (email); 

---------------------------------------------------

ALTER TABLE abroncs ADD modosito_user VARCHAR2(250);
ALTER TABLE abroncs ADD modositasi_ido TIMESTAMP;
ALTER TABLE abroncs ADD keszito_user VARCHAR2(250);
ALTER TABLE abroncs ADD keszitesi_ido TIMESTAMP;
ALTER TABLE abroncs ADD dml_tipus CHAR(1);
ALTER TABLE abroncs ADD sor_verzio NUMBER;

ALTER TABLE jarmu ADD modosito_user VARCHAR2(250);
ALTER TABLE jarmu ADD modositasi_ido TIMESTAMP;
ALTER TABLE jarmu ADD keszito_user VARCHAR2(250);
ALTER TABLE jarmu ADD keszitesi_ido TIMESTAMP;
ALTER TABLE jarmu ADD dml_tipus CHAR(1);
ALTER TABLE jarmu ADD sor_verzio NUMBER;

ALTER TABLE felni ADD modosito_user VARCHAR2(250);
ALTER TABLE felni ADD modositasi_ido TIMESTAMP;
ALTER TABLE felni ADD keszito_user VARCHAR2(250);
ALTER TABLE felni ADD keszitesi_ido TIMESTAMP;
ALTER TABLE felni ADD dml_tipus CHAR(1);
ALTER TABLE felni ADD sor_verzio NUMBER;

ALTER TABLE tulaj ADD modosito_user VARCHAR2(250);
ALTER TABLE tulaj ADD modositasi_ido TIMESTAMP;
ALTER TABLE tulaj ADD keszito_user VARCHAR2(250);
ALTER TABLE tulaj ADD keszitesi_ido TIMESTAMP;
ALTER TABLE tulaj ADD dml_tipus CHAR(1);
ALTER TABLE tulaj ADD sor_verzio NUMBER;
