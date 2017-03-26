# docker-cerebro

## Overview

[Cerebro](https://github.com/lmenezes/cerebro) is an open source (MIT License) Elasticsearch web admin tool. This project is an unofficial project that maintains production ready Docker image.

This image is available [mozamimy/cerebro](https://hub.docker.com/r/mozamimy/cerebro/) repository.

## Usage

Set following environment variables and run container,

- `APPLICATION_SECRET` (required)
- `HOSTS` (optional)
- `DBS_DEFAULT_DRIVER` (optional)
- `DBS_DEFAULT_DB_DRIVER` (optional)
- `DBS_DEFAULT_DB_URL` (optional)
- `REST_HISTORY_SIZE` (optional, default 50)

Variables started with `DBS_` cannot be changed to something other than SQLite, but it is provided for when drivers other than sqlite are supported in the future.

See also docker-compose.yml. It describes how to use this image.

## Limitations

- Authentications cannot be configured with environment variables.
  - Patches are welcome :rabbit: :kissing_heart:
- History of REST requests will be removed after a cerebro container is stopped.
  - Bacause Cerebro uses SQLite in application container.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mozamimy/docker-cerebro.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
