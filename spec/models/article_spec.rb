# frozen_string_literal: true

require 'rails_helper'
describe Article do
  describe '#create' do
    it 'creates an Article record' do
      instrument = Faker::Music.instrument
      band = Faker::Music.band
      album = Faker::Music.album
      fake_user = User.create!(first_name: Faker::Name.first_name, avatar_s: 'small.jpg', avatar_m: 'medium.jpg',
                               avatar_l: 'large.jpg')

      fake_article = described_class.create!(
        title: instrument,
        description: band,
        user_id: fake_user.id,
        section: 'Product',
        collection_notes: album,
        status: 'Available'
      )

      expect(fake_article).to have_attributes(
        title: instrument,
        description: band,
        section: 'Product',
        collection_notes: album,
        status: 'Available'
      )
    end
  end
end
