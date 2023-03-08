class ProfilesController < ApplicationController

  def edit
    @user = User.new
  end
end
