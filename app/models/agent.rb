# frozen_string_literal: true

class Agent
  include ActiveModel::API

  attr_accessor :id, :uuid, :full_name, :nationality, :licence_duration, :agency

  def full_name
    @full_name.titleize
  end

  def titleized_agency
    agency.titleize
  end

  class << self
    def all
      CSV.table(agents_csv).map do |agent_attributes|
        new(agent_attributes.to_h)
      end
    end

    def with_agency
      all.reject { |agent| agent.agency.nil? }
    end

    def where(**args)
      all.select { |agent| args.all? { |k, v| agent.send(k) == v.presence } }
    end

    private

    def agents_csv
      File.expand_path("lib/agents.csv")
    end
  end
end
