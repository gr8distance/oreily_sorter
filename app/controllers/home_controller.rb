class HomeController < ApplicationController
  class InvalidQueryError < StandardError; end

  def index
    @books = fetch_books
  end

  private

  def fetch_books
    query = params[:q]
    return Book.all.order(published_on: :desc) if query.blank?

    case query.to_sym
    when :price_asc then Book.all.order(price: :asc)
    when :price_desc then Book.all.order(price: :desc)
    when :published_on_asc then Book.all.order(published_on: :asc)
    when :published_on_desc then Book.all.order(published_on: :desc)
    else
      raise InvalidQueryError, "Invalid query: #{query}"
    end
  end
end
