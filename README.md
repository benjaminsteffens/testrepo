# 🐳 Automated Jenkins Server Setup (via Docker)

This Bash script automates the installation of **Docker** and then deploys the official **Jenkins** Continuous Integration server inside a container.

## 🚀 Quick Start

### Prerequisites

* A Linux environment (tested on Ubuntu 20.04/Focal, but should work on other Debian-based systems).
* A user account with `sudo` privileges.
* Internet access for downloading packages and the Docker image.

### Execution

1.  **Save the Script:** Save the provided code into a file named `install_jenkins.sh`.
2.  **Make it Executable:** Grant execution permission to the file.
    ```bash
    chmod +x install_jenkins.sh
    ```
3.  **Run the Script:** Execute the script. It will run with administrative privileges for installation steps.
    ```bash
    ./install_jenkins.sh
    ```
    *(The script will take a few minutes to complete the package installation and image download.)*

## ⚙️ What the Script Does

The script performs the following actions in sequence:

1.  **System Update:** Runs `sudo apt-get update -y`.
2.  **Install Dependencies:** Installs packages required for Docker repository management (`apt-transport-https`, `curl`, etc.).
3.  **Add Docker Repository:** Adds Docker's official GPG key and the stable Ubuntu repository to the system.
4.  **Install Docker CE:** Installs the core Docker engine (`docker-ce`).
5.  **Pull Jenkins Image:** Downloads the latest official `jenkins/jenkins` Docker image.
6.  **Run Jenkins Container:** Starts the Jenkins server as a detached container with port mappings:
    * **`-p 8080:8080`**: Maps the Jenkins web UI to your host machine's port 8080.
    * **`-p 50000:50000`**: Maps the agent communication port.
    * **`--restart=on-failure`**: Ensures Jenkins restarts if the container crashes.

## 🔑 Post-Installation (Accessing Jenkins)

Once the script is finished, the Jenkins server is running in the background.

1.  **Access the UI:** Open a web browser and navigate to the server's IP address or hostname on port 8080:
    ```
    http://<Your_Server_IP>:8080
    ```

2.  **Find the Initial Admin Password:** Jenkins requires an initial administrator password for setup. Since the container is running detached, you must retrieve this password from the container's logs or file system:

    First, find the running container ID:
    ```bash
    sudo docker ps
    ```
    Then, use the container ID (or its generated name) to get the password:
    ```bash
    sudo docker exec <container_id_or_name> cat /var/jenkins_home/secrets/initialAdminPassword
    ```
    Copy the outputted password and paste it into the Jenkins "Unlock Jenkins" screen to proceed with the setup wizard.