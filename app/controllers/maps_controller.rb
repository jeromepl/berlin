class MapsController < ApplicationController
  inherit_resources
  respond_to :html
  respond_to :json, :only => [:show, :index]

  skip_before_filter :ensure_api_authenticated, :only => [:show, :index]

  actions :index, :show, :new, :create

  include Pageable

  def show
    @map = Map.find(params[:id])

    @games = @map.games.officials.recent.includes(:winners, :map)

    respond_with(@map, :callback => params[:callback])
  end
end
