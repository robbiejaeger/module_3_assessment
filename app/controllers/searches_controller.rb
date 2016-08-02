class SearchesController < ApplicationController

  def show
    @stores = Store.find_by_zip(params[:zip])
  end
end
