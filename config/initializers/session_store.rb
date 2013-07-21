# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IURD_session',
  :secret      => '8f00e261d8e2ef572c86aeca0bcac8dabbfb3a3d4bc6631f8c2aa37ab558f947228e6f22b73911f4a1e22d6b143ccea957ebfe9cb09806ffd1084a178be5008a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
