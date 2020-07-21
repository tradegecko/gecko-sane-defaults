# frozen_string_literal: true

Papers.configure do |config|
  # Licenses we have determined are safe to use
  config.license_whitelist = [
    'MIT',

    'BSD', 'BSD-2', 'BSD-2-Clause', 'BSD 2-Clause',
    'BSD-3-Clause', 'BSD 3-clause',

    # Commercial-use friendly, as long as we don't use apache logo, or make it
    # seems as if our software is an extension of the library Apache project.
    # https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)
    'Apache 2.0', 'Apache-2.0', 'Apache 2', 'Apache License 2.0',

    # Specifically target clauses of static-linking library with code
    # (Which Ruby doesn't really suffer from it's an interpreted language)
    # https://tldrlegal.com/license/gnu-lesser-general-public-license-v3-(lgpl-3)
    # https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3)
    'LGPLv2.1', 'LGPL-2.1+',
    'LGPLv3', 'LGPL-3.0',
    'GPL-2.0', 'GPL-2.0+', 'GPLv2+',
    'GPL-3.0',

    # GPL-like
    'Ruby', 'ruby',

    # Public Domain
    'Unlicense',

    # MIT-like
    'ISC',
    'Hippocratic-2.1'
  ]

  # Commercial-friendly.
  config.license_whitelist << 'New Relic'

  # Disable JS validation, handled by a separate library
  config.validate_javascript = false
end
