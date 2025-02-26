FROM ros:humble-ros-base-jammy

# Set the HOME environment variable explicitly
ENV HOME=/root

# Set the working directory to HOME
WORKDIR $HOME

# Create a new directory called 's32g-gnss' inside the HOME directory
RUN mkdir -p $HOME/s32g-gnss

# Set the working directory to the newly created 's32g-gnss' folder
WORKDIR $HOME/s32g-gnss

# Copy the 'src' folder from your local machine into the container
# COPY src/ $HOME/s32g-gnss
