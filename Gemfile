source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.2", ">= 7.0.2.2"

gem "bootsnap", require: false
gem "importmap-rails"
gem "puma", "~> 5.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

# gem "jbuilder"
# gem "redis", "~> 4.0"
# gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "lefthook"
  gem "rack-mini-profiler"
  gem "rubocop-rails"
  gem "standardrb"
  gem "web-console"
end
