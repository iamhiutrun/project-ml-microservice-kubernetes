[![CircleCI](https://dl.circleci.com/status-badge/img/gh/iamhiutrun/project-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/iamhiutrun/project-ml-microservice-kubernetes/tree/main)
## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
### Makefile

The provided `Makefile` serves as an automation tool for streamlining various aspects of the project's development process. It offers the following targets and their functions:

- `setup`: This target establishes the project environment by creating a Python virtual environment named ~/.devops using the command `python3.7 -m venv ~/.devops`. This practice isolates project dependencies from the system-wide Python installation.

- `install`: The install target installs the project's dependencies as specified in the requirements.txt file. It achieves this by using `pip` install to upgrade pi`p and then install the necessary packages.

- `test`: This target is designed for executing tests on the project. In the example, there are comments indicating how additional tests can be incorporated, such as running tests with `pytest` or conducting tests on Jupyter notebooks using `nbval`.

- `lint`: The `lint` target performs linting checks on the project files. It utilizes two linters:

- `hadolint` is employed to lint the Dockerfile. This tool specializes in Dockerfile linting and ensures adherence to Dockerfile best practices.
`pylint` is used to lint the Python source code. `pylint` is a widely adopted Python linter that assesses code quality and enforces coding style guidelines.
- `all`: This serves as the default target that developers can invoke with the make command without specifying a particular target explicitly. It amalgamates the `install`, `lint`, and test targets, simplifying the process of preparing the environment, performing linting checks, and running tests.

In summary, this Makefile simplifies the development workflow by providing user-friendly commands for environment setup, dependency installation, testing, and linting checks. Developers can effortlessly use make followed by the desired target to automate these essential tasks, enhancing efficiency in project development.

* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`

### ```run_docker.sh```

Sure, let me explain each part of the script:

- `#!/usr/bin/env bash`: This is called a "shebang" line. It tells the system which interpreter to use to execute the script. In this case, it specifies that the script should be executed using the Bash shell (`/bin/bash`), which is commonly available on Unix-like systems.

- `docker build --tag=microprj3 .`: This command is used to build a Docker image. It creates an image based on the contents of the current directory (`.`) and adds a descriptive tag to the image. The tag in this case is `microprj3`, which will be used to identify the image later.

- `docker images list`: This line seems to be incorrect. It should be `docker images` instead of `docker images list`. The command `docker images` lists all the Docker images available on your system.

- `docker run -p 8000:80 microprj3`: This command runs a Docker container based on the previously built image (`microprj3`). It maps port 8000 on your host machine to port 80 inside the container. This means that when you access `http://localhost:8000` in your web browser, the traffic will be forwarded to the container's port 80, where the Flask app is running.

3. Run in Kubernetes:  `./run_kubernetes.sh`
### ```run_kubernetes.sh```

- `dockerpath="trunghieuluong/microprj3"`: This line assigns the Docker image path to the variable `dockerpath`. In this case, the image is intended to be pushed to the Docker Hub repository with the path `trunghieuluong/microprj3`.

- `kubectl run microprj3 --generator=run-pod/v1 --image=$dockerpath --port=80 --labels "app=microprj3"`: This command is using `kubectl` (Kubernetes command-line tool) to deploy a pod in a Kubernetes cluster. Here's what each option does:
  - `kubectl run microprj3`: This specifies the name of the deployment, which is `microprj3`.
  - `--generator=run-pod/v1`: This is specifying the generator to use, indicating a basic pod deployment.
  - `--image=$dockerpath`: This specifies the Docker image to use for the pod, which is defined by the previously set `dockerpath` variable.
  - `--port=80`: This specifies that the container inside the pod will be listening on port 80.
  - `--labels "app=microprj3"`: This assigns the label `app=microprj3` to the pod, which can be used for organizing and identifying pods.

- `kubectl get pods`: This command lists the pods in the Kubernetes cluster. After running the previous command to deploy the pod, this step is likely included to show the status of the newly deployed pod.

- `kubectl port-forward microprj3 8000:80`: This command sets up port forwarding, allowing you to access the pod's port 80 on your local machine's port 8000. This way, when you access `http://localhost:8000` in your web browser, the traffic will be forwarded to the pod's port 80, where your application is running.

###```upload_docker.sh```

- `echo "Docker ID and Image: $dockerpath"`: This line prints a message indicating the Docker ID and Image that will be used in the subsequent steps.

- `docker login`: This command prompts the user to log in to their Docker Hub account, enabling them to push images to the Docker Hub repository.

- `docker image tag microprj3 $dockerpath`: This command tags the locally built Docker image `microprj3` with the specified `dockerpath`. This is necessary to ensure that the image is properly identified when pushing to the Docker Hub repository.

- `docker push $dockerpath`: This command pushes the tagged Docker image to the specified Docker Hub repository using the previously set `dockerpath`.

### Kubernetes Steps
* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
