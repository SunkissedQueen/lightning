class StrapsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end  
end
