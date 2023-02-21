# frozen_string_literal: true

require 'open-uri'
require 'json'
# require 'pry'

namespace :demo_import do
  desc 'Import the JSON article list'
  task import: :environment do
    puts 'Importing Data ...'

    # demo_data = JSON.load(URI.open('https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'))
    demo_data = ''

    # File.open('https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json') do |f|
    File.open('app/assets/test-articles-v4.json') do |f|
      demo_data = JSON.parse(f.read)
    end

    demo_data.each do |row|
      puts "Processing #{row['id']}"

      valid_article = Article.find_by(id: row['id'])
      User.create_user_row(row)

      if valid_article
        puts " found #{valid_article.id} #{valid_article.title}  #{valid_article.description}"
        # Article.update_article_record(row)
      else
        puts "new article #{valid_article}"

        Location.create_location_row(row)
        Article.create_article_record(row)

        row['photos'].each do |photos|
          Photo.create_photo_record(row, photos)
          puts "#{row['id']} #{photos['files']['small']} #{photos['dimensions']}"
        end
      end
    end

    puts "total articles: #{Article.count}"
    puts "total users: #{User.count}"
    puts "total photos: #{Photo.count}"
    puts "total locations: #{Location.count}"
  end
end
