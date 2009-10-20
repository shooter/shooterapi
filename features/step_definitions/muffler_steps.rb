Given /^a filter "([^\"]*)" on shooter "([^\"]*)"$/ do |pattern, shooter_name|
  shooter = Shooter.find_by_name(shooter_name)
  Muffler.make(:shooter => shooter, :pattern => pattern)
end