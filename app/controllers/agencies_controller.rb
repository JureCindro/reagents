# frozen_string_literal: true

class AgenciesController < ApplicationController
  before_action :set_search_param

  def index
    @agencies = Agency.all.search(@search_param)
  end

  def doo
    @agencies = Agency.doo.search(@search_param)

    render :index
  end

  def sp
    @agencies = Agency.sp.search(@search_param)

    render :index
  end

  private

  def set_search_param
    @search_param = params.permit(:search, :commit)[:search]
  end
end
