require 'csv'

module Oreily
  class Books < Array
    def initialize(records)
      super(records.map { |record| Book.new(record) })
    end

    def sort
      sort_by { |book| book.published_on }
    end

    class << self
      def parse(source = nil)
        records = if source.nil?
                    read_source
                  else
                    source
                  end
        new(records)
      end

      def read_source
        CSV.read('db/books.tsv', col_sep: "\t")
      end
    end
  end
end
