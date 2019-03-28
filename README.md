## TradeGecko Rails Defaults
Shared sane defaults across TG apps

#### Current defaults:
- Deprecations raise in development/test and fire to Honeybadger in production
- Rails migration generator generates with frozen_string_literal
- Sidekiq/ActiveJob don't log exception backtraces as this data is in Honeybadger
