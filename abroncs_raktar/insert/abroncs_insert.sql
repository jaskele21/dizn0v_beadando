INSERT INTO abroncs
  (tulaj_id
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
  ,dotszam)
VALUES
  (1
  ,1
  ,'nyári'
  ,SYSDATE
  ,'Michelin'
  ,195
  ,65
  ,15
  ,2600
  ,'V'
  ,5
  ,4022);

INSERT INTO abroncs
  (tulaj_id
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
  ,dotszam)
VALUES
  (2
  ,2
  ,'nyári'
  ,SYSDATE
  ,'Barum'
  ,165
  ,45
  ,14
  ,1800
  ,'Q'
  ,5
  ,3920);

INSERT INTO abroncs
  (evszak
  ,betarolas_ideje
  ,gyarto
  ,meret
  ,profilarany
  ,atmero
  ,terheles_index
  ,sebesseg_index
  ,profilmelyseg
  ,dotszam)

VALUES
  ('nyári'
  ,SYSDATE
  ,'Continental'
  ,150
  ,40
  ,13
  ,1600
  ,'P'
  ,3
  ,2016);

INSERT INTO abroncs
  (tulaj_id
  ,evszak
  ,betarolas_ideje
  ,gyarto
  ,meret
  ,profilarany
  ,atmero
  ,terheles_index
  ,sebesseg_index
  ,profilmelyseg
  ,dotszam)

VALUES
  (3
  ,'téli'
  ,SYSDATE
  ,'Goodyear'
  ,215
  ,65
  ,20
  ,2600
  ,'V'
  ,5
  ,4822);

INSERT INTO abroncs
  (tulaj_id
  ,evszak
  ,betarolas_ideje
  ,gyarto
  ,meret
  ,profilarany
  ,atmero
  ,terheles_index
  ,sebesseg_index
  ,profilmelyseg
  ,dotszam)

VALUES
  (3
  ,'téli'
  ,SYSDATE
  ,'Goodyear'
  ,210
  ,60
  ,19
  ,2400
  ,'Q'
  ,5
  ,4822);

COMMIT;
