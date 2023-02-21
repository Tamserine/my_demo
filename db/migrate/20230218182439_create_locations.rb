# frozen_string_literal: true

# create the locations table
class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.bigint :article_id
      t.decimal :longitude
      t.decimal :latitude
      t.string :town
      t.string :country
    end
  end
end
