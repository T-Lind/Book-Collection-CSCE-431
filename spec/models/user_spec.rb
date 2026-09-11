require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a username" do
    expect(User.new(username: "alice")).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil)
    expect(user).not_to be_valid
    expect(user.errors[:username]).to include("can't be blank")
  end
end
