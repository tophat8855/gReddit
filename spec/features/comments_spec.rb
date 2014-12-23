require 'rails_helper'

feature 'CRUDing comments' do
  scenario "User posts a comment" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Posting"
    click_on "Add your own comment"
    fill_in "Comment", with: "Rad Stuff, Yo."
    click_on "Create Comment"

    expect(page).to have_content("Posting")
    expect(page).to have_content("Rad Stuff, Yo.")
  end

  scenario "User edits a comment" do
    Post.create!(
    subject: "Posting",
    post_text: "Some stuff",
    )
    visit posts_path
    click_on "Posting"
    click_on "Add your own comment"
    fill_in "Comment", with: "this is a coment"
    click_on "Create Comment"
    click_on "Edit"
    fill_in "Comment", with: "this is a comment"
    click_on "Update Comment"

    expect(page).to have_content("Comments for Posting")
    expect(page).to have_content("this is a comment")
  end

  scenario "User deletes a comment" do
    Post.create!(
    subject: "Post",
    post_text: "Trolling the Interwebs",
    )
    visit posts_path
    click_on "Post"
    click_on "Add your own comment"
    fill_in "Comment", with: "this is a comment"
    click_on "Create Comment"
    click_on "Delete"

    expect(page).to have_no_content("this is a comment")
  end
end
