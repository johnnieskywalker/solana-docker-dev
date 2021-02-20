# Interactive container with node rust solana to play and develop with
debian + node + rust + solana = :)

## Building the container

### Note after you cd into repo's directory
```bash
sudo docker build . -t solanacluster 
```

## Running the container

```bash
 sudo docker run -it solanacluster:latest 
```

## Targzipping the container into a file

```bash
sudo docker save solanacluster:latest | gzip > solanacluster_latest.tar.gz
```

