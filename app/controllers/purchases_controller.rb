class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new(user_id: current_user.id,item_id: params[:item_id])
  end

  def create
  end

end
