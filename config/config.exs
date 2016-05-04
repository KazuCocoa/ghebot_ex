use Mix.Config

config :reporter,
  droid_package: "com.android.chrome",
  droid_locale: "en",
  get_count_google: 5,
  app_id: "375380948",
  app_locale: "en",
  get_count_apple: 5

config :timex, default_locale: "jp"

import_config "#{Mix.env}.exs"
