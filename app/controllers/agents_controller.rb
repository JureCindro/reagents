# frozen_string_literal: true

class AgentsController < ApplicationController
  def index
    @agents = Agent.where(**filter_params.to_h.symbolize_keys)
  end

  private

  def filter_params
    params.permit(filter: [:agency])[:filter]
  end
end
