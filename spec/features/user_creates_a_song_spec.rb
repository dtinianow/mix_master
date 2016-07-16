require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)
    # As a user
    song_title = "One Love"
    # Given that artists exist in the database
    visit artist_path(artist)
    # When I visit the artist songs index
    click_on "New song"
    # And I click "New song"
    fill_in "song_title", with: "One Love"
    # And I fill in the title
    click_on "Create Song"
    # And I click "Create Song"
    expect(page).to have_content song_title
    # Then I should see the song name
    expect(page).to have_link artist.name, href: artist_path(artist)
    # And I should see a link to the song artist's individual page
  end
end
