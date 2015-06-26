require 'spec_helper'

describe Api::V1::UsersController do
  # Note: some headers are being added before every controller's request; check `spec_helper.rb` for more info

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      get :show, { id: @user.id}
    end
    
    it { should respond_with 200 }

    it "returns the information about a reporter on a hash" do
      user_response = json_response[:user]
      expect(user_response[:email]).to eql @user.email
    end

    it "has the product ids as an embedded object" do
      user_response = json_response[:user]
      expect(user_response[:product_ids]).to eql []
    end
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @users_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @users_attributes }
      end

      it { should respond_with 201 }

      it "renders the json response" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql @users_attributes[:email]
      end
    end

    context "when is not created" do
      before(:each) do
        # Note that email is not being included
        @invalid_user_attributes = { password: "12345678", password_confirmation: "12345678" }
        post :create, { user: @invalid_user_attributes }
      end

      it { should respond_with 422 }

      it "renders an errors JSON" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the JSON errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include("can't be blank")
      end
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      api_authorization_header(@user.auth_token)
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @user.id, 
                         user: { email: "newmail@example.com" } }
      end

      it { should respond_with 200 }

      it "renders the JSON representation for the updated user" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql "newmail@example.com"
      end
    end

    context "when is not created" do
      before(:each) do
        patch :update, { id: @user.id,
                         user: { email: "bademail.com" } }
      end

      it { should respond_with 422 }

      it "renders an errors JSON" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the JSON errors on why the user couldn't be updated" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include("is invalid")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      api_authorization_header(@user.auth_token)
      delete :destroy, { id: @user.id }
    end

    it { should respond_with 204 }
  end
end
