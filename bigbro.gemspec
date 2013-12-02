require './lib/bigbro/version'

Gem::Specification.new do |s|
  s.name        = 'bigbro'

  s.summary     = 'A Google Analytics plugin for Rails'

  s.description = 'BigBro provides view helpers to generate Analytics code '      \
                  '(with the noscript counterpart), test helpers to assert your ' \
                  'page contains the tracking code and a configuration method to '\
                  'set your GA account from environment.rb'

  s.authors     = ['Marcello Barnaba']
  s.email       = 'vjt@openssl.it'
  s.homepage    = 'http://github.com/vjt/bigbro'

  s.files       = `git ls-files`.split("\n")

  s.version     = BigBro::Version
  s.date        = '2013-12-02'

  s.add_dependency('rails', '>= 3.0')

end
