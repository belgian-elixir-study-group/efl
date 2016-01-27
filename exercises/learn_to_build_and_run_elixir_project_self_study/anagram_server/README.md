DAWS: Devspace Anagram Web Server :)
================

mix help

mix help run
mix help compile

Fetch dependancies
mix deps.get

Compile dependancies and the app
mix compile

Start the app and a interactive shell
iex -S mix

Start the app without an interactive shell
mix run --no-halt

mix test

Load the app but do not start it
iex -S mix run --no-start

Example of a custom task. See file launch,ex
mix anagram.launch


In the interactive shell, once the app has started:
:observer.start


Application.ensure_all_started(:daws)

Application.stop(:daws)
Application.start(:daws)

