<?php

/** ARCHITECTURE PHP SERVEUR  : Rôle du fichier controller.php
 * 
 *  Dans ce fichier, on va définir les fonctions de contrôle qui vont traiter les requêtes HTTP.
 *  Les requêtes HTTP sont interprétées selon la valeur du paramètre 'todo' de la requête (voir script.php)
 *  Pour chaque valeur différente, on déclarera une fonction de contrôle différente.
 * 
 *  Les fonctions de contrôle vont éventuellement lire les paramètres additionnels de la requête, 
 *  les vérifier, puis appeler les fonctions du modèle (model.php) pour effectuer les opérations
 *  nécessaires sur la base de données.
 *  
 *  Si la fonction échoue à traiter la requête, elle retourne false (mauvais paramètres, erreur de connexion à la BDD, etc.)
 *  Sinon elle retourne le résultat de l'opération (des données ou un message) à includre dans la réponse HTTP.
 */

/** Inclusion du fichier model.php
 *  Pour pouvoir utiliser les fonctions qui y sont déclarées et qui permettent
 *  de faire des opérations sur les données stockées en base de données.
 */
require("model.php");

function readController(){

    $movie = getMovies();
    return $movie;
}

function updateController(){
    /* Lecture des données de formulaire
      On ne vérifie pas si les données sont valides, on suppose (faudra pas toujours...) que le client les a déjà
      vérifiées avant de les envoyer 
    */
    $name = $_REQUEST['name'];
    $director = $_REQUEST['director'];
    $year = $_REQUEST['year'];
    $lengh = $_REQUEST['length'];
    $description = $_REQUEST['description'];
    $id_category = $_REQUEST['id_category'];
    $image = $_REQUEST['image'];
    $trailer = $_REQUEST['trailer'];
    $min_age = $_REQUEST['min_age'];
    // Mise à jour du menu à l'aide de la fonction updateMenu décrite dans model.php
    $ok = updateMovie($name, $director, $year, $lengh, $description, $id_category, $image, $trailer, $min_age);
    // $ok est le nombre de ligne affecté par l'opération de mise à jour dans la BDD (voir model.php)
    if ($ok!=0){
      return "Le $name $director $year $lengh $description $id_category $image $trailer $min_age a été mis à jour avec succès !";
    }
    else{
      return false;
    }
  }

  function addController() {
    $username = $_REQUEST['username'] ?? '';
    $avatar = $_REQUEST['avatar'] ?? '';
    $restriction = $_REQUEST['restriction'] ?? '';

    // Nettoyage des espaces
    $username = trim($username);
    $avatar = trim($avatar);
    $restriction = trim($restriction);

    // Vérification des champs obligatoires
    if ($username === '' || $restriction === '') {
        return ['error' => 'Le nom du profil et la restriction sont obligatoires.'];
    }

    // Vérification de la restriction : doit être un nombre valide
    $allowedRestrictions = [0, 12, 16, 18];
    if (!in_array((int)$restriction, $allowedRestrictions)) {
        return ['error' => 'La restriction d\'âge est invalide. Valeurs autorisées : 0, 12, 16, 18.'];
    }

    // Insertion dans la BDD via le modèle
    $ok = addUser($username, $avatar !== '' ? $avatar : null, (int)$restriction);

    if ($ok != 0) {
        return ['success' => "Le profil '$username' a été ajouté avec succès !"];
    } else {
        return ['error' => "Une erreur est survenue lors de l'ajout du profil."];
    }
}

  

  function detailController(){
    $id = $_REQUEST['id'];
    $movie = getdetailMovie($id);
    return $movie;
  }


  function readMoviesPerCategorieController()
{
  $film_list_cat = getMoviePerCategorie($_REQUEST['category'], $_REQUEST['age']);
  return $film_list_cat;
}
    
   