# Health Monitoring Bot (HMB)

Health Monitoring Bot (HMB) is a product of Thinkbots designed to help general practitioners (GPs) and hospitals streamline the process of monitoring patients' health. This web application allows patients/users to conveniently fill out symptom surveys from the comfort of their homes without any time restrictions. HMB automatically analyzes users' responses and generates results on hospital and patient accounts. In addition to its primary functionality, HMB offers several other features demonstrated below.

## Tools and Technology Used

- HTML5
- CSS
- Ajax
- JavaScript
- REST APIs
- MySQL on Amazon Web Services (AWS) for database management

## Instructions to Run the HMB Web Application

### Requirements

- Docker
- Docker-Compose

#### Installing Docker on Linux

```bash
sudo apt-get update
sudo apt-get install -y docker-engine
docker version # Verify installation version


## Instructions to Run the HMB Web Application
1. Requirement:
•	Docker
•	Docker-Compose

1.1	To install Docker on Linux run these commands in the terminal: 
sudo apt-get install update
sudo apt-get install -y docker-engine
To verify the installation version use the “docker version” command 
1.1.1	After that install Docker-Compose using this command:
sudo apt-get install docker-compose
To verify the installation version use the “docker-compose version” command
2.	Methods to Run HMB Application
2.1	Executable Shell  Script
1-	We have created a shell script file “run_hmb_linux.sh” that can be used to run the application, the script will build required containers and images. 
2-	Then open the browser and go to http://localhost:8000 to access the application.

2.2	 Using Terminal
1-	Open the terminal and go to the directory “hmb”
2-	Then run the command: docker-compose up - -build
3-	Once the image is built go to http://localhost:8000 
![image](https://github.com/Jetendar-maheshwari/Health-Monitor-Bot/assets/79384613/f18484b8-99ba-423e-a9fb-785a3b2b4961)

