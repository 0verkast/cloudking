# cloudking

## Setup

Clone the repo locally
```bash
git clone https://github.com/0verkast/cloudking.git
```

Build the image
```bash
docker build .
```

Tag the image
```bash
docker tag ${container_id} cloudking
```

Add an alias to your .bashrc (this is just QoL and is not required)
```bash
vim ~/.bashrc
alias ck='docker run --rm -e LANG=C.UTF-8 cloudking'
source ~/.bashrc
```

Run the container
```bash
ck --help
```

If you didn't add an alias, this is the command
```bash
docker run --rm -e LANG=C.UTF-8 cloudking --help
```

From start to finish this should take about 5 minutes
If you plan to run this on a cheap cloud VM, it will take longer
Final container size on disk is ~4.3GB (sorry, dependencies suck)
