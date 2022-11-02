class ApplicationController < ActionController::Base
  def is_login?
        return session[:logged_in] == true
    end

    def must_be_logged_in
        if is_login?
            return true
        else
            redirect_to main_login_path, notice: "Ei Ei login na ja"
        end
    end
end
