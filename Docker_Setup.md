# Real Time Activity: `(Portainer)`

There is something called **Portainer**. Imagine there are 10–20 containers, images, volumes then it's tough to see on command line, so Portainer gives you user interface where you can see everything from GUI itself.

*(It is also used during Docker sessions by colleagues)*

```bash
>> docker create volume portainerdata
```

### Let's create a container

```bash
>> docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer-data:/data \
portainer/portainer-ce:2.11.1
```

```bash
>> docker ps
```

Copy instance IP, goto browser.

```
https://IP:9443
```

*(Advanced procedure)*

### Portainer

Create user:

```
username: admin
password: any
```

**[Create user]**

**Here you can also add `Kubernetes cluster` as well, but now we get with `Docker`.**

- **Here you can see all your `containers`, `images`, `volumes`, `network` etc.**

---

## Command Explanation

- `-restart=always` → as containers are stopped, so if anything happens or container goes down, it is going to restart again and again.
- `v /var/run/docker.sock:/var/run/docker.sock` → here it is mounting the socket, so Portainer can see containers, volumes, images, networks etc. and collect information from host.

    **Means :**

  - **Mount the host's Docker socket into the Portainer container** at the same path.
  - Portainer **doesn't simply get/copy the host's Docker data into the container**. Instead, Portainer uses the socket to **communicate with the host Docker daemon**:
- `v portainer-data:/data` → this container is going to generate some data or logs, so we are storing it inside the `portainer-data` volume that we created.

```bash
>> docker stop portainer
```

Q. How this works Portaner container accessing the Host data with socket?

---

# Portainer Latest Version

Yes. As of **August 2026**, the latest Portainer CE release shown on Docker Hub is **2.45.0**. (hub.docker.com)

So replace your old `2.11.1` command with:

```bash
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer-data:/data \
  portainer/portainer-ce:2.45.0
```

### Your notebook version

```bash
>> docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer-data:/data \
portainer/portainer-ce:2.45.0
```

Then:

```bash
>> docker ps
```

Open:

```
https://<SERVER-IP>:9443
```

**Note:** You can also use `portainer/portainer-ce:latest`, but for learning/production I recommend pinning the version (`2.45.0`) so the image doesn't unexpectedly change when you recreate the container. Docker Hub currently lists both `latest` and `2.45.0`. (hub.docker.com)

Portainer official Docker installation docs
