# tailscale_jumpserver solution
Use Tailscale to build jumper server for other people access one's resources safely.   
In this README, let's assume Bob want to access Alice's home local service A.   
   
<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step0.png" width="100%" />    

## Step1. Sign up a Tailscale®  
Alice should tell Bob to [sign up Tailscale®](https://login.tailscale.com/start). Bob may use Microsoft® , Goolge or GitHub account to do that.      

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step1-1.png" width="100%" />    

After this done, Bob can follow Tailscale®'s introduction to install the client software on Bob's device.   

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step1-2.png" width="100%" />    

Bob can also do that or add more devices later according to the [download page](https://tailscale.com/download).   

## Step2. Generate AuthKey for the jump server   
Bob should generate an Authkey in his Tailscale Settings and offer the key to Alice for jump server using.   
("Ephemeral Key" should be ok).  
After click the Generate button, it will show the key just generated. Remember to copy it before click th Done button. 

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step2.png" width="100%" />    

## Step3. Alice kick-off the jump server with Docker    
Alice run below cmd on her prepared Tailscale JumpServer (amd64 host with docker installed). Remeber to replace the "tskey-xxxxxxxx" with the one recieved from Bob in step 2.   

```shell   
docker run -itd --privileged --restart always --name jumpserver_for_bob -e TS_AUTHKEY="tskey-xxxxxxxx" -e SERVER_NAME="alice-service-A" -e JUMP_TARGET="192.168.1.33/32" gps949/tailscale_jumpserver:latest 
```   

After the container run up, Bob should see th jump server on his Tailscale® admin control panel.  

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step3-1.png" width="100%" />   

Follow the step in above screenshot. (If Bob will only access Alice's service A in 90 days, he can ignore the 2nd step).   
After the 3rd step, click the switch to enable all subnet rules.   

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step3-2.png" width="100%" />   

## Step4. Bob can enjoy Alice service A through Tailscale® jump server now!   
Bob need to install the Tailscale client on his device first if he didn't do that in Step 2.   
Bob should ensure he has already logged in the Tailscale® client and enabled the subnet.   

<img src="https://github.com/gps949/tailscale_jumpserver/raw/main/imgs/step4.png" width="100%" />
