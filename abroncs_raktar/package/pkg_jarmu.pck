CREATE OR REPLACE PACKAGE pgk_jarmu IS
  PROCEDURE uj_jarmu(p_rendszam VARCHAR2
                    ,p_tulaj_id NUMBER);
  PROCEDURE suly_megadas(p_suly     NUMBER
                        ,p_rendszam VARCHAR2);
  PROCEDURE max_sebbeseg_megadas(p_sebbeseg NUMBER
                                ,p_rendszam VARCHAR2);
                                FUNCTION rendszam_csekk(p_rendszam VARCHAR2) RETURN BOOLEAN;
END pgk_jarmu;
/
CREATE OR REPLACE PACKAGE BODY pgk_jarmu IS
  PROCEDURE uj_jarmu(p_rendszam VARCHAR2
                    ,p_tulaj_id NUMBER) IS
  BEGIN
    IF rendszam_csekk(p_rendszam)
       AND pkg_tulaj.tulaj_id_csekk(p_tulaj_id)
    THEN
      INSERT INTO jarmu
        (rendszam
        ,tulaj_id)
      VALUES
        (p_rendszam
        ,p_tulaj_id);
    END IF;
  END uj_jarmu;
  --------------------------------------------------------------
  PROCEDURE suly_megadas(p_suly     NUMBER
                        ,p_rendszam VARCHAR2) IS
  BEGIN
    IF rendszam_csekk(p_rendszam)
       AND pkg_0_nagyobb.nagyobb_0(p_suly)
    THEN
      UPDATE jarmu j
         SET j.jarmu_sulya = p_suly
       WHERE j.rendszam = p_rendszam;
    END IF;
  END suly_megadas;
  --------------------------------------------------------------
  PROCEDURE max_sebbeseg_megadas(p_sebbeseg NUMBER
                                ,p_rendszam VARCHAR2) IS
  BEGIN
    IF rendszam_csekk(p_rendszam)
       AND pkg_0_nagyobb.nagyobb_0(p_sebbeseg)
    THEN
      UPDATE jarmu j
         SET j.jarmu_max_sebbesege = p_sebbeseg
       WHERE j.rendszam = p_rendszam;
    END IF;
  END max_sebbeseg_megadas;
  --------------------------------------------------------------
  FUNCTION rendszam_csekk(p_rendszam VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF lower(p_rendszam) LIKE ('[a-z][a-z][a-z][a-z]-[0-9][0-9][0-9]')
       OR lower(p_rendszam) LIKE ('[a-z][a-z][a-z]-[0-9][0-9][0-9]')
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_wrong_rendszam_format_ex,
                              p_rendszam ||
                              ' rendszam nem megfelelõ formátumú');
    
      RETURN FALSE;
    END IF;
  END rendszam_csekk;
END pgk_jarmu;
/
