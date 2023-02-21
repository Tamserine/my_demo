# frozen_string_literal: true

# create the articles table to hold items posted by users
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :donation_description
      t.bigint :collection_id
      t.string :section
      t.text :collection_notes
      t.decimal :price
      t.text :currency
      t.text :payment_type
      t.datetime :created_at
      t.datetime :updated_at
      t.string :status
      t.datetime :expiry
      t.integer :likes
      t.boolean :by_user
      t.integer :impressions
      t.integer :views
      t.boolean :is_owner
      t.boolean :first
      t.datetime :last_listed
    end
  end
end
