require 'rails_helper'

feature 'CRUDing comments' do
  scenario "User posts a comment" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Posting"
    click_on "Add Comment"
    fill_in "Comment", with: "Rad Stuff, Yo."
    click_on "Create Comment"

    expect(page).to have_content("Posting")
    expect(page).to have_content("Rad Stuff, Yo.")
  end

  scenario "User views a comment" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Posting"
  end
end
