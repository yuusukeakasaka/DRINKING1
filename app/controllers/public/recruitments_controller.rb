class Public::RecruitmentsController < ApplicationController

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.user_id = current_user.id
    if @recruitment.save
       redirect_to recruitments_path
    else
       render :new
    end
  end

  def index
    @recruitments = Recruitment.all.page(params[:page]).per(5).reverse_order
  end

  def destroy
    Recruitment.find_by(id: params[:id]).destroy
    redirect_to recruitments_path
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:recruitment_post, :user_id)
  end

end