require 'rails_helper'

RSpec.describe User, type: :model do
 describe "新規登録" do
  it "nicknameが必須" do
    user = User.new(nickname: "")
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
  end
  it "emailが必須" do
    user = User.new(email: "")
    user.valid?
    expect(user.errors.full_messages).to include("Email can't be blank")
  end
  it "emailが一意性" do
    user = create(:user)
    another_user = build(:user,email: user.email)
    anoter_user.valid?
    binding.pry
  end
  it "emailには＠を含む" do
  end
  it "passwordが必須" do
  end
  it "passwordは、６文字以上必須" do
  end
  it "passwordは、半角英数混合であること" do
  end
  it "passwordは、確認用を含めて２回入力すること" do
  end
  it "passwordとpassword_confirmationは、値の一致が必須" do
  end

  it "family_nameが必須" do
  end
  it "first_nameが必須" do
  end
  it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須" do
  end
  it "first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須" do
  end
  it "family_name_kanaが必須" do
  end
  it "first_name_kanaが必須" do
  end
  it "family_name_kanaは、全角（カタカナ）での入力が必須" do
  end
  it "first_name_kanaは、全角（カタカナ）での入力が必須" do
  end
  it "birthdayが必須" do
  end

 end
end
