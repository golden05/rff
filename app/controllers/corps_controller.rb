class CorpsController < ApplicationController

  before_action :admin_signed

  def index
    @corps = Corp.all
  end

  def new
    @corp = Corp.new
  end
  
  def create
    corp = Corp.new(corp_params) 
    if corp.save
      redirect_to corps_url, notice: "success #{corp.name} was created."
    else
      redirect_to new_corp_url, notice: "some error not create"
    end
  end

  def edit
    set_corp 
  end

  def update
    set_corp
    @corp.update(corp_params)
    redirect_to corps_url, notice: "corp #{@corp.name} was success updated"
  end


  private

  def set_corp
    @corp = Corp.find(params[:id])
  end

  def corp_params
    params.require(:corp).permit(:name)
  end
end
