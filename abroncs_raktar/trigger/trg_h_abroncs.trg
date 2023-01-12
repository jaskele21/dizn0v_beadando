CREATE OR REPLACE TRIGGER trg_h_abroncs
  AFTER INSERT OR UPDATE OR DELETE ON abroncs
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO h_abroncs
      (id
      ,tulaj_id
      ,felni_id
      ,evszak
      ,betarolas_ideje
      ,gyarto
      ,meret
      ,profilarany
      ,atmero
      ,terheles_index
      ,sebesseg_index
      ,profilmelyseg
      ,dotszam
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:old.id
      ,:old.tulaj_id
      ,:old.felni_id
      ,:old.evszak
      ,:old.betarolas_ideje
      ,:old.gyarto
      ,:old.meret
      ,:old.profilarany
      ,:old.atmero
      ,:old.terheles_index
      ,:old.sebesseg_index
      ,:old.profilmelyseg
      ,:old.dotszam
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.sor_verzio + 1);
  ELSE
    INSERT INTO h_abroncs
      (id
      ,tulaj_id
      ,felni_id
      ,evszak
      ,betarolas_ideje
      ,gyarto
      ,meret
      ,profilarany
      ,atmero
      ,terheles_index
      ,sebesseg_index
      ,profilmelyseg
      ,dotszam
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:new.id
      ,:new.tulaj_id
      ,:new.felni_id
      ,:new.evszak
      ,:new.betarolas_ideje
      ,:new.gyarto
      ,:new.meret
      ,:new.profilarany
      ,:new.atmero
      ,:new.terheles_index
      ,:new.sebesseg_index
      ,:new.profilmelyseg
      ,:new.dotszam
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.sor_verzio);
  END IF;

END trg_h_abroncs;
/
