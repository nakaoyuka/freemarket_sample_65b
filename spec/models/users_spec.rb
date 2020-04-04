require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_jp_nameがない場合は登録できないこと" do
      user = build(:user, last_jp_name: nil)
      user.valid?
      expect(user.errors[:last_jp_name]).to include("を入力してください")
    end
    
    it "first_jp_nameがない場合は登録できないこと" do
      user = build(:user, first_jp_name: nil)
      user.valid?
      expect(user.errors[:first_jp_name]).to include("を入力してください")
    end
    
    it "year_idがない場合は登録できないこと" do
      user = build(:user, year_id: nil)
      user.valid?
      expect(user.errors[:year_id]).to include("を入力してください")
    end
    
    it "month_idがない場合は登録できないこと" do
      user = build(:user, month_id: nil)
      user.valid?
      expect(user.errors[:month_id]).to include("を入力してください")
    end
    
    it "day_idがない場合は登録できないこと" do
      user = build(:user, day_id: nil)
      user.valid?
      expect(user.errors[:day_id]).to include("を入力してください")
    end
    
    it "telがない場合は登録できないこと" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("を入力してください")
    end
    
    it "zip_codeがない場合は登録できないこと" do
      user = build(:user, zip_code: nil)
      user.valid?
      expect(user.errors[:zip_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:user, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "addresssがない場合は登録できないこと" do
      user = build(:user, addresss: nil)
      user.valid?
      expect(user.errors[:addresss]).to include("を入力してください")
    end

    it " nicknameが8文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は12文字以内で入力してください")
    end
    
    it "emailのフォーマットが不適切でないか" do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に登録されています")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "a000000", password_confirmation: "a000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "q00000", password_confirmation: "q00000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it " passwordが英数字が含まれていない時は登録できないこと " do
      user = build(:user, password: "q00000", password_confirmation: "q00000")
      user.valid?
      expect(user.errors[:password]).to include("英数字を含めて入力してください")
    end

    t "passwordとpassword_confirmationが一致していないと登録できない" do
      user = build(:user, password: "a123456", password_confirmation: "a123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordとpassword_confirmationが一致していないと登録できない" do
      user = build(:user, password: "a123456", password_confirmation: "b987654")
      user.valid?
      expect(user.errors[:password_confirmation][0]).to include("とパスワードの入力が一致しません")
    end


  end
end