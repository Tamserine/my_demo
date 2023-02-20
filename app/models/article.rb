# frozen_string_literal: true

# Articles a user may have posted
class Article < ApplicationRecord
  # Articles posted by users having photos and locations
  belongs_to :user
  has_one :location
  has_many :photos

  def self.update_article_record(import_data)
    puts 'updating'
    Article.update!(
      id: import_data['id'],
      title: import_data['title'],
      description: import_data['description'],
      donation_description: import_data['donation_description'],
      collection_id: import_data['collection']['id'],
      section: import_data['section'],
      collection_notes: import_data['collection_notes'],
      price: import_data['value']['price'],
      currency: import_data['value']['currency'],
      payment_type: import_data['value']['payment_type'],
      created_at: import_data['value']['created_at'],
      updated_at: import_data['updated_at'],
      status: import_data['status'],
      expiry: import_data['expiry'],
      likes: import_data['likes'],
      by_user: import_data['by_user'],
      impressions: import_data['impressions'],
      views: import_data['views'],
      user_id: import_data['user']['id'],
      is_owner: import_data['is_owner'],
      last_listed: import_data['last_listed']
    )
  end

  def self.create_article_record(import_data)
    puts 'new record'
    Article.find_or_create_by(
      id: import_data['id'],
      title: import_data['title'],
      description: import_data['description'],
      donation_description: import_data['donation_description'],
      collection_id: import_data['collection']['id'],
      section: import_data['section'],
      collection_notes: import_data['collection_notes'],
      price: import_data['value']['price'],
      currency: import_data['value']['currency'],
      payment_type: import_data['value']['payment_type'],
      created_at: import_data['value']['created_at'],
      updated_at: import_data['updated_at'],
      status: import_data['status'],
      expiry: import_data['expiry'],
      likes: import_data['likes'],
      by_user: import_data['by_user'],
      impressions: import_data['impressions'],
      views: import_data['views'],
      user_id: import_data['user']['id'],
      is_owner: import_data['is_owner'],
      last_listed: import_data['last_listed']
    )
  end
end
