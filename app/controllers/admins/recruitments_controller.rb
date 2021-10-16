class Admins::RecruitmentsController < ApplicationController

  def index
    @recruitments = Recruitment.all.page(params[:page]).per(10).reverse_order
  end

  def destroy
    Recruitment.find_by(id: params[:id]).destroy
    redirect_to admins_recruitments_path
  end

end
