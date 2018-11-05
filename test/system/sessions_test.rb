require "application_system_test_case"
include BCrypt

class SessionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit sessions_url
  #
  #   assert_selector "h1", text: "Sessions"
  # end

  #Test qui montre que le user peut se connecter et qui vérifier que le lien de la homepage est existant
  test "view_homepage" do
  
  	visit '/'

		assert_link 'Connectez-vous!'  	

 		visit signup_path

    fill_in "Prénom", with: "Bob"
    fill_in "Nom", with: "Lennon"
    fill_in "Email", with: "bob.lennon@gmail.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"

    click_on "S'inscrire"
 
    assert_link "Voici le lien pour la page du club"


  end


  #Test de la page d'inscription avec des champs vides et qui renvoie des erreurs
  test "view_signup_with_blank_fields" do
  
 		visit signup_path

    fill_in "Email", with: "bob.lennon@gmail.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"

    click_on "S'inscrire"
    assert_no_link "Voici le lien pour la page du club"

  end


  #Test de la page d'inscription avec l'email doublon et qui renvoie des erreurs
  test "view_signup_with_existing_email" do

 		visit signup_path
    fill_in "Prénom", with: "Bob"
    fill_in "Nom", with: "Lennon"
    fill_in "Email", with: "fred@fred.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"

    click_on "S'inscrire"
    assert_no_link "Voici le lien pour la page du club"

  end

  #Test de la présence des liens de la navbar
  test "nav_bar_links" do
 		visit signup_path
    assert_link "Secret App"
    assert_link "Home"
    assert_link "Connexion"
    assert_link "Inscription"
  end

  #Test de connexion sur la club page et vérification de la présence de toutes les informations de tous les utilisateurs
  test "test_private_club_page" do
  
  	visit '/'

		assert_link 'Connectez-vous!'  	

 		visit signup_path

    fill_in "Prénom", with: "Bob"
    fill_in "Nom", with: "Lennon"
    fill_in "Email", with: "bob.lennon@gmail.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"

    click_on "S'inscrire"
    click_on "Voici le lien pour la page du club"

    users = User.all
    users.each do |element|
    	assert_text element.id
    	assert_text element.prenom
    	assert_text element.nom
    	assert_text element.email   	    	    	    	
    end

  end

  #Test pour vérifier l'accès à la page de profil de l'utilisateur et des informations présentes
  test "show_profile_page_for_the_good_user" do

  	visit '/'
		click_on 'Connexion'  	
    fill_in "Email", with: "fred@fred.com"
    fill_in "Mot de passe", with: "hahahaha"
		click_on 'Login'
		click_on 'Mon Profil'

		assert_text "980190962"
		assert_text "Bob"
		assert_text "Lennon"
		assert_text "fred@fred.com"


	end	

	#Test pour vérifier qu'un user non connecté ne puisse accéder à la page de profil d'un utilisateur
  test "show_profile_page_with_a_visitor" do
  	visit '/users/980190962'
	end	

	#Test pour vérifier que l'utilisateur ne peux voir que son contenu de page de profil
  test "show_profile_page_with_another_connected_user" do
  	
  	visit '/'
		click_on 'Connexion'  	
    fill_in "Email", with: "fred@fred.com"
    fill_in "Mot de passe", with: "hahahaha"
		click_on 'Login'
  	visit '/users/298486374'
	end	


end