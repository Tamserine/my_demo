# frozen_string_literal: true

# create the photos table to hold photos related to items
class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.bigint :article_id
      t.string :image_s
      t.string :image_m
      t.string :image_l
      t.integer :width
      t.integer :height
    end
  end
end
