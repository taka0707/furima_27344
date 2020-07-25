require 'rails_helper'

RSpec.describe SendingDestination, type: :model do
  before do
    user = build(:user)
    @item = create(:item, user: user)
    # @item.image = { io: File.open("#{Rails.root}/public/images/test_image.jpg"), filename: 'test_image.jpg' }
    @sending_destination = build(:SendingDestination, item: @item)
  end
  describe '#create' do
    context 'can save' do
      it 'is valid with post_code, prefecture_id, city, house_number, building_name,phone_number' do
        expect(@sending_destination).to be_valid
      end

      it 'is valid with phone_number that less than 11 and without "-"' do
        @sending_destination.phone_number = '00000000000'
        expect(@sending_destination).to be_valid
      end

      it 'is valid with price that has "-"' do
        @sending_destination.post_code = '000-0000'
        expect(@sending_destination).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without post_code' do
        @sending_destination.post_code = nil
        @sending_destination.valid?
        expect(@sending_destination.errors[:post_code]).to include("can't be blank")
      end

      it 'is invalid without prefecture_id' do
        @sending_destination.prefecture_id = nil
        @sending_destination.valid?
        expect(@sending_destination.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'is invalid without city' do
        @sending_destination.city = nil
        @sending_destination.valid?
        expect(@sending_destination.errors[:city]).to include("can't be blank")
      end

      it 'is invalid without house_number' do
        @sending_destination.house_number = nil
        @sending_destination.valid?
        expect(@sending_destination.errors[:house_number]).to include("can't be blank")
      end

      it 'is invalid without phone_number' do
        @sending_destination.phone_number = nil
        @sending_destination.valid?
        expect(@sending_destination.errors[:phone_number]).to include("can't be blank")
      end

      it 'is invalid without "-" in post_code' do
        @sending_destination.post_code = '0000000'
        @sending_destination.valid?
        expect(@sending_destination.errors[:post_code]).to include('is invalid')
      end

      it 'is invalid with "-" in phone_number' do
        @sending_destination.phone_number = '000-000-000'
        @sending_destination.valid?
        expect(@sending_destination.errors[:phone_number]).to include('is invalid')
      end
    end
  end
end
