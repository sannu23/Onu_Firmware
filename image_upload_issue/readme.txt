




install_bsp/Project/profile/CT/UNION_EN7528_LE_7592_7613_MAP_R2_demo/boa.conf 

search  :
# set post limit to 20MB
SinglePostLimit 20971520


1. The initial fw upgrade was failing and network was getting reset because the http server was replying with error response and the connection was getting reset because POST size overflowed.

2. On capturing the wireshark packets , found the following information which states Bad request. Your client has malformed.


4. Go to the SDK and inside your Project/Profile , modify the value of SinglePostLimit in boa.conf file and then compile your firmware.

5. For eg: I have kept the SinglePostLimit as 30 MB .
The image upgrade worked fine . I have attached logs for 3 different images upgraded