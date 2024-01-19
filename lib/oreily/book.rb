require 'date'

module Oreily
  BASE_URL = 'https://www.oreilly.co.jp'.freeze

  class Book
    attr_reader :isbn, :title, :price, :published_on
    def initialize(record)
      @isbn = record[0]
      @title = record[1]
      @price = record[2].gsub(',', '').to_i
      @published_on = parse_date(record[3])
    end

    def to_url
      "#{BASE_URL}/books/#{isbn.gsub('-', '')}"
    end

    private

    def parse_date(date)
      return nil if date.nil?

      Date.parse(date)
    end
  end
end
