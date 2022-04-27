FROM rancher/k3s:v1.22.9-rc4-k3s1-amd64

# download the wasi shim and add to /bin/...
COPY containerd-shim-spin-v1 /bin/containerd-shim-spin-v1

# copy in an containerd config into /etc/containerd/config.toml
COPY config.toml.tmpl /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl

# TODO: add akri bits