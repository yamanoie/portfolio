

RSpec.describe Match, type: :model do
	# タイトル、テキスト、職業があれば有効な状態であること
	it "is valid with a title, text and occupation" do
		user = FactoryBot.create(:user)
		match = user.matches.build(
			title: "hoge",
			text: "hogehogehoge",
			occupation: true,
		)
		expect(match).to be_valid
	end
	# タイトルがなければ無効な状態であること
	it "is invalid without a title" do
		match = Match.new(title: nil)
		match.valid?
		expect(match.errors[:title]).to include("can't be blank")
	end
	# テキストがなければ無効な状態であること
	it "is invalid without a text" do
		match = Match.new(text: nil)
		match.valid?
		expect(match.errors[:text]).to include("can't be blank")
	end
	# 職業がなければ無効な状態であること
	it "is invalid without a occupation" do
		match = Match.new(occupation: nil)
		match.valid?
		expect(match.errors[:occupation]).to include("is not included in the list")
	end
end