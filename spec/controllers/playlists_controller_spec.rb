require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    it "creates a new playlist" do
      expect {
        post :create, params: {:playlist => attributes_for(:playlist)}
      }.to change(Playlist, :count).by(1)
    end
    it "assigns a newly created playlist as @playlist" do
      post :create, params: {:playlist => attributes_for(:playlist)}
      expect(assigns(:playlist)).to be_a(Playlist)
      expect(assigns(:playlist)).to be_persisted
    end
    it "redirects to the created playlist" do
      post :create, params: {:playlist => attributes_for(:playlist)}
      expect(response).to redirect_to(Playlist.last)
    end
  end

  describe "PUT #update" do
    it "updates a playlist" do
      playlist = create(:playlist)
      put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: 'Jams') }
      playlist.reload
      expect(playlist.name).to eq("Jams")
    end
    it "assigns an updated playlist as @playlist" do
      playlist = create(:playlist)
      put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "Jams")}
      expect(assigns(:playlist)).to eq([playlist])
    end
    it "redirects to the updated playlist" do
      playlist = create(:playlist)
      put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: 'Jams')}
      expect(response).to redirect_to(Playlist.last)
    end
  end
end
