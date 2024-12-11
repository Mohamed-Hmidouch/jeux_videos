--------les requetes  Base-----
select pseaudo,email,date_joint from membre;
select titre,studio_developpement,genre from jeu;
select * from tournoi
where nom_tournoi = 'Tournoi A'
;
select * from emprunter
where  date_retour_reelle is NOT NULL
;
--------Requêtes avec Jointures-----
select membre.id_membre,membre.email,membre.date_joint,tournoi.nom_tournoi  from membre 
inner join participer on membre.id_membre = participer.id_membre
inner join tournoi on participer.id__tournoi = tournoi.id__tournoi;

SELECT membre.id_membre, membre.pseaudo, membre.email, abonnement.type_abonnement
FROM membre
INNER JOIN abonnement ON membre.abonnement_id = abonnement.id_abonnemnt
WHERE abonnement.type_abonnement = 'Annuel';

SELECT membre.pseaudo, jeu.titre, jeu.genre, jeu.studio_developpement, emprunter.date_emprunt, emprunter.date_retour
FROM membre
INNER JOIN emprunter ON membre.id_membre = emprunter.id_membre
INNER JOIN jeu ON emprunter.id_Jeu = jeu.id_Jeu
WHERE membre.pseaudo = 'JaneSmith';

SELECT membre.pseaudo, jeu.titre, jeu.genre, jeu.studio_developpement, emprunter.date_emprunt, emprunter.date_retour
FROM membre
INNER JOIN emprunter ON membre.id_membre = emprunter.id_membre
INNER JOIN jeu ON emprunter.id_Jeu = jeu.id_Jeu;

SELECT membre.pseaudo, abonnement.type_abonnement
FROM membre
INNER JOIN abonnement ON membre.abonnement_id = abonnement.id_abonnemnt;

SELECT count(id_jeu) FROM jeu;

SELECT id__tournoi 
FROM participer WHERE id_membre = (    SELECT id__membre
    FROM participer
    GROUP BY id__membre
    ORDER BY COUNT(id__tournoi) DESC)
;

select * from jeu where annee_sortie > 2010 order by titre asc;

SELECT DISTINCT id_membre 
FROM emprunter 
WHERE date_retour_reelle IS NULL;
SELECT * 
FROM tournoi
WHERE date_tournoi BETWEEN '2024-02-16' AND '2025-12-31'
ORDER BY date_tournoi ASC;

SELECT id_membre, COUNT(*) AS emprunts_actifs
FROM emprunter
WHERE date_retour IS NULL
GROUP BY id_membre
HAVING COUNT(*) > 1;