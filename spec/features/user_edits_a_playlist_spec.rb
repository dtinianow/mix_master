require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see newly added songs and do not see removed songs" do
    # As a user
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "New Song")
    # Given that a playlist and songs exist in the database
    visit playlist_path(playlist)
    # When I visit that playlist's show page
    click_on "Edit"
    # And I click on "Edit"
    fill_in 'playlist_name', with: 'Jams'
    # And I enter a new playlist name
    uncheck("song-#{first.id}")
    # And I select an additional song
    check("song-#{new_song.id}")
    # And I uncheck an existing song
    click_on "Update Playlist"
    # And I click on "Update Playlist"
    expect(page).to have_content 'Jams'
    # Then I should see the playlist's updated name
    expect(page).to have_content new_song.title
    # And I should see the name of the newly added song
    expect(page).not_to have_content first.title
    # And I should not see the name of the removed song
  end
end
