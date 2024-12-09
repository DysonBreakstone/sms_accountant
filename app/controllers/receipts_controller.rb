class ReceiptsController < ApplicationController

  def new
    @receipt = Receipt.new
  end

  def create
    a = Receipt.create(receipt_params)
  end

  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  private
    def receipt_params
      params.require(:receipt).permit(:receipt_photo, :user_id, :vendor_id)
    end
end
