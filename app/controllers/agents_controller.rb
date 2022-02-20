# frozen_string_literal: true

class AgentsController < ApplicationController
  before_action :set_search_param

  def index
    @agents = Agent.where(**query_params[:filter].to_h.symbolize_keys).search(@search_param)
  end

  def without_agency
    @agents = Agent.without_agency.search(@search_param)

    render :index
  end

  private

  def query_params
    params.permit(:search, :commit, filter: [:agency])
  end

  def set_search_param
    @search_param = query_params[:search]
  end
end
