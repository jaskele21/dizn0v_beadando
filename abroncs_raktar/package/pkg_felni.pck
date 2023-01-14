CREATE OR REPLACE PACKAGE pkg_felni IS
  PROCEDURE uj_felni(p_osztaskor_atmeroje NUMBER
                    ,p_atmero             NUMBER
                    ,p_szelesseg          NUMBER
                    ,p_csavarokszama      NUMBER);
  FUNCTION felni_id_csekk(p_id NUMBER) RETURN BOOLEAN;
END pkg_felni;
/
CREATE OR REPLACE PACKAGE BODY pkg_felni IS

  PROCEDURE uj_felni(p_osztaskor_atmeroje NUMBER
                    ,p_atmero             NUMBER
                    ,p_szelesseg          NUMBER
                    ,p_csavarokszama      NUMBER) IS
  BEGIN
    IF pkg_0_nagyobb.nagyobb_0(p_osztaskor_atmeroje)
       AND pkg_0_nagyobb.nagyobb_0(p_atmero)
       AND pkg_0_nagyobb.nagyobb_0(p_szelesseg)
       AND pkg_0_nagyobb.nagyobb_0(p_csavarokszama)
    THEN
      INSERT INTO felni
        (osztaskor_atmeroje
        ,atmero
        ,szelesseg
        ,csavarok_szama)
      VALUES
        (p_osztaskor_atmeroje
        ,p_atmero
        ,p_szelesseg
        ,p_csavarokszama);
    END IF;
  END uj_felni;
  ------------------------------------------------------------
  FUNCTION felni_id_csekk(p_id NUMBER) RETURN BOOLEAN IS
    v_talal NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_talal FROM felni f WHERE f.id = p_id;
    IF v_talal <> 0
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_felni_not_found_ex,
                              p_id ||
                              '-idval rendelkezõ felni nem létezik.');
      RETURN FALSE;
    END IF;
  END felni_id_csekk;
END pkg_felni;
/
