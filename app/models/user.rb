# frozen_string_literal: true

# Contains user details
class User < ApplicationRecord
  # User
  has_many :articles

  def self.create_user_row(row)
    User.find_or_create_by(
      id: row['user']['id'],
      first_name: row['user']['first_name'],
      avatar_s: row['user']['current_avatar']['small'],
      avatar_m: row['user']['current_avatar']['medium'],
      avatar_l: row['user']['current_avatar']['large']
    )
  end
end
