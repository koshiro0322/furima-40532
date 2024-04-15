require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録できるとき' do
    it '必要な情報がすべて存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品登録できないとき' do
    it 'itemnameが空では登録できない' do
      @item.itemname = ''
      @item.valid?
      expect(@item.errors[:itemname]).to include("can't be blank")
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'category_idが1の場合は無効である' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'shipping_fee_responsibility_idが空では登録できない' do
      @item.shipping_fee_responsibility_id = ''
      @item.valid?
      expect(@item.errors[:shipping_fee_responsibility_id]).to include("can't be blank")
    end

    it 'shipping_fee_responsibility_idが1の場合は無効である' do
      @item.shipping_fee_responsibility_id = 1
      @item.valid?
      expect(@item.errors[:shipping_fee_responsibility_id]).to include("can't be blank")
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    it 'condition_idが1の場合は無効である' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'prefecture_idが1の場合は無効である' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'shipping_duration_idが空では登録できない' do
      @item.shipping_duration_id = ''
      @item.valid?
      expect(@item.errors[:shipping_duration_id]).to include("can't be blank")
    end

    it 'shipping_duration_idが1の場合は無効である' do
      @item.shipping_duration_id = 1
      @item.valid?
      expect(@item.errors[:shipping_duration_id]).to include("can't be blank")
    end
    it '商品画像が空では出品できない' do
      # @item = build(:item, image: nil)
      @item.image.detach
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors[:price]).to include('is not a number')
    end

    it '価格が300円未満では出品できない' do
      @item.price = 150
      @item.valid?
      expect(@item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 20_000_000
      @item.valid?
      expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
    end

    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include('must exist')
    end
  end
end
