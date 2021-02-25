class PasswordResetController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: 'If an account with that email is present you should receive an email in 5 minutes'
  end

  def edit
    @user = User.find_by
  end
end