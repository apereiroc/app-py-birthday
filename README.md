# App-py birthday

... or **api-birthday**, yet to be decided.

This app will serve as a database for storing birthdays, now that facebook is no longer used.

## Build and run with Docker

Build the image with

```bash
docker buildx build -f Dockerfile -t appy-bday-image .
```

Run the container with

```bash
docker run --publish 5001:5000 --detach appy-bday-image
```

Run the container with volumes for **development**

```bash
docker run --publish 5001:5000 --volume $(pwd):/app --detach appy-bday-image
```
