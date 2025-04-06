<?php
/**
 * Ce fichier contient toutes les fonctions qui réalisent des opérations
 * sur la base de données, telles que les requêtes SQL pour insérer, 
 * mettre à jour, supprimer ou récupérer des données.
 */

/**
 * Définition des constantes de connexion à la base de données.
 *
 * HOST : Nom d'hôte du serveur de base de données, ici "localhost".
 * DBNAME : Nom de la base de données
 * DBLOGIN : Nom d'utilisateur pour se connecter à la base de données.
 * DBPWD : Mot de passe pour se connecter à la base de données.
 */
define("HOST", "localhost");
define("DBNAME", "meignant3");
define("DBLOGIN", "meignant3");
define("DBPWD", "meignant3");

  function getMovies() {

    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    
    $sql = "SELECT  name, image FROM Movie";

    $answer = $cnx->query($sql);

       // Récupère les résultats de la requête sous forme d'objets
       $res = $answer->fetchAll(PDO::FETCH_OBJ);
       return $res; // Retourne les résultats
  }

  function updateMovie($n, $r, $y, $d, $t, $des, $c, $i, $u, $a) {
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL de mise à jour du menu avec des paramètres
    $sql = "REPLACE INTO Movies (name, réalisateur, year, date, time, description, Category, image, url, age_minimal)
    VALUES (:name, :réalisateur, :year, :date, :time, :description, :Category, :image, :url, :age_minimal)"; 
           
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie les paramètres aux valeurs
    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':réalisateur', $r);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':date', $d);
    $stmt->bindParam(':time', $t);
    $stmt->bindParam(':description', $des);
    $stmt->bindParam(':Category', $c);
    $stmt->bindParam(':image', $i);
    $stmt->bindParam(':url', $u);
    $stmt->bindParam(':age_minimal', $a);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées
}