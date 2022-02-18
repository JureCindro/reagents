# frozen_string_literal: true

class Agency
  include ActiveModel::API

  attr_accessor :name

  def titleized_name
    name.titleize
  end

  class << self
    def all
      Agent.with_agency.map { |agent| new name: agent.agency }
    end

    def doo
      all.reject { |agency| agency.name =~ /S\.P\.?/i }
    end

    def sp
      all.select { |agency| agency.name =~ /S\.P\.?/i }
    end
  end
end
