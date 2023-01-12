CREATE OR REPLACE TRIGGER trg_abroncs
  BEFORE INSERT OR UPDATE ON abroncs
  FOR EACH ROW
BEGIN
   IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := sq_abroncs.nextval;
    END IF;
    :new.keszito_user  := USER;
    :new.keszitesi_ido := systimestamp;
    :new.dml_tipus     := 'I';
    :new.sor_verzio   := 1;
  ELSIF updating
  THEN
    :new.dml_tipus   := 'U';
    :new.sor_verzio := :old.sor_verzio + 1;
  END IF;
  :new.modosito_user  := USER;
  :new.modositasi_ido := systimestamp;
END trg_abroncs;
/
