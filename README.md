# AutoLiker


Tick is an auto liker for Tinder. Before using, you'd need to use an http proxy in order to intercept the authentication token from Tinder. Once retrieved, you can place it in a new file, Tick/env.rb as an environment variable.

env.rb file should only have this:

ENV['token'] = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

run with:

ruby auto_liker.rb
