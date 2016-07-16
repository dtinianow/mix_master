require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they visit the artist index and do not see that artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path
    # As a user
    # Given that an artist exists in the database
    expect(page).to have_content "Bob Marley"
    # When I visit that artist's show page
    click_on "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    # And I click on "Delete"
    click_on "Delete"
    # Then I should be back on the artist index page
    expect(page).to have_current_path(artists_path)
    # Then I should not see the artist's name
    expect(page).not_to have_content "Bob Marley"
  end
end
