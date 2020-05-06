class AddEnumeratorTypes < ActiveRecord::Migration[6.0]
  def up
    enable_extension 'pgcrypto'  # enable uuid
    execute <<-SQL
      CREATE TYPE player_position AS ENUM ('north', 'east', 'south', 'west');
      CREATE TYPE deal_zone AS ENUM ('all', 'ns', 'ew', 'none');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE player_position;
      DROP TYPE deal_zone;
    SQL
  end
end
