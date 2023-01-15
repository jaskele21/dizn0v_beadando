CREATE OR REPLACE VIEW vw_tarolas AS
 SELECT a.id,
        t.vezetek_nev || ' ' || t.kereszt_nev AS Nev,
        t.telefonszam as Telefonszam,
        a.betarolas_ideje as Betarolasideje,
        a.gyarto as Gyarto,
        a.meret || '/'|| a.profilarany|| 'R' || a.atmero as Meret, 
        a.evszak as Evszak,
        a.profilmelyseg as Profilmelyseg
 FROM abroncs a INNER JOIN tulaj t ON a.tulaj_id=t.id;
