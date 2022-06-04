FROM gitpod/workspace-base
USER root
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
  && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
  && curl https://kots.io/install | bash \
  && helm completion bash > /etc/bash_completion.d/helm \
  && kubectl completion bash > /etc/bash_completion.d/kubectl \
  && kubectl kots completion bash > /etc/bash_completion.d/kots \
  && kubectl version --client \
  && helm version \
  && kubectl kots version
USER gitpod
