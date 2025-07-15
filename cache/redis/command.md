# Redis Commands

## Connection

- `redis-cli` - Connect to the Redis server.
  - `redis-cli -h <host> -p <port> -a <password>` - Connect to the Redis server with host, port and password.
- `redis-server` - Start the Redis server.
  - `redis-server /path/to/redis.conf` - Start the Redis server with a configuration file.

## Password

- `requirepass <password>` - Set the password to access the Redis server in configuration file. need to restart the server to take effect.
- `config set requirepass <password>` - Set the password to access the Redis server. expire after restart.
- `auth <password>` - Authenticate to the server.
