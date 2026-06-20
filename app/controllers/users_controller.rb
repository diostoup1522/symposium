class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :update ]
  def show
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(params.expect(user: [ :bio ]))
        redirect_to @user
      else
        render :show, status: :unprocessable_entity
      end
    else
      head :forbidden
    end
  end
end
