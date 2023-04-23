# README

## Settup

Both backend and frontend of this app are containerized with docker. To start the app you need to build the images and start the containers

```bash
docker-compose build
docker-compose up
```

After starting the container you would need to execute database migrations and add some seed data

```bash
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
```

Also, I am running docker in a local linux server at 192.168.1.7. You would need to:

- open `config/initializers/cors.rb` in the backend repo (tll) and change 192.168.1.7:3002 to the host and port where you're running the frontend app, this will be localhost:3002 most likely
- in the frontend repo, open `.env` file and change `REACT_APP_TLL_ENDPOINT` to point to your backend endpoint. This will also be localhost:3000, most likely

### Notes
For the sake of this simple coding challenge:

- No authentication system was provided
- No multi-tenancy features included
- No pagination was supported