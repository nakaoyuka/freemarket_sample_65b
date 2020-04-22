class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :pay, :done]
  before_action :set_card, only: [:index, :pay]
  before_action :set_parents, only: [:index, :done]

  require 'payjp'

  def index
    # card = Card.where(user_id: current_user.id).first
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to edit_card_path(current_user.id)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    # card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price , #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => @card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
  end

  def done
    @parents = Category.all.where(ancestry: nil)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end