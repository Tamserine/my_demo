# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#create' do
    it 'creates a user record' do
      url = Faker::Internet.url
      first_name = Faker::Name.first_name
      user = described_class.create!(
        first_name:,
        avatar_s: "#{url}/small.jpg",
        avatar_m: "#{url}/medium.jpg",
        avatar_l: "#{url}/large.jpg"
      )
      expect(user).to have_attributes(
        first_name:,
        avatar_s: "#{url}/small.jpg",
        avatar_m: "#{url}/medium.jpg",
        avatar_l: "#{url}/large.jpg"
      )
    end
  end
end
