CREATE OR REPLACE TRIGGER trg_h_jarmu
  AFTER INSERT OR UPDATE OR DELETE ON jarmu
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO h_jarmu
      (rendszam
      ,tulaj_id
      ,jarmu_sulya
      ,jarmu_max_sebbesege
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:old.rendszam
      ,:old.tulaj_id
      ,:old.jarmu_sulya
      ,:old.jarmu_max_sebbesege
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.sor_verzio + 1);
  ELSE
    INSERT INTO h_jarmu
      (rendszam
      ,tulaj_id
      ,jarmu_sulya
      ,jarmu_max_sebbesege
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:new.rendszam
      ,:new.tulaj_id
      ,:new.jarmu_sulya
      ,:new.jarmu_max_sebbesege
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.sor_verzio);
  END IF;
END trg_h_jarmu;
/
