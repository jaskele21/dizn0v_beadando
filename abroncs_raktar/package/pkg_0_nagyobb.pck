CREATE OR REPLACE PACKAGE pkg_0_nagyobb IS

  FUNCTION nagyobb_0(p_szam NUMBER) RETURN BOOLEAN;
END pkg_0_nagyobb;
/
CREATE OR REPLACE PACKAGE BODY pkg_0_nagyobb IS
  FUNCTION nagyobb_0(p_szam NUMBER) RETURN BOOLEAN IS
  BEGIN
    IF p_szam > 0
    THEN
      RETURN TRUE;
    ELSE
      raise_application_error(pkg_error.gc_smaller_0_ex,
                              p_szam|| ' kissebb vagy egyenlo mint 0.');
      RETURN FALSE;
    END IF;
  END nagyobb_0;
END pkg_0_nagyobb;
/
