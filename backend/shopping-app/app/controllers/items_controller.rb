class ItemsController < ApplicationController
before_action :find_item, only: [:update, :destroy]

def index
  render json: Item.all
end

def show
  render json: Item.find(params[:id])
end

def update
  @item.update(item_params)
  if @item.save
    render json: @item, status: :accepted
  else
    render json: { errors: @item.errors.full_messages }, status: :unprocessible_entity
  end
end

def destroy
  render json: Item.find(params[:id]).destroy
end

private

def item_params
  params.permit(:id, :name, :pic_url, :price, :category_id, :user_id)
end

def find_item
  @item = Item.find(params[:id])
end
end
