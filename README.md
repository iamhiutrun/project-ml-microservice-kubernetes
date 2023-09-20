<include a CircleCI status badge, here>

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
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
