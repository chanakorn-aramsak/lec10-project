class MainController < ApplicationController

  def login

  end

  def create
        u = User.where(login: params[:login]).first
        if u && u.authenticate(params[:password])
            session[:logged_in] = true
            session[:user_id] = u.id
            redirect_to '/main/user_Item'
        else 
            session[:logged_in] = false
            redirect_to '/main/login', notice: 'Incorrect username or password'
        end
  end

  def destroy
        reset_session
  end

  def user_Item
      if (session[:logged_in] == false) 
          redirect_to '/main/login', notice: 'Please Login!!!'
      end
      @items = Item.where(user_id: session[:user_id]).all
      @Userrr = User.where(id: session[:user_id]).first
  end


  def destroyItem
      @item = Item.find(params[:id])
      @item.destroy
      Inventory.destroy_by(item_id: params[:id])
      redirect_to '/main/user_Item', notice: 'Data was deleted'
  end

  def inventories 
        if (session[:logged_in] == false) 
            redirect_to '/main/login', notice: 'Please Login!!!'
        end
        @user_id = session[:user_id]     
        @Inventt = Inventory.where(user_id:@user_id).all
        
        @Userrr = User.where(id: @user_id).first
    end
end
