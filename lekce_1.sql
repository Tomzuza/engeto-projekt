-- Vypište všechna data z tabulky healthcare_provider. --
SELECT 
	* 
FROM 
	healthcare_provider hp ;

-- Vypište pouze sloupce se jménem a typem poskytovatele ze stejné tabulky jako v předchozím příkladu. --
SELECT 
	name ,provider_type 
FROM 
	healthcare_provider hp ;

-- Předchozí dotaz upravte tak, že vypíše pouze prvních 20 záznamů v tabulce. --
SELECT 
	name ,provider_type 
FROM
	healthcare_provider hp 
LIMIT 
	20;

-- Vypište z tabulky healthcare_provider záznamy seřazené podle kódu kraje vzestupně. --
SELECT
	* 
FROM 
	healthcare_provider hp  
ORDER BY 
	region_code ASC ;

-- Vypište ze stejné tabulky jako v předchozím příkladě sloupce se jménem poskytovatele, kódem kraje a kódem okresu. Data seřaďte podle kódu okresu sestupně. Nakonec vyberte pouze prvních 500 záznamů. --
SELECT 
	name,
	region_code,
	district_code  
FROM 
	healthcare_provider hp 
ORDER BY 
	district_code DESC 
LIMIT 
	500;

-- Vyberte z tabulky healthcare_provider všechny záznamy poskytovatelů zdravotních služeb, kteří poskytují služby v Praze (kraj Praha). --
SELECT 
	* 
FROM 
	healthcare_provider hp 
WHERE 
	region_code ="CZ010";

-- Vyberte ze stejné tabulky název a kotaktní informace poskytovatelů, kteří nemají místo poskytování v Praze (kraj Praha). --
SELECT 
	name ,
	phone ,
	fax ,
	email, 
	website 
FROM 
	healthcare_provider hp 
WHERE 
	region_code !="CZ010";

-- Vypište názvy poskytovatelů, kódy krajů místa poskytování a místa sídla u takových poskytovatelů, u kterých se tyto hodnoty rovnají. --
SELECT 
	name,
	region_code,
	residence_region_code
from
	healthcare_provider hp 
WHERE 
	region_code = residence_region_code;
	
-- Vypište název a telefon takových poskytovatelů, kteří svůj telefon vyplnili do registru. --
SELECT 
	name,
	phone
FROM
	healthcare_provider hp 
WHERE 
	phone IS NOT NULL ;

-- Vypište název poskytovatele a kód okresu u poskytovatelů, kteří mají místo poskytování služeb v okresech Benešov a Beroun. Záznamy seřaďte vzestupně podle kódu okresu. --
SELECT 
	name,
	district_code 
FROM	
	healthcare_provider hp 
WHERE 
	district_code = "cz0201" or district_code = 'CZ0202' 
ORDER BY 
	district_code ASC;



-- Vytvořte tabulku t_{jméno}_{příjmení}_providers_south_moravia z tabulky healthcare_provider vyberte pouze Jihomoravský kraj. --
CREATE TABLE IF NOT EXISTS 
	t_zuzana_tomasova_providers_south_moravia AS
SELECT *
FROM 
	healthcare_provider hp 
WHERE 
	region_code = 'CZ064' ;

DROP TABLE IF EXISTS
	t_zuzana_tomasova_providers_south_moravia;

-- Vytvořte tabulku t_{jméno}_{příjmení}_resume, kde budou sloupce date_start, date_end, job, education. Sloupcům definujte vhodné datové typy. --
CREATE TABLE IF NOT EXISTS t_zuzana_tomasova_resume (
    date_start date,
    date_end date,
    education varchar(255),
    job varchar(255)
);

-- Vložte do tabulky popis_tabulek pod svým jménem popis tabulky. --

-- Do tabulky t_{jméno}_{příjmení}_resume, kterou jste vytvořili v minulé části, vložte záznam se svým současným zaměstnáním nebo studiem.--
INSERT INTO 
	t_zuzana_tomasova_resume 
VALUES 
	("2023-09-13", null, "schvalovatel uveru", "UPCE");

-- K tabulce t_{jméno}_{příjmení}_resume přidejte dva sloupce: institution a role, které budou typu VARCHAR(255).--
ALTER TABLE 
	t_zuzana_tomasova_resume 
ADD COLUMN
insitution varchar(255);

K tabulce t_{jméno}_{příjmení}_resume přidejte dva sloupce: institution a role, které budou typu VARCHAR(255). 

DELETE FROM t_zuzana_nemeckova_resume WHERE job = "UPCE"
