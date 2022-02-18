class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all
  end

  def doo
    @agencies = Agency.doo

    render :index
  end

  def sp
    @agencies = Agency.sp

    render :index
  end
end
