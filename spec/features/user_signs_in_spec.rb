require 'rails_helper'

RSpec.feature "User signs in with Spotify" do
  scenario "they see a link to sign out" do
    auth_data = {
        'provider'  => 'spotify',
        'info' => {
          'id'           => '12345'
        }
      }

    OmniAuth.config.mock_auth[:spotify] = auth_data

    visit playlists_path
    click_link "Sign in with Spotify"
    expect(page).to have_content("Sign out")
    expect(page).to have_content(auth_data['info']['id'])
    expect(page).to_not have_content("Sign in with Spotify")
  end
end
# As a user
# When I visit the playlists index
# And I click "Sign in with Spotify"
# Then I should see a "Sign Out" link
# And I should see my display name
# And I should not see "Sign in with Spotify"
