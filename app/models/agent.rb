# frozen_string_literal: true

class Agent
  include ActiveModel::API

  attr_accessor :id, :uuid, :nationality, :licence_duration
  attr_writer :full_name, :agency

  def full_name
    @full_name.titleize
  end

  def agency
    @agency&.titleize
  end

  class AgentCollection < Array
    def search(query)
      select { |agent| agent.full_name =~ %r{.*#{query}.*}i }
    end
  end

  class << self
    def all
      @all ||= AgentCollection.new(CSV.table(agents_csv).map { |agent_attributes| new(agent_attributes.to_h) })
    end

    def with_agency
      @with_agency ||= AgentCollection.new(all.reject { |agent| agent.agency.nil? })
    end

    def without_agency
      @without_agency ||= AgentCollection.new(all.select { |agent| agent.agency.nil? })
    end

    def where(**args)
      AgentCollection.new(all.select { |agent| args.all? { |k, v| agent.send(k) == v.presence } })
    end

    private

    def agents_csv
      File.expand_path("lib/agents.csv")
    end
  end
end
