require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end


  test "when all fields are present it saves user" do
   user = User.new name:"name", email:"example@email.com", password:"passwo"
   assert user.valid?
  end


  test "when name does not exist" do
  	user = User.new email:"example@email.com", password:"passwo"
   assert !user.valid?
  end


  test "when email does not exist" do
  	user = User.new name:"name", password:"passwo"
   assert !user.valid?
  end



  test "when password does not exist" do
  	user = User.new name:"name", email:"example@email.com"
   assert !user.valid?
  end


  test "when email is not valid" do
  	addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
    	user = User.new name:"name", email:invalid_address, password:"passwo"
    	assert !(user.valid?)
    end
  end



  test "when email is valid" do
  	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
    	user = User.new name:"name", email:valid_address, password:"passwo"
    	assert (user.valid?) 
    end
  end


  test "when password length is short" do
  	user = User.new name:"name", email:"example@email.com", password:"passw"
   assert !user.valid?
  end


  test "when email is already taken" do
  	user = User.new name:"name", email:"example@email.com", password:"passwo"
    same_email = user.dup
    same_email.email = user.email.upcase
    same_email.save
    assert !(user.valid?)
  end
       

end
