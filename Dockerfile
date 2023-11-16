# Builder stage
FROM python:3.9-slim-bullseye as builder

# Set the working directory
WORKDIR /code

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the rest of your application's code
COPY . .

# Runtime stage
FROM python:3.9-slim-bullseye

# Set the working directory in the runtime stage
WORKDIR /code

# Install runtime dependencies only
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy built assets from the builder stage
COPY --from=builder /code /code

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
