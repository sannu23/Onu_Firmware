
1. Upload the tclinux image 
    - Login with telecomadmin / nE7jA%5m
    - Upload image and type below commands

-	Prolinecmd restore default      # to relect the changes ---- confirm the date of uploaded image 


2. SDK_path : release_app/en7528/filesystem/userfs/CountrySetting
                release_app/en7528/filesystem/userfs/CountrySetting/IND/


2. once the image uploaded vlaidate the changes
=> Validate the change on linux console:
cat /userfs/CountrySetting/IND/toneSetting.txt


connect grandstream  to onu   ---- to connect telephone 
get done voip registration in onu configration page 

Once the voip registration and setup is complete please execute the below commands:
1.	/userfs/bin/sipclient -v "0xff 0xf"
2.	Change the region with same dial and ring tone:
3.	tcapi set VoIPAdvanced_Common VoIPRegion IND-INDIA
tcapi commit VoIPAdvanced_Common
/userfs/bin/sipclient -r -1
4.	sys wan2lan on 15
wan2lan [on||off] <number>
5.	insmod /lib/modules/pcmDump.ko
6.	echo 0 2 1 15 192.168.29.2 30000 > /proc/vdsp/debug/pcmdump
replace 192.168.29.2 with the ip on which you are capture the wireshark packets.
 
After this please make a call and capture the wirehsark packets. Make sure SIP and RTP packets are captured.
Please share the logs and wirehshrk packets to us for analysis

