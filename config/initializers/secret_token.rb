# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Broker::Application.config.secret_key_base = '508ceac7382b1b29169c38af31e28dbdf2f2ab937bf91b73c50084a554cb0261bd2fa81d0f8a544e4b565bd8785432204718c0c3967d6243f464ad89bcf7eee3'
