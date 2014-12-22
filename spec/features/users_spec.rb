require 'rails_helper'

feature "Users" do
  scenario "User registers" do
    visit signup_path
    fill_in "User name", with: "User1"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Sign up"

    expect(page).to have_content ("Welcome, User1")
  end

  scenario "User can sign out" do
    visit signup_path
    fill_in "User name", with: "User1"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Sign up"
    click_on "Sign Out"

    expect(page).to have_content ("Sign Up Sign In")
  end

  xscenario "User can sign in" do
    visit signup_path
    fill_in "User name", with: "User1"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"

    expect(page).to have_content ("Welcome, User1")
  end
end
