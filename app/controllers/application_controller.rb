class ApplicationController < ActionController::Base
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'Realize login para continuar ou crie uma nova conta'
    end
  end
end
