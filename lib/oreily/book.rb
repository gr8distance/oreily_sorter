require 'date'

module Oreily
  BASE_URL = 'https://www.oreilly.co.jp'.freeze

  class Book
    attr_reader :isbn, :title, :price, :published_on
    def initialize(record)
      case record
      when Array
        intialize_from_array(record)
      when ::Book
        initialize_from_model(record)
      else
        raise ArgumentError, "Invalid argument class: #{record.class}"
      end
    end

    def to_url
      "#{BASE_URL}/books/#{isbn.gsub('-', '')}"
    end

    def to_model
      ::Book.new(
        isbn: isbn,
        title: title,
        price: price,
        published_on: published_on
      )
    end

    private

    def intialize_from_array(array)
      @isbn = record[0]
      @title = record[1]
      @price = record[2].gsub(',', '').to_i
      @published_on = parse_date(record[3])
    end

    def initialize_from_model(model)
      @isbn = model.isbn
      @title = model.title
      @price = model.price
      @published_on = model.published_on
    end

    def set_price
      record[2].gsub(',', '').to_i
    end

    def parse_date(date)
      return nil if date.nil?

      Date.parse(date)
    end
  end
end
