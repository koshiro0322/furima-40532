require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  context '新購入できるとき' do
    it '必要な情報がすべて存在すれば登録できる' do
      expect(@purchase_address).to be_valid
    end

    it 'building_nameが空では登録できること' do
      @purchase_address.building_name = nil
      @purchase_address.valid?
      expect(@purchase_address).to be_valid
    end
  end
  context '購入できない時' do
    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors[:token]).to include("can't be blank")
    end

    it 'postal_codeが空では登録できない' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors[:postal_code]).to include("can't be blank")
    end

    it 'cityが空では登録できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors[:city]).to include("can't be blank")
    end

    it 'street_addressが空では登録できない' do
      @purchase_address.street_address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors[:street_address]).to include("can't be blank")
    end

    it 'phone_numberが空では登録できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors[:phone_number]).to include("can't be blank")
    end

    it '電話番号は10文字未満だと保存できない' do
      @purchase_address.phone_number = '123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors[:phone_number]).to include('is too short (minimum is 10 characters)')
    end

    it '電話番号は12文字以上だと保存ができない' do
      @purchase_address.phone_number = '123456789012'
      @purchase_address.valid?
      expect(@purchase_address.errors[:phone_number]).to include('is too long (maximum is 11 characters)')
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列以外だと保存ができない' do
      @purchase_address.postal_code = 1_234_567
      @purchase_address.valid?
      expect(@purchase_address.errors[:postal_code]).to include('は「3桁ハイフン4桁」の形式で入力してください')
    end

    it '電話番号は半角数値以外だと保存できない' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors[:phone_number]).to include('は半角数字のみ入力してください')
    end
    it 'prefecture_idが空では登録できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'prefecture_idが1の場合は無効である' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors[:prefecture_id]).to include("can't be blank")
    end
    it 'userが紐付いていなければ出品できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ出品できない' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
