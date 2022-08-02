class StrapsController < ApplicationController
  before_action :authenticate_user!
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end  
end
