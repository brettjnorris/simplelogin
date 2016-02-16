require 'rails_helper'

RSpec.feature "UserEdits", type: :feature do
  let(:user_params) do
    {
      first_name: "Test",
      last_name: "User",
      password: "test1234",
      email: "test@example.com",
      phone: "5558675309"
    }
  end
  let!(:user) { User.create(user_params) }

  scenario "User updates account" do
    login_as user
    visit "/"

    click_link 'Edit Account'

    fill_in 'First name', with: 'Carl'
    fill_in 'Last name', with: 'Winslow'
    fill_in 'Current password', with: 'test1234'

    click_button 'Update'

    user.reload

    expect(page).to have_text("Your account has been updated successfully")
    expect(user.first_name).to eq("Carl")
    expect(user.last_name).to eq("Winslow")
  end

  scenario "User updates password" do
    login_as user
    visit "/"

    click_link 'Edit Account'

    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    fill_in 'Current password', with: 'test1234'

    click_button 'Update'

    expect(page).to have_text("Your account has been updated successfully.")

    click_button 'Sign Out'
    click_link 'Sign In'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'newpassword'

    click_button 'Log in'

    expect(page).to have_text("Signed in successfully.")
  end

  scenario "User does not enter a password confirmation" do
    login_as user
    visit "/"

    click_link 'Edit Account'

    fill_in 'Password', with: 'newpassword'
    fill_in 'Current password', with: 'test1234'

    click_button 'Update'

    expect(page).to_not have_text("Your account has been updated successfully.")
    expect(page).to have_text("Password confirmation doesn't match")
  end
end
