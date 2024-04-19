require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  it 'userが紐付いていなければ出品できない' do
    @purchase.user = nil
    @purchase.valid?
    expect(@purchase.errors[:user]).to include('must exist')
  end

  it 'itemが紐付いていなければ出品できない' do
    @purchase.item = nil
    @purchase.valid?
    expect(@purchase.errors[:item]).to include('must exist')
  end
end
