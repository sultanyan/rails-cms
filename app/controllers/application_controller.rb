class ApplicationController < ActionController::Base

  before_filter :get_page_nav, :get_jumbotron, :get_blocks
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  # Define a method in the master application controller
  # So that it is accessable by all controllers extending it
  def get_page_nav
      @pageNav = Page.where("menu_display" == true && "is_published" == true).order(order: :asc)
  end

  def get_jumbotron
      @jumbotron = Block.where("position = 'jumbotron'")
  end

  def get_blocks
      @blocks = Block.where("position = 'block'").order(order: :asc)
  end
end
