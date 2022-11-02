class ShopController < ApplicationController
  def shopId
    @user_id = params[:id]
    @Itemm = Item.where(user_id: @user_id).all
  end
end
