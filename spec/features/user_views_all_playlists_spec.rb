require 'rails_helper'

RSpec.feature "User visits playlists index" do
  scenario "they see links to each individual playlist page" do
    # As a user
    playlists = create_list(:playlist_with_songs, 2)
    # Given that playlists exist in the database
    visit playlists_path
    # When I visit the playlists index
    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
    # Then I should see each playlist's name
    # And each name should link to that playlist's individual page
  end
end
