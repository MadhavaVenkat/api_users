require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:each) do
    @user = User.create!(firstname: "venk",lastname: "madha", email: "venka@gmail.com")
  end

  describe "GET /api/users" do
    it "has status code 200" do
      get "/api/users"
      expect(response).to have_http_status(200)
      expect(response.body).to include("users listed successfully")
    end
  end

  describe "GET /api/users/:id" do
    it "has status code 200" do
      get "/api/users/#{@user.id}"
      expect(response).to have_http_status(200)
      expect(response.body).to include("user fetched successfully")
    end
  end

  describe "POST /api/users" do
    it "has status code 200" do
      post "/api/users", params: {user: { firstname: "venk",lastname: "madha", email: "venka@gmail.com" } }
      expect(response).to have_http_status(200)
      expect(response.body).to include("user created successfully")
    end

    it "user not created" do
      post "/api/users", params: {user: { firstname: "",lastname: "madha", email: "venka@gmail.com" } }
      expect(response.body).to include("user not created")
    end
  end

  describe "PUT /api/users/:id" do
    it "has status code 200" do
      put "/api/users/#{@user.id}", params: {user: { firstname: "venkatesh",lastname: "madhava", email: "venka@gmail.com" } }
      expect(response).to have_http_status(200)
      expect(response.body).to include("user updated successfully")
    end

    it "user not updated" do
      put "/api/users/#{@user.id}", params: {user: { firstname: "",lastname: "madhava", email: "venka@gmail.com" } }
      expect(response.body).to include("user not updated")
    end
  end

  describe "DELETE /api/users/:id" do
    it "has status code 200" do
      delete "/api/users/#{@user.id}"
      expect(response).to have_http_status(200)
      expect(response.body).to include("user deleted successfully")
    end
  end

  describe "GET /api/typehead" do
    it "has status code 200" do
      search_query = "ve"
      get "/api/typehead/#{search_query}"
      expect(response).to have_http_status(200)
    end
  end
end
