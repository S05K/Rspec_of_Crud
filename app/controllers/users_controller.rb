class UsersController < ApplicationController
    before_action :authenticate_user!

    # def loging 
    #     byebug
    #     @user = User.find_by(email: params[:email])
    #     if @user && @user.authenticate(params[:password])
    #         render json: @user 
    #     else
    #         render json: {error: "Not found"}
    #     end
    # end


end
