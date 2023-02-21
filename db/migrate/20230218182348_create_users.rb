# frozen_string_literal: true

# create the users table to hold user name and avatar
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :avatar_s
      t.string :avatar_m
      t.string :avatar_l
      t.string :roles
      t.decimal :longitude
      t.decimal :latitude
      t.string :verifications
    end
  end
end
