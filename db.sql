INSERT INTO jeu(titre,studio_developpement,annee_sortie,genre,multijouer)
VALUES
('The Legend of Zelda', 'Nintendo', 1986, 'Aventure', 1),
('Minecraft', 'Mojang', 2011, 'Sandbox', 1),
('FIFA 23', 'EA Sports', 2022, 'Sport', 0),
('Call of Duty: Modern Warfare', 'Activision', 2019, 'Shooter', 1),
('The Witcher 3', 'CD Projekt Red', 2015, 'RPG', 0)
;

INSERT INTO membre (pseaudo, email, date_joint, abonnement_id)
VALUES 
('JohnDoe', 'john.doe@example.com', '2023-01-15', NULL),
('JaneSmith', 'jane.smith@example.com', '2022-06-22', NULL),
('AlexTheGreat', 'alex.great@example.com', '2023-08-09', NULL),
('MiaRose', 'mia.rose@example.com', '2023-03-11', NULL),
('ChrisPower', 'chris.power@example.com', '2022-11-20', NULL);
