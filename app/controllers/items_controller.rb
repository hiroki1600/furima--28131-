class ItemsController < ApplicationController
  before_action :move_to_index, expect: [:index]
  def index
  end

  def new
  end

  def create
  end

 private

  def move_to_index
    unless user_sign_in?
      redirect_to action: :index
  end
end
