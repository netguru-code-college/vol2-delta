source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'gmaps4rails', '~> 2.1.2'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'underscore-rails'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'rubocop', '~> 0.52.1'
gem 'countries', '~> 1.2', '>= 1.2.5'
gem 'country_select', '~> 2.5', '>= 2.5.2'
gem 'kaminari'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'bundler-audit', '~> 0.6.0'
gem 'omniauth-facebook', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.6'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
