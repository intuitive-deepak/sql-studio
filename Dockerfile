# Start from the latest Rust official image
FROM rust:latest AS builder

# Create a new directory for our project
WORKDIR /app

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Copy the source code
COPY src ./src

# Build the application
RUN cargo build --release

# Use a minimal image for the final stage
FROM debian:buster-slim

# Copy the built binary from the builder stage
COPY --from=builder /app/target/release/your_project_name /usr/local/bin/your_project_name

# Set the entrypoint for the Docker container
ENTRYPOINT ["your_project_name"]

# Expose the port your application runs on
EXPOSE 8000
