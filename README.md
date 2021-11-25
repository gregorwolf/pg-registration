# CAP Event Registration using PostgreSQL for persistence

For local testing:

```
{
  "VCAP_SERVICES": {
    "postgres": [
      {
        "name": "postgres",
        "label": "postgres",
        "tags": [
          "database",
          "plain"
        ],
        "credentials": {
          "host": "localhost",
          "port": "5432",
          "database": "registration",
          "user": "registration",
          "password": "SecurePassword"
        }
      }
    ]
  }
}

```
