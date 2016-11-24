New Relic Test App
===================

This is a basic Rack application running via Puma (https://github.com/puma/puma). Visiting the app should return "Hello World!" and visiting the `/status` endpoint should return a `{"status":"OK"}` (200) response.

The app contains the [newrelic_rpm](https://github.com/newrelic/rpm) gem for reporting to New Relic. There are two branches, `master` and `latest_rpm` which both use different versions of the gem.

- `master` - Contains New Relic RPM gem @ `v3.5.6.55`

- `latest_rpm` - Contains New Relic RPM gem @ `v3.17.1.326`

----------

Installation/How to Run
-------------

- Clone to your local machine: `git clone git@github.com:onthebeach/new_relic_test_app.git`

- To run, `bundle exec foreman start`

Building a docker image
-------------
When you have made changes to the app, you can run `make docker-build` to build the Docker image (ensure you have [Docker](https://docs.docker.com/engine/installation/) setup beforehand). Once built, you can then run `make docker-push` to push your newly-built image up to the public Docker repo.

If you would like to run the app inside Docker rather than using `foreman start`, a task has been included:
`make docker-run-hello-world`.
