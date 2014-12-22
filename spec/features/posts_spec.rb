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

  scenario "User views a post" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path

    expect(page).to have_content("Posting")
  end

  scenario "User deletes a post" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Posting"
    click_on "Delete"

    expect(page).to have_no_content("Posting")
  end
end
