class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    u = User.new
    u.thing = params[:file]
    u.save!
    render :text => %{<a href="#{u.thing.url}">#{u.thing.url}</a>}
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
  end

end