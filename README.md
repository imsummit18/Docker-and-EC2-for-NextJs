//docker process
Build the docker images

→docker build  -t imsummit18/nextjs-app:1 .

or for mac plactform

→docker buildx build --platform linux/amd64 -t imsummit18/nextjs-app:1 . (where imsummit18 is docker hub username)

If we want to run it locally
→ docker run -d -p 3000:3000 imsummit18/nextjs-app:1

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

If you want to run multiple container of same image
--> sudo docker run -d -p 3001:3000 --name imsummit18/nextjs-app:2 imsummit18/nextjs-app:1

(for this if we want to run another container in port 3001 we need to add security policies for inbound rule to expose 3001 port)



FOR CICD:

Generate a Persistent SSH Key Pair (if you haven't already):
ssh-keygen -t rsa -b 4096 -C "github-ec2" -f github-actions-key


Add the Public Key to EC2
ssh -i existing-ec2.pem ubuntu@<EC2_PUBLIC_IP>
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys


Add the Private Key to GitHub Secrets
Go to your GitHub repo → Settings → Secrets and variables → Actions
Click “New repository secret”
Name: EC2_KEY
Paste the full content of github-actions-key 


