FROM jenkins/jenkins:lts

MAINTAINER Jesse DeFer <docker-jenkins@dotd.com>

RUN /usr/local/bin/install-plugins.sh scm-api sonar saml ant artifactory checkstyle docker-workflow findbugs git github github-branch-source maven-plugin workflow-api pipeline-aws pipeline-model-definition workflow-cps workflow-job workflow-multibranch github-organization-folder jacoco junit ssh-agent ssh-credentials slack subversion scm-sync-configuration pipeline-stage-view pipeline-milestone-step pipeline-input-step pipeline-build-step blueocean-pipeline-api-impl blueocean-jwt blueocean-jira matrix-auth hashicorp-vault-plugin blueocean-github-pipeline blueocean-git-pipeline git-server git-client blueocean-dashboard config-file-provider docker-custom-build-environment aws-credentials blueocean ansicolor ec2 aws-java-sdk role-strategy kubernetes aws-cloudwatch-logs-publisher

USER root
RUN wget -nv -O /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator && chmod a+rx /usr/local/bin/aws-iam-authenticator
USER jenkins

EXPOSE 8080 50000
