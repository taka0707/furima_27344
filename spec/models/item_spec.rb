require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = create(:user)
    @item = build(:item, user_id: user.id)
    @item.image = {io: File.open("#{Rails.root}/public/images/test_image.jpg"), filename: 'test_image.jpg'}
  end
  describe '#create' do
    context 'can save' do
      it 'is valid with name, introduction, category_id, condition_id, postage_payer_id, 
          prefecture_id, preparation_day_id, price, image' do
        expect(@item).to be_valid
      end

      it 'is valid with price that less than 9999999' do
        @item.price = 999999
        expect(@item).to be_valid
      end

      it 'is valid with price that more than 300' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without introduction' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors[:introduction]).to include("can't be blank")
      end

      it 'is invalid without image' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'is invalid without category_id' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'is invalid without condition_id' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it 'is invalid without postage_payer_id' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors[:postage_payer_id]).to include("can't be blank")
      end

      it 'is invalid without prefecture_id' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'is invalid without preparation_day_id' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include("can't be blank")
      end

      it 'is invalid without price' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it 'is invalid with price that more than 10000000' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it 'is invalid with price that less than 299' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end
    end
  end
end