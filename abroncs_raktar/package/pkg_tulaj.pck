CREATE OR REPLACE PACKAGE pkg_tulaj IS
  PROCEDURE uj_tulaj(p_vez_nev VARCHAR2
                    ,p_ker_nev VARCHAR2
                    ,p_telszam VARCHAR2
                    ,p_email   VARCHAR2);
  FUNCTION email_e(p_email VARCHAR2) RETURN BOOLEAN;
  PROCEDURE tulaj_torol(p_id NUMBER);
  FUNCTION tulaj_id_csekk(p_id NUMBER) RETURN BOOLEAN;
  PROCEDURE telefon_valtozas(p_id      NUMBER
                            ,p_telszam VARCHAR2);
  

END pkg_tulaj;
/
CREATE OR REPLACE PACKAGE BODY pkg_tulaj IS
  PROCEDURE uj_tulaj(p_vez_nev VARCHAR2
                    ,p_ker_nev VARCHAR2
                    ,p_telszam VARCHAR2
                    ,p_email   VARCHAR2) IS
  
  BEGIN
    IF email_e(p_email)
    THEN
      INSERT INTO tulaj
        (vezetek_nev
        ,kereszt_nev
        ,telefonszam
        ,email)
      VALUES
        (p_vez_nev
        ,p_ker_nev
        ,p_telszam
        ,p_email);
    ELSE
      raise_application_error(pkg_error.gc_wrong_email_format_ex,
                              p_email || ' email nem megfelelõ formátumú');
    END IF;
  
  END uj_tulaj;
  ----------------------------------------------------
  FUNCTION email_e(p_email VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF p_email LIKE '%@%.%'
    THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END email_e;
  ----------------------------------------------------
  PROCEDURE tulaj_torol(p_id NUMBER) IS
  BEGIN
    IF tulaj_id_csekk(p_id)
    THEN
      DELETE FROM jarmu j WHERE j.tulaj_id = p_id;
      DELETE FROM abroncs a WHERE a.tulaj_id = p_id;
      DELETE FROM tulaj t WHERE t.id = p_id;
    END IF;
  END tulaj_torol;
  ----------------------------------------------------
  FUNCTION tulaj_id_csekk(p_id NUMBER) RETURN BOOLEAN IS
    v_talal NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_talal FROM tulaj t WHERE t.id = p_id;
    IF v_talal <> 0
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_tulaj_not_found_ex,
                              p_id ||
                              '-idval rendelkezõ tulaj nem létezik.');
      RETURN FALSE;
    END IF;
  END tulaj_id_csekk;
  ----------------------------------------------------
  PROCEDURE telefon_valtozas(p_id      NUMBER
                            ,p_telszam VARCHAR2) IS
  BEGIN
    IF tulaj_id_csekk(p_id)
    THEN
      UPDATE tulaj t SET t.telefonszam = p_telszam WHERE t.id = p_id;
    END IF;
  END telefon_valtozas;
  ----------------------------------------------------
  
END pkg_tulaj;
/
