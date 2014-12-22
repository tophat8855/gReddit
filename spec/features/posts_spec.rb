require 'rails_helper'

feature 'CRUDing posts' do
  scenario "User creates a post" do
    visit posts_path
    click_on "New Post"
    fill_in "Subject", with: "Weather"
    fill_in "Post text", with: "Can you believe it's snowing?"
    click_on "Create Post"

    expect(page).to have_content("Weather")
    expect(page).to have_content("Can you believe it's snowing?")
  end
end
