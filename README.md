# App-py birthday

... or **api-birthday**, yet to be decided.

This app will serve as a database for storing birthdays, now that facebook is no longer used.

## Build and run with Docker

Build the image and run the container in detach mode with

```bash
docker compose up --detach --build
```

This will start the server in dev mode.

## Tricks for development

Create a virtual environment for dev-tools, linting, etc 

```bash
python3 -m venv env-app-py
source env-app-py/bin/activate
pip install -r requirements.txt
```


Run the container with volumes, so the app is refreshed when the code is changed

```bash
docker run --publish 5001:5000 --volume $(pwd):/app --detach appy-bday-image
```
