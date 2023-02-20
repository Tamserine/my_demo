# frozen_string_literal: true

# Locations of articles
class Location < ApplicationRecord
  has_one :article

  def self.create_location_row(row)
    Location.find_or_create_by(
      article_id: row['id'],
      longitude: row['location']['longitude'],
      latitude: row['location']['latitude'],
      town: row['location']['town'],
      country: row['location']['country']
    )
  end
end
