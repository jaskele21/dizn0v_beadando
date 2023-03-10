CREATE OR REPLACE PACKAGE pkg_abroncs IS
  PROCEDURE uj_abroncs(p_evszak      VARCHAR2
                      ,p_gyarto      VARCHAR2
                      ,p_meret       NUMBER
                      ,p_profilarany NUMBER
                      ,p_atmero      NUMBER);
  PROCEDURE terheles_megadasa(p_terheles NUMBER
                             ,p_id       NUMBER);
  PROCEDURE sebesseg_megadasa(p_sebesseg NUMBER
                             ,p_id       NUMBER);
  PROCEDURE profilmelyseg_megadasa(p_profilmelyseg NUMBER
                                  ,p_id            NUMBER);
  PROCEDURE dotszam_megadasa(p_dotszam NUMBER
                            ,p_id      NUMBER);
  PROCEDURE tulajhoz_rendeles(p_tulaj_id NUMBER
                             ,p_id       NUMBER);
  PROCEDURE felnihez_rendeles(p_felni_id NUMBER
                             ,p_id       NUMBER);
  FUNCTION abroncs_id_csekk(p_id NUMBER) RETURN BOOLEAN;
  FUNCTION evszak_csekk(p_evszak VARCHAR2) RETURN BOOLEAN;
  PROCEDURE abroncs_torles(p_id NUMBER);

END pkg_abroncs;
/
CREATE OR REPLACE PACKAGE BODY pkg_abroncs IS
  PROCEDURE uj_abroncs(p_evszak      VARCHAR2
                      ,p_gyarto      VARCHAR2
                      ,p_meret       NUMBER
                      ,p_profilarany NUMBER
                      ,p_atmero      NUMBER) IS
  BEGIN
    IF evszak_csekk(p_evszak)
       AND pkg_0_nagyobb.nagyobb_0(p_meret)
       AND pkg_0_nagyobb.nagyobb_0(p_profilarany)
       AND pkg_0_nagyobb.nagyobb_0(p_atmero)
    THEN
      INSERT INTO abroncs
        (evszak
        ,gyarto
        ,betarolas_ideje
        ,meret
        ,profilarany
        ,atmero)
      VALUES
        (p_evszak
        ,p_gyarto
        ,SYSDATE
        ,p_meret
        ,p_profilarany
        ,p_atmero);
    ELSE
      raise_application_error(pkg_error.gc_wrong_evszak_ex,
                              p_evszak || ' rossz ?vszak.');
    END IF;
  END uj_abroncs;
  ----------------------------------------------------------
  PROCEDURE terheles_megadasa(p_terheles NUMBER
                             ,p_id       NUMBER) IS
  BEGIN
    IF abroncs_id_csekk(p_id)
       AND pkg_0_nagyobb.nagyobb_0(p_terheles)
    THEN
      UPDATE abroncs a SET a.terheles_index = p_terheles WHERE a.id = p_id;
    END IF;
  END terheles_megadasa;
  ----------------------------------------------------------
  PROCEDURE sebesseg_megadasa(p_sebesseg NUMBER
                             ,p_id       NUMBER) IS
  BEGIN
    IF abroncs_id_csekk(p_id)
       AND pkg_0_nagyobb.nagyobb_0(p_sebesseg)
    THEN
      UPDATE abroncs a SET a.sebesseg_index = p_sebesseg WHERE a.id = p_id;
    END IF;
  END sebesseg_megadasa;
  ----------------------------------------------------------
  PROCEDURE profilmelyseg_megadasa(p_profilmelyseg NUMBER
                                  ,p_id            NUMBER) IS
  BEGIN
    IF abroncs_id_csekk(p_id)
       AND pkg_0_nagyobb.nagyobb_0(p_profilmelyseg)
    THEN
      UPDATE abroncs a
         SET a.profilmelyseg = p_profilmelyseg
       WHERE a.id = p_id;
    END IF;
  END profilmelyseg_megadasa;
  ----------------------------------------------------------
  PROCEDURE dotszam_megadasa(p_dotszam NUMBER
                            ,p_id      NUMBER) IS
  BEGIN
    IF abroncs_id_csekk(p_id)
       AND pkg_0_nagyobb.nagyobb_0(p_dotszam)
    THEN
      UPDATE abroncs a SET a.dotszam = p_dotszam WHERE a.id = p_id;
    END IF;
  END dotszam_megadasa;

  ----------------------------------------------------------
  PROCEDURE felnihez_rendeles(p_felni_id NUMBER
                             ,p_id       NUMBER) IS
  BEGIN
    IF pkg_felni.felni_id_csekk(p_felni_id)
    THEN
      IF abroncs_id_csekk(p_id)
      THEN
        UPDATE abroncs a SET a.felni_id = p_felni_id WHERE a.id = p_id;
      END IF;
    END IF;
  END felnihez_rendeles;

  ----------------------------------------------------------
  PROCEDURE tulajhoz_rendeles(p_tulaj_id NUMBER
                             ,p_id       NUMBER) IS
  BEGIN
    IF pkg_tulaj.tulaj_id_csekk(p_tulaj_id)
    THEN
      IF abroncs_id_csekk(p_id)
      THEN
        UPDATE abroncs a SET a.tulaj_id = p_tulaj_id WHERE a.id = p_id;
      END IF;
    END IF;
  END tulajhoz_rendeles;
  ----------------------------------------------------------
  FUNCTION abroncs_id_csekk(p_id NUMBER) RETURN BOOLEAN IS
    v_talal NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_talal FROM abroncs a WHERE a.id = p_id;
    IF v_talal <> 0
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_abroncs_not_found_ex,
                              p_id ||
                              '-idval rendelkez? abroncs nem l?tezik.');
      RETURN FALSE;
    END IF;
  END abroncs_id_csekk;
  ----------------------------------------------------------
  FUNCTION evszak_csekk(p_evszak VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    CASE lower(p_evszak)
      WHEN 'ny?ri' THEN
        RETURN TRUE;
      WHEN 't?li' THEN
        RETURN TRUE;
      WHEN 'n?gy?vszakos' THEN
        RETURN TRUE;
      ELSE
        RETURN FALSE;
    END CASE;
  END evszak_csekk;
  ----------------------------------------------------------
  PROCEDURE abroncs_torles(p_id NUMBER) IS
  BEGIN
    IF abroncs_id_csekk(p_id)
    THEN
      DELETE FROM abroncs a WHERE a.id = p_id;
    END IF;
  END abroncs_torles;
END pkg_abroncs;
/
