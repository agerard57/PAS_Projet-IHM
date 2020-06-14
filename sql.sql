--vue_etu_list
CREATE VIEW `vue_etu_list`AS
SELECT etu.id AS id, civ, CONCAT(nom, ' ', prenom) AS identite, ville, CONCAT(code, '  ', lib_court) AS filiere
FROM ETUDIANT AS etu
JOIN FILIERE AS fili 
ON etu.id_fil = fili.id

--vue_inscri
CREATE VIEW vue_inscri AS
SELECT etu.id, civ, nom, prenom, adresse, cp, ville, telephone, portable, mel, fil.code
FROM ETUDIANT etu, FILIERE fil
WHERE etu.id_fil = fil.id

--vue_releve_list
CREATE VIEW `vue_releve_list` AS
SELECT lib_court, coef, note, id_etud
FROM NOTATION AS nota
JOIN UE ON (nota.id_UE = UE.id)
----------------------------------------------------------------------------------------------------------------

--sp_inscri-list_filiere
CREATE PROCEDURE `sp_inscri_list_filiere`(IN v_code varchar(20), OUT v_nom_table varchar(20))
BEGIN
    DROP TABLE IF EXISTS resultat;
    CREATE TABLE resultat AS
    SELECT * 
    FROM vue_etu_list
    WHERE filiere LIKE CONCAT('%', v_code, '%') COLLATE latin1_general_cs;
    SET v_nom_table := 'resultat';
END

-- sp_inscri_list_etu
CREATE PROCEDURE `sp_inscri_list_etu`(in v_numero varchar(4), v_nom varchar(50), out v_nom_table varchar(20))
BEGIN
    DROP TABLE IF EXISTS resultat;
    CREATE TABLE resultat AS
        SELECT *
        FROM vue_inscri
        WHERE id LIKE CONCAT('%', v_numero,'%') COLLATE latin1_general_cs
        AND nom LIKE CONCAT('%', v_nom,'%') COLLATE latin1_general_cs
        ORDER BY nom, id;
    SET v_nom_table := 'resultat';
END

--sp_note_supr
CREATE PROCEDURE `sp_note_supr`(IN v_numero INT, OUT v_erreur INT)
BEGIN
    DELETE FROM NOTATION WHERE id_etud = v_numero;
    SET v_erreur := 0;
END

--sp_etu_ajout
CREATE PROCEDURE `sp_etu_ajout`(v_numero INT, v_civ varchar(4), v_nom varchar(25), v_prenom varchar(25), v_adresse varchar(50), v_cp varchar(5), v_ville varchar(25), v_portable varchar(25), v_tel varchar(10), v_mel varchar(60), v_code varchar(10), OUT v_erreur INT)
BEGIN
    DECLARE f_id int(11);

    SELECT id INTO f_id
    FROM FILIERE 
    WHERE code LIKE f_code COLLATE latin1_general_cs;

    INSERT INTO ETUDIANT(id, civ, nom, prenom, adresse, cp, ville, portable, telephone, mel, id_fil)
    VALUES (v_numero, v_civ, v_nom, v_prenom, v_adresse, v_cp, v_ville, v_portable, v_tel, v_mel, f_id);
    SET v_erreur := 0;
END

-- sp_etu_maj; 
CREATE PROCEDURE `sp_etu_maj`(v_numero INT, v_civ varchar(4), v_nom varchar(25), v_prenom varchar(25), v_adresse varchar(50), v_cp varchar(5), v_ville varchar(25), v_portable varchar(25), v_tel varchar(10), v_mel varchar(60), OUT v_erreur INT)
BEGIN
    UPDATE ETUDIANT
    SET civ = v_civ,
    nom = v_nom,
    prenom = v_prenom,
    adresse = v_adresse,
    cp = v_cp,
    ville = v_ville,
    portable = _portable,
    telephone = v_tel,
    mel = v_mel
    WHERE id = v_id;
    SET v_erreur := 0;
END

-- sp_inscri_tous; 

CREATE PROCEDURE `sp_inscri_list_tous`(out v_nom_table varchar(20))
BEGIN
    DROP TABLE IF EXISTS resultat;
    CREATE TABLE resultat AS
    SELECT * 
    FROM vue_inscri;
    SET v_nom_table := 'resultat';
END

-- sp_moy_inscri;
CREATE PROCEDURE `sp_moy_inscri`(IN id INT, OUT moy VARCHAR(5))
BEGIN
    DECLARE v_note FLOAT DEFAULT 0;
    DECLARE v_coef FLOAT DEFAULT 0;
    DECLARE v_note_tot FLOAT DEFAULT 0;
    DECLARE v_nb_note INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE v_coef_tot DECIMAL(6,3) DEFAULT 0;
    
    DECLARE fincurs BOOLEAN DEFAULT 0;
    DECLARE curs CURSOR FOR
        SELECT note, coef
        FROM NOTATION nota, UE, ETUDIANT etu
        WHERE id_UE = id;
    
    SELECT COUNT(*) INTO v_nb_note
    FROM vue_releve_list
    WHERE id_etud = id;
    
    OPEN curs;
    FETCH curs INTO v_note, v_coef;
    WHILE i != v_nb_note DO
        IF v_note != -1
        THEN
            SET v_note_tot := v_note_tot + (v_note * v_coef);
            SET v_coef_tot := v_coef_tot + v_coef;
        END IF;
        FETCH curs INTO v_note, v_coef;
        SET i := i + 1;
    END WHILE;
    CLOSE curs;
    SET moy := FORMAT(v_note_tot / v_coef_tot, 2);
END

-- sp_etu_note; 

CREATE PROCEDURE `sp_etu_note`(IN v_id varchar(5), OUT v_nomtable varchar(20))
BEGIN
 DROP TABLE IF EXISTS resultat;
 CREATE TABLE resultat AS
    SELECT lib_court, CONCAT("x ", REPLACE(coef,'.',',')), IF(note = -1 ,'Non noté', REPLACE(coef,'.',','))
    FROM vue_releve_list
    WHERE id_etud = v_id
    ORDER BY lib_court;
 SET v_nomtable := 'resultat';
END

-- sp_inscri_num; 

CREATE PROCEDURE `sp_inscri_num`(IN v_id varchar(5), OUT v_nomtable varchar(20))
BEGIN
    DROP TABLE IF EXISTS resultat;
    CREATE TABLE resultat AS
        SELECT *
        FROM vue_inscri
        WHERE id COLLATE latin1_general_ci = v_id;
    SET v_nomtable := 'resultat';
END

--sp_moy_filiere
CREATE PROCEDURE sp_moy_filiere(IN v_code VARCHAR(10), OUT moy VARCHAR(5))
BEGIN
    DECLARE v_nb_eleve INT;
    DECLARE i INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_moy VARCHAR(5) DEFAULT 0;
    DECLARE curs CURSOR FOR (
        SELECT etu.id
        FROM ETUDIANT AS etu
        JOIN FILIERE AS fil
            ON (etu.id_fil = fil.id)
        WHERE code = fil_code
    );

    SELECT COUNT(*) INTO v_nb_eleve
    FROM ETUDIANT AS etu
    JOIN FILIERE AS fil
        ON (etu.id_fil = fil.id)
    WHERE code = fil_code;

    OPEN curs;

    SET moy := 0;
    WHILE i != v_nb_eleve DO
        FETCH curs INTO v_id;
        CALL sp_moy_inscri(v_id, v_moy);
        SET moy := moy + REPLACE(v_moy,',','.') ;
        SET i := i + 1;
    END WHILE;

    CLOSE curs;

    IF(v_nb_eleve != 0) THEN
        SET moy := REPLACE(FORMAT(moy / v_nb_eleve,2),'.',',');
    ELSE
        SET moy := -1;
    END IF;
END;
------------------------------------------------------------------------------------------------------------------------------------------