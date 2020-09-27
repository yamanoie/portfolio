require 'rails_helper'

RSpec.describe User, type: :model do
	# 姓、名、メール、国、パスワードがあれば有効な状態であること
	it "is valid with a nmae, email, country, and password" do
		user = User.new(
			name: "Tarou",
			email: "test@example.com",
			country: false,
			password: "xxxxxxx",
		)
		expect(user).to be_valid
	end
	# 名がなければ無効な状態であること
	it "is invalid without a name" do
		user = User.new(name: nil)
		user.valid?
		expect(user.errors[:name]).to include("can't be blank")
	end
	# メールアドレスがなければ無効な状態であること
	it "is invalid without an email address" do
		user = User.new(email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end
	# 国がなければ無効な状態であること
	it "is invalid without an country" do
		user = User.new(country: nil)
		user.valid?
		expect(user.errors[:country]).to include("is not included in the list")
	end
	# 重複したメールアドレスなら無効な状態であること
	it "is invalid with a duplicate email address" do
		User.create(
			name: "Tarou",
			email: "test@example.com",
			country: true,
			password: "xxxxxxx",
		)
		user = User.new(
			name: "Hanako",
			email: "test@example.com",
			country: true,
			password: "xxxxxxx",
		)
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end
end