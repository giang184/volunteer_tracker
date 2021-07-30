# Word Definer by Andrew Giang
This project creates an application that tracks projects and volunteers working on them. On the application, you can view, add, update, and delete.

## Technology Used
* _Ruby_
* _Docker_
* _Ruby Gems: rspec, pry_
* _Sinatra_
* _Postgres_

## Objectives

* Full CRUD functionality for both `project`s and `volunteers`s.
* Routes are named using RESTful conventions.
* Sinatra application uses views, instance variables and forms.
* Sinatra routes process GET and POST requests/responses.
* Project includes thorough and passing integration specs as well as specs for both classes.

## Set up and Installation

### Running Sinatra and Postgres

To run both Sinatra and Postgres, type the following into the command line (you must be in the root directory of the project):

```
$ docker-compose up --build
```

If you nagivate to `http://localhost:4567/` without setting up a database, though, you'll get a `PG::ConnectionBad` error.

### Using psql

To do any database management, including creating, deleting, and altering databases, you need to use psql, a command line tool. That means you need to interactively connect to the running Postgres container.

You can use `$ docker-compose up --build` - while the Sinatra container won't work correctly without a database, both the Sinatra and Postgres containers will be running and you will be able to access them.

Once you have a Postgres container running, get the container ID with `$ docker ps`.

Next, you can run psql with the following command:

```
$ docker exec -it -u postgres [CONTAINER_ID] psql
```

At this point, you can create and alter databases as needed. If you want to see the database connection in action with the current Sinatra application, just do the following in psql:

```
CREATE DATABASE projects;
```

Once you've created the database, you can run the local Sinatra server and see the following string at `http://localhost:4567/`:

```
This is connected to the database record_store.
```

When you're done running the server, you should always type in `docker-compose down` to gracefully stop the container.

