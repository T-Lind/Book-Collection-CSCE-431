require "rails_helper"

RSpec.describe "Books", type: :request do
  def book_params(overrides = {})
    {
      title: "Dune",
      author: "Frank Herbert",
      price: 9.99,
      published_date: Date.new(1965, 8, 1)
    }.merge(overrides)
  end

  describe "creating a book" do
    it "adds a book and shows a flash notice on the home page" do
      expect {
        post books_path, params: { book: book_params }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(books_path)
      follow_redirect!
      expect(response.body).to include("Book was successfully created.")
      expect(response.body).to include("Dune")
    end

    it "does not add a book with a blank title and shows a flash notice" do
      expect {
        post books_path, params: { book: book_params(title: "") }
      }.not_to change(Book, :count)

      expect(response.body).to include("Title can&#39;t be blank").or include("Title can't be blank")
    end

    it "does not add a book with a blank author and shows a flash notice" do
      expect {
        post books_path, params: { book: book_params(author: "") }
      }.not_to change(Book, :count)

      expect(response.body).to include("Author can&#39;t be blank").or include("Author can't be blank")
    end

    it "does not add a book with a blank price and shows a flash notice" do
      expect {
        post books_path, params: { book: book_params(price: "") }
      }.not_to change(Book, :count)

      expect(response.body).to include("Price can&#39;t be blank").or include("Price can't be blank")
    end

    it "does not add a book with a blank published date and shows a flash notice" do
      expect {
        post books_path, params: { book: book_params(published_date: "") }
      }.not_to change(Book, :count)

      expect(response.body).to include("Published date can&#39;t be blank").or include("Published date can't be blank")
    end
  end
end
