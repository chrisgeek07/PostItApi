require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let(:user) { User.create(username: "testuser", password: "password", token: "valid_token") }
  let(:headers) { { "Authorization" => "Bearer #{user.token}" } }

  describe "GET /api/v1/users/:user_id/posts" do
    it "returns all posts" do
      get "/api/v1/users/#{user.id}/posts", headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /api/v1/users/:user_id/posts" do
    it "creates a new post" do
      post_params = { post: { content: "New post", user_id: user.id } }
      post "/api/v1/users/#{user.id}/posts", params: post_params, headers: headers
      puts response.body if response.status == 422
      expect(response).to have_http_status(:created)
    end
  end
end
