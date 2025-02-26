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
COPY ../src/ $HOME/s32g-gnss/src

# Install the necessary packages
RUN apt-get update && apt-get install -y \
    git \
    python3-pip

# Install the necessary ROS packages with rosdep
RUN rosdep update && rosdep install --from-paths src --ignore-src -r -y

# Install the necessary Python packages
RUN pip3 install -r src/demo/gnss_eval_ros/requirements.txt

# Build the workspace
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
    && export MAKEFLAGS="-j 1" \
    && colcon build --executor sequential 