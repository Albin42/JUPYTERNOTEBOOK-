FROM python:3.8.2-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN pip install pip pipenv --upgrade
RUN pipenv install --skip-lock --system --dev
RUN python3 -m pip install notebook
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
RUN tar -xvf ngrok-v3-stable-linux-amd64.tgz
RUN ./ngrok authtoken 2ec4tCn7Ye2DqI7Xwqi3Y9xiiEv_3rYGwymMWVP8M8wTYpjqU

EXPOSE 8888

CMD ./ngrok http 8888 & python3 -m notebook --allow-root

CMD ["./scripts/entrypoint.sh"]

# Use a Python base image
#FROM python:3.9

# Install Jupyter notebook


# Download ngrok


# Extract ngrok


# Set ngrok authtoken (Replace '<your_ngrok_auth_token>' with your actual ngrok authentication token)


# Expose port 8888 for Jupyter notebook


# Start ngrok to expose port 8888 (Run in the background)
