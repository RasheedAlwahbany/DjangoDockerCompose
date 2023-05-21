FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY Pipfile Pipfile.lock ./
RUN pip install pipenv && \
    pipenv install --system --deploy --ignore-pipfile

# Install gunicorn
RUN pip install gunicorn

# Copy the Django project
COPY . .

# Expose port
EXPOSE 8000

# Start the server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "djangoDocker.wsgi"]
