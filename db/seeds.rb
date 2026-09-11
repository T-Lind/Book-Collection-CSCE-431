dune = Book.find_or_create_by!(title: "Dune") do |book|
  book.author = "Frank Herbert"
  book.price = 9.99
  book.published_date = Date.new(1965, 8, 1)
end

hobbit = Book.find_or_create_by!(title: "The Hobbit") do |book|
  book.author = "J. R. R. Tolkien"
  book.price = 12.50
  book.published_date = Date.new(1937, 9, 21)
end

alice = User.find_or_create_by!(username: "alice")
bob = User.find_or_create_by!(username: "bob")

UserBook.find_or_create_by!(user: alice, book: dune)
UserBook.find_or_create_by!(user: bob, book: hobbit)
