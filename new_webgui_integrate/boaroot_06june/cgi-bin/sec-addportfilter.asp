





<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="0" type="image/x-icon">
    <link rel="stylesheet" href="/Dashboard/Modules/fontawesome/css/font-awesome.min.css">
    <title>Add Port Filter</title>
    <link href="/css/scoop-vertical.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/simple-line-icons.css" rel="stylesheet">
    <link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
    <script language="javascript" src="/JS/menu.js"></script>
<script language="javascript" src="/JS/myscript.js"></script>


<script language="javascript" src="/JS/util.js"></script>
<style>
.btn-orang {
    background-color: #f58220;
    color: white;
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
height:400px;
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


.input-group-text {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding: 0.375rem 0.75rem;
    margin-bottom: 0;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    text-align: center;
    white-space: nowrap;
    background-color: #f58220;
    border: 1px solid #f58220;
    border-radius: 0.25rem;
} 
.breadcrum_box {
    padding: 8px 12px;
    background: #fdfdfd;
    box-shadow: 0px 0px 6px rgba(0,0,0,0.1);
    position: relative;
}

.breadcrum_box ul li {
    display: inline-block;
     padding: 0px 15px;
    color: #a4a6a9; 
    font-size: 13px; 
}  

.help_icon {
    position: absolute;
    right: 14px;
    top: 7px;
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


.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li.active > a {
    background: rgba(243,243,243,1.00);
    color: #0c0c0c;
    font-weight: 500;
}
.scoop .scoop-navbar[navbar-theme="theme4"] .scoop-item > li > a {
color: #0c0c0c;
    font-weight: 500;

}
.lighter_grey_bg {
    background: #eeeeee;
    padding: 20px 30px;
    margin-right: -30px;
    margin-left: -30px;
    margin-bottom: 20px;
}
.heading_grey {
    font-weight: 300;
    color: #fd7e14;
    font-size: 30px;
    padding: 0px 12px;
    margin: 0px;
    .white_box {
    background: #fff;
    border-radius: 4px;
    box-shadow: 0px 0px 6px rgba(0,0,0,0.1);
    padding: 15px;
    margin-bottom: 20px;
    }
    .heading_margin {
    margin-bottom: 15px;
}
tbody{
font-size:13px;
}
</style>
<script language="JavaScript" type="text/JavaScript">
	
	</script>
	</SCRIPT>
    
</head>
<body onload="FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload="DoUnload()">
	<input name="Selected_Menu" type="hidden" id="Selected_Menu" value="Security->Port Filter">
    <div id="scoop" class="scoop iscollapsed" theme-layout="vertical" vertical-placement="left"
        vertical-layout="wide" scoop-device-type="desktop" vertical-nav-type="compact"
        vertical-effect="shrink" vnavigation-view="view1">
        <div class="scoop-overlay-box">
        </div>
        <div class="scoop-container">
            <div class="scoop-main-container">
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
					<div id="Header">
					    <SCRIPT language=javascript>
					    MakeHeader('Gateway Name:','Gateway Type:','Security','Port Filter','Welcome!','N/A');
					    </SCRIPT>
					</div>
					<div class="">
 
 
 
						  <div class="scoop-inner-content">
 
 
											    <h1 class="heading_big bei pb-3">Port Filter</h1>
													<form name="ConfigForm" id="ConfigForm" action="/cgi-bin/sec-addportfilter.asp" method="post">
													<div class="white_box">
														   <h1 class="heading_grey"><img src="../img/port.png" width="45" height="40" class="img_sub" alt=""/><span style="vertical-align:middle;"> IP Layer Filter</span></h1>
 
								 <div class="container-fluid">
								 <input type="hidden" id="PortFilterType" name="PortFilterType">
				   <input type="hidden" id="IpMacType_Flag" name="IpMacType_Flag" value="IpUp">
				   <input type="hidden" id="Save_Flag" name="Save_Flag" value="0">
				   <input type="hidden" id="curNum" name="curNum" value="40">
				   <input type="hidden" id="Direction_Flag" name="Direction_Flag" value="N/A">
				   <input type="hidden" id="EnableIP_Flag" name="EnableIP_Flag" value="Yes">
				   <input type="hidden" id="RuleType_Flag" name="RuleType_Flag" value="IP">
				   <input type="hidden" id="Current_Flag" name="Current_Flag" value="0">
				   <input type="hidden" id="WanInterfaceFlag" name="WanInterfaceFlag" value="br0">
				   <input type="hidden" id="IpType_Flag" name="IpType_Flag" value="IpUp">
				   <input type="hidden" id="Actionflag" name="Actionflag" value="Add">
				   <script language="JavaScript" type="text/javascript">
 var DomainName = document.ConfigForm.curNum.value;
 /*if (top.preAddDomain != '')
 {
 DomainName = top.preAddDomain;
 top.preAddDomain = '';
 }
 else
 {
 DomainName = 'InternetGatewayDevice.X_ATP_Security.IpFilterOut';
 }*/
 var portFilterInIndex = 0;
 var portFilterOutIndex = 0;
 var portFilterIn = new Array()
 var portFilterOut = new Array()
 function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,CntStatus,IPv6Enabled)
 {
 this.domain = domain;
 this.Name = Name;
 this.Enable = Enable;
 this.NATEnabled = NATEnabled;
 this.ConnectionType = ConnectionType;
 this.CntStatus = CntStatus;
 this.IPv6Enabled = IPv6Enabled;
 }
 var WanIP  = new Array(new stWanInfo("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1","1_TR069_R_8_46","1","0","IP_Routed","PendingDisconnect","0"),null);
 var WanPPP = new Array(null);
 var WanInfo = new Array();
 var i;
 for (i = 0; i < WanIP.length-1; i++)
 {
 WanInfo[i] = WanIP[i];
 }
 for (j = 0; j < WanPPP.length-1; i++,j++)
 {
 WanInfo[i] =  WanPPP[j];
 }
 var FliterType;
 if (DomainName <= 79)
 {
	    FliterType = 'out';//up filter
 }
 else
 {
	    FliterType = 'in';//down filter
 }
 function LoadFrame()
 {
	    var typeFLAG = GetQueryString('typeFlag');
	    document.ConfigForm.Save_Flag.value = "0";
	    if (FliterType== "out")
	    {
			  document.ConfigForm.Current_Flag.value = "out";
			  setDisplay('interface',0);
			  ChangeInface();
	    }
	    else if (FliterType== "in")
	    {
			  document.ConfigForm.Current_Flag.value = "in";
			  setDisplay('interface',1);
			  ChangeInface();
	    }
	    if ( typeFLAG )
			  document.ConfigForm.IpMacType_Flag.value = typeFLAG;
 }
 
 function checkForm()
 {
	    //var   IPNames = new Array(8);
	    var vnumber = 0;
	    /*IPNames[0] = "N/A";
	    IPNames[1] = "N/A";
	    IPNames[2] = "N/A";
	    IPNames[3] = "N/A";
	    IPNames[4] = "N/A";
	    IPNames[5] = "N/A";
	    IPNames[6] = "N/A";
	    IPNames[7] = "N/A";*/
 
	    if(document.ConfigForm.Current_Flag.value == "out")
	    {
			  /*
			  if(parseInt(vnumber)>=40)
			  {
					alert("The filter rule number reaches the upper limit!");
					return false;
			  }
 
			  if (document.ConfigForm.Name.value == IPNames[0] || document.ConfigForm.Name.value == IPNames[1] || document.ConfigForm.Name.value == IPNames[2] || document.ConfigForm.Name.value == IPNames[3] )
			  {
					 alert("The filter name cannot be repeated!");
					 return false;
			  }*/
 
			  if (document.ConfigForm.Protocol.value == "" && document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value == "" && document.ConfigForm.SourcePortStart.value == "" &&
					document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIpMask.value == "" && document.ConfigForm.DestPortStart.value == "")
			  {
					 alert("The filter rule should be configured at least one parameter!");
					 return false;
			  }
	    }
 
	    if(document.ConfigForm.Current_Flag.value == "in")
	    {
			  /*
			  if(parseInt(vnumber)>=40)
			  {
					alert("The filter rule number reaches the upper limit!");
					return false;
			  }
 
			  if (document.ConfigForm.Name.value == IPNames[4] || document.ConfigForm.Name.value == IPNames[5] || document.ConfigForm.Name.value == IPNames[6] || document.ConfigForm.Name.value == IPNames[7] )
			  {
					 alert("The filter name cannot be repeated!");
					 return false;
			  }*/
 
			  if (document.ConfigForm.Protocol.value == "" && document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value == "" && document.ConfigForm.SourcePortStart.value == "" &&
					document.ConfigForm.DestPortStart.value == "")
			  {
					 alert("The filter rule must be configured at least for other parameters besides the destination address!");
					 return false;
			  }
 
			  if (document.ConfigForm.WanPath.value.length == 0)
			  {
					alert('No available WAN connection currently!');
					return false;
			  }
	    }
 
	    if (document.ConfigForm.Name.value == '' || document.ConfigForm.Name.value.length > 31  )
	    {
			  alert("The filter name is incorrect");
			  return false;
	    }
	    if (isValidName(document.ConfigForm.Name.value) == false)
	    {
			  alert("The filter name is incorrect");
			  return false;
	    }
 
	    if (document.ConfigForm.SourceIPStart.value != ""  && document.ConfigForm.SourceIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.SourceIPStart.value) == false))
	    {
			  if (isGlobalIpv6Address(document.ConfigForm.SourceIPStart.value) == false)
			  {
					alert('Source start address "' + document.ConfigForm.SourceIPStart.value + '" incorrect');
					return false;
			  }
	    }
 
	    if (document.ConfigForm.SourceIpMask.value != "" && document.ConfigForm.SourceIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.SourceIpMask.value) == false))
	    {
					alert('Source subnet mask"' + document.ConfigForm.SourceIpMask.value + '" incorrect');
					return false;
	    }
 
	    if (document.ConfigForm.DestIPStart.value != ""  && document.ConfigForm.DestIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.DestIPStart.value) == false))
	    {
			  if (isGlobalIpv6Address(document.ConfigForm.DestIPStart.value) == false)
			  {
					alert('Destination start address "' + document.ConfigForm.DestIPStart.value + '" incorrect');
					return false;
			  }
	    }
 
	    if (document.ConfigForm.DestIpMask.value != "" && document.ConfigForm.DestIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.DestIpMask.value) == false))
	    {
			  alert('Destination subnet mask"' + document.ConfigForm.DestIpMask.value + '" incorrect');
			  return false;
	    }
 
	    if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value != "" )
	    {
			  msg = 'Source address must be configured,When the source subnet mask is not empty';
			  alert(msg);
			  return false;
	    }
 
	    if (document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIpMask.value != "" )
	    {
			  msg = 'Destination address must be configured,When the destination subnet mask is not empty';
			  alert(msg);
			  return false;
	    }
 
	    if (document.ConfigForm.SourcePortStart.value != "" || document.ConfigForm.DestPortStart.value != "")
	    {
					if (document.ConfigForm.Protocol.selectedIndex == 0 || document.ConfigForm.Protocol.selectedIndex == 4)
					{
						   msg = 'Only TCP or UDP can set the port';
						   alert(msg);
						   return false;
					}
	    }
 
	    if (document.ConfigForm.SourcePortStart.value != "" && document.ConfigForm.SourcePortStart.value != "0" && isValidPort(document.ConfigForm.SourcePortStart.value) == false )
	    {
			  msg = 'Source Port "' + document.ConfigForm.SourcePortStart.value + '" incorrect';
			  alert(msg);
			  return false;
	    }
 
	    if (document.ConfigForm.DestPortStart.value != "" && document.ConfigForm.DestPortStart.value != "0" && isValidPort(document.ConfigForm.DestPortStart.value) == false )
	    {
			  msg = 'Destination Port "' + document.ConfigForm.DestPortStart.value + '" incorrect';
			  alert(msg);
			  return false;
	    }
 
	    if(document.ConfigForm.Current_Flag.value == "in")
	    {
			  for(var i=0;i<portFilterInIndex;i++)
			  {
					/*
					if (document.ConfigForm.Name.value == portFilterIn[i].IPName)
					{
						   alert("The same filter name already exists!");
						   return false;
					}*/
					if (document.ConfigForm.Protocol.value == portFilterIn[i].Protocol &&
					document.ConfigForm.SourceIPStart.value == portFilterIn[i].SrcIPAddr &&
					document.ConfigForm.SourceIpMask.value == portFilterIn[i].SrcIPMask &&
					document.ConfigForm.SourcePortStart.value == portFilterIn[i].SrcPort &&
					document.ConfigForm.DestIPStart.value == portFilterIn[i].DesIPAddr &&
					document.ConfigForm.DestIpMask.value == portFilterIn[i].DesIPMask &&
					document.ConfigForm.DestPortStart.value == portFilterIn[i].DesPort &&
					document.ConfigForm.WanPath.value == portFilterIn[i].Interface)
					{
						   alert("The same filter rule already exists!");
						   return false;
					}
			  }
	    }
	    else    //out
	    {
			  for(var i=0;i<portFilterOutIndex;i++)
			  {
					/*
					if (document.ConfigForm.Name.value == portFilterOut[i].IPName)
					{
						   alert("The same filter name already exists!");
						   return false;
					}*/
					if (document.ConfigForm.Protocol.value == portFilterOut[i].Protocol &&
					document.ConfigForm.SourceIPStart.value == portFilterOut[i].SrcIPAddr &&
					document.ConfigForm.SourceIpMask.value == portFilterOut[i].SrcIPMask &&
					document.ConfigForm.SourcePortStart.value == portFilterOut[i].SrcPort &&
					document.ConfigForm.DestIPStart.value == portFilterOut[i].DesIPAddr &&
					document.ConfigForm.DestIpMask.value == portFilterOut[i].DesIPMask &&
					document.ConfigForm.DestPortStart.value == portFilterOut[i].DesPort)
					{
						   alert("The same filter rule already exists!");
						   return false;
					}
			  }
	    }
 
	    return true;
 }
 
 function btnSaveIP()
 {
	    var Form = document.ConfigForm;
	    if (checkForm() != false)
	    {
			  if(Form.Current_Flag.value == "in")
			  {
			  Form.curNum.value = "140";
			  Form.IpType_Flag.value = "IpDown";
			  Form.Direction_Flag.value = "Incoming";
			  Form.WanInterfaceFlag.value =  Form.WanPath.value;
			  }
			  else
			  {
			  Form.curNum.value = "100";
			  Form.Direction_Flag.value = "Outgoing";
			  Form.IpType_Flag.value = "IpUp";
			  //Form.WanInterfaceFlag.value =  Form.WanPath.value;
			  }
			  Form.Save_Flag.value = "1";
			  if( true == setEBooValueCookie(Form) )
					Form.submit();
	    }
 }
 function Cancel()
 {
	    location.replace('/cgi-bin/sec-portfilter.asp');
 }
 </script>
				   <script language="JavaScript" type="text/JavaScript">
 var nEntryNum = 1;
 var vArrayStr = "1_INTERNET_R_VID_46,";
 var vEntryName = vArrayStr.split(',');
 vArrayStr = "nas0_0,";
 var vEntryValue = vArrayStr.split(',');
 vArrayStr = "0,";
 vArrayStr = "Yes,";
 vArrayStr = "Enable,";
 var WANEnNAT = vArrayStr.split(',');
 
			  vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
 
			  vEntryValue = SortUtil.SortMyArray( vEntryValue );
			  WANEnNAT = SortUtil.SortMyArray( WANEnNAT );
 
 function ChangeInface()
 {
	    var index = getElById('WanPath').selectedIndex;
	    if (index > -1)
	    {
			  for (i = 0; i < WANEnNAT.length-1; i++)
			  {
					if (vEntryValue[i] == getSelectVal('WanPath'))
					{
						   break;
					}
			  }
			  if (WANEnNAT[i] == "Disabled")
			  {
					getElById('NatState').innerHTML = 'Disable';
			  }
			  else
			  {
					getElById('NatState').innerHTML = 'Enable';
			  }
	    }
 }
 </script>
														   <div class="row">
																 <div class="col-md-3 form-group">
																		<label>Filter Name:</label>
									<input class="form-control"  type='text' size="18" id="Name" name="Name" maxLength=31>
																	    </div>
 
																  <div class="col-md-3 form-group" style="display:none">
																	    <div class="custom-control custom-checkbox">
									<input type='checkbox' id="Enable" name="Enable"  class="custom-control-input" checked="checked">
																		 <label class="custom-control-label" for="Enable">Enable:</label>
																	    </div>
																 </div>
 
 
										  <div class="col-md-3 form-group">
																		<label>Protocol:</label>
								  <select id='Protocol' name='Protocol' size="1" class="custom-select">
					    <option value="">
					    <option value="TCP/UDP">TCP/UDP
					    <option value="TCP">TCP
					    <option value="UDP">UDP
					    <option value="ICMP">ICMP </select>
																	    </div>
 
								 <div class="col-md-3 form-group">
																		<label>Source IP Address:</label>
									<input  class="form-control" type='text' size="20" id="SourceIPStart" name="SourceIPStart" maxLength=15>
																	    </div>
 
								 <div class="col-md-3 form-group" >
																		<label>Source Subnet Mask:</label>
								 <input  class="form-control" type='text' size="20" id="SourceIpMask" name="SourceIpMask" maxLength=15>
																	    </div>
 
								  
 
								    <div class="col-md-3 form-group">
																		<label>Source Port:</label>
								    <input  class="form-control" type='text' size="20" id="SourcePortStart" name="SourcePortStart" maxLength=11>
																	    </div>
 
								  
 
								  <div class="col-md-3 form-group">
																		<label>Destination IP Address:</label>
							    <input class="form-control" type='text' size="20" id="DestIPStart" name="DestIPStart" maxLength=15>
																	    </div>
 
 
								  <div class="col-md-3 form-group" >
																		<label>Destination Subnet Mask:</label>
							    <input  class="form-control" type='text' size="20" id="DestIpMask" name="DestIpMask" maxLength=15>
																	    </div>
								   
 
								  <div class="col-md-3 form-group">
																		<label>Destination Port:</label>
							   <input  class="form-control" type='text' size="20" id="DestPortStart" name="DestPortStart" maxLength=11>
																	    </div>
 
								  
 
								  <div class="row col-md-12" id='interface' style="display:none;">
 
									   <div class="col-md-3 form-group">
																		<label>Interface:</label>
							 <select id="WanPath" name="WanPath" size="1" onChange="ChangeInface()" class="custom-select">
						 <script language="JavaScript" type="text/javascript">
											  for (i = 0; i < nEntryNum; i++)
											  {
													document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
											  }
 
											  </script>
					    </select>
																	    </div>
 
									  <div class="col-md-3 form-group">
																		<label>NAT Status:</label>
						    <p id="NatState">&nbsp;</p>
																	    </div>
 
									    </div>
												  </div>
																 <hr class="margin_adjs" />
																 <div class="form-footer text-right">
								 <input type="hidden" id="SaveFlag" name="SaveFlag" value="0">
																 <button class="btn btn-orang btn-lg" type="button"  id="btnOK" onClick="btnSaveIP()">SAVE</button>
																 <button class="btn btn-secondary btn-lg" type="button" id="btnCancel" onClick="Cancel()">CANCEL</button>
																 </div>
 
						   </div>
						   </div>
						   </FORM>
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
		   
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script type="text/javascript" src="/JS/jquery.min.js"></script>
<script type="text/javascript" src="/JS/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="/Dashboard/Modules/leftmenu/js/Loader.js"></script>-->
<script type="text/javascript"  src="/JS/popper.min.js"></script>
<script  type="text/javascript" src="/JS/scoop.js"></script>
<script  type="text/javascript" src="/JS/left_menu.js"></script>
<script  type="text/javascript" src="/JS/jquery_mCustomScrollbar_concat.js"></script>
<script  type="text/javascript" src="/JS/jquery_mousewheel.js"></script>   
   
</body>
</html>