require 'rails_helper'

describe "user can login" do
  let!(:user) {create(:user)}

  context "with the correct credentials" do
    it "a user can login" do
      post '/api/v1/login', params: { email: user.email, password: user.password }

      expect(response).to be_successful

      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(user_data[:data]).to be_a(Hash)
      expect(user_data[:data][:attributes]).to have_key(:first_name)
      expect(user_data[:data][:attributes]).to have_key(:last_name)
      expect(user_data[:data][:attributes]).to have_key(:email)
    end
  end

  context "with incorrect credentials" do
    it "a user cannot login" do
      post '/api/v1/login', params: { email: 'user@email.com', password: "nope"}

      expect(response.status).to be(401)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:error]).to eq("Email or password invalid. Please try again.")
    end
  end
end
