
//docker process
Build the docker images
→docker buildx build --platform linux/amd64 -t imsummit18/nextjs-app:1 . (where imsummit18 is docker hub username)

If we want to run it locally 
→ docker run  -d -p 3000:3000 imsummit18/nextjs-app:1

Push to docker hub:
→docker push imsummit18/nextjs-app:1



Create a ec2 instance:

Install docker 

sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu


Pull docker image:
→docker pull imsummit18/nextjs-app:1
Run:
→sudo docker run --rm -d -p 3000:3000 imsummit18/nextjs-app:1
