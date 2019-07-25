CREATE DEFINER=`root`@`localhost` PROCEDURE `usersAddOrEdit`(
IN _id int(100),
IN _username varchar(100),
IN _identificar varchar(100),
IN _email varchar(200)
)
BEGIN
	IF _id = 0 THEN
		INSERT INTO users(username,identificacion,email)
        VALUES (_username,_identificacion,_email);
        
        SET _id = LAST_INSERT_ID();
    ELSE
    	UPDATE users
        SET 
        username = _username,
        identificacion = _identificacion,
        email = _email
        WHERE id = _id;
    END IF;
    
SELECT _id AS 'id';
END