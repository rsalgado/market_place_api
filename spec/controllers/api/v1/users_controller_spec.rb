require 'spec_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = 'application/vnd.marketplace.v1' }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      get :show, { id: @user.id, format: :json }
    end
    
    it { should respond_with 200 }

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @users_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @users_attributes }, format: :json
      end

      it { should respond_with 201 }

      it "renders the json response" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @users_attributes[:email]
      end
    end

    context "when is not created" do
      before(:each) do
        # Note that email is not being included
        @invalid_user_attributes = { password: "12345678", password_confirmation: "12345678" }
        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it { should respond_with 422 }

      it "renders an errors JSON" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the JSON errors on why the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include("can't be blank")
      end
    end
  end
end
