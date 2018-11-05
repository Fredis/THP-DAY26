require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(nom: "John", prenom: "Kennedy", email: "john.kennedy@gmail.com", password: "proutproutprout", password_confirmation: "proutproutprout")
		@user2 = User.new(nom: "Dave", prenom: "Campbell", email: "john.kennedy@gmail.com", password: "proutproutprout", password_confirmation: "proutproutprout")
	end

  test "the user prenom can't be blank" do
    @user.prenom = "     "
    assert_not @user.save
  end

  test "the user prenom can't be nil" do
    @user.prenom = nil
    assert_not @user.save
  end

  test "the user can't have a same mail address than in db" do
  	@user.save
  	assert_not @user2.save
	end

end
