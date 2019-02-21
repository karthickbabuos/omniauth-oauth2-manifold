Gem::Specification.new do |s|
  s.name= %q{omniauth-oauth2-manifold}
  s.version = "1.0.0"
  s.date = %q{2019-02-10}
  s.authors       = ["Karthick Babu"]
  s.email         = ["karthick.babu@freshworks.com"]
  s.summary = %q{Gem to perform oauth operations for multiple providers}
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.1'
  s.add_dependency 'omniauth-oauth2', '~>1.1.1'
end