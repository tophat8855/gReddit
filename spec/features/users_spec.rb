require 'rails_helper'

feature "Users" do
  scenario "User creates a user" do
    visit users_path
    click_on "New User"
    fill_in "User Name", with: "User1"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Register"

    expect(page).to have_content ("Welcome, #{User1}")
  end
end
