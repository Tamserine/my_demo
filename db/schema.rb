# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_218_182_439) do
  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.text 'donation_description'
    t.bigint 'collection_id'
    t.string 'section'
    t.text 'collection_notes'
    t.decimal 'price'
    t.text 'currency'
    t.text 'payment_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'status'
    t.datetime 'expiry'
    t.integer 'likes'
    t.boolean 'by_user'
    t.integer 'impressions'
    t.integer 'views'
    t.boolean 'is_owner'
    t.bigint 'conversation_id'
    t.bigint 'user_id'
    t.boolean 'first'
    t.datetime 'last_listed'
  end

  create_table 'locations', force: :cascade do |t|
    t.bigint 'article_id'
    t.decimal 'longitude'
    t.decimal 'latitude'
    t.string 'town'
    t.string 'country'
  end

  create_table 'photos', force: :cascade do |t|
    t.bigint 'article_id'
    t.string 'image_s'
    t.string 'image_m'
    t.string 'image_l'
    t.integer 'width'
    t.integer 'height'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'avatar_s'
    t.string 'avatar_m'
    t.string 'avatar_l'
    t.string 'roles'
    t.decimal 'longitude'
    t.decimal 'latitude'
    t.string 'verifications'
  end
end
