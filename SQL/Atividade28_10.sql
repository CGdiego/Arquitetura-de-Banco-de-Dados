CREATE USER 'gerente'@'localhost'
	IDENTIFIED BY 'tuff123';
CREATE USER 'atendente'@'localhost'
	IDENTIFIED BY 'sahir321';
    
GRANT ALL PRIVILEGES ON produtos TO 'gerente'@'localhost';
GRANT SELECT ON pedidos TO 'gerente'@'localhost';
GRANT SELECT ON itens_pedido TO 'gerente'@'localhost';

GRANT SELECT ON produtos TO 'atendente'@'localhost';
GRANT INSERT ON pedidos TO 'atendente'@'localhost';
GRANT INSERT ON itens_pedido TO 'atendente'@'localhost';

GRANT UPDATE ON produtos TO 'atendente'@'localhost';

DELIMITER //
CREATE TRIGGER trg_auditoria_pedido_delete
	BEFORE DELETE ON pedidos
    FOR EACH ROW
BEGIN
	IF OLD.data_pedido > (NOW() - INTERVAL 24 HOUR) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Nao pode apagar pedidos com menos de 24 h';
	END IF;
END;
//
DELIMITER ;