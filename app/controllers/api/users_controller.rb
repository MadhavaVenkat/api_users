class Api::UsersController < ApplicationController
    before_action :set_user ,only: %i[show update destroy]

    def index
      @users = User.all 
      unless  @users.nil?
        render json: {users: @users , message: "users listed successfully"}
      else
        render json: {message: "users not listed"}
      end     
    end

    def show
      if @user
        render json: {user: @user, message: "user fetched successfully"}
      else
        render json: {message: "user not fetched "}
      end
    end


    def create
      user = User.new(user_params)
      if user.save
        render json: {user: user,message: "user created successfully"}
      else
        render json: {message: "user not created"}
      end
    end

    def update
      if @user.update_attributes(user_params)
        render json: {user: @user, message: "user updated successfully"}
      else
        render json: {message: "user not updated"}
      end
    end

    def destroy
      if @user
        @user.destroy
        render json: {message: "user deleted successfully"}
      else
        render status: 305, json: {message: "user not deleted"}
      end
    end

    def query
      search_query = request.params[:query]
      users_listed = User.any_of({firstname: /#{search_query}/},{lastname: /#{search_query}/},{email: /#{search_query}/}).entries
      @output = []
      users_listed.each do |user|
        user.attributes.each do |key,value|
           if value =~ /#{search_query}/
             @output << value
           end
        end
      end

      unless @output.nil?
        render json: @output
      else
        render json: {message: "no data found"}
      end
    end

    private

    def user_params
       params.require(:user).permit(:firstname,:lastname,:email)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
