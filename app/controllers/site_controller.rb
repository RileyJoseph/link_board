class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:secret]

  def index
    @posts = Post.all
    @votes = Vote.all
  end

  def about
  end

  def create
  end

end