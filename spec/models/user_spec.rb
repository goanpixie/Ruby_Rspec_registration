require 'rails_helper'
RSpec.describe User, type: :model do
  it "should not save if email already exists." do
   User.create(
    first_name: "Jane",
    last_name: "Doe",
    email: "janethebest@codingdojo.com"
   )
   user = User.new(
    first_name: "Jane",
    last_name: "Smith",
    email: "janethebest@codingdojo.com"
   )
   expect(user).to be_invalid
  end
   it "should contain a valid email" do
   user = User.new(
    first_name: 'Roald',
    last_name: 'Dahl',
    email: 'roalddahl'
   )
   expect(user).to be_invalid
  end


  it "should not save if first_name field is blank." do
   user = User.new(
    first_name: ''
   )
   expect(user).to be_invalid
  end

   it "should not save if last_name field is blank." do
   user = User.new(
    last_name: ''
   )
   expect(user).to be_invalid
  end

   it "should not save if email field is blank." do
   user = User.new(
    email: ''
   )
   expect(user).to be_invalid
  end

   it "should not save if password field is blank." do
   user = User.new(
    password: ''
   )
   expect(user).to be_invalid
  end

   it "should not save if password and rpwd do not match field is blank." do
   user = User.new(
    first_name: "jo",
    last_name: "galecki",
    email:  "jo@galecki.com",
    password: "dare",
    rpwd: "dare1"
   )
   expect(user).to be_invalid
  end

  it "password must be encrypted" do
  	my_password = 'password'

  	user = User.new(
  		email: 'roalddahl@gmail.com',
  		first_name: 'roald',
  		last_name: 'dahl',
  		password: my_password
  	)

  	user.save
  	expect(user.password_digest).not_to eq(my_password)
  end


end