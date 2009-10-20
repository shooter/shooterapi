Given /^a shooter "([^\"]*)" with payload "([^\"]*)"$/ do |name, payload|
  Shooter.make(:name => name, :payload => payload)
end

Given /^shooter "([^\"]*)" belongs to "([^\"]*)"$/ do |shooter_name, email|
  user = User.find_by_email(email)
  user.shooters << Shooter.find_by_name(shooter_name)
end

Given /^a shooter "([^\"]*)"$/ do |name|
  Shooter.make(:name => name)
end

Given /^shooter "([^\"]*)" has no payload$/ do |name|
  Shooter.find_by_name(name).update_attribute(:payload, nil)
end

Given /^shooter "([^\"]*)" has payload "([^\"]*)"$/ do |name, payload|
  Shooter.find_by_name(name).update_attribute(:payload, payload)
end

Given /^I post "([^\"]*)" to shooter "([^\"]*)"$/ do |payload, shooter_name|
  shooter = Shooter.find_by_name(shooter_name)
  api_key = shooter.shortcode_url
  params = {:payload => payload, :api_key => api_key}
  put(api_shooter_path(shooter),params)
end

When /^I shoot "([^\"]*)" via the API$/ do |shooter_name|
  shooter = Shooter.find_by_name(shooter_name)
  delete(shoot_api_shooter_path(shooter))
end

Then /^shooter "([^\"]*)" payload should be blank$/ do |shooter_name|
  Shooter.find_by_name(shooter_name).payload.should be_blank
end