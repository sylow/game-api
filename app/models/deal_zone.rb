class DealZone
  ZONES = %w(ns ew all none).freeze

  def self.as_hash
    Hash[self::ZONES.map { |el| [el, el] }]
  end
end