class ApplicationController < ActionController::Base
  include SessionsHelper

  def new
    @article = Article.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def search
    @article = Article.where(activated: true).search(params[:search])
  end
end
