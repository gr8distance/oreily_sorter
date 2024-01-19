source = Oreily::Books.source
books = Oreily::Books.parse(source)
Book.import!(books.map(&:to_model))
