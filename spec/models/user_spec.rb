require 'rails_helper'

describe User do
  describe '#create' do
    # 1. 全てのカラムが入力されている時に登録できること
    it 'is valid with a all_column' do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. emailが空では登録できないこと
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 3. 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    # 4. passwordが空では登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpasswrd_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. passwordが数字だけだと登録できないこと
    it 'is invalid if password is only numbers ' do
      user = build(:user, password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user.errors[:password]).to include('Password Include both letters and numbers')
    end

    # 7. passwordが英語だけだと登録できないこと
    it 'is invalid if password is only english ' do
      user = build(:user, password: 'aaaaaa', password_confirmation: 'aaaaaa')
      user.valid?
      expect(user.errors[:password]).to include('Password Include both letters and numbers')
    end

    # 8. passwordが数字と英語両方使うと登録できること
    it 'is You can register if password uses both numbers and English ' do
      user = build(:user, password: '000aaa', password_confirmation: '000aaa')
      expect(user).to be_valid
    end

    # 9. passwordが6文字以上であれば登録できること
    it 'is valid with a password that has more than 6 characters ' do
      user = build(:user, password: '000aaa', password_confirmation: '000aaa')
      expect(user).to be_valid
    end

    # 10. passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters ' do
      user = build(:user, password: '000aa', password_confirmation: '000aa')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    # 11. nicknameが空では登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 12. first_nameが空だと登録できないこと
    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 13. first_nameが全角文字だと登録できること
    it 'is valid You can register if first_name is full-width characters ' do
      user = build(:user, first_name: '太郎')
      expect(user).to be_valid
    end

    # 14. first_nameが全角文字以外だと登録できないこと
    it 'is invalid cannot register if first_name is not full-width characters' do
      user = build(:user, first_name: 'tarou')
      user.valid?
      expect(user.errors[:first_name]).to include('Full-width characters')
    end

    # 15. family_nameが空だと登録できないこと
    it 'is invalid without a family_name' do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # 16. family_nameが全角文字だと登録できること
    it 'is valid You can register if family_name is full-width characters ' do
      user = build(:user, family_name: '山田')
      expect(user).to be_valid
    end

    # 17. family_nameが全角文字以外だと登録できないこと
    it 'is invalid cannot register if first_name is not full-width characters' do
      user = build(:user, family_name: 'yamada')
      user.valid?
      expect(user.errors[:family_name]).to include('Full-width characters')
    end

    # 18. first_name_kanaが空だと登録できないこと
    it 'is invalid without a first_name_kana' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 19. first_name_kanaが全角カタカナだと登録できること
    it 'is valid You can register if first_name_kana is full-width characters ' do
      user = build(:user, first_name_kana: 'タロウ')
      expect(user).to be_valid
    end

    # 20. first_name_kanaが全角カタカナ以外だと登録できないこと
    it 'is invalid cannot register if first_name_kana is not full-width characters' do
      user = build(:user, first_name_kana: 'tarou')
      user.valid?
      expect(user.errors[:first_name_kana]).to include('Full-width characters')
    end

    # 21. family_name_kanaが空だと登録できないこと
    it 'is invalid without a family_name_kana' do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    # 22. family_name_kanaが全角カタカナだと登録できること
    it 'is valid You can register if family_name_kana is full-width characters ' do
      user = build(:user, family_name_kana: 'ヤマダ')
      expect(user).to be_valid
    end

    # 23. family_name_kanaが全角カタカナ以外だと登録できないこと
    it 'is invalid cannot register if family_name_kana is not full-width characters' do
      user = build(:user, family_name_kana: 'yamada')
      user.valid?
      expect(user.errors[:family_name_kana]).to include('Full-width characters')
    end

    # 21. birthdayが空だと登録できないこと
    it 'is invalid without a birthday' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end
