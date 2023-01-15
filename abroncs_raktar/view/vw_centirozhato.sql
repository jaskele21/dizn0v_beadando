CREATE OR REPLACE VIEW vw_centirozhato AS
 SELECT a.id as AbroncsID,
        f.id as FelniID,
        a.gyarto as Gyarto,
        a.meret || '/'|| a.profilarany|| 'R' || a.atmero as Meret,        
        a.profilmelyseg as Profilmelyseg,
        f.csavarok_szama as Csavarokszama,
        f.szelesseg as Szelleseg,
        f.osztaskor_atmeroje as Osztaskoratmeroje
 FROM abroncs a INNER JOIN felni f ON a.felni_id=f.id;
