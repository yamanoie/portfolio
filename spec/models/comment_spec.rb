

RSpec.describe Comment, type: :model do
	# コメントがあれば有効な状態であること
	it "is valid with a comment" do
		user = FactoryBot.create(:user)
		post = FactoryBot.create(:post)
		comment = user.comments.build(
			comment: "hogehogehoge",
			user_id: 1,
			post_id: 1,
		)
		expect(comment).to be_valid
	end
	# コメントがなければ無効な状態であること
	it "is invalid without a comment" do
		comment = Comment.new(comment: nil)
		comment.valid?
		expect(comment.errors[:comment]).to include("can't be blank")
	end
end