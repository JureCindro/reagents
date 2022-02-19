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

  class AgencyCollection < Array
    def search(query)
      select { |agency| agency.name =~ %r{.*#{query}.*}i }
    end
  end

  class << self
    def all
      AgencyCollection.new(
        Agent.with_agency.map(&:agency).uniq
             .map { |agency| new name: agency }
             .sort_by(&:name)
      )
    end

    def doo
      AgencyCollection.new(all.reject { |agency| agency.name =~ /S\.P\.?/i })
    end

    def sp
      AgencyCollection.new(all.select { |agency| agency.name =~ /S\.P\.?/i })
    end

    def agent_counts
      @agent_counts ||= Agent.all.group_by(&:agency).transform_values(&:count)
    end
  end
end
