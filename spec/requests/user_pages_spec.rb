require 'spec_helper'

describe "User pages" do

 
	 subject { page }

  	describe "signup page" do
   	 before { visit signup_path }

    	it { should have_content('Sign Up') }
    	it { should have_title(full_title('Sign Up')) }
  end
   


describe "profile page" do
  # Replace with code to make a user variable
  it "should have the content user.name" do
	      visit signup_path
	      expect(page).to have_content('Sign Up')
	 end
	 
	  it "should have the title 'Sign Up'" do
      	  visit signup_path
      	  expect(page).to have_title("ShopMore-Online shopping website | Sign Up")
    end
   end

end



    
