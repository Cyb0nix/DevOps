# DevOps

___

## Installation

1. Clone the repository on the server you want to use for CI/CD

```bash
git clone https://github.com/Cyb0nix/DevOps.git
```
2. Launch the docker-compose file

```bash
docker-compose -f DevOps/GitLab/docker-compose.yml build
docker-compose -f DevOps/GitLab/docker-compose.yml up -d
```
3. Wait for the container to be up and running (check on http://localhost)


4. Initialize the example project and get the root password
```bash
docker exec -it gitlab ./init.sh
```
5. You can now access the Gitlab interface on http://localhost


6. Setup CI/CD variables
    - Go to Settings > CI/CD > Variables
    - Add the following variables:
        - SSH_PRIVATE_KEY: your production server private key
        - SERVER_USER: your production server username
        - SERVER_IP: your production server IP
        - SERVER_PATH: the path where you want to deploy your project
      

7. Create a Runner on the Gitlab interface and get the registration token
    - Go to Settings > CI/CD > Runners > New Project Runner
    - Check the "Run untagged jobs" box
    - Create the runner and get the registration token
    - Run the following command on the docker host
```bash
docker exec -it gitlab gitlab-runner register --url http://localhost --registration-token <token> --executor docker --docker-image "node:20.14" --description "docker-runner" --docker-network-mode "host"
```
8. start the runner
```bash
docker exec -it gitlab gitlab-runner start
```
9. Wait for the execution of the pipeline and check the deployment on the production server (http://<SERVER_IP>:6789/api)



