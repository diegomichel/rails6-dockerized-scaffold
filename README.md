# README

* System dependencies
- Docker

* Configuration
docker-compose run web bundle install

* To run the project
docker-compose build
docker-compose up

* To run rails commands, example rails c: 
docker-compose run web bundle exec rails c

* I want to use another db engine
docker-compose.yml includes configuration for postgresql, just uncomment it.
make sure to change the config on the config/database.yml file too.
