require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '商品購入' do
    before do
      @purchase_destination = FactoryBot.build(:purchase_destination)
      
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば購入できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_destination.building_name = ""
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが存在しなければ保存できないこと' do
        @purchase_destination.postal_code = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが英字であれば保存できないこと' do
        @purchase_destination.postal_code = "abc-test"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角であれば保存できないこと' do
        @purchase_destination.postal_code = "あいう-えおかき"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが数字のみであれば保存できないこと' do
        @purchase_destination.postal_code = 1234567
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが初期値では登録できないこと' do
        @purchase_destination.prefecture_id = 0
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが存在しなければ保存できないこと' do
        @purchase_destination.city = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが存在しなければ保存できないこと' do
        @purchase_destination.address = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが存在しなければ保存できないこと' do
        @purchase_destination.phone_number = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank", "Phone number is too short", "Phone number is invalid. Input only naumber")
      end
      it 'phone_numberが10桁より小さいと保存できないこと' do
        @purchase_destination.phone_number = "090123412"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが英字であると保存できないこと' do
        @purchase_destination.phone_number = "abcdefghij"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid. Input only naumber")
      end
      it 'phone_numberが全角であると保存できないこと' do
        @purchase_destination.phone_number = "あいうえおかきくけこ"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid. Input only naumber")
      end
      it 'tokenが存在しなければ保存できないこと' do
        @purchase_destination.token = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end