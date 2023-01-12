CREATE OR REPLACE TRIGGER trg_h_tulaj
  AFTER INSERT OR UPDATE OR DELETE ON tulaj
  FOR EACH ROW

BEGIN
  IF deleting
  THEN
    INSERT INTO h_tulaj
      (id
      ,vezetek_nev
      ,kereszt_nev
      ,telefonszam
      ,email
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:old.id
      ,:old.vezetek_nev
      ,:old.kereszt_nev
      ,:old.telefonszam
      ,:old.email
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.sor_verzio + 1);
  ELSE
    INSERT INTO h_tulaj
      (id
      ,vezetek_nev
      ,kereszt_nev
      ,telefonszam
      ,email
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:new.id
      ,:new.vezetek_nev
      ,:new.kereszt_nev
      ,:new.telefonszam
      ,:new.email
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.sor_verzio);
  END IF;

END trg_h_tulaj;
/
