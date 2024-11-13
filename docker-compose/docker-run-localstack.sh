#!/usr/bin/env bash
docker run -p 4566-4599:4566-4599 -p 8080:8080 -e SERVICES='s3,sqs,cloudwatch,logs,sns,stepfunctions,lambda,cloudformation,events' \
-e DOCKER_HOST='unix:///var/run/docker.sock' \
--name localstack_local localstack/localstack


