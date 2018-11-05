require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit sessions_url
  #
  #   assert_selector "h1", text: "Sessions"
  # end

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

  test "view_signup_with_blank_fields" do
  
 		visit signup_path

    fill_in "Email", with: "bob.lennon@gmail.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"

    click_on "S'inscrire"
    assert_link "Voici le lien pour la page du club"
    
  end

  test "view_signup_with_existing_email" do
 		visit signup_path
    fill_in "Prénom", with: "Bob"
    fill_in "Nom", with: "Lennon"
    fill_in "Email", with: "fred@fred.com"
    fill_in "Mot de passe", with: "Coucou"
    fill_in "Confirmez votre mot de passe", with: "Coucou"
    click_on "S'inscrire"
    assert_link "Voici le lien pour la page du club"
    
  end

end