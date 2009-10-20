Given /^I am a logged in user$/ do
  email = 'paul@rslw.com'
  password = 'monkeys'
  user = User.make(:email => email, :password => password)
  When 'I log in as "paul@rslw.com"'
end

Given /^a user "([^\"]*)"$/ do |email|
  User.make(:email => email, :password => 'monkeys')
end

When /^I log in as "([^\"]*)"$/ do |email|
  visit(new_user_session_path)
  fill_in("Email", :with => email)
  fill_in("Password", :with => 'monkeys')
  click_button("Ok, Start Shooting")
end