require 'rails_helper'

describe "THE SIGN UP PROCESS", :type => :feature do 

  it "----->Creates new user<---------\n" do 

    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: "user1@email.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button 'Sign up'

    expect(page).to have_content 'Welcome!'

  end

  it "----->does NOT create user with DUPLICATE email<---------\n" do 

    @user_1 = User.create email: "user_1@email.com", 
      password: 'password', 
      password_confirmation: 'password'

    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: @user_1.email
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button 'Sign up'

    expect(page).to have_content 'Email has already been taken'

  end  
  
  
end