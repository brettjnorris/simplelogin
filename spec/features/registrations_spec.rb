require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  scenario "User Registers a new account" do
    visit "/"

    click_link "Sign Up"

    fill_in "First name", with: "Test"
    fill_in "Last name", with: "User"
    fill_in "Email", with: "test@example.com"
    fill_in "Phone", with: "1234567890"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign up"

    expect(User.where(email: 'test@example.com').count).to eq(1)
    expect(page).to have_text("You have signed up successfully.")
  end

  context "With a duplicate user email" do
    let(:email) { 'duplicate@example.com' }
    let(:user_params) do
      {
        email: email,
        password: 'test1234',
        phone: '5555551234'
      }
    end
    let!(:user) { User.create(user_params) }

    scenario "User Registers with a duplicate email" do
      visit "/"

      click_link "Sign Up"

      fill_in "First name", with: "Test"
      fill_in "Last name", with: "User"
      fill_in "Email", with: email
      fill_in "Phone", with: "1234567890"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"

      click_button "Sign up"

      expect(page).to have_text("Email has already been taken")
    end
  end

  scenario "User Registers with an invalid phone number" do
    visit "/"

    click_link "Sign Up"

    fill_in "First name", with: "Test"
    fill_in "Last name", with: "User"
    fill_in "Email", with: "test@example.com"
    fill_in "Phone", with: "1234567"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign up"

    expect(page).to have_text("Phone is the wrong length (should be 10 characters)")
  end
end
