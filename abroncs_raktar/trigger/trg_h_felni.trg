CREATE OR REPLACE TRIGGER trg_h_felni
  AFTER INSERT OR UPDATE OR DELETE ON felni
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO h_felni
      (id
      ,osztaskor_atmeroje
      ,atmero
      ,szelesseg
      ,csavarok_szama
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:old.id
      ,:old.osztaskor_atmeroje
      ,:old.atmero
      ,:old.szelesseg
      ,:old.csavarok_szama
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.sor_verzio + 1);
  ELSE
    INSERT INTO h_felni
      (id
      ,osztaskor_atmeroje
      ,atmero
      ,szelesseg
      ,csavarok_szama
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszito_ido
      ,dml_tipus
      ,sor_verzio)
    VALUES
      (:new.id
      ,:new.osztaskor_atmeroje
      ,:new.atmero
      ,:new.szelesseg
      ,:new.csavarok_szama
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.sor_verzio);
  END IF;
END trg_h_felni;
/
