FROM jenkins/jenkins:lts-jdk11

MAINTAINER Jesse DeFer <docker-jenkins@dotd.com>

RUN jenkins-plugin-cli --verbose --plugins scm-api sonar saml cas-plugin ant artifactory docker-workflow git github github-branch-source maven-plugin workflow-api pipeline-aws pipeline-model-definition workflow-job workflow-multibranch jacoco junit ssh-agent ssh-credentials slack pipeline-stage-view pipeline-milestone-step pipeline-input-step pipeline-build-step blueocean-pipeline-api-impl blueocean-jwt blueocean-jira matrix-auth hashicorp-vault-plugin blueocean-github-pipeline blueocean-git-pipeline git-server git-client blueocean-dashboard config-file-provider docker-custom-build-environment aws-credentials blueocean ansicolor ec2 aws-java-sdk role-strategy kubernetes configuration-as-code pipeline-utility-steps warnings-ng git-forensics templating-engine metrics extended-read-permission mask-passwords http_request amazon-ecr

USER root
# https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
ENV AWS_IAM_AUTHENTICATOR_URL=https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.12/aws-iam-authenticator_0.5.12_linux_amd64
RUN curl -sSfL -o /usr/local/bin/aws-iam-authenticator ${AWS_IAM_AUTHENTICATOR_URL} && \
    chmod a+rx /usr/local/bin/aws-iam-authenticator

USER jenkins

#COPY jenkins.yaml /casc_configs/
#ENV CASC_JENKINS_CONFIG /casc_configs
ENV JAVA_OPTS "-Xmx4g -Djenkins.install.runSetupWizard=false -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Phoenix ${JAVA_OPTS:-}"
ENV TZ "America/Phoenix"

EXPOSE 8080 50000
