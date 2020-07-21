## TradeGecko Sane Defaults
Library for sharing sane defaults across TG apps

#### Current defaults:
- Deprecations raise in development/test and fire to Honeybadger in production
- Rails migration generator now generates with the `#frozen_string_literal: true` pragma
- Sidekiq/ActiveJob don't log exception backtraces as this data is in Honeybadger
- Shared rubocop.yml
- Acceptable OSS License list integrated with papers gem

#### Possible Enhancements
- Essential gems
- frozen_string_literal on other generators
- An Ember version
