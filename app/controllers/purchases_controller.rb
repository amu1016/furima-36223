class PurchasesController < ApplicationController
  before_action :set_item, only: :create

  def index
    @purchase = Purchase.new(user_id: current_user.id, item_id: params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      return redirect_to root_path
    else
      @purchase = Purchase.new(user_id: current_user.id, item_id: params[:item_id])
      render 'index'
    end
  end

  private

  def purchase_destination_params
    params.require(:purchase_destination).permit(:postal_code, :prefecture_id , :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @purchase = Purchase.new(user_id: current_user.id, item_id: params[:item_id])
    @item = @purchase.item
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_destination_params[:token],
        currency: 'jpy'
      )
  end
end
