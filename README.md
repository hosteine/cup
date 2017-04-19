# Cup of Hosteine
Preconfigured container to run multiple hosts based on LAMP stack.

## Development

1. Clone repository
```
git clone git@github.com:hosteine/cup.git
```

2. Build container
```
docker build -t hosteine .
```

3. Run container
```
docker run -d -v `pwd`/data:/data -v `pwd`/config:/config -v `pwd`/bin:/bin -v `pwd`/logs:/logs -p 8888:80 -p 3306:3306 --memory="192m" hosteine
```
