require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下であれば登録できる' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを正しく入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを正しく入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを正しく入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'abc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが空欄です")
      end
      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが空欄です")
      end
      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '00aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは正しく入力してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を正しく入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を正しく入力してください")
      end
      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のフリガナを正しく入力してください")
      end
      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナを正しく入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を正しく入力してください")
      end
      it 'last_nameが全角入力でなければ登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字が空欄です")
      end
      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が空欄です")
      end
      it 'last_name_rubyが全角カタカナでなければ登録できない' do
        @user.last_name_ruby = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のフリガナが空欄です")
      end
      it 'first_name_rubyが全角カタカナでなければ登録できない' do
        @user.first_name_ruby = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナが空欄です")
      end
    end
  end
end
