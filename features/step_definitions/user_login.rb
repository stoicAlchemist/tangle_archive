Given(/^I am the "(.*)" user$/) do |username|
  @me = build :user, "user_#{username}".to_sym
end

When(/^I am not logged in$/) do
  logged_in?
end

When(/^I visit the show page for the Project with id="([0-9]+)"/) do |id|
  projects_path id
end

Then(/^I should be redirected to the login page$/) do
  expect(page).to have_content("login")
end
