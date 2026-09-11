require "rails_helper"

RSpec.describe "UserBooks", type: :request do
  let!(:user) { User.create!(username: "alice") }
  let!(:book) do
    Book.create!(
      title: "Dune",
      author: "Frank Herbert",
      price: 9.99,
      published_date: Date.new(1965, 8, 1)
    )
  end

  it "creates a user book from selected user and book dropdown values" do
    expect {
      post user_books_path, params: { user_book: { user_id: user.id, book_id: book.id } }
    }.to change(UserBook, :count).by(1)

    expect(response).to redirect_to(user_books_path)
    follow_redirect!
    expect(response.body).to include("User book was successfully created.")
    expect(response.body).to include("alice")
    expect(response.body).to include("Dune")
  end
end
