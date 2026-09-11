require "rails_helper"

RSpec.describe Book, type: :model do
  def valid_attributes
    {
      title: "Dune",
      author: "Frank Herbert",
      price: 9.99,
      published_date: Date.new(1965, 8, 1)
    }
  end

  it "is valid with a title" do
    book = Book.new(valid_attributes)
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(valid_attributes.merge(title: nil))
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an author" do
    book = Book.new(valid_attributes.merge(author: nil))
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "is invalid without a price" do
    book = Book.new(valid_attributes.merge(price: nil))
    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a published date" do
    book = Book.new(valid_attributes.merge(published_date: nil))
    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
