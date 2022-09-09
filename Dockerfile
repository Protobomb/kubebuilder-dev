FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    golang-go \
    curl

# install manifests
RUN curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
RUN chmod +x kubebuilder && mv kubebuilder /usr/local/bin/

# clean apt cache
RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/
