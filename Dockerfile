# use official Python image as base
FROM python:3.13-slim

# first install the environment, so this layer is cached
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# create a working directory
WORKDIR /app

# copy the application
COPY . .

# expose the port
EXPOSE 5000

# run the application
CMD ["flask", "run", "--host=0.0.0.0", "--debug"]
