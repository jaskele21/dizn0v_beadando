CREATE OR REPLACE TYPE ty_auto AS OBJECT
(
  rendszam                 VARCHAR2(7),
  abroncs_evszak           VARCHAR2(250),
  abroncs_gyarto           VARCHAR2(250),
  felni_osztaskor_atmeroje NUMBER,
  CONSTRUCTOR FUNCTION ty_auto RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_auto IS
  CONSTRUCTOR FUNCTION ty_auto RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
END;
/
