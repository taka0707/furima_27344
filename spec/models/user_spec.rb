require 'rails_helper'
describe User do
  describe '#create' do
    #  nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, first_name,
    family_name_kana, first_name_kana, birth_date" do
      user = build(:user)
      expect(user).to be_valid
    end
    #  nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    #  emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    #  passwordが空では登録できないこと
    it "is invalid without an password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
     # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without an family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without an first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without an family_name_kana" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    
    it "is invalid without an first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without an birth_date" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end
    #  passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "aaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is invalid notinclude number at password" do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it "is invalid notinclude alphabet at password" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    #  passwordが6文字以上の英数字混合では登録できること
    it "is valid with a password that has more than 6 characters and number and alphabet" do
      user = build(:user, password: "aaa000")
      expect(user).to be_valid
    end
    #  重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    #  family_nameが'ひらがな' 'カタカナ' '漢字'でなければ登録できないこと
    it "is invalid with a family_name that has not 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, family_name: "abe00")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    #  first_nameが'ひらがな' 'カタカナ' '漢字'でなければ登録できないこと
    it "is invalid with a first_name that has not 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, first_name: "abe00")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    #  family_nameが'ひらがな' 'カタカナ' '漢字'であれば登録できること
    it "is invalid with a family_name that has 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, family_name: "あ亜ア")
      expect(user).to be_valid
    end
    #  first_nameが'ひらがな' 'カタカナ' '漢字'であれば登録できること
    it "is invalid with a first_name that has 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, first_name: "あ亜ア")
      expect(user).to be_valid
    end
    #  family_name_kanaが 'カタカナ' でなければ登録できないこと
    it "is invalid with a family_name that has not 'カタカナ'" do
      user = build(:user, family_name_kana: "あ亜")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    #  first_name_kanaが 'カタカナ' でなければ登録できないこと
    it "is invalid with a first_name_kana that has not 'カタカナ'" do
      user = build(:user, first_name_kana: "あ亜")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    #  family_name_kanaが 'カタカナ' であれば登録できること
    it "is invalid with a family_name_kana that has 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, family_name_kana: "アイウ")
      expect(user).to be_valid
    end
    #  first_name_kanaが 'カタカナ' であれば登録できること
    it "is invalid with a first_name_kana that has 'ひらがな' 'カタカナ' '漢字'" do
      user = build(:user, first_name_kana: "アイウ")
      expect(user).to be_valid
    end

  end
end