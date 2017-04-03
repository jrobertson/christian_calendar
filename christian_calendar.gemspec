Gem::Specification.new do |s|
  s.name = 'christian_calendar'
  s.version = '0.1.5'
  s.summary = 'Returns the date for Easter, Ash Wednesday, Good Friday, Trinity Sunday, and more'
  s.description = "Returns the dates for Epiphany, St David's Day, Ash Wednesday, Mothering Sunday, St Patrick's Day, Palm Sunday, Good Friday, Easter Sunday, Whit Sunday, Trinity Sunday, Ascension Day, Pentecost Sunday, St Andrews Day, Advent Sunday, and Christmas day"
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('easter', '~> 0.1', '>=0.1.2')
  s.add_runtime_dependency('chronic', '~> 0.10', '>=0.10.2')
  s.signing_key = '../privatekeys/christian_calendar.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/christian_calendar'
  s.required_ruby_version = '>= 2.1.2'
end
