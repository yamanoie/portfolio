require 'rails_helper'


RSpec.describe User, type: :model do
	it "ユーザー新規登録" do
		user = User.new(
			name: ""
		)
		expect(user.name).to be_valid
	end
end





# RSpec.describe "Userモデルのテスト", type: :model do
# 	describe "バリデーションのテスト" do
# 		let(:user) { built(:user) }
# 		subject { user.valid? }
# 		context "nameカラム" do
# 			let(:user) { user }
# 			it "空欄でないこと" do
# 				user.name = ''
# 				is_expected.to eq false;
# 			end
# 		end
# 	end
# end