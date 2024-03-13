
-- =================================================
-- Mini-Project SQL: Glioma
-- ================================================

USE `glioma_db`;


-- ====================== SQL Queries - Show Tables ==========================


-- Show Tables
SHOW TABLES;

-- Show target table columns
SELECT *
FROM glioma_db.target;


-- Show info table columns
SELECT *
FROM glioma_db.info;


-- ====================== SQL Queries - Join - Tables ==========================

SELECT tar.*, inf.primary_diagnosis
FROM glioma_db.info as inf
RIGHT JOIN glioma_db.target as tar
ON inf.case_id = tar.case_id;



-- ====================== SQL Queries - Aggregation ==========================


-- Count Grade by Gender and Grade
SELECT 
CASE
	WHEN gender = '1' THEN "Female"
    WHEN gender = '0' THEN "Male"
END as gender,
grade,
COUNT(grade) AS count_grade
FROM glioma_db.target
GROUP BY gender, grade
ORDER BY gender;



-- Frequency of Mutations by Gender and Grade
SELECT 
CASE
	WHEN gender = '1' THEN "Female"
    WHEN gender = '0' THEN "Male"
END as gender,
grade,
       SUM(idh1) AS sum_idh1,
       SUM(tp53) AS sum_tp53,
       SUM(atrx) AS sum_atrx,
       SUM(pten) AS sum_pten,
       SUM(egfr) AS sum_egfr,
       SUM(cic) AS sum_cic,
       SUM(muc16) AS sum_muc16,
       SUM(pik3ca) AS sum_pik3ca,
       SUM(nf1) AS sum_nf1,
       SUM(pik3r1) AS sum_pik3r1,
       SUM(fubp1) AS sum_fubp1,
       SUM(rb1) AS sum_rb1,
       SUM(notch1) AS sum_notch1,
       SUM(bcor) AS sum_bcor,
       SUM(csmd3) AS sum_csmd3,
       SUM(smarca4) AS sum_smarca4,
       SUM(grin2a) AS sum_grin2a,
       SUM(idh2) AS sum_idh2,
       SUM(fat4) AS sum_fat4,
       SUM(pdgfra) AS sum_pdgfra
FROM glioma_db.target
GROUP BY gender, grade
ORDER BY gender;

