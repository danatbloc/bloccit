require 'rails_helper'
include SessionsHelper

RSpec.describe FavoritesController, type: :controller do
  let(:my_topic) { create(:topic) }
  let(:my_user) { create(:user) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }
  
  context 'guest user' do
    describe 'POST create' do
      it 'redirects the user to the sign in view' do
        post :create, params: { post_id: my_post.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe 'DELETE destroy' do
      it 'redirects the user to the sign in view' do
        favorite = my_user.favorites.where(post: my_post).create
        delete :destroy, params: { post_id: my_post.id, id: favorite.id }
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context 'signed in user' do
    before do
      create_session(my_user)
    end

    describe 'POST create' do
      it 'redirects to the posts show view' do
        post :create, params: { post_id: my_post.id }
        expect(response).to redirect_to([my_topic, my_post])
      end

      it 'creates a favorite for the current user and specified post' do
        # expect(my_user.favorites.find_by_post_id(my_post.id)).to be_nil
        # my_user favored their own post when created.
        # See create_favorite_for_post_author method. This spec not needed.

        post :create, params: { post_id: my_post.id }
        expect(my_user.favorites.find_by_post_id(my_post.id)).not_to be_nil
      end
    end

    describe 'DELETE destroy' do
      it 'redirects to the posts show view' do
        favorite = my_user.favorites.where(post: my_post).create
        delete :destroy, params: { post_id: my_post.id, id: favorite.id }
        expect(response).to redirect_to([my_topic, my_post])
      end

      it 'destroys the favorite for the current user and post' do
        # favorite = my_user.favorites.where(post: my_post).create
        # my_user favored their own post when my_post was created on line 7 above.
        # See create_favorite_for_post_author method.
        # The above favorite create (line 55) method not needed anymore and causes an error because it creates a duplicate favorite.

        expect( my_user.favorites.find_by_post_id(my_post.id) ).not_to be_nil

        delete :destroy, params: { post_id: my_post.id, id: my_post.favorites.first.id }
        expect( my_user.favorites.find_by_post_id(my_post.id) ).to be_nil
      end
    end
  end
end
