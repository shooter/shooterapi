# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shooter_session',
  :secret      => '70249343cb3aa3e1acdd3739a2ef15813d45be854608710f69cc4f2efe1c50973f5dd2c001ae9c11a9436f78471f3b03345fb6c8b3fde3367facb55288241397'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
