CREATE TABLE abonnement (
    id_abonnement INT AUTO_INCREMENT PRIMARY KEY,
    type_abonnement VARCHAR(15) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

CREATE TABLE membre (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(10) NOT NULL,
    email VARCHAR(15) NOT NULL,
    date_joint DATE NOT NULL,
    abonnement_id INT,
    FOREIGN KEY (abonnement_id) REFERENCES abonnement(id_abonnement)
);

CREATE TABLE jeu (
    id_jeu INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(10) NOT NULL,
    studio_developpement VARCHAR(20) NOT NULL,
    annee_sortie VARCHAR(20) NOT NULL,
    genre VARCHAR(10) NOT NULL,
    multijoueur TINYINT(1) NOT NULL
);

CREATE TABLE tournoi (
    id_tournoi INT AUTO_INCREMENT PRIMARY KEY,
    nom_tournoi VARCHAR(10) NOT NULL,
    date_tournoi DATE NOT NULL,
    recompenses VARCHAR(20) NOT NULL,
    id_jeu INT,
    FOREIGN KEY (id_jeu) REFERENCES jeu(id_jeu)
);

CREATE TABLE participer (
    id_membre INT,
    id_tournoi INT,
    score INT NOT NULL,
    rang_final INT NOT NULL,
    PRIMARY KEY (id_membre, id_tournoi),
    FOREIGN KEY (id_membre) REFERENCES membre(id_membre),
    FOREIGN KEY (id_tournoi) REFERENCES tournoi(id_tournoi)
);

CREATE TABLE emprunter (
    date_emprunt DATE NOT NULL,
    date_retour DATE NOT NULL,
    date_retour_reelle DATE,
    id_membre INT,
    id_jeu INT,
    PRIMARY KEY (id_membre, id_jeu),
    FOREIGN KEY (id_membre) REFERENCES membre(id_membre),
    FOREIGN KEY (id_jeu) REFERENCES jeu(id_jeu)
);

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

INSERT INTO abonnement (type_abonnement, date_debut, date_fin)
VALUES
('Mensuel', '2024-01-01', '2024-01-31'),
('Annuel', '2024-02-01', '2025-01-31'),
('Trimestriel', '2024-03-01', '2024-05-31'),
('Semestriel', '2024-04-01', '2024-09-30'),
('Annuel', '2024-05-01', '2025-04-30');

INSERT INTO tournoi (nom_tournoi, date_tournoi, recompenses, id_de_membre, id_Jeu)
VALUES
('Tournoi A', '2024-01-20', '500 USD', 1, 1),
('Tournoi B', '2024-02-15', 'Console de jeu', 2, 2),
('Tournoi C', '2024-03-10', '1000 USD', 3, 3),
('Tournoi D', '2024-04-05', 'Carte cadeau', 4, 4),
('Tournoi E', '2024-05-25', 'Trois jeux gratuits', 5, 5);

INSERT INTO emprunter (date_emprunt, date_retour, date_retour_reelle, id_membre, id_jeu)
VALUES
('2024-01-01', '2024-01-10', '2024-01-09', 1, 3),
('2024-02-05', '2024-02-12', '2024-02-12', 2, 4),
('2024-03-01', '2024-03-08', NULL, 3, 2),
('2024-03-15', '2024-03-20', '2024-03-19', 4, 1),
('2024-04-01', '2024-04-07', '2024-04-06', 5, 5);

INSERT INTO participer (score, rang_final, id_membre, id__tournoi)
VALUES
(85, 1, 1, 3),
(72, 2, 2, 1),
(60, 3, 3, 2),
(90, 1, 4, 4),
(50, 4, 5, 5);