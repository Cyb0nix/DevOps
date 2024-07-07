FROM gitlab/gitlab-ce:latest

#Download and install gitlab-runner
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git


RUN curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod +x /usr/local/bin/gitlab-runner &&  \
    useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash && \
    gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner && \
    gitlab-runner start \

WORKDIR /home/
ADD init.sh ./home/
#Clone the project
WORKDIR /home/exemple
RUN git clone https://github.com/Cyb0nix/Exemple-Project.git .
ADD .gitlab-ci.yml .

WORKDIR /home/




