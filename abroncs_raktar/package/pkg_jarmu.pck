CREATE OR REPLACE PACKAGE pgk_jarmu IS
  PROCEDURE uj_jarmu(p_rendszam VARCHAR2
                    ,p_tulaj_id NUMBER);
  PROCEDURE suly_megadas(p_suly     NUMBER
                        ,p_rendszam VARCHAR2);
  PROCEDURE max_sebbeseg_megadas(p_sebbeseg NUMBER
                                ,p_rendszam VARCHAR2);
  FUNCTION rendszam_csekk(p_rendszam VARCHAR2) RETURN BOOLEAN;
  FUNCTION rendszam_letezik(p_rendszam VARCHAR2) RETURN BOOLEAN;
  FUNCTION auto(p_id         NUMBER
               ,p_rendszam   VARCHAR2
               ,p_abroncs_id NUMBER) RETURN ty_auto;
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
    IF rendszam_letezik(p_rendszam)
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
    IF rendszam_letezik(p_rendszam)
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
  --------------------------------------------------------------
  FUNCTION rendszam_letezik(p_rendszam VARCHAR2) RETURN BOOLEAN IS
    v_talal NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO v_talal
      FROM jarmu j
     WHERE j.rendszam = p_rendszam;
    IF v_talal <> 0
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_rendszam_not_found_ex,
                              p_rendszam ||
                              ' rendszam nem található a táblában.');
      RETURN FALSE;
    END IF;
  END;
  --------------------------------------------------------------
  FUNCTION auto(p_id         NUMBER
               ,p_rendszam   VARCHAR2
               ,p_abroncs_id NUMBER) RETURN ty_auto IS
    v_talal NUMBER;
    v_auto  ty_auto;
  BEGIN
    IF pkg_tulaj.tulaj_id_csekk(p_id)
       AND pkg_abroncs.abroncs_id_csekk(p_abroncs_id)
       AND rendszam_letezik(p_rendszam)
    
    THEN
      SELECT COUNT(*)
        INTO v_talal
        FROM jarmu j
       INNER JOIN tulaj t
          ON j.tulaj_id = t.id
       WHERE j.rendszam = p_rendszam;
      IF v_talal <> 0
      THEN
        SELECT ty_auto(rendszam                 => p_rendszam,
                       abroncs_evszak           => a.evszak,
                       abroncs_gyarto           => a.gyarto,
                       felni_osztaskor_atmeroje => f.osztaskor_atmeroje)
          INTO v_auto
          FROM tulaj t
         INNER JOIN abroncs a
            ON t.id = a.tulaj_id
         INNER JOIN felni f
            ON a.felni_id = f.id
        
         WHERE a.id = p_abroncs_id;
        RETURN v_auto;
      END IF;
      RETURN NULL;
    END IF;
    RETURN NULL;
  END;
  -------------------------------------------------------
END pgk_jarmu;
/
