class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new(user_id: current_user.id,item_id: params[:item_id])
  end

  def create
  end

  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token])
  end
end
