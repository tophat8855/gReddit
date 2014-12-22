require 'rails_helper'

feature 'CRUDing comments' do
  scenario "User posts a comment" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Add Comment"
    fill_in "Comment", with: "Rad Stuff, Yo."
    click_on "Submit Comment"

    expect(page).to have_content("Posting")
    expect(page).to have_content("Rad Stuff, Yo.")
  end
end
