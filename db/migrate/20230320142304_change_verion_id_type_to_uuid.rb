# frozen_string_literal: true

class ChangeVerionIdTypeToUuid < ActiveRecord::Migration[7.0]
  def up
    add_column :versions, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :versions do |t|
      t.remove :id, type: :integer
      t.rename :uuid, :id
    end
    execute "ALTER TABLE versions ADD PRIMARY KEY (id);"
  end
end
