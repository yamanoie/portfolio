

RSpec.describe Post, type: :model do
	# テキストがあれば有効な状態であること
	it "is valid with a text" do
		user = FactoryBot.create(:user)
		post = user.posts.build(
			text: "hogehogehoge",
			user_id: 1,
		)
		expect(post).to be_valid
	end
	# テキストがなければ無効な状態であること
	it "is invalid without a text" do
		post = Post.new(text: nil)
		post.valid?
		expect(post.errors[:text]).to include("can't be blank")
	end
	# テキストが141字以上の場合、無効な状態であること
	it "is invalid that text is 141 characters or more " do
		post = Post.new(text: "a" * 141)
		expect(post).to be_invalid
	end
end