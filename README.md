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

## How to get tar.gz with solana?
Unfortunately github don't allow such a big files so I was not able to push it here
It was downloaded from : https://github.com/solana-labs/solana/releases/tag/v1.5.8
Which I believe will be maintained by solana team for many years
