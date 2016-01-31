use Mix.Config

config :my_bot_ex,
  token: "431a9ce93c6a55ba024a63ac5c82e5786c14b437",
  endpoint: "https://api.github.com",
  api_key: System.get_env("BOT_TOKEN")

config :revision_plate_ex,
  http_port: System.get_env("PORT")
