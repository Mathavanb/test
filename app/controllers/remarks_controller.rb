class RemarksController < ApplicationController
  before_action :set_category
  before_action :set_product
  before_action :set_remark, only: %i[ show edit update destroy ]

  # POST /remarks or /remarks.json
  def create
    @remark = @product.remarks.new(remark_params)

      if @remark.save
        redirect_to category_product_url(@category,@product), notice: "Remark was successfully created."
      else
        redirect_to category_product_url(@category,@product), notice: "Remark not Added"
      end
  end


  # DELETE /remarks/1 or /remarks/1.json
  def destroy
    @remark = @product.remarks.find(params[:id])
    if @remark.destroy
      redirect_to category_product_url(@category,@product), notice: "Remark was successfully deleted."
    else
      redirect_to category_product_url(@category,@product), notice: "Error Occured"
    end
  end

  private
  def set_category
    @category = Category.find(params[:category_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_remark
      @remark = @product.remarks.find(params[:id])
    end

  def set_product
    @product = @category.products.find(params[:product_id])
  end

    # Only allow a list of trusted parameters through.
    def remark_params
      params.require(:remark).permit(:body, :product_id)
    end
end
