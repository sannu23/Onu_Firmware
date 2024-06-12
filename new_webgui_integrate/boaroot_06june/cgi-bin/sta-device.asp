<%
if Request_Form("accountflg")="1" then
	if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then
			TCWebApi_set("WebCurSet_Entry","CurPage","1")
			TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")
			TCWebApi_commit("Account_Entry")
			TCWebApi_save()
	else
		TCWebApi_set("WebCurSet_Entry","CurPage","1")
		TCWebApi_set("Account_Entry0","web_passwd","cfmPassword")
		TCWebApi_commit("Account_Entry")
		TCWebApi_save()
	end If
	tcWebApi_constSet("System_Entry","reset_flag","0") 
	TCWebApi_save()
else
	TCWebApi_set("WebCurSet_Entry","CurPage","0")
	tcWebApi_constSet("System_Entry","reset_flag","0") 
	TCWebApi_save()
end If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%tcWebApi_get("String_Entry","DevInfoDevInformationText","s")%></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"> 
<link href="/css/custom.css" type="text/css" rel="stylesheet">
<link href="/css/jquery.mCustomScrollbar.css" type="text/css" rel="stylesheet">
<link href="/css/scoop-vertical.css" type="text/css" rel="stylesheet">
<link href="/css/simple-line-icons.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script language="JavaScript" src="/js/printtable.js"></script>



 




<META content="MSHTML 6.00.6000.16809" name=GENERATOR>

<style type="text/css">
.front-img{
width:auto;
height:290px;
background-repeat:no-repeat;
background-image:url(../img/FRONT.png);
background-size:cover;
}
.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li.scoop-trigger.active > a {
    background: #f3f3f3;
    color: #f68220;
}

.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li.scoop-trigger > a {
    background: #f3f3f3;
    border-bottom-color: #eeeeee;
    color: #f68220;
}

.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li:hover > a:before {
    border-left-color: #f68220;
}

#overflow-amit{
height:300px;
  overscroll-behavior-y: contain;
 
}

.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li.active > a {
    background: rgba(243,243,243,1.00);
    color: #0c0c0c;
    font-weight: 500;
}
.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li > a {
color: #0c0c0c;
    font-weight: 500;

}

.scoop-logo {
    padding: 6px;
    border-bottom: solid 1px #eeeeee;
    text-align: center;
}

.modal-lg, .modal-xl {
    max-width: 1000px;
}
        table
        {
          font-size: 14px;
        }
        
        #tablewid{
         width: 600px !important
        }
        a{
          text-decoration: none;
        }
        .close{
            color: red;
        }
        .card-header{
         color:#f58220;
        }
        .modal-title{
         color:#f58220;
        }
        .btn-orang{
         background-color:#f58220;
         color: white;
        }
        .active {
         display: contents;
        }

        .hidden {
          display: none;
        }
        #myDiv {
          display: none;
        }
        .modal-lg{
            width: 945px!;important
        }
        @media (min-width: 992px)

            .modal-lg{
                max-width: 1200px! importent;
            }   

           .modal-lg{
            width: 1200px!importent;
           }
        }
        .modal-lg{

              max-width: 1200px! importent;
        }
        .table-headcol{
            background-color: #f2f2f2;

        }
    </style>

</HEAD>
<body onload="FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload="DoUnload()" marginwidth="0" marginheight="0" themebg-pattern="pattern6" style="-webkit-text-stroke: 0.05px; -webkit-font-smoothing: antialiased;">
    <input id="Selected_Menu" type="hidden" value="Status->Device Info" name="Sta_Dev"> 
		<div id="scoop" class="scoop iscollapsed" theme-layout="vertical" vertical-placement="left" vertical-layout="wide" scoop-device-type="desktop" vertical-nav-type="compact" vertical-effect="shrink" vnavigation-view="view1">	
			<div class="scoop-overlay-box"></div>
			<div class="scoop-container">  				
				<div class="scoop-main-container" style="min-height: 117px; margin-top: 0px;">
					<div class="scoop-wrapper">
						<nav class="scoop-navbar is-hover" navbar-theme="theme4" active-item-theme="theme0" sub-item-theme="theme2" active-item-style="style0" scoop-navbar-position="absolute">  
					<div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
					<div class="scoop-inner-navbar"> 
						<div class="scoop-logo"> 
						<a href="https://syrotech.com" target="_blank"><span class="logo-text"><img src="/img/logo.png" style="height:42px; width:138px; " class="img-fluid" alt=""></span></a>
					</div> 
					   <div id="LeftMenu">
<ul class="scoop-item scoop-left-item left_nav" item-border="true" item-border-style="solid" subitem-border="true"> 
<li class="scoop-hasmenu active" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:LoadPage('1')">
<svg xmlns="http://www.w3.org/2000/svg" height="512pt" viewBox="0 -84 512 512" width="512pt">
<path d="m467 194.945312h-35v-165c0-8.285156-6.714844-15-15-15s-15 6.714844-15 15v165h-292v-165c0-8.285156-6.714844-15-15-15s-15 6.714844-15 15v165h-35c-24.8125 0-45 20.183594-45 45v90c0 8.28125 6.714844 15 15 15h482c8.285156 0 15-6.71875 15-15v-90c0-24.816406-20.1875-45-45-45zm15 120h-452v-75c0-8.273437 6.730469-15 15-15h422c8.269531 0 15 6.726563 15 15zm0 0"></path><path d="m192.359375 56.304688c35.09375-35.089844 92.1875-35.089844 127.28125 0 2.925781 2.929687 6.765625 4.394531 10.605469 4.394531 3.835937 0 7.675781-1.464844 10.605468-4.394531 5.859376-5.855469 5.859376-15.355469 0-21.214844-46.789062-46.785156-122.917968-46.785156-169.707031 0-5.855469 5.859375-5.855469 15.355468 0 21.214844 5.859375 5.855468 15.359375 5.855468 21.214844 0zm0 0"></path><path d="m287.820312 103.125c3.835938 0 7.675782-1.464844 10.605469-4.394531 5.855469-5.855469 5.855469-15.355469 0-21.210938-11.332031-11.335937-26.398437-17.574219-42.425781-17.574219s-31.09375 6.238282-42.425781 17.574219c-5.859375 5.855469-5.859375 15.351563 0 21.210938 5.855469 5.859375 15.355469 5.855469 21.210937 0 5.667969-5.667969 13.199219-8.785157 21.214844-8.785157 8.011719 0 15.546875 3.117188 21.210938 8.785157 2.929687 2.929687 6.769531 4.394531 10.609374 4.394531zm0 0"></path><path d="m211 269.945312c0 8.28125-6.714844 15-15 15s-15-6.71875-15-15c0-8.285156 6.714844-15 15-15s15 6.714844 15 15zm0 0"></path><path d="m271 269.945312c0 8.28125-6.714844 15-15 15s-15-6.71875-15-15c0-8.285156 6.714844-15 15-15s15 6.714844 15 15zm0 0"></path><path d="m331 269.945312c0 8.28125-6.714844 15-15 15s-15-6.71875-15-15c0-8.285156 6.714844-15 15-15s15 6.714844 15 15zm0 0"></path><path d="m271 134.945312c0 8.28125-6.714844 15-15 15s-15-6.71875-15-15c0-8.285156 6.714844-15 15-15s15 6.714844 15 15zm0 0"></path></svg>

<span  class="scoop-mtext">Status</span></a>
<!-- <ul class="scoop-submenu" id="StatusMenu">
<li class=" active"><a href="javascript:LoadPage('1')" target="" id="sta-device" name="sta-device">Device Info</a></li>
<li class=" "><a href="javascript:LoadPage('2')" target="" id="sta-network" name="sta-network">Net Info</a></li>
<li class=" "><a href="javascript:LoadPage('3')" target="" id="sta-user" name="sta-user">User Info</a></li>
<li class=" "><a href="javascript:LoadPage('4')" target="" id="sta-VoIP" name="sta-VoIP">VoIP Info</a></li>
<li class=" "><a href="javascript:LoadPage('5')" target="" id="sta-acs" name="sta-acs">CWMP Status</a></li>
<li class=" "><a href="javascript:LoadPage('6')" target="" id="wifi_parameter" name="wifi_parameter">Wifi Info</a></li>
<li class=" "><a href="javascript:LoadPage('7')" target="" id="sta-pon" name="sta-pon">Pon info</a></li>
</ul> -->

</li>



<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">

<svg xmlns="http://www.w3.org/2000/svg" height="512pt" viewBox="0 0 512 512" width="512pt"><path d="m140.328125 61.792969c34.820313-20.863281 74.308594-31.792969 115.671875-31.792969 124.617188 0 226 101.382812 226 226 0 41.039062-10.765625 80.253906-31.328125 114.890625 9.449219 4.070313 17.644531 10.5 23.855469 18.542969 24.585937-40.042969 37.472656-85.648438 37.472656-133.433594 0-68.378906-26.628906-132.667969-74.980469-181.019531-48.351562-48.351563-112.640625-74.980469-181.019531-74.980469-48.027344 0-93.828125 13.007812-134 37.820312 7.976562 6.269532 14.339844 14.496094 18.328125 23.972657zm0 0"></path><path d="m372.035156 449.992188c-34.90625 21.007812-74.515625 32.007812-116.035156 32.007812-124.617188 0-226-101.382812-226-226 0-41.363281 10.929688-80.847656 31.792969-115.671875-9.472657-3.988281-17.703125-10.351563-23.972657-18.328125-24.8125 40.171875-37.820312 85.972656-37.820312 134 0 68.378906 26.628906 132.667969 74.980469 181.019531 48.351562 48.351563 112.640625 74.980469 181.019531 74.980469 48.328125 0 94.375-13.15625 134.710938-38.253906-8.082032-6.167969-14.550782-14.332032-18.675782-23.753906zm0 0"></path><path d="m115 85c0 16.570312-13.429688 30-30 30s-30-13.429688-30-30 13.429688-30 30-30 30 13.429688 30 30zm0 0"></path><path d="m457.027344 426.027344c0 16.566406-13.433594 30-30 30-16.570313 0-30-13.433594-30-30 0-16.570313 13.429687-30 30-30 16.566406 0 30 13.429687 30 30zm0 0"></path><path d="m439.0625 271h-68.179688c-1.964843 54.363281-14.28125 108.109375-43.679687 154.300781 61.628906-26.015625 106.207031-84.742187 111.859375-154.300781zm0 0"></path><path d="m271 241h69.863281c-1.742187-45.066406-11.332031-86.773438-27.4375-118.726562-12.097656-23.996094-27.011719-40.253907-42.425781-46.757813zm0 0"></path><path d="m312.855469 390.847656c.191406-.371094.378906-.746094.570312-1.121094 16.105469-31.949218 25.695313-73.65625 27.4375-118.726562h-69.863281v165.484375c15.171875-6.402344 29.863281-22.257813 41.855469-45.636719zm0 0"></path><path d="m327.203125 86.699219c4.605469 6.65625 8.957031 14.023437 13.011719 22.070312 18.140625 35.984375 28.871094 82.472657 30.667968 132.230469h68.175782c-5.648438-69.558594-50.226563-128.285156-111.855469-154.300781zm0 0"></path><path d="m184.796875 425.300781c-4.605469-6.65625-8.957031-14.023437-13.011719-22.070312-18.140625-35.984375-28.871094-82.472657-30.667968-132.230469h-68.179688c5.652344 69.558594 50.230469 128.285156 111.859375 154.300781zm0 0"></path><path d="m241 436.484375v-165.484375h-69.863281c1.742187 45.066406 11.332031 86.773438 27.4375 118.726562 12.097656 23.996094 27.011719 40.253907 42.425781 46.757813zm0 0"></path><path d="m198.574219 122.273438c-16.105469 31.953124-25.695313 73.660156-27.4375 118.726562h69.863281v-165.484375c-15.414062 6.503906-30.328125 22.761719-42.425781 46.757813zm0 0"></path><path d="m171.785156 108.769531c4.058594-8.046875 8.40625-15.414062 13.011719-22.070312-61.628906 26.015625-106.207031 84.742187-111.859375 154.300781h68.179688c1.796874-49.757812 12.527343-96.246094 30.667968-132.230469zm0 0"></path>
</svg>


<span class="scoop-mtext">Net</span></a>
<ul class="scoop-submenu" id="NetMenu">
<li class=" "><a href="javascript:LoadPage('9')" target="" id="net-wanset" name="net-wanset">WAN</a></li>
<li class=" "><a href="javascript:LoadPage('10')" target="" id="net-binding" name="net-binding">Binding</a></li>
<li class=" "><a href="javascript:LoadPage('11')" target="" id="net-dhcp" name="net-dhcp">LAN</a></li>
<li class=" "><a href="javascript:LoadPage('12')" target="" id="net-wlan" name="net-wlan">WLAN</a></li>
<li class=" "><a href="javascript:LoadPage('13')" target="" id="net-wlan11ac" name="net-wlan11ac">WLAN5G</a></li>
<li class=""><a href="javascript:LoadPage('30')" target="" id="app-VoIP" name="app-VoIP">Voice Setup</a></li>
<li class=" "><a href="javascript:LoadPage('14')" target="" id="net-tr069" name="net-tr069">CWMP</a></li>
<li class=" "><a href="javascript:LoadPage('15')" target="" id="net-qos" name="net-qos">QoS</a></li>
<li class=" "><a href="javascript:LoadPage('16')" target="" id="net-time" name="net-time">Time</a></li>
<li class=" "><a href="javascript:LoadPage('17')" target="" id="net-routeset" name="net-routeset">Route</a></li>
<li class=" "><a href="javascript:LoadPage('18')" target="" id="net-bandsteering" name="net-bandsteering">Bandsteering</a></li>
</ul>
</li> 

<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6">    	
<a href="javascript:void(0)">
    <svg xmlns="http://www.w3.org/2000/svg" height="512pt" viewBox="0 -21 512 512" width="512pt">
	    <path d="m372 301.058594v6.238281c0 23.03125 8.988281 44.324219 25 59.960937 16.011719-15.636718 25-36.929687 25-59.960937v-6.238281c-8.585938-2.855469-16.941406-6.371094-25-10.515625-8.058594 4.144531-16.414062 7.660156-25 10.515625zm0 0">
		    
	    </path>
	    <path d="m497 220h-20c-26.613281 0-52.03125-12.710938-68-34-2.832031-3.777344-7.277344-6-12-6s-9.167969 2.222656-12 6c-15.96875 21.289062-41.386719 34-68 34h-20c-8.285156 0-15 6.714844-15 15v72.296875c0 34.925781 10.351562 68.675781 29.929688 97.59375 19.582031 28.921875 47.070312 51.066406 79.5 64.039063 1.789062.714843 3.679687 1.070312 5.570312 1.070312s3.78125-.355469 5.570312-1.070312c32.429688-12.972657 59.917969-35.117188 79.5-64.039063 19.578126-28.917969 29.929688-62.667969 29.929688-97.59375v-72.296875c0-8.285156-6.714844-15-15-15zm-45 87.296875c0 36.09375-17.230469 70.363281-46.089844 91.667969-2.648437 1.957031-5.777344 2.933594-8.910156 2.933594s-6.261719-.980469-8.910156-2.933594c-28.859375-21.304688-46.089844-55.574219-46.089844-91.667969v-17.433594c0-6.828125 4.613281-12.796875 11.222656-14.515625 12.6875-3.304687 24.894532-8.308594 36.28125-14.875 4.640625-2.679687 10.355469-2.679687 14.992188 0 11.386718 6.566406 23.59375 11.570313 36.28125 14.875 6.609375 1.71875 11.222656 7.6875 11.222656 14.515625zm0 0"></path>
	    <path d="m397 130h-397v195c0 24.8125 20.1875 45 45 45h216.839844c-6.492188-20.109375-9.839844-41.214844-9.839844-62.703125v-72.296875c0-24.8125 20.1875-45 45-45h20c17.21875 0 33.667969-8.226562 44-22 8.453125-11.269531 21.910156-18 36-18 5.15625 0 10.226562.910156 15 2.605469v-22.605469zm-192 180h-160c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15h160c8.285156 0 15 6.714844 15 15s-6.714844 15-15 15zm0-60h-160c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15h160c8.285156 0 15 6.714844 15 15s-6.714844 15-15 15zm0-60h-160c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15h160c8.285156 0 15 6.714844 15 15s-6.714844 15-15 15zm0 0"></path><path d="m367 0h-322c-24.8125 0-45 20.1875-45 45v55h412v-55c0-24.8125-20.1875-45-45-45zm-150 65c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15 15 6.714844 15 15-6.714844 15-15 15zm60 0c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15 15 6.714844 15 15-6.714844 15-15 15zm60 0c-8.285156 0-15-6.714844-15-15s6.714844-15 15-15 15 6.714844 15 15-6.714844 15-15 15zm0 0"></path>
    </svg>
    <span class="scoop-mtext">Security</span></a>

<ul class="scoop-submenu" id="SecurityMenu">
<li class=" "><a href="javascript:LoadPage('20')" target="" id="sec-urlfilter" name="sec-urlfilter">URL Filter</a></li>
<li class=" "><a href="javascript:LoadPage('21')" target="" id="sec-firewall" name="sec-firewall">Firewall</a></li>
<li class=" "><a href="javascript:LoadPage('22')" target="" id="sec-macfilter" name="sec-macfilter">MAC Filter</a></li>
<li class=" "><a href="javascript:LoadPage('23')" target="" id="sec-portfilter" name="sec-portfilter">Port Filter</a></li>
<li class=" "><a href="javascript:LoadPage('24')" target="" id="sec-aclfilter" name="sec-aclfilter">ACL Filter</a></li>
<li class=" "><a href="javascript:LoadPage('25')" target="" id="sec-parental" name="sec-parental">Parental Control</a></li>
</ul>
</li> 
<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">
<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> 
<path id="Rectangle_4_copy_3" data-name="Rectangle 4 copy 3" class="cls-1" d="M36,38H2a2,2,0,0,1-2-2V2A2,2,0,0,1,2,0H36a2,2,0,0,1,2,2V36A2,2,0,0,1,36,38ZM16,3H5A2,2,0,0,0,3,5V33a2,2,0,0,0,2,2H16V3ZM35,5a2,2,0,0,0-2-2H18V18H28.586L24,13.414,25.414,12l6,6H32v0.586l0.457,0.457L32,19.5V20H31.5l-0.457.457L31,20.414l-6.043,6.043-1.414-1.414L28.586,20H18V35H33a2,2,0,0,0,2-2V5ZM12,8H6V6h6V8Zm0,6H6V12h6v2Zm0,6H6V18h6v2Zm0,6H6V24h6v2Z"></path></svg>
<span class="scoop-mtext">APP</span></a>
<ul class="scoop-submenu" id="APPMenu">
	<li class=" "><a href="javascript:LoadPage('27')" target="" id="app-ddns" name="app-ddns">DDNS</a></li>
	<li class=" "><a href="javascript:LoadPage('28')" target="" id="app-natset" name="app-natset">Forward Rules</a></li>
	<li class=" "><a href="javascript:LoadPage('29')" target="" id="app-upnp" name="app-upnp">UPNP</a></li>
		<li class=" "><a href="javascript:LoadPage('31')" target="" id="app-igmpset" name="app-igmpset">IGMP/MLD</a></li>
	<li class=" "><a href="javascript:LoadPage('32')" target="" id="app-daily" name="app-daily">Daily APP</a></li>
	<li class=" "><a href="javascript:LoadPage('33')" target="" id="app-ipsecList" name="app-ipsecList">VPN</a></li>

	<li class=" "><a href="javascript:LoadPage('34')" target="" id="wifi_multi_ap_basic" name="wifi_multi_ap_basic">EasyMesh</a></li>
</ul>
</li> 
<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">
<svg xmlns="http://www.w3.org/2000/svg" height="512pt" viewBox="0 0 512 512" width="512pt">
	<path d="m256 271c-41.355469 0-75 33.644531-75 75s33.644531 75 75 75 75-33.644531 75-75-33.644531-75-75-75zm0 120c-24.8125 0-45-20.1875-45-45s20.1875-45 45-45 45 20.1875 45 45-20.1875 45-45 45zm0 0"></path>
	<path d="m202.285156 0h-202.285156v451h127.652344l43.496094 43.492188 26.675781-26.679688c4.292969 2.058594 8.691406 3.886719 13.175781 5.476562v38.710938h90v-38.710938c4.484375-1.589843 8.878906-3.417968 13.175781-5.476562l26.675781 26.679688 43.492188-43.492188h127.65625v-390h-249.714844zm138.566406 452.066406-21.546874-21.550781c-6.679688 3.5625-17.804688 12.191406-37.058594 17.164063l-11.246094 2.90625v31.414062h-30v-31.414062l-11.246094-2.90625c-19.238281-4.96875-30.152344-13.480469-37.058594-17.164063l-21.546874 21.550781-21.214844-21.214844 21.550781-21.546874c-3.683594-6.902344-12.191406-17.808594-17.164063-37.058594l-2.90625-11.246094h-30.414062v-30h30.414062l2.90625-11.246094c4.96875-19.238281 13.480469-30.152344 17.164063-37.058594l-21.550781-21.546874 21.214844-21.214844 21.546874 21.550781c6.679688-3.5625 17.804688-12.191406 37.058594-17.164063l11.246094-2.90625v-30.414062h30v30.414062l11.246094 2.90625c19.238281 4.96875 30.191406 13.5 37.058594 17.164063l21.546874-21.550781 21.214844 21.214844-21.550781 21.550781c3.695313 6.921875 12.195313 17.804687 17.164063 37.054687l2.90625 11.246094h30.414062v30h-30.414062l-2.90625 11.25c-4.964844 19.234375-13.476563 30.148438-17.164063 37.054688l21.550781 21.550781zm53.789063-31.066406-16.828125-16.824219c2.058594-4.296875 3.886719-8.691406 5.472656-13.175781h37.714844v-90h-37.714844c-1.585937-4.480469-3.414062-8.878906-5.472656-13.175781l26.679688-26.675781-63.640626-63.640626-26.679687 26.679688c-4.292969-2.058594-8.6875-3.886719-13.171875-5.476562v-37.710938h-90v37.710938c-4.484375 1.589843-8.882812 3.417968-13.175781 5.476562l-26.679688-26.679688-63.636719 63.640626 26.675782 26.675781c-2.054688 4.292969-3.882813 8.691406-5.472656 13.175781h-37.710938v90h37.710938c1.589843 4.480469 3.417968 8.878906 5.476562 13.175781l-16.828125 16.824219h-87.359375v-270h452v270zm87.359375-300h-452v-91h159.714844l60 61h232.285156zm0 0">
		
	</path>
</svg><span class="scoop-mtext">Manage</span></a>
<ul class="scoop-submenu" id="ManageMenu">
	<li class=" "><a href="javascript:LoadPage('36')" target="" id="mag-account" name="mag-account">User Management</a></li>
	<li class=" "><a href="javascript:LoadPage('37')" target="" id="mag-reset" name="mag-reset">Device Management</a></li>
	<li class=" "><a href="javascript:LoadPage('38')" target="" id="mag-syslogmanage" name="mag-syslogmanage">Log Management</a></li>
	<li class=" "><a href="javascript:LoadPage('39')" target="" id="upgrade" name="upgrade">Upgrade</a>
	</li>
</ul>
</li> 
<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">

	<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> <path id="Forma_1" data-name="Forma 1" class="cls-1" d="M8.609,18.488A11.056,11.056,0,0,1,11.653,10.8a1.6,1.6,0,0,0,0-2.2,1.438,1.438,0,0,0-2.1,0,14.436,14.436,0,0,0,0,19.765,1.439,1.439,0,0,0,2.1,0,1.6,1.6,0,0,0,0-2.2A11.056,11.056,0,0,1,8.609,18.488Zm-5.641,0a17.059,17.059,0,0,1,4.7-11.859,1.6,1.6,0,0,0,0-2.2,1.439,1.439,0,0,0-2.1,0A20.219,20.219,0,0,0,0,18.488,20.218,20.218,0,0,0,5.565,32.544a1.439,1.439,0,0,0,2.1,0,1.6,1.6,0,0,0,0-2.2A17.059,17.059,0,0,1,2.969,18.488ZM19,10.413a7.912,7.912,0,0,0-7.719,8.075A7.912,7.912,0,0,0,19,26.563a7.912,7.912,0,0,0,7.719-8.075A7.912,7.912,0,0,0,19,10.413Zm0,13.044a4.869,4.869,0,0,1-4.75-4.969A4.869,4.869,0,0,1,19,13.519a4.869,4.869,0,0,1,4.75,4.969A4.869,4.869,0,0,1,19,23.458ZM32.435,4.433a1.438,1.438,0,0,0-2.1,0,1.6,1.6,0,0,0,0,2.2,17.059,17.059,0,0,1,4.7,11.859,17.06,17.06,0,0,1-4.7,11.859,1.6,1.6,0,0,0,0,2.2,1.438,1.438,0,0,0,2.1,0A20.218,20.218,0,0,0,38,18.488,20.218,20.218,0,0,0,32.435,4.433ZM28.446,8.606a1.438,1.438,0,0,0-2.1,0,1.6,1.6,0,0,0,0,2.2,11.228,11.228,0,0,1,0,15.373,1.6,1.6,0,0,0,0,2.2,1.438,1.438,0,0,0,2.1,0A14.436,14.436,0,0,0,28.446,8.606Z"></path></svg>
	<span class="scoop-mtext">Diagnose</span></a><ul class="scoop-submenu" id="DiagnoseMenu">
		<li class=" "><a href="javascript:LoadPage('41')" target="" id="diag-quickdiagnose" name="diag-quickdiagnose">Internet Diagnose</a></li>
		<li class=" "><a href="javascript:LoadPage('42')" target="" id="diag-speedtest" name="diag-speedtest">Speed Test</a></li>
	</ul>
</li> 
	<li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="/cgi-bin/help.asp">

		<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> 
			<path id="Forma_1_copy" data-name="Forma 1 copy" class="cls-1" d="M18.746,0A19,19,0,1,0,38,18.744,19,19,0,0,0,18.746,0ZM18.69,30.565l-0.1,0a2.766,2.766,0,0,1,.065-5.531l0.094,0A2.766,2.766,0,1,1,18.69,30.565Zm6.8-13.49a12.558,12.558,0,0,1-2.268,2.031l-1.16.8a3.147,3.147,0,0,0-1.165,1.418,2.933,2.933,0,0,0-.18,1.19l0,0.186H16.286l0.013-.375c0.054-1.54.092-2.446,0.73-3.194a18.823,18.823,0,0,1,3.3-2.658,3.485,3.485,0,0,0,.782-0.8,2.816,2.816,0,0,0,.67-1.641,3.2,3.2,0,0,0-.608-1.89,2.531,2.531,0,0,0-2.19-.823,2.389,2.389,0,0,0-2.213,1.023,4.112,4.112,0,0,0-.67,2.21v0.189H11.539l0.008-.2c0.118-2.8,1.116-4.809,2.965-5.984a7.809,7.809,0,0,1,4.295-1.127,9.269,9.269,0,0,1,5.54,1.595A5.531,5.531,0,0,1,26.587,13.8,5.461,5.461,0,0,1,25.487,17.076Z"></path></svg>
			<span class="scoop-mtext">Help</span></a>
			<ul class="scoop-submenu" id="HelpMenu"></ul>
	</li> 
</ul>
					    
</div>							</div> 
				</nav>




<div class="scoop-content">
                        <div id="Header"><header class="header_box scoop-header iscollapsed" header-theme="theme2" scoop-header-position="relative"> <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="fa fa-bars" aria-hidden="true"> </i></a>

                        </div> &nbsp;
                        <div style="float:left; padding-top:10px">
                          <a href="https://www.facebook.com/SyrotechNetworks" target="_blank"><image src="../img/fb.png" style="width:30px">  
                          </a>
                        <a href="https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2F13408012%2Fadmin%2F" target="_blank"><image src="../img/linked-in.png" style="width:30px">
                        

                        </a> 
                        <a href="https://twitter.com/Syrotech" target="_blank"> <image src="../img/twit.png" style="width:30px"> </a> 
                        <a href="https://www.youtube.com/channel/UCxKPAshBZ3BjsKoryZqd1jg?reload=9" target="_blank"> <image src="../img/youtube.png" style="width:30px"> </a> <a href="https://www.instagram.com/syrotechnetworks/" target="_blank"> <image src="../img/insta.png" style="width:30px"> </a>

                        </div>
                        <span class="gateway_box">Gateway Name:Home Gateway</span><span class="model_box">Gateway Type:NP1257G</span><a onclick="DoLogout()" href="/cgi-bin/login.asp" id="logOut" name="logOut" target="_top" class="Power_btn"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="25" viewBox="0 0 22 25"> <path id="power_icon" data-name="power_icon" class="cls-1" d="M15.405,3.524s-1.324-.6-1.324.8A3.166,3.166,0,0,0,15.41,6.65,8.495,8.495,0,0,1,11,22.253,8.495,8.495,0,0,1,6.59,6.65,3.167,3.167,0,0,0,7.919,4.322c0-1.4-1.324-.8-1.324-0.8A11.242,11.242,0,0,0,11,25,11.242,11.242,0,0,0,15.405,3.524ZM11.077,0A1.47,1.47,0,0,0,9.46,1.258V12.325a1.47,1.47,0,0,0,1.618,1.258,1.3,1.3,0,0,0,1.463-1.258V1.258A1.3,1.3,0,0,0,11.077,0Z"></path> </svg></a> </header>
                      </div>
                      <div class=""> 

 

      <form style="DISPLAY: none" name="ConfigForm"></form>
      
	 <div class="container-fluid" style="overflow-y: auto; overflow-x: hidden; "  >
        <div class="d-sm-flex align-items-center justify-content-between mb-4" >
            <!-- <h1 class="h3 mb-0 text-gray-800"><b>Basic Equipment Information :</b></h1>                        -->
        </div>
        <div class=" col-md-12 col-xl-12 col-md-12" style="margin-left:9px;">   
<div class="row front-img">
 <div class="col-md-3">
<a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO"><img class= "mobile-iconfront" src="../img/inter.png" style="width:55%;margin-left:55px;margin-top:82px;"> <h4 class="mobile-iconfront-text" style="padding-left: 86px; padding-top: 18px;"><b>Internet</b></h4></a>
</div>
<div class="col-md-6">
<a href="#"><img class="mid-divice" src="../img/ont.png" style=""></a>
</div>
<div class="col-md-3">

<a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO08"><img class= "mobile-iconfront"  src="../img/user.png" style="width:50%;margin-left:60px;margin-top:90px;"> <h4 style="padding-left: 105px; padding-top: 22px;"><b>User</b></h4></a>

</div>

</div>
         </div>                
            <div class="row p-3" style="background-color:#fff;"   id="overflow-amit"> 
                <div class="col-xl-6 col-md-6 mb-4">
                    <div class="card " style="height:374px;" >
                            <div class="card-header">
                                <span>
                                    <img src="../img/stasush.png" style="width:45px;padding-bottom:5px;">
                                </span>
                                    <span  ><b style="font-size: 18px;padding-top:5px;"><span style="vertical-align:middle;">Device Information</b></span>
                                    <hr>                                    
                                    <span>On this page, you can view basic device information </span>
                            </div>
                        <div class="card-body table-bordered table-responsive " >                                       
                                <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO01">
                                    <table class="table  table-bordered table-striped">
                                        <tbody>
                                            <tr>
                                                <th style="width:25%">Model Number </th>
                                                <td style="width:75%">SY-GPON-2010R2-WADONT</td>                                     
                                            </tr>
                                            <tr>
                                                <th style="width:25%">Device Serial  </th>
                                                <td style="width:75%"> SY-GPON-2010R2-WADONT</td>
                                            </tr>
                                            <tr>
                                                <th style="width:25%">Description:   </th> 
                                                <td style="width:75%">4GE+1Voice+2USB+Dual Band Wifi XPON ONU</td>
                                            </tr>     
                                            <tr>
                                                <th style="width:25%">Hardware Version   </th> 
                                                <td style="width:75%">20CD.A</td>
                                            </tr>                                                         
                                        </tbody>
                                    </table>
                                    <button class="btn btn-orang btn-sm" href="" data-toggle="modal" data-target="#HERO01" >View More
                                    </button>
                                </a>
                                <div class="modal fade" id="HERO01" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <span class="">
                                                    <img src="../img/stasush.png" style="width:45px;padding-bottom:5px;">
                                                </span>
                                                <h2 class="modal-title" style="display: inline;"><span style="vertical-align:middle;">&nbsp;Device Information</h2></span>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>On this page, you can view basic device information.</p>
                                                <table class="table  table-bordered table-striped">
                                                        <tbody> 
                                                                <tr>
                                                                    <th style="width:40%">Model Number </th>
                                                                    <td style="width:60%">SY-GPON-2010R2-WADONT</td>                                     
                                                                </tr>
                                                                <tr>
                                                                    <th style="width:40%">Device Serial  </th>
                                                                    <td style="width:60%"> SY-GPON-2010R2-WADONT</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Description:   </th> 
                                                                    <td>4GE+1Voice+2USB+Dual Band Wifi XPON ONU</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>MAC:</th>  
                                                                    <td>2C:97:B1:21:EF:7A </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Hardware Version: </th>   
                                                                    <td>20CD.A</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Software Version:</th>  
                                                                    <td>V5R020C00S130</td>
                                                                </tr>                                               
                                                                <tr> 
                                                                        <th> Manufacture Info: </th> 
                                                                        <td>2021083084AGJ7736080.C442</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>ONT Registration Status: </th>   
                                                                    <td>OFFLINE</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>CPU Usage:</th>  
                                                                    <td>2%</td>
                                                                </tr>
                                                                <tr>
                                                                    <th> Memory Usage: </th>
                                                                    <td> 29%</td>
                                                                </tr>
                                                                <tr>
                                                                    <th> Custom Info:</th>   
                                                                    <td> COMMON</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>System Time:</th> 
                                                                    <td>  1981-01-01 04:30:48+00:00</td>
                                                                </tr>
                                                        
                                                        </tbody>
                                                </table>
                                            </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light" data-dismiss="modal">Close </button>
                                                </div>
                                        </div>
                                    </div>
                                </div>                            
                        </div>
            
                    </div>                    
                </div>                       
                <div class="col-xl-6 col-md-6 mb-4"> 
            
                    <div class="card ">
                            <div class="card-header">
                                <span>
                                    <img src="../img/internet.png" style="width:45px;padding-bottom:5px;">
                                </span>
                                <span><b style="font-size: 18px;"><span style="vertical-align:middle;">WAN Information</b></span></span>
                                <hr>                            
                                <span> 
                                    you can query the connection and line status of the WAN port.
                                </span>
                            </div>
                            <div class="card-body table-bordered table-responsive">
                            <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO">            
                                <table class="table table-striped ">
                                    <tbody>
                                        <tr> 
                                            <th style="width:25%;">Connection <br>Name </th>
                                            <td>3_INTERNET_R_VID_ </td>                                                         
                                        </tr> 
                                        <tr>
                                            <th style="width:25%;">Status </th>
                                            <td>Unconnected</td>      
                                        </tr>    
                                        <tr>
                                            <th style="width:25%;">IP <br>Address</th>
                                            <td>--</td>     
                                        </tr>
                                        <tr>
                                            <th style="width:25%;">Subnet Mask </th>  
                                            <td>--</td>     
                                        </tr>
                                    </tbody>
                                </table>                               
                            </a>
                                <button class="btn btn-orang btn-sm" href="" data-toggle="modal" data-target="#HERO" >View More
                                </button>
                                <div class="modal fade" id="HERO" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <span>
                                                        <img src="../img/internet.png" style="width:45px;padding-bottom:5px;">
                                                    </span>
                                                    <h2 class="modal-title"><span style="vertical-align:middle;">&nbsp;WAN Information</h2></span>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>On this page, you can query the connection and line status of the WAN port.</p>
                                                    <p> 
                                                        <b>IPv4 Information(Click the form for details)</b> 
                                                    </p>
                
                                                    <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#myModal2">
                                                        <table class="table table-striped" >
                                                            <thead class="bg-dark text-white">
                                                            <tr>
                                                                <th>WAN Name </th>
                                                                <th>Status </th>
                                                                <th>IP Address</th>
                                                                <th>VLAN/Priority </th>
                                                                <th>Connect </th>
                
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1_INTERNET_R_VID_</td>
                                                                    <td>Disconnected</td>
                                                                    <td>--</td>
                                                                    <td>-/-</td>
                                                                    <td>Always on</td>                                                                
                                                                </tr>
                                                            </tbody>
                                                        </table>
                
                                                    </a>
                                                    <p><b>IPv6 Information(Click the form for details)</b></p>
                                                    <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#myModal1">
                                                        <table class="table table-striped" >
                                                            <thead class="bg-dark text-white">
                                                            <tr>
                                                                <th>WAN Name </th>
                                                                <th>Status </th>
                                                                <th>IP Address</th>
                                                                <th>VLAN/Priority </th>
                                                                <th>Connect </th>
                
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td>2_INTERNET_R_VID_</td>
                                                                <td>connected</td>
                                                                <td>--</td>
                                                                <td>-/-</td>
                                                                <td>Always on</td>
                                                                
                                                            </tr>
                                                        </tbody>
                                                        </table>
                                                        
                                                    </a>
                                                </div>
                
                
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <div class="modal fade" id="myModal2" role="dialog">
                                <div class="modal-dialog modal-lg">
                            
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <span>
                                                <img src="../img/wanip.png" style="width:45px;padding-bottom:5px;">
                                            </span>
                                            <h2 class="modal-title"><span style="vertical-align:middle;">&nbsp;IPv4 Information</h2></span>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table  table-bordered table-striped">
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 40%">MAC Address: </th>
                                                        <td> B8:E3:B1:D7:46:A3</td>
                                                    </tr>
                                                    <tr>
                                                        <th>VLAN:</th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Policy:</th>
                                                        <td> --</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Priority:</th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>NAT:</th>
                                                        <td>Enable</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>IP Acquisition Mode:</th>
                                                        <td>DHCP</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>IP Address/Subnet Mask:</th>
                                                        <td> --</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Gateway:</th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>DNS Servers: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Lease Time:</th>
                                                        <td> --</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Remain Lease: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>NTP Servers: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Time Zone Info: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>SIP Servers:   </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Static Route: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Vendor Info: </th>
                                                        <td>--</td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Online Duration (dd:hh:mm:ss):</th>
                                                        <td>--</td> 
                                                    </tr>
                                                    </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            
                            
                            <div class="modal fade" id="myModal1" role="dialog">
                                <div class="modal-dialog modal-lg">
                                
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <span>
                                                <img src="../img/wanip.png" style="width:45px;padding-bottom:5px;">
                                            </span>
                                            <h2 class="modal-title"><span style="vertical-align:middle;">&nbsp;IPv6 Information</h2></span>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table  table-bordered table-striped">
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 40%">MAC Address: </th>
                                                        <td> B8:E3:B1:D7:46:A3</td>

                                                    </tr>
                                                    <tr>
                                                        <th>VLAN: </th>
                                                        <td>  --</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Policy:</th>
                                                        <td> --</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Priority: </th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>DNS Servers:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Prefix:</th>
                                                        <td> --</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Prefix Acquisition Mode: </th>
                                                        <td>PrefixDelegation</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Prefix Preferred Lifetime:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Prefix Valid Lifetime:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Remain Lifetime of the Prefix:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>IP Address:</th>
                                                        <td>--</td>
                                                    <tr>
                                                        <th>Acquisition Mode of the IP Address:</th>
                                                        <td> AutoConfigured </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status of the IP Address:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Preferred Lifetime of the IP Address:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Valid Lifetime of the IP Address:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Remain Lifetime of the IP Address: </th>
                                                        <td> </td> 
                                                    </tr>
                                                    <tr>
                                                        <th>Default Gateway:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>DS-Lite AFTR Name:</th>
                                                        <td>--</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Peer IP Address of the DS-Lite Channel:</th>
                                                        <td>--</td>
                                                    </tr>
                                                   <tr>
                                                        <th> Online Duration (dd:hh:mm:ss):</th>
                                                        <td>--</td>
                                                    </tr>
                                            
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                        <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="col-xl-6 col-md-6 mb-4 ">  

                    <div class="card " style="height:377px;">
                        <div class="card-header ">
                            <span>
                                <img src="../img/trangle.png" style="width:45px;padding-bottom:5px;">
                            </span>
                             <span> <b style="font-size:18px;"><span style="vertical-align:middle;">PON Optical Information</b></span></span>
                            <hr>
                            On this page, you can query the status of the optical module.
                        </div>
                        <div class="card-body table-bordered table-responsive " >                                       
                            <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO02">

                                    <table class="table table-striped ">
                                        <tbody>
                                            <tr>
                                                <th >Optical Information</th>
                                                <th >Current Value</th>
                                                <th >Reference Value</th>
                                            </tr>
                                            
                                            <tr>
                                                <th> Optical Signal Sending Status:</th >
                                                <td>  -- </td>
                                                <td> Auto</td>
                                            </tr>
                                                <tr>
                                                    <th>TX Optical Power: </th>
                                                    <td>  -- dBm</td>
                                                    <td>  0.5 to 5 dBm</td>
                                                </tr>
                                                <tr>
                                                    <th>RX Optical Power:</th>
                                                    <td>-- dBm </td>
                
                                                    <td> -27 to -3 dBm</td>
                                                </tr>
                                              
                                                                            
                                        
                                        </tbody>
                                    </table>
                                    <button class="btn btn-orang btn-sm" href="" data-toggle="modal" data-target="#HERO02" >View More</button>
                            </a>
                            <div class="modal fade" id="HERO02" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <span>
                                                <img src="../img/trangle.png" style="width:45px;padding-bottom:5px;">
                                            </span>
                                                <h2 class="modal-title" style="display: inline;"><span style="vertical-align:middle;">PON Optical Information</span></h2>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <p>On this page, you can query the status of the optical module.</p>
                                            <table class="table table-striped ">
                                            
                                                <tbody>
                                                    <tr>
                                                       <th colspan="3" style="color: #f58220">Network Link Connection Information</th>
                                                    </tr>
                                            
                                                    <tr>
                                                        <th style="width: 30%"> PON Link Connection Status :</th >
                                                        <td  colspan="2">Online</td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th>PON Mode </th>
                                                        <td colspan="2"> Gepon</td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th>FEC  Enable</th>
                                                        <td colspan="2">Enable</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Encription Mode :   </th>
                                                        <td colspan="2">3364 mV </td> 
                                                      
                                                    </tr>
                                                    <tr>
                                                        <th>GEMPORT1 :Disable; GEMPORT160 :Disable</th>
                                                        <td colspan="2">No Alarm</td>   
                                                     
                                                    </tr>
                                             
                                                    <tr>
                                                        <th style="color: #f58220" colspan="3">Link Preformance Statistics :</th>
                                                       
                                                    </tr>
                                                    <tr>

                                                        <th>Packets Number Of PON Port Send </th>
                                                        <td colspan="2">679729</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Packets Number Of PON Port Send</th>
                                                        <td colspan="2">967210</td>
                                                    </tr>
                                                    <tr>
                                                       <th style="color: #f58220" colspan="3">Light Module Information</th>
                                                    </tr>
                                                    <tr>
                                                        <th >Optical Information</th>
                                                        <th >Current Value</th>
                                                        <th >Reference Value</th>
                                                    </tr>
                                                
                                                       <tr>
                                                        <th>Optical Signal Sending Status:</th>
                                                        <td>   -- </td>
                                                        <td> Auto</td>
                                                        </tr>
                                                        <tr>
                                                            <th>TX Optical Power:</th>
                                                            <td>   -- dBm</td>
                                                            <td>  0.5 to 5 dBm</td>
                                                        </tr>
                                                        <tr>
                                                            <th>RX Optical Power: </th>
                                                            <td>  -- dBm </td>
                                                            <td> -27 to -3 dBm </td>
                                                        </tr>
                                                        <tr>
                                                            <th>Working Voltage: </th>
                                                            <td>   3364 mV</td>
                                                            <td> 3100 to 3500 mV </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Bias Current: </td>
                                                            <td>  0 mA </td>
                                                            <td>  0 to 90 mA </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Working Temperature: </td>
                                                            <td>  52 ?  </td>
                                                            <td>  -10 to +85 ? </td> 
                                                        </tr>                                                                   
                                        
                                                </tbody>
                                            </table>
                               
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-light" data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                            <!-- <div class="card-body table-bordered table-responsive"">
                                <table class="table table-striped ">
                                    <tbody>
                                        <tr>
                                            <th ></th>
                                            <th >Current Value</th>
                                            <th >Reference Value</th>
                                        </tr>
                                        
                                        <tr>
                                            <th> Optical Signal Sending Status:</th >
                                            <td>  -- </td>
                                            <td> Auto</td>
                                        </tr>
                                            <tr>
                                                <th>TX Optical Power: </th>
                                                <td>  -- dBm</td>
                                                <td>  0.5 to 5 dBm</td>
                                            </tr>
                                            <tr>
                                                <th>RX Optical Power:</th>
                                                <td>-- dBm </td>
            
                                                <td> -27 to -3 dBm</td>
                                            </tr>
                                            <tr>
                                                <th>Working Voltage:   </th>
                                                <td>3364 mV </td> 
                                                <td>3100 to 3500 mV </td>
                                            </tr>
                                            <tr>
                                                <th>Bias Current:  </th>
                                                <td>0 mA </td>   
                                                <td>0 to 90 mA </td>
                                            </tr>
                                            <tr>
                                                <th>Working Temperature:</th>
                                                <td>39 ? </td>
                                                <td> -10 to +85 ?</td>
                                            </tr>
                                                                        
                                    
                                    </tbody>
                                </table>
                            </div> -->
                    </div>
                </div>                    
                <div class="col-xl-6 col-md-6 mb-4">                        
                    <div class="card ">
                    <div class="card-header">
                            <span>
                                <img src="../img/voice.png" style="width:45px;padding-bottom:5px;">
                            </span>
                            <span><b style="font-size:18px;"><span style="vertical-align:middle;">Voice </b></span></span>
                            <hr>
                           status information of voice users and reset the voice function
                        </div>
            
                    <div class="card-body">
                        <a style="text-decoration: none;" href="" data-toggle="modal" data-target="#HERO04">
                        <table class="table table-bordered table-striped">
                            <thead></thead>
                            <tbody>
                                <tr>
                                    <th>User Name(Phone Number)</th>
                                    <td>--</td>
                                </tr>
                                <tr>
                                    <th>Associated POTS Port</th>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <th>User Status</th>
                                    <td>Disabled</td>
                                </tr>
                                <tr>
                                    <th>Call Status</th>
                                    <td>Idle</td>
                                </tr>
                                <tr>
                                    <th>Registry Error</th>
                                    <td>Upstream port disconnected</td>
                                </tr>
                            </tbody>
                            
                        </table>
                    </a>
                        <button class="btn btn-orang btn-sm" href="" data-toggle="modal" data-target="#HERO04">View More</button>
                    </div>
                    
                    </div>
                </div> 

                <div class="modal fade" id="HERO04" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <span>
                                                <img src="../img/voice.png" style="width:45px;padding-bottom:5px;">
                                            </span>
                                                <h2 class="modal-title" style="display: inline;"><span style="vertical-align:middle;">Voice</span></h2>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <p>status information of voice users and reset the voice function</p>
                                        <table class="table table-striped table-bordered ">             
                                                <tbody>
                                                                <tr>
                                                                    <th style="width: 80% ;text-align:center">
                                                                        Register Server
                                                                    </th>
                                                                    <td>
                                                                        
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <th style="width: 80% ;text-align:center">
                                                                        Register Server Port
                                                                    </th>
                                                                    <td>
                                                                        5060
                                                                           
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="width: 80% ;text-align:center">
                                                                        Secondary Register Server
                                                                    </th>
                                                                    <td>
                                                                        
                                                                          
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="width: 80% ;text-align:center">
                                                                        Secondary Register Server Port 
                                                                    </th>
                                                                    <td>
                                                                        5060
                                                                          
                                                                    </td>
                                                                </tr>
                                                                <tbody>
                                                                
                                                            </tbody>
                                                </tbody>
                                         </table>
                                         <table class="table table-bordered table-striped">
                                            <tbody>
                                                <tr>
                                                    <th style="width:30%">
                                                        Name
                                                    </th>
                                                    <th>
                                                        Line 1
                                                    </th>
                                                       
                                                </tr>
                                                <tr>
                                                    <th style="width:30%">
                                                        Telephone Number
                                                    </th>
                                                    <td>                                               </td>
                                                </tr>
                                                <tr>
                                                    <th class="table_title" style="width:30%">
                                                        Registration Status
                                                    </th>
                                                    <td>
                                                        
                                                       Disable
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="table_title" style="width:30%">
                                                        Subscriber Line State
                                                    </th>
                                                    <td>
                                                        Idle
                                                    </td>
                                                </tr>
                                                   <tr>
                                                        <td colspan="2" style=" text-align: center">
                                                           <button class="btn btn-orang btn-sm" onclick="myFunction()">Restart VoIP</button>
                                                       </td>
                                                    </tr>
                                            </tbody>
                                         </table>
              
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                 </div>                    
                <div class="col-xl-12 col-md-12 mb-4">                        
                    <div class="card ">
                        <div class="card-header">
                            <span>
                                <img src="../img/logo-user.png" style="width:45px;padding-bottom:5px;">
                            </span>
                           <span><b style="font-size:18px;"><span style="vertical-align:middle;">User Info</b></span></span>
                           <hr>
                           <span>
                           On this page, you can query the WLAN information,& user-side Ethernet port information.
                            </span>

                        </div>
            
                                <div class="card-body table-responsive">
                                        <p style="color:#f58220;"><b>WIFI Devices</b></p>
                                        <table class="table table-bordered">
                                            <thrad>
                                                <tr>
                                                    <th>Device Name</th> 
                                                    <th>Port ID </th>
                                                    <th>Device Info </th>
                                                    <th>Device Status </th>  
                                                    <th>Connection Duration</th> 
                                                    <th>Operations</th>
                                                </tr>
                                            </thrad>
                                            <tbody>
                                                <tr>
                                                    <td>V2149</td> 
                                                    <td>SSID5</td>
                                                    <td>4e:b2:bd:cf:26:af192.168.100.3</td>
                                                    <td>Online </td>  
                                                    <td>0 hour 3 minutes</td> 
                                                    <td>
                                                        <button class="btn btn-sm btn-orang m-1 p-1"data-toggle="modal" data-target="#HERO05">Details/Edit</button>
                                                        <button  class="btn btn-sm btn-orang pl-1 pr-0" onclick="alert('Cannot use this function due to high security level of your brouser.')">Share Access</button>
                                                        <button  class="btn btn-sm btn-orang m-1 p-1" data-toggle="modal" data-target="#HERO06">Application</button>
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        
                                        </table>
                                        <p style="color:#f58220;"><b>WIRED Devices</b></p>
                                        <table class="table table-bordered">
                                        
                                        <thrad>
                                            <tr>
                                                <th>Device Name</th> 
                                                <th>Port ID </th>
                                                <th>Device Info </th>
                                                <th>Device Status </th>  
                                                <th>Connection Duration</th> 
                                                <th>Operations</th>
                                            </tr>
                                        </thrad>
                                        <tbody>
                                            <tr>
                                                <td>V2149</td> 
                                                <td>SSID5</td>
                                                <td>4e:b2:bd:cf:26:af192.168.100.3</td>
                                                <td>Online </td>  
                                                <td>0 hour 3 minutes</td> 
                                                <td>
                                                    <button class="btn btn-sm btn-orang m-1 p-1"data-toggle="modal" data-target="#HERO07">Details/Edit</button>
                                                    <button  class="btn btn-sm btn-orang pl-1 pr-0" onclick="alert('Cannot use this function due to high security level of your brouser.')">
                                                    Share Access</button>
                                                    <button  class="btn btn-sm btn-orang m-1 p-1" data-toggle="modal" data-target="#HERO06">Application</button>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                        </table>
                                        <div class="modal fade" id="HERO05" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <span>
                                                            <img src="../img/logo-user.png" style="width:45px;">
                                                        </span>
                                                            <h2 
                                                            class="modal-title" style="display: inline;"> &nbsp; User Device Information
                                                            </h2>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <div class="modal-body">                                           
                                                    <table class="table table-striped table-bordered ">  
                                                        <p>On this page, you can query the details about the user device, including the host name, device type, IP address, MAC address, device status, port type, port ID, online and offline duration, IP acquisition mode, and remaining lease time.</p>           
                                                            <tbody>
                                                                <tr><th width="30%">Host Name:</th><td> V2149</td>
                                                               <tr><th> User Alias:</th><td><input class="form-control" type="text"placeholder="--" name=""></td>
                                                                <tr><th>User Device Type:</th>
                                                                    <td><select class="form-control" id="DeviceType">
                                                                            <option value="0">--</option>
                                                                            <option value="1">Phone</option>
                                                                            <option value="2">Pad</option>
                                                                            <option value="3">PC</option>
                                                                            <option value="4">STB</option>
                                                                            <option value="5">OTHER</option>
                                                                        </select>
                                                                    </td>
                                                                <tr><th>Device Type:</th><td>    android-dhcp-11</td>
                                                                <tr><th>IP Address:</th><td> 192.168.100.3</td>
                                                                <tr><th>MAC Address:</th><td>    4e:b2:bd:cf:26:af</td>
                                                                <tr><th>Device Status:</th><td>  Online</td>
                                                                <tr><th>Port Type:</th><td>  WIFI</td>
                                                                <tr><th>Port ID:</th><td>    SSID5</td>
                                                                <tr><th>Online Duration:</th><td>    0 hour 3 minutes</td>
                                                                <tr><th>IP Acquisition Mode:</th><td>    DHCP</td>
                                                                <tr><th>Remaining Lease Time:</th><td>   83251(s)</td>
                                                            </tbody>
                                                     </table>
                                                                  
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="HERO06" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <span>
                                                            <img src="../img/logo-user.png" style="width:45px;">
                                                        </span>
                                                            <h2 
                                                            class="modal-title" style="display: inline;"> &nbsp; User Device Information
                                                            </h2>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <button class="btn btn-light m-1">IP Filter</button><br>
                                                        <button class="btn btn-light m-1">Mac Filter</button><br>
                                                        <button class="btn btn-light m-1">Port Mapping</button><br>
                                                         <button class="btn btn-light m-1"> Configure Reserved DHCP IP Addresses</button><br>
                                                         <button class="btn btn-light m-1"> Parental Control Configuration</button>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="HERO07" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <span>
                                                            <img src="../img/logo-user.png" style="width:45px;">
                                                        </span>
                                                            <h2 
                                                            class="modal-title" style="display: inline;"> &nbsp; User Device Information
                                                            </h2>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <div class="modal-body">
                                                       
                                                    <table class="table table-striped table-bordered ">  
                                                    <p>On this page, you can query the details about the user device, including the host name, device type, IP address, MAC address, device status, port type, port ID, online and offline duration, IP acquisition mode, and remaining lease time.</p>           
                                                            <tbody>
                                                                <tr><th width="30%">Host Name:</th><td> V2149</td>
                                                               <tr><th> User Alias:</th><td><input class="form-control" type="text"placeholder="--" name=""></td>
                                                                <tr><th>User Device Type:</th>
                                                                    <td><select class="form-control" id="DeviceType">
                                                                            <option value="0">--</option>
                                                                            <option value="1">Phone</option>
                                                                            <option value="2">Pad</option>
                                                                            <option value="3">PC</option>
                                                                            <option value="4">STB</option>
                                                                            <option value="5">OTHER</option>
                                                                        </select>
                                                                    </td>
                                                                <tr><th>Device Type:</th><td>    android-dhcp-11</td>
                                                                <tr><th>IP Address:</th><td> 192.168.100.3</td>
                                                                <tr><th>MAC Address:</th><td>    4e:b2:bd:cf:26:af</td>
                                                                <tr><th>Device Status:</th><td>  Online</td>
                                                                <tr><th>Port Type:</th><td>  ETH</td>
                                                                <tr><th>Port ID:</th><td>   Lan2</td>
                                                                <tr><th>Online Duration:</th><td>    0 hour 3 minutes</td>
                                                                <tr><th>IP Acquisition Mode:</th><td>    Static</td>
                                                                <tr><th>Remaining Lease Time:</th><td>  ---</td>
                                                            </tbody>
                                                     </table>
                                                                  
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-sm btn-orang"data-toggle="modal" data-target="#HERO08" >View More</button>
                                </div>
                            
                                    
                                         
                  
                                        
                    </div>
                </div>

                    <div class="modal fade" id="HERO08" role="dialog" style="overflow-y:auto;">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <span>
                                            <img src="../img/wlan.png" style="width:45px;">
                                        </span>
                                            <h2 
                                            class="modal-title" style="display: inline;"> &nbsp; 
                                            WLAN Information
                                            </h2>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                        <div class="modal-body table-responsive">
                                           
                                        <table class="table table-bordered ">  
                                                    <p>
                                                        On this page, you can query the WLAN information, WLAN packet statistics, and SSID information.
                                                    </p>
                                                <thead>
                                                        <tr>
                                                            <td colspan="6" ><button class="btn 
                                                                btn-orang btn-sm"data-toggle="modal" data-target="#HERO011">One-Click Diagnosis
                                                                </button>
                                                            </td>
                                                            <td colspan="7">
                                                                <span><img src="../img/ethport.png" style="width:45px;"></span> &nbsp;
                                                                <button class="btn btn-orang btn-sm"
                                                                data-target="#HERO010" data-toggle="modal"> Ethernet Port Status
                                                              </button>
                                                            </td>
                                                        </tr>
                                                        <tbody id="div3" class="hidden">
                                                            <tr><td colspan="13">ok</td></tr>
                                                        </tbody>
                                                        <tr>
                                                            <td colspan="5"><input name="WlanMethod"  type="radio" onclick="showDiv1()" >2.4 GHz wireless network information
                                                            </td>
                                                            <td colspan="4"><input name="WlanMethod" type="radio" onclick="showDiv2()">5 GHz wireless network information
                                                            </td>
                                                        </tr>

                                                </thead>
                                                <tbody id="div1" class="active">
                                                    <tr>
                                                        <td style="color:#f58220 " colspan="13">WLAN Info</td>
                                                    </tr>
                                                    <tr>
                                                        <td>WLAN Status:</td>
                                                        <td colspan="12">Enabled  </td>
                                                    </tr>
                                                    <tr>
                                                        <td>WLAN Channel:</td>
                                                        <td colspan="12">4 </td>
                                                    </tr>   
                                                    <tr>
                                                        <td style="color:#f58220 " colspan="13">
                                                            WLAN Packet Statistics
                                                        </td>
                                                    </tr>                                           
                                                    <tr>
                                                          <th rowspan="2">SSID Index</th>
                                                          <th >SSID Name</th>
                                                          <th colspan="4" style= " text-align:center">Receive (RX)</th>
                                                          <th colspan="4"  style="text-align:center" colspan="6">Transmit (TX)
                                                          </th>

                                                    </tr>
                                                    <tr>                                                     
                                                      <th></th>
                                                      <th>Bytes </th>
                                                      <th>Packets</th>
                                                      <th>Error  </th>
                                                      <th>Discarded</th>
                                                      
                                                     <th>Bytes </th>
                                                      <th>Packets</th>
                                                      <th>Error  </th>
                                                      <th>Discarded</th>
                                                    </tr>
                                                    <tr>                       
                                                        <td>1</td>
                                                        <td>ElSID2G</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>989592</td>           
                                                        <td>7967 </td>
                                                        <td>0</td>
                                                        <td>6 </td>
                                                    </tr>
                                                    <tr>                       
                                                          <td>2</td>
                                                          <td>002</td>
                                                          <td>03</td>
                                                          <td>054</td>
                                                          <td>05</td>
                                                          <td>06</td>
                                                          <td>8</td>
                                                          <td>7</td>
                                                          <td>0</td>
                                                          <td>6</td>
                                                    </tr>
                                              </tbody>

                                            <tbody  id="div2" class="hidden">                                                
                                                <p>WLAN Packet Statistics</p>
                                                    <tr><td>WLAN Info</td></tr>
                                                    <tr>
                                                        <td>WLAN Status:</td>
                                                        <td colspan="12">Enabled  </td>
                                                    </tr>
                                                    <tr>
                                                        <td>WLAN Channel:</td>
                                                        <td colspan="12">165 </td>
                                                    </tr>   
                                                    <tr>
                                                        <td style="color:#f58220 " colspan="13">
                                                            WLAN Packet Statistics
                                                        </td>
                                                    </tr>                                             
                                                      
                                                 
                                                      <tr>

                                                          <th rowspan="2">SSID Index</th>
                                                          <th >SSID Name</th>
                                                          <th colspan="4" style= " text-align:center">Receive (RX)</th>
                                                          <th colspan="4"  style="text-align:center" colspan="6">Transmit (TX)</th>

                                                      </tr>
                                                    <tr>
                                                         
                                                          <th></th>
                                                          <th>Bytes </th>
                                                          <th>Packets</th>
                                                          <th>Error  </th>
                                                          <th>Discarded</th>
                                                          
                                                         <th>Bytes </th>
                                                          <th>Packets</th>
                                                          <th>Error  </th>
                                                          <th>Discarded</th>

                                                      </tr>

                                                      <tr>                       
                                                          <td>1</td>
                                                          <td>ElSID2G</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>989592</td>           
                                                          <td>7967 </td>
                                                          <td>0</td>
                                                          <td>6 </td>
                                                      </tr>
                                                       <tr>                       
                                                          <td>2</td>
                                                          <td>002</td>
                                                          <td>03</td>
                                                          <td>054</td>
                                                          <td>05</td>
                                                          <td>06</td>
                                                          <td>8</td>
                                                          <td>7</td>
                                                          <td>0</td>
                                                          <td>6</td>
                                                      </tr>
                                                    </tbody>
                                                    
                                                    <tbody id="div1" class="active" >
                                                        <tr>
                                                          <td style="color:#f58220 " colspan="13">SSID Information</td>
                                                        </tr>
                                                        <tr>
                                                          <th rowspan="2">SSID Index</th>
                                                          <th >SSID Name</th>
                                                          <th colspan="4" style= " text-align:center">Receive (RX)</th>
                                                          <th style="text-align:center" colspan="4">Transmit (TX)</th>
                                                        </tr>
                                                        <tr>
                                                            <th></th>
                                                          <th>Bytes </th>
                                                          <th>Packets</th>
                                                          <th>Error  </th>
                                                          <th>Discarded</th>

                                                          <th>Bytes </th>
                                                          <th>Packets</th>
                                                          <th>Error  </th>
                                                          <th>Discarded</th>
                                                        </tr>
                                                        <tr>                       
                                                          <td>1</td>
                                                          <td>ElSID2G</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>0</td>
                                                          <td>859853</td>
                                                          <td>6784</td>
                                                          <td>0</td>
                                                          <td>6</td>
                                                        </tr>
                                                        <tr>                       
                                                          <td>2</td>
                                                          <td>002</td>
                                                          <td>03</td>
                                                          <td>054</td>
                                                          <td>05</td>
                                                          <td>06</td>
                                                          <td>8</td>
                                                          <td>7</td>
                                                          <td>0</td>
                                                          <td colspan="3">6</td>
                                                        </tr>
                                                    </tbody>
                                        </table>
                                        


                                            <table class="table table-bordered table-striped" >    
                                                    <tbody>
                                                        <tr>
                                                            <td style="color:#f58220" colspan="13">
                                                                STA Information 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="13">
                                                                <button class="btn btn-sm  btn-orang">Query</button>
                                                            </td>
                                                        </tr>
                                                            <tr>
                                                                <th>MAC Address</th> 
                                                                <th>SSID Name </th> 
                                                                <th>Connection Duration (s) </th> 
                                                                <th>Sending Rate (Mbit/s) </th> 
                                                                <th>Receiving Rate (Mbit/s)</th> 
                                                                    <th>Noise (dBm) </th> 
                                                                    <th>Signal-to-Noise Ratio (dB)</th> 
                                                                    <th> Signal Quality (dBm)</th> 
                                                                    <th>Antenna Num</th> 
                                                                    <th> 11k </th> 
                                                                    <th>11v </th> 
                                                                    <th>DualBand</th> 
                                                            </tr>
                                                    </tbody>
                                            </table>

                                            <table class="table table-bordered table-striped">
                                                <tbody>
                                                        <tr>
                                                            <td style="color:#f58220 " colspan="13">
                                                                Neighboring AP Information
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td colspan="13">
                                                                <button class="btn btn-sm  btn-orang"  data-toggle="modal" data-target="#HERO09" >Query</button>&nbsp;&nbsp;&nbsp;
                                                                Note: querying the neighboring AP information may disconnect all STA connections.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>MAC Address</th> 
                                                            <th>SSID Name </th> 
                                                            <th>Connection Duration (s) </th> 
                                                            <th>Sending Rate (Mbit/s) </th> 
                                                            <th>Receiving Rate (Mbit/s)</th> 
                                                            <th>Signal Strength (dBm) </th> 
                                                            <th>Noise (dBm) </th> 
                                                            <th>Signal-to-Noise Ratio (dB)</th> 
                                                            <th> Signal Quality (dBm)</th> 
                                                            <th>Antenna Num</th> 
                                                            <th> 11k </th> 
                                                            <th>11v </th> 
                                                            <th>DualBand</th> 
                                                        </tr>
                                                </tbody>
                                            </table>
                                            <table class="table table-bordered table-striped">
                                                <tr><td style="color:#f58220 ">STA Event Log</td></tr>
                                                <tr>
                                                    <td>
                                                        <input id="btn_sta_event" name="btnCheck" type="button" value="Download Log File" class="NewDelbuttoncss" >
                                                    </td>
                                                </tr>
                                              <tr>
                                                <td colspan="13">
                                                <textarea class="form-control"wrap="off" readonly="readonly" rows="15" cols="100">
             1981-01-01 00:00:42 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:00:44 [5G] [vap4] dmac_config_start_vap: WLAN UP success
            1981-01-01 00:00:44 [5G] [vap4] wal_chan_switch_report:pre_chan=36 new_chan=149 reason=1 chip_index=1
            1981-01-01 00:00:45 [2.4G] [vap0] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:00:45 [2.4G] [vap0] wal_cfg80211_del_station:hmac_config_kick_user reason:3!
            1981-01-01 00:00:45 [2.4G] [vap0] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:00:45 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:3!
            1981-01-01 00:00:45 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:00:46 [2.4G] [vap0] dmac_config_start_vap: WLAN UP success
            1981-01-01 00:00:46 [2.4G] [vap0] wal_chan_switch_report:pre_chan=1 new_chan=9 reason=1 chip_index=0
            1981-01-01 00:01:08 [5G] [vap4] hmac_ap_rx_auth_req: AUTH_REQ rx user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:08 [5G] [vap4] hmac_encap_auth_rsp: AUTH_RSP tx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:08 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_REQ rx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:08 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_RSP tx, STA assoc AP SUCC! user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:08 [5G] [vap4] hmac_ap_up_rx_asoc_req: STA_index=8. 
            1981-01-01 00:01:08 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:08 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 10a 
            1981-01-01 00:01:08 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:08 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 30a 
            1981-01-01 00:01:20 [5G] [vap4] hmac_ap_rx_auth_req: AUTH_REQ rx user mac:86:14:0d:84:xx:xx
            1981-01-01 00:01:20 [5G] [vap4] hmac_encap_auth_rsp: AUTH_RSP tx : user mac:86:14:0d:84:xx:xx
            1981-01-01 00:01:20 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_REQ rx : user mac:86:14:0d:84:xx:xx
            1981-01-01 00:01:20 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_RSP tx, STA assoc AP SUCC! user mac:86:14:0d:84:xx:xx
            1981-01-01 00:01:20 [5G] [vap4] hmac_ap_up_rx_asoc_req: STA_index=9. 
            1981-01-01 00:01:20 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:20 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 10a 
            1981-01-01 00:01:20 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:20 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 30a 
            1981-01-01 00:01:24 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, sa[f8:9e:94:0c:xx:xx]
            1981-01-01 00:01:24 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, err_code:1[Unspecified]
            1981-01-01 00:01:24 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:01:26 [5G] [vap4] hmac_ap_rx_auth_req: AUTH_REQ rx user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:26 [5G] [vap4] hmac_encap_auth_rsp: AUTH_RSP tx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:26 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_REQ rx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:26 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_RSP tx, STA assoc AP SUCC! user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:26 [5G] [vap4] hmac_ap_up_rx_asoc_req: STA_index=10. 
            1981-01-01 00:01:26 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:26 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 10a 
            1981-01-01 00:01:26 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:26 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 30a 
            1981-01-01 00:01:40 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, sa[f8:9e:94:0c:xx:xx]
            1981-01-01 00:01:40 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, err_code:1[Unspecified]
            1981-01-01 00:01:40 [5G] [vap4] hmac_mgmt_encap_deauth:send deauth to f8:9e:94:0c:xx:xx
            1981-01-01 00:01:40 [5G] [vap4] hmac_mgmt_send_deauth_frame: DEAUTH TX :  to f8:9e:94:0c:xx:xx
            1981-01-01 00:01:40 [5G] [vap4] hmac_mgmt_send_deauth_frame: DEAUTH tx, err_code:6[Class 2 frame received from non-authed STA]
            1981-01-01 00:01:40 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:01:44 [5G] [vap4] hmac_ap_rx_auth_req: AUTH_REQ rx user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:44 [5G] [vap4] hmac_encap_auth_rsp: AUTH_RSP tx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:44 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_REQ rx : user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:44 [5G] [vap4] hmac_ap_up_rx_asoc_req: ASSOC_RSP tx, STA assoc AP SUCC! user mac:f8:9e:94:0c:xx:xx
            1981-01-01 00:01:44 [5G] [vap4] hmac_ap_up_rx_asoc_req: STA_index=11. 
            1981-01-01 00:01:44 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:44 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 10a 
            1981-01-01 00:01:44 [5G] [vap4] hmac_tx_classify_lan_to_wlan: EAPOL tx : uc_tid=7,IS_EAPOL_KEY_PTK=1
            1981-01-01 00:01:44 [5G] [vap4] dmac_rx_process_data_event: EAPOL rx, key info is 30a 
            1981-01-01 00:01:46 |INFO|STA|5G| [f8:9e:94:0c:c1:2d]sta leave
            1981-01-01 00:01:46 |INFO|STA|5G| (00:01:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:141
            1981-01-01 00:01:46 |INFO|STA|5G| [f8:9e:94:0c:c1:2d]sta leave
            1981-01-01 00:01:46 |INFO|STA|5G| (00:01:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:141
            1981-01-01 00:03:20 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, sa[f8:9e:94:0c:xx:xx]
            1981-01-01 00:03:20 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, err_code:1[Unspecified]
            1981-01-01 00:03:20 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:03:41 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, sa[86:14:0d:84:xx:xx]
            1981-01-01 00:03:41 [5G] [vap4] hmac_ap_rx_deauth_req: DEAUTH rx, err_code:3[STA deauth leaving or has left]
            1981-01-01 00:03:41 [5G] [vap4] wal_cfg80211_del_station:hmac_config_kick_user reason:2!
            1981-01-01 00:03:46 |INFO|STA|5G| [f8:9e:94:0c:c1:2d]sta leave
            1981-01-01 00:03:46 |INFO|STA|5G| [f8:9e:94:0c:c1:2d](00:01:46)ifIndex:4,rssi:-50dBm,phy_rate_rx:702Mbps,phy_rate_tx:866Mbps
            1981-01-01 00:03:46 |INFO|STA|5G| [f8:9e:94:0c:c1:2d](00:02:46)ifIndex:4,rssi:-53dBm,phy_rate_rx:526Mbps,phy_rate_tx:702Mbps
            1981-01-01 00:03:46 |INFO|STA|5G| (00:01:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:141
            1981-01-01 00:03:46 |INFO|STA|5G| (00:02:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:150
            1981-01-01 00:03:46 |INFO|STA|5G| (00:03:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:597
            1981-01-01 00:03:46 |INFO|STA|5G| [86:14:0d:84:da:09]sta leave
            1981-01-01 00:03:46 |INFO|STA|5G| [86:14:0d:84:da:09](00:01:46)ifIndex:4,rssi:-38dBm,phy_rate_rx:6Mbps,phy_rate_tx:866Mbps
            1981-01-01 00:03:46 |INFO|STA|5G| [86:14:0d:84:da:09](00:02:46)ifIndex:4,rssi:-49dBm,phy_rate_rx:6Mbps,phy_rate_tx:866Mbps
            1981-01-01 00:03:46 |INFO|STA|5G| (00:01:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:141
            1981-01-01 00:03:46 |INFO|STA|5G| (00:02:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:150
            1981-01-01 00:03:46 |INFO|STA|5G| (00:03:46)channel:149,bandwidth:80 MHz(2),noise:-90dBm,glitch:597
            1981-01-01 00:45:45 [2.4G] [vap0] wal_chan_switch_report:pre_chan=9 new_chan=3 reason=1 chip_index=0
            1981-01-01 01:00:45 [2.4G] [vap0] wal_chan_switch_report:pre_chan=3 new_chan=4 reason=1 chip_index=0
            1981-01-01 04:30:40 [5G] [vap4] wal_chan_switch_report:pre_chan=149 new_chan=36 reason=1 chip_index=1
            1981-01-01 04:30:41 [2.4G] [vap0] wal_chan_switch_report:pre_chan=4 new_chan=11 reason=1 chip_index=0
        1981-01-01 04:45:39 [5G] [vap4] wal_chan_switch_report:pre_chan=36 new_chan=149 reason=1 chip_index=1
        1981-01-01 05:00:39 [5G] [vap4] wal_chan_switch_report:pre_chan=149 new_chan=36 reason=1 chip_index=1
        1981-01-01 05:15:39 [5G] [vap4] wal_chan_switch_report:pre_chan=36 new_chan=149 reason=1 chip_index=1
        1981-01-01 05:15:40 [2.4G] [vap0] wal_chan_switch_report:pre_chan=11 new_chan=4 reason=1 chip_index=0
        1981-01-01 06:15:38 [5G] [vap4] wal_chan_switch_report:pre_chan=149 new_chan=36 reason=1 chip_index=1

                                                      </textarea>
                                                  </td>
                                              </tr>
                                    </table>

                                          <!-- query -->
                                          


                                        
                                    </div>
                                </div>
                            </div>
                    </div> 
                    <div class="modal fade show" id="HERO010" style="display:none;" aria-modal="true" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                        <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <span>
                                                                                <img src="../img/ethport.png" style="width:45px;">
                                                                            </span>
                                                                                <h2 
                                                                                class="modal-title" style="display: inline;"> &nbsp; 
                                                                               Eth Port Information
                                                                                </h2>
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                                <p>On this page, you can query the user-side Ethernet port information.</p>
                                                                                <h5>Ethernet Port Status</h5>
                                                                            <table class="table  table-bordered table-striped">
                                                                                <tbody>  
                                                                                        <tr>
                                                                                            <th colspan="1" rowspan="2" >Port</<th>
                                                                                            <th colspan="3" >Status</<th>
                                                                                            <th colspan="2">Receive (RX)</<th>
                                                                                            <th colspan="2">Transmit (TX)</<th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th class="table-headcol">Mode</<th>
                                                                                            <th class="table-headcol">Speed</<th>
                                                                                            <th class="table-headcol">Link</<th>
                                                                                            <th class="table-headcol">Bytes</<th>
                                                                                            <th class="table-headcol">Packets</<th>
                                                                                            <th class="table-headcol">Bytes</<th>
                                                                                            <th class="table-headcol">Packets</<th>
                                                                                        </tr>

                                                                                            <tr>  
                                                                                                <td>1 </td>  
                                                                                                <td>--</td>   
                                                                                                <td>-- </td>  
                                                                                                <td>Down</td>    
                                                                                                <td>0</td>  
                                                                                                <td>0</td>  
                                                                                                <td>0</td>   
                                                                                                <td>0</td> 
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>2</td>  
                                                                                                <td>Full-duplex </td>
                                                                                                <td>100 Mbit/s</td>  
                                                                                                <td>Up</td>
                                                                                                <td>1282881</td>
                                                                                                <td>10002 </td> 
                                                                                                <td>16081538 </td>   
                                                                                                <td>16164 </td>  
                                                                                                
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>3 </td> 
                                                                                                <td> -- </td> 
                                                                                                <td>-- </td> 
                                                                                                <td>Down </td>  
                                                                                                <td> 0 </td>  
                                                                                                <td>0 </td>  
                                                                                                <td>0 </td>  
                                                                                                <td>0</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>4</td>   
                                                                                                <td>--</td>  
                                                                                                <td>--</td>  
                                                                                                <td>Down</td>    
                                                                                                <td>0 </td> 
                                                                                                <td> 0</td>   
                                                                                                <td>0 </td>  
                                                                                                <td>0</td>
                                                                                            </tr>
                                                                                        
                                                                                    </tbody> 
                                                                            </table>
                                                                        </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                    </div>
                    
                                                                </div>
                     </div>
                     <div class="modal fade" id="HERO09" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <span>
                                                            <img src="../img/wlan.png" style="width:45px;">
                                                        </span>
                                                            <h3 class="modal-title" > &nbsp; 
                                                            Neighboring AP Information
                                                            </h3>  
                                                     <button type="button" class="close" data-dismiss="modal"> </button>

                                                    </div>
                                                    <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                                    &nbsp; &nbsp;
                                                    &nbsp;Note: querying the neighboring AP information may disconnect all STA connections.</p>
                                                    <div class="modal-body table-responsive">

                                                    <table class="table table-bordered table-striped" id="HERO09">
                                                        
                                                        <tbody>
                                                            <tr>
                                                                <td style="color:#f58220 " colspan="13">
                                                                    Number of neighbor APs: 27
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>SSID Name </th> 
                                                                <th>MAC Address</th> 
                                                                
                                                                <th>Network Type </th> 
                                                                <th>Channel </th> 
                                                                <th>Signal Strength (dBm)</th> 
                                                                <th>Noise (dBm) </th> 
                                                                <th>DTIM Interval</th> 
                                                                <th>Beacon Period (ms)</th> 
                                                                <th> Authentication Mode</th> 
                                                                <th>Working Mode</th> 
                                                                <th> Max. Rate (Mbit/s) </th> 
                                                               
                                                            </tr>
                                                            <tr>
                                                                <td>GOIP  </td>  
                                                                <td>78:8A:20:C9:EC:68 </td>  
                                                                <td>AP </td> 
                                                                <td>1 </td>  
                                                                <td>-40(Stronger) </td>  
                                                                <td>-90 </td> 
                                                                <td>1 </td>  
                                                                <td>100</td> 
                                                                <td>WPA2-PSK-AES</td>
                                                                <td>11b/g/n </td>
                                                                <td>144</td>
                                                            </tr>
                                                            <tr>
                                                                <td>GOIP  </td>  
                                                                <td>78:8A:20:C9:EC:68 </td>  
                                                                <td>AP </td> 
                                                                <td>1 </td>  
                                                                <td>-40(Stronger) </td>  
                                                                <td>-90 </td> 
                                                                <td>1 </td>  
                                                                <td>100</td> 
                                                                <td>WPA2-PSK-AES</td>
                                                                <td>11b/g/n </td>
                                                                <td>144</td>
                                                            </tr>
                                                        </tbody>

                                                    </table>
                                                    </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                </div>          
                                                </div>
                                            </div>
                     </div>
                     <div class="modal fade" id="HERO011" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <span>
                                                            <img src="../img/wlan.png" style="width:45px;">
                                                        </span>
                                                            <h3 class="modal-title" > &nbsp; 
                                                            Neighboring AP Information
                                                            </h3>  
                                                     <button type="button" class="close" data-dismiss="modal"> </button>

                                                    </div>
                                                    <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                                    &nbsp; &nbsp;
                                                    &nbsp;Note: querying the neighboring AP information may disconnect all STA connections.</p>
                                                    <div class="modal-body table-responsive">

                                                    <table class="table table-bordered table-striped" id="HERO09">
                                                        <tbody>
                                                      
                                                               <tr>
                                                                    <td ><input name="WlanMethod1"  type="radio"  onclick="showDiv6()" > 2.4 GHz wireless network information
                                                                    </td>
                                                                    <td colspan="2"><input name="WlanMethod1" type="radio" onclick="showDiv7()"> 5 GHz wireless network information
                                                                    </td>
                                                                </tr> 

                                                            
                                                          
                                                        </tbody>
                                                        <tbody id="div6">
                                                            <tr>
                                                                    <td>5G WLAN Status:</td>
                                                                    <td colspan="2">Enabled  </td>
                                                                </tr>   
                                                                <tr>
                                                                    <td>Working Mode:</td>
                                                                    <td colspan="2">802.11a/n/ac    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Channel check:</td>
                                                                    <td colspan="2">20 MHz   </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Frequency bandwidth mode:  </td>
                                                                    <td colspan="2">20 MHz </td>
                                                                </tr>   
                                                                <tr>
                                                                    <td>Current working frequency bandwidth:</td>
                                                                    <td colspan="2">20 MHz </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Whitelist/Blacklist filtering:</td>
                                                                    <td colspan="2">Off  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>MAC address check:  </td>
                                                                    <td colspan="2">OK  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Difference of antenna signal strength:  </td>
                                                                    <td colspan="2">RSSI difference between antennas is smaller than or equal to 10.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Interference:  </td>
                                                                    <td colspan="2">  520  </td>
                                                                </tr>      
                                                                <tr>
                                                                    <td>Calibration parameter:  </td>
                                                                    <td colspan="2">  Normal   </td>
                                                                </tr> 
                                                                <tr>
                                                                    <th colspan="3">SSID1Information</th>
                                                                </tr>   
                                                               <tr> 
                                                                    <td> SSID Name:  </td>    
                                                                    <td colspan="2">ElSID2G    </td>
                                                                </tr> 
                                                                <tr> 
                                                                  <td>Enable SSID:</td>
                                                                  <td colspan="2"> Enabled </td>
                                                                </tr>   
                                                                <tr> 
                                                                    <td>SSID broadcast:  </td>
                                                                    <td colspan="2">Enabled  </td>   
                                                                <tr>
                                                                <tr> 
                                                                    <td>WMM Status: </td>
                                                                    <td colspan="2">     Enabled  </td> 
                                                                </tr>  
                                                                <tr> 
                                                                    <td>Encryption Mode:</td>
                                                                    <td colspan="2">TKIP&AES</td> 
                                                                </tr>   
                                                                <tr> 
                                                                    <td>Maximum number of connected wireless STAs:</td>
                                                                    <td colspan="2"> 32</td>    
                                                                </tr>
                                                                <tr>
                                                                    <td>Number of connected wireless STAs:</td>  
                                                                    <td colspan="2"> 0 </td>
                                                                </tr> 
                                                                <tr ><th colspan="3">STA Information</th></tr>
                                                                <tr>                                                          <td> 2.4G Number of connected wireless STAs:</td>
                                                                    <td>0</td>
                                                                </tr> 
                                                                <tr>
                                                                    <td>2.4G Number of wireless STAs having weak signals:</td>
                                                                    <td>0</td>
                                                                </tr>                          
                                                           <tr>
                                                               <th colspan="3">Number of interference</th>
                                                             
                                                           </tr>
                                                           <tr>
                                                               <td>Number of interference sources:</td>
                                                               <td colspan="2">6</td>
                                                           </tr>
                                                           <tr> 
                                                            <td>Number of strong interference sources: </td>
                                                            <td colspan="2">  0
                                                           </td></tr>
                                                        </tbody>
                                                        <tbody id="div7">
                                                            <tr>
                                                                    <td>5G WLAN Status:</td>
                                                                    <td colspan="2">Enabled</td>
                                                                </tr>   
                                                                <tr>
                                                                    <td>Working Mode:</td>
                                                                    <td colspan="2">802.11a/n/ac </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Channel check:</td>
                                                                    <td colspan="2">36(Auto)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Frequency bandwidth mode:  </td>
                                                                    <td colspan="2">Auto 20/40/80 MHz   </td>
                                                                </tr>   
                                                                <tr>
                                                                    <td>Current working frequency bandwidth:</td>
                                                                    <td colspan="2">80 MHz  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Whitelist/Blacklist filtering:</td>
                                                                    <td colspan="2">Off   </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>MAC address check:  </td>
                                                                    <td colspan="2">OK  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Difference of antenna signal strength:  </td>
                                                                    <td colspan="2">RSSI difference between antennas is smaller than or equal to 10.  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Interference:  </td>
                                                                    <td colspan="2">  95   </td>
                                                                </tr>      
                                                                <tr>
                                                                    <td>Calibration parameter:  </td>
                                                                    <td colspan="2">  Normal   </td>
                                                                </tr> 
                                                                <tr>
                                                                    <th colspan="3">SSID1Information</th>
                                                                </tr>   
                                                               <tr> 
                                                                    <td> SSID Name:  </td>    
                                                                    <td colspan="2">El_5G     </td>
                                                                </tr> 
                                                                <tr> 
                                                                  <td>Enable SSID:</td>
                                                                  <td colspan="2"> Enabled  </td>
                                                                </tr>   
                                                                <tr> 
                                                                    <td>SSID broadcast:  </td>
                                                                    <td colspan="2">Enabled  </td>   
                                                                <tr>
                                                                <tr> 
                                                                    <td>WMM Status: </td>
                                                                    <td colspan="2">     Enabled  </td> 
                                                                </tr>  
                                                                <tr> 
                                                                    <td>Encryption Mode:</td>
                                                                    <td colspan="2">TKIP&AES</td> 
                                                                </tr>   
                                                                <tr> 
                                                                    <td>Maximum number of connected wireless STAs:</td>
                                                                    <td colspan="2"> 32</td>    
                                                                </tr>
                                                                <tr>
                                                                    <td>Number of connected wireless STAs:</td>  
                                                                    <td colspan="2"> 0 </td>
                                                                </tr> 
                                                                <tr ><th colspan="3">STA Information</th></tr>
                                                                <tr>                                                          <td> 2.4G Number of connected wireless STAs:</td>
                                                                    <td>0</td>
                                                                </tr> 
                                                                <tr>
                                                                    <td>2.4G Number of wireless STAs having weak signals:</td>
                                                                    <td>0</td>
                                                                </tr>                          
                                                           <tr>
                                                               <th colspan="3">Number of interference</th>
                                                             
                                                           </tr>
                                                           <tr>
                                                               <td>Number of interference sources:</td>
                                                               <td colspan="2">5</td>
                                                           </tr>
                                                           <tr> 
                                                            <td>Number of strong interference sources: </td>
                                                            <td colspan="2">  0
                                                           </td></tr>
                                                        </tbody>
                                                    </table>
                                                    </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                                </div>          
                                                </div>
                                            </div>
                     </div>

                <div class="col-xl-12 col-md-12 mb-4">                        
                                    <div class="card ">
                                    <div class="card-header">
                                            <span>
                                                <img src="../img/touch-2.png" style="width:45px;padding-bottom:5px;">
                                            </span>
                                           <span> <b style="font-size:18px;"><span style="vertical-align:middle;">CWMP Status </b></span></span>
                                           <hr>
                                            <p>
                                                On this page, you can query the TR069 Information
                                            </p>
                                        </div>
                                        
                            
                                    <div class="card-body">
                                        <table class="table table-bordered table-striped">
                                            <tr>
                                              <!--  <th>Interaction Build</th> -->
                                               <th colspan="2" class="text-center modal-title"><span>
                                                   <img src="../img/touch.png" style="width: 30px">
                                               </span>Interaction Build</th>
                                               <th rowspan="2" class="text-center pt-5 modal-title"><span>
                                                   <img src="../img/setting.png" style="width: 30px">
                                               </span>Business Configuration Dispensed Status:</th>
                                              <!--  <th>Business Configuration Dispensed Status:</th> -->

                                                
                                            </tr>
                                            <tr>
                                                <th class="table-headcol text-center modal-title">Proactive reporting Inform Status</th>
                                                <th class="table-headcol text-center modal-title">Accepting ITMS connection request Status</th>
                                               
                                                
                                           
                                            </tr>
                                            <tr>
                                                <td>Unreported (No remote management WAN connection)</td>
                                                <td>No received remote connection request</td>
                                                <td>No received remote business configuration</td>
                                            </tr>
                                        </table>
                                       
                                    </div>
                                    
                                    </div>
                                </div>

            </div>               

                    

                    
                   

                </div>             

            </div>         

<div class="text-center p-3"  style="background-color: rgb(235 234 234 / 20%);">
    &COPY; 2023 Copyright :
    <a class="text-white" style="color:#fd7e14 !important;" href="#">Syrotech Networks Pvt. Ltd.</a>
  </div>
</div>		
		<script type="text/javascript" src="/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/jquery.min.js"></script>
<script type="text/javascript" src="/JS/jquery_mCustomScrollbar_concat.js"></script>
<script type="text/javascript" src="/JS/jquery_mousewheel.js"></script>
<script type="text/javascript" src="/JS/popper.min.js"></script>
<script type="text/javascript" src="/JS/scoop.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/JS/left_menu.js"></script>
<script type="text/javascript" src="/JS/menu.js"></script>

<script type="text/javascript">    
        function myFunction() 
        {
        var result = confirm("This operation will interrupt the current call. Are you sure you want to continue?");
        }
    </script>
<script type="text/javascript">
  function showDiv1() {
  document.getElementById("div1").classList.add("active");
  document.getElementById("div1").classList.remove("hidden");
  document.getElementById("div2").classList.remove("active");
  document.getElementById("div2").classList.add("hidden");
}

function showDiv2() {
  document.getElementById("div2").classList.add("active");
  document.getElementById("div2").classList.remove("hidden");
  document.getElementById("div1").classList.remove("active");
  document.getElementById("div1").classList.add("hidden");
}

function showDiv3() {
  document.getElementById("div3").classList.add("active");
  document.getElementById("div3").classList.remove("hidden");
  document.getElementById("div1").classList.remove("active");
  document.getElementById("div1").classList.add("hidden");
}
function showDiv4(){
    document.getElementById("div4").classList.add("active");
  document.getElementById("div4").classList.remove("hidden");
  document.getElementById("div2").classList.remove("active");
  document.getElementById("div2").classList.add("hidden");
}

</script>
<script type="text/javascript">
  function showDiv6() {
  document.getElementById("div6").classList.add("active");
  document.getElementById("div6").classList.remove("hidden");
  document.getElementById("div7").classList.remove("active");
  document.getElementById("div7").classList.add("hidden");
}

function showDiv7() {
  document.getElementById("div7").classList.add("active");
  document.getElementById("div7").classList.remove("hidden");
  document.getElementById("div6").classList.remove("active");
  document.getElementById("div6").classList.add("hidden");
}

</script>
	

</body>
</HTML>
