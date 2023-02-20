# frozen_string_literal: true

# Photos of articles in different sizes
class Photo < ApplicationRecord
  # photos for articles
  belongs_to :article

  def self.create_photo_record(row, photos)
    puts "#{row['id']} #{photos['files']['small']}"
    Photo.find_or_create_by(
      article_id: row['id'],
      image_s: photos['files']['small'],
      image_m: photos['files']['medium'],
      image_l: photos['files']['large'],
      width: photos['dimensions']['width'],
      height: photos['dimensions']['height']
    )
  end
end
