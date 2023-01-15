CREATE OR REPLACE VIEW vw_felni AS 
SELECT f.id,
       f.osztaskor_atmeroje,
       f.atmero,
       f.szelesseg,
       f.csavarok_szama
FROM felni f;
