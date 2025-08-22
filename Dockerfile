# use official Python image as base
FROM python:3.13-slim

# create unprivileged user with no shell access and no home directory
RUN addgroup --gid 1001 --system app_group && \
    adduser --no-create-home --shell /bin/false --disabled-password \
        --uid 1001 --system --ingroup app_group app_user

# set working directory
WORKDIR /code

# install Python dependencies as root
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy the application code
COPY . .

# change ownership so the app user can read/write in /code
RUN chown -R app_user:app_group /code

# Switch to unprivileged user for running the service
USER app_user

# default command (overridable by docker-compose)
CMD ["flask", "run", "--host=0.0.0.0", "--debug"]
