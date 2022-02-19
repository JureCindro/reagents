# frozen_string_literal: true

class Agency
  include ActiveModel::API

  attr_writer :name

  def name
    @name.titleize
  end

  def agent_count
    self.class.agent_counts[name]
  end

  class << self
    def all
      Agent.with_agency.map(&:agency).uniq
        .map { |agency| new name: agency }
        .sort_by(&:name)
    end

    def doo
      all.reject { |agency| agency.name =~ /S\.P\.?/i }
    end

    def sp
      all.select { |agency| agency.name =~ /S\.P\.?/i }
    end

    def agent_counts
      @agent_counts ||= Agent.all.group_by(&:agency).transform_values(&:count)
    end
  end
end
