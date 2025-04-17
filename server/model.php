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
    
    $sql = "SELECT id, name, image, min_age FROM Movie";

    $answer = $cnx->query($sql);

       // Récupère les résultats de la requête sous forme d'objets
       $res = $answer->fetchAll(PDO::FETCH_OBJ);
       return $res; // Retourne les résultats
  }

  function updateMovie($n, $r, $y, $t, $des, $c, $i, $u, $a) {
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL de mise à jour du menu avec des paramètres
    // $sql = "REPLACE INTO Movies (name, director, year, lengh, description, id_category, image, trailer, min_age)
    // VALUES (:name, :director, :year, :lengh, :description, :id_category, :image, :trailer, :min_age)"; 

    $sql = "INSERT INTO `Movie`(`name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`)
     VALUES (:name, :year, :lentgh, :description, :director, :id_category, :image, :trailer, :min_age)";
           
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie les paramètres aux valeurs
    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':director', $r);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':lentgh', $t);
    $stmt->bindParam(':description', $des);
    $stmt->bindParam(':id_category', $c);
    $stmt->bindParam(':image', $i);
    $stmt->bindParam(':trailer', $u);
    $stmt->bindParam(':min_age', $a);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées

}


/*function addUser($us, $av, $rest) {
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL pour insérer un nouvel utilisateur
    $sql = "INSERT INTO `User`(`username`, `avatar`, `restriction`) 
    VALUES (:username, :avatar, :restriction)";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie les paramètres aux valeurs
    $stmt->bindParam(':username', $us);
    $stmt->bindParam(':avatar', $av);
    $stmt->bindParam(':restriction', $rest);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées

}
*/

function addUser($us, $av, $rest) {
  try {
      $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
      $sql = "INSERT INTO `User`(`username`, `avatar`, `restriction`) VALUES (:username, :avatar, :restriction)";
      $stmt = $cnx->prepare($sql);
      $stmt->bindParam(':username', $us);
      $stmt->bindParam(':avatar', $av);
      $stmt->bindParam(':restriction', $rest);
      $stmt->execute();
      return $stmt->rowCount(); 
  } catch (PDOException $e) {
      echo json_encode(['error' => $e->getMessage()]); // <<< on affiche l'erreur
      http_response_code(500);
      exit(); // <<< très important pour éviter les erreurs fantômes
  }
}



function getdetailMovie($id) {
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL pour récupérer les détails d'un film par son ID
    $sql = "SELECT Movie. *, Category.name AS category_name
            FROM Movie
            INNER JOIN Category ON Movie.id_category = Category.id
            WHERE Movie.id = $id";

    $answer = $cnx->query($sql);

    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne le résultat
}

/*function getcategoryMovie($categorie) {
  $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 

  $sql= "SELECT Movie.id, Movie.name, Movie.image, 
            FROM Movie
            INNER JOIN Category ON Movie.id_Category = Category.id
            WHERE Category.name = :Category_name";

 $answer = $cnx->query($sql);

       // Récupère les résultats de la requête sous forme d'objets
       $res = $answer->fetchAll(PDO::FETCH_OBJ);
       return $res; // Retourne les résultats
}*/
function getMoviePerCategorie($cat)
{
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le Movie avec des paramètres
    $sql = "SELECT Movie.name, Movie.image, Movie.id
            FROM Movie
            INNER JOIN Category ON Movie.id_category = Category.id
            WHERE Category.name = :category_name";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);

    $stmt->bindParam(':category_name', $cat);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; 
    }






       