START TRANSACTION;
INSERT INTO PLAYER (NAME, LNAME1, LNAME2, STATUS, BIRTHDATE,  CITY,  STATE, COUNTRY) VALUES
('LIONEL', 'MESSI', '', 'ACTIVO', '1800-3-22', 'Warsaw', 'Mazovia', 'Poland' ),
('CRISTIANO', 'RONALDINHO', '64', 'ACTIVO', '1969-4-20', 'New Taipei', 'New Taipei', 'Taiwan'),
('DIEGO', 'ARMANDO', 'MARADONA','ACTIVO', '1925-10-13', 'Hell', 'California', 'USA'),
('EDSON', 'ARANTES', 'DO NASCIMIENTO', 'ACTIVO','1889-4-20', 'Hell', 'Michigan', 'USA'),
('LeBron', 'James', '','ACTIVO', '1984-12-30', 'Akron', 'Hell', 'USA'),
('Neymar', 'da Silva', 'Santos', 'ACTIVO', '1992-2-5', 'Mogi das Cruzes', 'Sao Paolo', 'Brazil'),
('Roger', 'Federer', '','ACTIVO', '1981-8-8', 'Basel', 'Basel-Stadt', 'Switzerland'),
('Zlatan', 'Ibrahimović', '','ACTIVO', '1981-10-3', 'Malmö', 'Scania', 'Sweden');
COMMIT;