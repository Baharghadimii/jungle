class Admin::SalesController < ApplicationController

  def index   
    @sales = Sale.all  
  end
  def new
    @sales = Sale.new
  end
  def create
    @sales = Sale.new(sale_params)
    if @sales.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end
  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :starts_on,
      :ends_on,
      :percent_off
    )
  end
end
