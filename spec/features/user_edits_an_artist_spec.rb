require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the updated name of the artist and existing image" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    #     As a user
    # Given that an artist exists in the database
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    # When I visit that artist's show page
    visit artist_path(artist)
    # And I click on "Edit"
    click_on 'Edit'
    # And I fill in a new name
    fill_in 'artist_name', with: "Damian Marley"
    # And I click on "Update Artist"
    click_on 'Update Artist'
    # Then I should see the artist's updated name
    expect(page).not_to have_content "Bob Marley"
    expect(page).to have_content "Damian Marley"
    # Then I should see the existing image
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
