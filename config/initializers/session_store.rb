# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_directions_session',
  :secret      => 'd612f9551865735fb4215d9755802609e4ccdb56adf5ef6c00e614462ab607812f1d0e53cdcd4dad5b7b861f41d90c240767197d8cee78557d0d15a86c41fff7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
