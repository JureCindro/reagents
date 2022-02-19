# frozen_string_literal: true

class AgentsController < ApplicationController
  def index
    @agents = Agent.where(**query_params[:filter].to_h.symbolize_keys)
      .yield_self { |agents| search_params.blank? ? agents : agents.search(search_params) }
  end

  def without_agency
    @agents = Agent.without_agency
      .yield_self { |agents| search_params.blank? ? agents : agents.search(search_params) }

    render :index
  end

  private

  def query_params
    params.permit(:search, :commit, filter: [:agency])
  end

  def search_params
    query_params[:search]
  end
end
