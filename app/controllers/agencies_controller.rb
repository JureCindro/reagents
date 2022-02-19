# frozen_string_literal: true

class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all.yield_self { |agencies| search_params.blank? ? agencies : agencies.search(search_params) }
  end

  def doo
    @agencies = Agency.doo.yield_self { |agencies| search_params.blank? ? agencies : agencies.search(search_params) }

    render :index
  end

  def sp
    @agencies = Agency.sp.yield_self { |agencies| search_params.blank? ? agencies : agencies.search(search_params) }

    render :index
  end

  private

  def search_params
    params.permit(:search, :commit)[:search]
  end
end
