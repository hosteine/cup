1. Clone repo

2. cd to docker-image 

   docker build -t hostein .

3. Run docker container
   
    docker run -d -v /.../data/apache2:/data/apache2 -v  /.../data/mysql:/var/lib/mysql hostein

4. http://your_ip

  