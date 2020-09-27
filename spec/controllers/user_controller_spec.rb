require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "#index" do
		# 認証済みユーザーとして
		context "as an authenticated user" do
			before do
				@user = FactoryBot.create(:user)
			end
			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :index
				expect(response).to be_success
			end
			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :index
				expect(response).to have_http_status "200"
			end
		end
		#　ゲストとして
		context "as a guest" do
			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :index
				expect(response).to have_http_status "302"
			end
			# サインイン画面にリダイレクトすること
			it "redirects to the sign_in page" do
				get :index
				expect(response).to redirect_to new_user_session_path
			end
		end
	end
end
