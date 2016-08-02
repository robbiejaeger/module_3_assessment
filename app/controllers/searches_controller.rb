class SearchesController < ApplicationController

  def show
    @stores, @total = Store.find_by_zip(params[:zip])
  end
end
