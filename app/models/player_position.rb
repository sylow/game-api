class PlayerPosition
  POSITIONS = %w(north east south west).freeze

  def self.as_hash
    Hash[self::POSITIONS.map { |el| [el, el] }]
  end
end