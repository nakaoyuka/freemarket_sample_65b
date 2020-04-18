class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm]


  def index
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)
  end
  
  def show
    @parents = Category.all.where(ancestry: nil)
  end

  def new
  end

  def confirm
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def testset
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
