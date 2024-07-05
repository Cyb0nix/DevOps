FROM gitlab/gitlab-ce:latest
LABEL maintainer="Cybonix"

#Download and install gitlab-runner
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git
RUN curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod +x /usr/local/bin/gitlab-runner &&  \
    useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash && \
    gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner






