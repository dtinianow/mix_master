require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they can see each artist and visit their individual page" do
    #  As a user
    bob_marley = "Bob Marley"
    bob_marley_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    mastodon = "Mastodon"
    mastodon_image_path = "https://pbs.twimg.com/profile_images/489801255716270080/Zrmh9T__.jpeg"
    # Given that artists exist in the database
    Artist.create(name: bob_marley, image_path: bob_marley_image_path)
    Artist.create(name: mastodon, image_path: mastodon_image_path)
    # When I visit the artists index
    visit artists_path
    # Then I should see each artist's name
    expect(page).to have_content bob_marley
    expect(page).to have_content mastodon
    # And each name should link to that artist's individual page
    click_on bob_marley
    expect(page).to have_content bob_marley
    expect(page).to have_css("img[src=\"#{bob_marley_image_path}\"]")
    click_on "Return to All Artists"
    click_on mastodon
    expect(page).to have_content mastodon
    expect(page).to have_css("img[src=\"#{mastodon_image_path}\"]")
  end
end
