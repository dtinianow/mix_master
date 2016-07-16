require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they see the page for the individual artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    #As a user
    #When I visit the artists index
    visit artists_path
    #And I click "New artist"
    click_on "New artist"
    #And I fill in the name
    fill_in "artist_name", with: artist_name
    #And I fill in an image path
    fill_in "artist_image_path", with: artist_image_path
    #And I click "Create Artist"
    click_on "Create Artist"
    #Then I should see the artist name and image on the page
    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

 context "the submitted data is invalid" do
   scenario "they see an error message" do
     # As a user
     artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
     # When I visit the artists index
     visit artists_path
     # And I click "New artist"
     click_on "New artist"
     # And I fill in an image path
     fill_in "artist_image_path", with: artist_image_path
     # And I click "Create Artist"
     click_on "Create Artist"
     # Then I should see "Name cannot be blank" on the page
     expect(page).to have_content "Name can't be blank"
   end
 end
end
