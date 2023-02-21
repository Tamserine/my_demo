# frozen_string_literal: true

require 'rails_helper'
describe Article do
  describe '#create' do
    it 'creates an Article with some photos' do
      url = Faker::Internet.url
      instrument = Faker::Music.instrument
      band = Faker::Music.band
      album = Faker::Music.album
      fake_user = User.create!(first_name: Faker::Name.first_name, avatar_s: 'small.jpg', avatar_m: 'medium.jpg',
                               avatar_l: 'large.jpg')

      fake_article = described_class.create!(
        title: instrument, description: band,
        user_id: fake_user.id, section: 'Product',
        collection_notes: album, status: 'Available'
      )

      photo1 = Photo.create(
        article_id: fake_article.id, image_s: "#{url}/small1.jpg",
        image_m: "#{url}/medium1.jpg", image_l: "#{url}/large1.jpg",
        width: 400, height: 600
      )

      photo2 = Photo.create(
        article_id: fake_article.id, image_s: "#{url}/small2.jpg",
        image_m: "#{url}/medium2.jpg", image_l: "#{url}/large2.jpg",
        width: 400, height: 600
      )

      photo3 = Photo.create(
        article_id: fake_article.id, image_s: "#{url}/small3.jpg",
        image_m: "#{url}/medium3.jpg", image_l: "#{url}/large3.jpg",
        width: 400, height: 600
      )

      expect(photo1).to have_attributes(image_s: "#{url}/small1.jpg")
      expect(photo2).to have_attributes(image_m: "#{url}/medium2.jpg")
      expect(photo3).to have_attributes(image_l: "#{url}/large3.jpg")
    end
  end
end
