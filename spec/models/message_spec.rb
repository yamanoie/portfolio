

RSpec.describe Message, type: :model do
	# メッセージがあれば有効な状態であること
	it "is valid with a message" do
		user = FactoryBot.create(:user)
		room = FactoryBot.create(:room)
		message = user.messages.build(
			message: "hogehogehoge",
			user_id: 1,
			room_id: 1,
		)
		expect(message).to be_valid
	end
	# メッセージがなければ無効な状態であること
	it "is invalid without a message" do
		post = Message.new(message: nil)
		post.valid?
		expect(post.errors[:message]).to include("can't be blank")
	end
end