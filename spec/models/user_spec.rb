require 'rails_helper'

RSpec.describe User, type: :model do
  describe "phone number validation" do
    context "with a 10-digit phone number" do
      let(:params) do
        {
          phone: "1234567890",
          email: "user@example.com"
        }
      end

      it "is valid" do
        expect(User.new(params)).to be_valid
      end
    end

    context "with a 7-digit phone number" do
      let(:params) do
        {
          phone: "1234567",
          email: "user@example.com"
        }
      end

      let(:user) { User.new(params) }

      it "is not valid" do
        expect(user).to_not be_valid
      end

      it "sets the correct error message" do
        user.valid?
        expect(user.errors).to include(:phone)
        expect(user.errors[:phone]).to include("is the wrong length (should be 10 characters)")
      end
    end
  end

  describe "email validation" do
    context "with an email address" do
      let(:params) do
        {
          phone: "1234567890",
          email: "user@example.com"
        }
      end

      it "is valid" do
        expect(User.new(params)).to be_valid
      end
    end

    context "without an email addresss" do
      let(:params) do
        {
          phone: "1234567890",
          email: nil
        }
      end

      let(:user) { User.new(params) }

      it "is not valid" do
        expect(user).to_not be_valid
      end

      it "sets the correct error message" do
        user.valid?
        expect(user.errors).to include(:email)
        expect(user.errors[:email]).to include("can't be blank")
      end
    end
  end
end
