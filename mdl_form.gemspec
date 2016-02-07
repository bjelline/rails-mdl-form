$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mdl_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mdl_form"
  s.version     = MdlForm::VERSION
  s.authors     = ["Brigitte Jellinek", "Stephen Potenza", "Carlos Lopes"]
  s.email       = ["brigitte.jellinek@fh-salzburg.ac.at", "potenza@gmail.com", "carlos.el.lopes@gmail.com"]
  s.homepage    = "http://github.com/bjelline/rails-mdl-forms"
  s.summary     = "Rails form builder that makes it easy to style forms using Material Design Lite"
  s.description = "mdl_form is a rails form builder that makes it super easy to create beautiful-looking forms using Material Design Lite"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails", "~> 4.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "timecop", "~> 0.7.1"
  s.add_development_dependency "mocha"
end
