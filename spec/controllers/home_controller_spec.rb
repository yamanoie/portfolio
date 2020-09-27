require 'rails_helper'

RSpec.describe HomesController, type: :controller do
	describe "#top" do
		# 正常にレスポンスを返すこと
		it "responds successfully" do
			get :top
			expect(response).to be_success
		end
	end
	describe "#top" do
		# 正常にレスポンスを返すこと
		it "responds successfully" do
			get :welcome
			expect(response).to be_success
		end
	end
end
