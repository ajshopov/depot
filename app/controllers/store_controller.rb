class StoreController < ApplicationController
  def index
    @products = Product.order(:title) #alphabetical
  end
end
