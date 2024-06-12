<%
if Request_Form("IPV4_Flag") = "1" then
	if tcwebApi_get("Lan_Entry","IP","h") <> Request_Form("ethIpAddress") then
		TCWebApi_constSet("Account_Entry0","Logged","0")
		TCWebApi_constSet("Account_Entry0","Logoff","1")
		TCWebApi_constSet("Account_Entry1","Logged","0")
		TCWebApi_constSet("Account_Entry1","Logoff","1")
		TCWebApi_constSet("Account_Entry2","Logged","0")
		TCWebApi_constSet("Account_Entry2","Logoff","1")
		TCWebApi_set("Lan_Entry","IP","ethIpAddress")
	end if
	TCWebApi_set("Lan_Entry","netmask","ethSubnetMask")
	TCWebApi_set("Lan_Dhcp","type","dhcpSrvType")
	
	TCWebApi_commit("Lan")
	
	if Request_Form("dhcpSrvType") = "0" then
		TCWebApi_unset("DhcpRelay_Entry")
        TCWebApi_commit("Dhcpd_Common")
	end if
	
	if Request_Form("dhcpSrvType") = "1" then
		TCWebApi_set("Dhcpd_Common","lease","dhcpLeasedTimeFrag")
		TCWebApi_set("Dhcpd_Common","start","dhcpEthStart")
		TCWebApi_set("Dhcpd_Common","pool_count","EthendIPcount")
		TCWebApi_set("Dhcpd_Option60","DeviceStyle","IpPoolIndex")
		TCWebApi_set("Dhcpd_Option60","lease","dhcpLeasedTimeFrag")
		if Request_Form("RouteIPChangeFlag") = "1" then
			TCWebApi_set("Dhcpd_Option60","startSTB","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countSTB","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startPhone","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countPhone","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startCamera","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countCamera","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startHGW","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countHGW","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","start","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_count","EthendIPcount")
	  end if
		if Request_Form("IpPoolIndex") = "STB" then
			TCWebApi_set("Dhcpd_Option60","startSTB","dhcpEthStartFrag")
			TCWebApi_set("Dhcpd_Option60","pool_countSTB","DeviceendIPcount")
		elseif Request_Form("IpPoolIndex") = "Phone" then
			TCWebApi_set("Dhcpd_Option60","startPhone","dhcpEthStartFrag")
			TCWebApi_set("Dhcpd_Option60","pool_countPhone","DeviceendIPcount")
		elseif Request_Form("IpPoolIndex") = "Camera" then
			TCWebApi_set("Dhcpd_Option60","startCamera","dhcpEthStartFrag")
			TCWebApi_set("Dhcpd_Option60","pool_countCamera","DeviceendIPcount")
		elseif Request_Form("IpPoolIndex") = "HGW" then
			TCWebApi_set("Dhcpd_Option60","startHGW","dhcpEthStartFrag")
			TCWebApi_set("Dhcpd_Option60","pool_countHGW","DeviceendIPcount")
		else
			TCWebApi_set("Dhcpd_Option60","start","dhcpEthStartFrag")
			TCWebApi_set("Dhcpd_Option60","pool_count","DeviceendIPcount")
		end if
		
		TCWebApi_unset("DhcpRelay_Entry")
		TCWebApi_commit("Dhcpd_Common")
		TCWebApi_commit("Dhcpd_Option60")
	end if
	
	if Request_Form("dhcpSrvType") = "2" then
		TCWebApi_set("DhcpRelay_Entry","Server","dhcpRelayServerIP")
		TCWebApi_commit("DhcpRelay_Entry")
        TCWebApi_commit("Dhcpd_Common")
	end if

	TCWebApi_save()
end if

if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <>"Yes" then
if Request_Form("RA_Flag") = "1" then
	TCWebApi_set("Radvd_Entry","Enable","RAEnable_Flag")
	TCWebApi_set("Radvd_Entry","Mode","RAMode")
	if Request_Form("RAMode") = "1" then
		TCWebApi_set("Radvd_Entry","PrefixIPv6","radvdPrefix")
		TCWebApi_set("Radvd_Entry","Prefixv6Len","RAPrefixLen")
		TCWebApi_set("Radvd_Entry","PreferredLifetime","PreferredLifetime")
		TCWebApi_set("Radvd_Entry","ValidLifetime","ValidLifetime")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","MinRAInterval","RACycMin")
		TCWebApi_set("Radvd_Entry","MaxRAInterval","RACycMax")
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","1")
	else
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","0")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","DelegatedWanConnection","rapdsource")
	end if
	
	TCWebApi_commit("Radvd_Entry")
	TCWebApi_save()
end if

if Request_Form("Dhcp1_Flag") = "1" then
	TCWebApi_set("Dhcp6s_Entry","Enable","EnDHCPServerFlag")
	if Request_Form("EnDHCPServerFlag") = "1" then
		TCWebApi_set("Dhcp6s_Entry","Mode","DHCPSetTypeFlag")
		if Request_Form("DHCPSetTypeFlag") = "1" then
			TCWebApi_set("Dhcp6s_Entry","AddrFormat","AddrFormat")
			TCWebApi_set("Dhcp6s_Entry","PrefixIPv6","dhcpPrefix")
			TCWebApi_set("Dhcp6s_Entry","Prefixv6Len","PrefixLen")
			TCWebApi_set("Dhcp6s_Entry","PreferredLifetime","t1")
			TCWebApi_set("Dhcp6s_Entry","ValidLifetime","t2")
			TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne")
			TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo")
			TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
		else
			if Request_Form("dnssource") = "999" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","2")
			elseif Request_Form("dnssource") = "998" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
				TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne_Source")
				TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo_Source")
			else
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","0")
				TCWebApi_set("Dhcp6s_Entry","DNSWANConnection","dnssource")
			end if
		end if
	end if

	TCWebApi_commit("Dhcp6s_Entry")
	TCWebApi_save("Dhcp6s_Entry")
end if
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
	<TITLE><%tcWebApi_get("String_Entry","DHCPSettingText","s")%></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<link rel="stylesheet" href="/Dashboard/Modules/fontawesome/css/font-awesome.min.css">
<link rel="icon" href="0" type="image/x-icon">

<link href="/css/scoop-vertical.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/simple-line-icons.css" rel="stylesheet">
    <link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<style>
.white_box{
	height:160%;
	/* position:absolute !important; */
}
.white_box1{
	background: #fff;
    border-radius: 4px;
    box-shadow: 0px 0px 6px rgba(0,0,0,0.1);
    padding: 15px;
    height:145% !important;
    /* position:absolute !important; */

}
		.lighter_grey_bg {
			background: #eeeeee;
			padding: 20px 30px;
			margin-right: -30px;
			margin-left: -30px;
			margin-bottom: 20px;
		}
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
		.margin_adjs {
			margin-right: -30px;
			margin-left: -30px;
		}
		.sub_heading {
			color: #fd7e14;
			font-size: 25px;
			margin-bottom: 15px;
			font-weight: 500;
		}
		h2{
			font-weight: 500;
		color:#fd7e14;
		font-size:2rem;
		}
		td{
		font-size:13px;
		}
		</style>
		<SCRIPT language=JavaScript type=text/javascript>
			function	getendetherIPforCount(start, count)
			{
				var vret = "";
			  var S = start.split('.');
			  if(S.length > 3)
			  {
				  var temp = parseInt(count) + parseInt(S[3]) - 1;
				  vret = S[0] + '.' + S[1] + '.' + S[2] + '.' + temp.toString();
			  }
			  return vret;
			}
	  function dhcpcnst(domain,dhcpStart,dhcpEnd,LeaseTime,Enable,STBMinAddr,STBMaxAddr,STBRelay,PhoneMinAddr,PhoneMaxAddr,PhoneRelay,CameraMinAddr,CameraMaxAddr,CameraRelay,ComputerMinAddr,ComputerMaxAddr,ComputerRelay,HGWMinAddr,HGWMaxAddr,HGWRelay, PortRelayEnable, PortRelayStr)
	  {
	  this.domain = domain;
	  this.dhcpStart = dhcpStart;
	  this.dhcpEnd = dhcpEnd;
	  this.LeaseTime = LeaseTime;
	  this.Enable = Enable;
	  this.STBMinAddr = STBMinAddr;
	  this.STBMaxAddr = STBMaxAddr;
	  this.STBRelay = STBRelay;
	  this.PhoneMinAddr = PhoneMinAddr;
	  this.PhoneMaxAddr = PhoneMaxAddr ;
	  this.PhoneRelay = PhoneRelay;
	  this.CameraMinAddr = CameraMinAddr;
	  this.CameraMaxAddr  = CameraMaxAddr ;
	  this.CameraRelay = CameraRelay;
	  this.ComputerMinAddr = ComputerMinAddr;
	  this.ComputerMaxAddr = ComputerMaxAddr ;
	  this.ComputerRelay = ComputerRelay ;
	  this.HGWMinAddr = HGWMinAddr;
	  this.HGWMaxAddr = HGWMaxAddr;
	  this.HGWRelay = HGWRelay;
	  this.PortRelayEnable = PortRelayEnable;
	  this.PortRelayStr = PortRelayStr;
	  }
	  var dhcpst = new Array(new dhcpcnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement","<% tcWebApi_get("Dhcpd_Common","start","s") %>","<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>","86400","1","<% tcWebApi_get("Dhcpd_Option60","startSTB","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countSTB","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startPhone","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countPhone","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startCamera","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countCamera","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","start","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_count","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startHGW","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countHGW","s" ) %>","0","0",""),null);
	  poolIndex = top.lanDevIndex;
	  var proto = ''
	  var natEnbl = 1;
	  var dhcpEnbl = dhcpst[0].Enable;
	  var dhcpStart = "";
	  if(dhcpst[0].dhcpStart != "N/A")
		  dhcpStart = dhcpst[0].dhcpStart;
	  var dhcpEnd = getendetherIPforCount(dhcpStart,dhcpst[0].dhcpEnd);
	  var dhcpLease = dhcpst[0].LeaseTime;
	  var dhcpStart1_1 = dhcpst[0].STBMinAddr;
	  var dhcpEnd1_1 = getendetherIPforCount(dhcpStart1_1, dhcpst[0].STBMaxAddr);
	  var enblrelay_stb = dhcpst[0].STBRelay;
	  var dhcpStart1_2 = dhcpst[0].PhoneMinAddr;
	  var dhcpEnd1_2 = getendetherIPforCount(dhcpStart1_2, dhcpst[0].PhoneMaxAddr);
	  var enblrelay_phone = dhcpst[0].PhoneRelay;
	  var dhcpStart1_3 = dhcpst[0].CameraMinAddr
	  var dhcpEnd1_3 = getendetherIPforCount(dhcpStart1_3, dhcpst[0].CameraMaxAddr);
	  var enblrelay_camera = dhcpst[0].CameraRelay;
	  var dhcpStart1_4 = dhcpst[0].ComputerMinAddr;
	  var dhcpEnd1_4 = getendetherIPforCount(dhcpStart1_4, dhcpst[0].ComputerMaxAddr);
	  var enblrelay_computer = dhcpst[0].ComputerRelay;
	  var dhcpStart1_5 = dhcpst[0].HGWMinAddr;
	  var dhcpEnd1_5 = getendetherIPforCount(dhcpStart1_5, dhcpst[0].HGWMaxAddr);
	  var enblrelay_hgw = dhcpst[0].HGWRelay;
	  var dhcpPortRelayEnable = dhcpst[0].PortRelayEnable;
	  var host = [["InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","192.168.1.1","255.255.255.0"],null];
	  var oldAddrPrimary;
	  var oldMaskPrimary;
	  if (host.length > 1)
	  {
	  oldAddrPrimary = host[0][1];
	  oldMaskPrimary = host[0][2];
	  }
	  function dhcpv6cnst(domain,Enable,AllocateWan,Prefix,PrefixLength,Preferredlifetime,Validlifetime,DnsSrver)
	  {
	  this.domain            = domain;
	  this.Enable            = Enable;
	  this.allocateWan       = AllocateWan;
	  this.Prefix            = Prefix;
	  this.PrefixLength      = PrefixLength;
	  this.Preferredlifetime = Preferredlifetime;
	  this.Validlifetime     = Validlifetime;
	  var dns           = DnsSrver.split(',');
	  this.DnsSrvOne    = dns[0];
	  if ( dns.length > 1 )
	  {
	  this.DnsSrvTwo = dns[1];
	  }
	  else
	  {
	  this.DnsSrvTwo = '';
	  }
	  }
	  var dhcpv6st = new Array(new dhcpv6cnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_DHCPv6","1","UseAllocatedSubnet","","64","3600","7200",""),null);
	  if (dhcpv6st.length > 0)
	  {
	  var dhcpEnb6l = dhcpv6st[0].Enable;
	  var UseAllc  = dhcpv6st[0].allocateWan;
	  var DnsOne   = dhcpv6st[0].DnsSrvOne;
	  var DnsTwo   = dhcpv6st[0].DnsSrvTwo;
	  if (DnsOne == '')
	  {
	  DnsOne = "fe80::1";
	  }
	  var Prefix   = dhcpv6st[0].Prefix;
	  var Prelen   = dhcpv6st[0].PrefixLength;
	  var Domana   = "";
	  var Time1    = dhcpv6st[0].Preferredlifetime;
	  var Time2    = dhcpv6st[0].Validlifetime;
	  }
	  else
	  {
	  var dhcpEnb6l = "1";
	  var UseAllc  = "UseAllocatedSubnet";
	  var DnsOne   = "fe80::1";
	  var DnsTwo   = "";
	  var Prefix   = "";
	  var Prelen   = "64";
	  var Domana   = "";
	  var Time1    = "3600";
	  var Time2    = "7200";
	  }
	  function radvdcnst(domain,Enable,AllocateWan,AssConn,Prefix,PrefixLength,Preferredlifetime,Validlifetime)
	  {
	  this.domain            = domain;
	  this.allocateWan       = AllocateWan;
	  this.AssConn           = AssConn;
	  this.Prefix            = Prefix;
	  this.PrefixLength      = PrefixLength;
	  this.Enable            = Enable;
	  this.Preferredlifetime = Preferredlifetime;
	  this.Validlifetime     = Validlifetime;
	  }
	  var radvdst = new Array(new radvdcnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_SLAAC","1","Normal","1111:db8:1:0::","1111:db8:1:0::","64","3600","7200"),null);
	  if (radvdst.length > 1)
	  {
	  var radvdEnbl = radvdst[0].Enable;
	  var RAUseAllc  = radvdst[0].allocateWan;
	  var RAAssCon   = radvdst[0].AssConn;
	  var RAPrefix   = radvdst[0].Prefix;
	  var RAPrelen   = radvdst[0].PrefixLength;
	  var RATime1    = radvdst[0].Preferredlifetime;
	  var RATime2    = radvdst[0].Validlifetime;
	  }
	  else
	  {
	  var radvdEnbl = "1";
	  var RAUseAllc  = "UseAllocatedSubnet";
	  var RAAssCon   = "";
	  var RAPrefix   = "";
	  var RAPrelen   = "64";
	  var RATime1    = "3600";
	  var RATime2    = "7200";
	  }
	  var changeAddrFlag = false;
	  function disableDhcp6Srv()
	  {
	  with ( document.forms[2] )
	  {
	  setCheck("dhcp6SrvType" ,0);
	  setDisplay('AssConnection',0);
	  setDisplay('DHCP6SPrefixCfg',0);
	  setDisable('dhcpPrefix',1);
	  setDisable('PrefixLen' ,1);
	  setDisable('t1',1);
	  setDisable('t2',1);
	  setDisable('DnsSrvOne',1);
	  setDisable('DnsSrvTwo',1);
	  setDisable('DomainNameText'    ,1);
	  }
	  }
	  function enableDhcp6Srv(formLoad)
	  {
	  with ( document.forms[2] )
	  {
	  setCheck("dhcp6SrvType",1);
	  setDisplay('AssConnection',1);
	  if ( "Normal" == UseWan.value )
	  {
	  setDisplay('DHCP6SPrefixCfg', 1);
	  }
	  setDisable('dhcpPrefix',0);
	  setDisable('PrefixLen' ,0);
	  setDisable('t1',0);
	  setDisable('t2',0);
	  setDisable('DnsSrvOne',0);
	  setDisable('DnsSrvTwo',0);
	  setDisable('DomainNameText'    ,1);
	  }
	  }
	  
	  function EnablePrefixParameter()
	  {
	  with (document.forms[2])
	  {
	  if ( 0 != getCheckVal('dhcp6SrvType'))
	  {
	  setDisable('dhcpPrefix',0);
	  setDisable('NamePrefix',0);
	  setDisable('PrefixLen'    ,0);
	  setDisable('NamePrefixLen',0);
	  }
	  }
	  }
	  function DisablePrefixParameter()
	  {
	  with (document.forms[2])
	  {
	  if ( 0 != getCheckVal('dhcp6SrvType'))
	  {
	  setDisable('dhcpPrefix',1);
	  setDisable('NamePrefix',1);
	  setDisable('PrefixLen'    ,1);
	  setDisable('NamePrefixLen',1);
	  }
	  }
	  }
	  function EnableIPPoolParameter()
	  {
	  with (document.forms[2])
	  {
	  }
	  }
	  function DisableIPPoolParameter()
	  {
	  with (document.forms[2])
	  {
	  }
	  }
	  function IPPoolGenerateOperation()
	  {
	  with (document.forms[2])
	  {
	  if ( "UsePrefix" == UsePrefixOrIPPool.value )
	  {
	  DisableIPPoolParameter();
	  EnablePrefixParameter();
	  }
	  else if ( "UseIPPool" == UsePrefixOrIPPool.value )
	  {
	  DisablePrefixParameter();
	  EnableIPPoolParameter();
	  }
	  else
	  {
	  DisablePrefixParameter();
	  DisableIPPoolParameter();
	  }
	  }
	  }
	  function CheckPrefix(Prefix,type)
	  {
	  var IpAddress1 = Prefix.split(':');
	  var IpAddress3 = Prefix;
	  if ( 1 == type && '' == IpAddress3)
	  {
	  return true;
	  }
	  if ( true != isUnicastIpv6Address(IpAddress3) )
	  {
	  return false;
	  }
	  switch (type)
	  {
	  case 0 :
	  if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
	  {
	  switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
	  {
	  case 15 :
	  return false;
	  case 14 :
	  if ( 8 <= parseInt(IpAddress1[0].substring(2, 3),16) && 12 > parseInt(IpAddress1[0].substring(2, 3),16) )
	  {
	  return false;
	  }
	  break;
	  default:
	  break;
	  }
	  }
	  break;
	  case 1 :
	  if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
	  {
	  switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
	  {
	  case 15 :
	  return false;
	  default:
	  break;
	  }
	  }
	  break;
	  default:
	  return false;
	  }
	  return true;
	  }
	  function CheckLength(Length)
	  {
	  var TemLen = parseInt(Length);
	  if ( true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
	  {
	  return false;
	  }
	  return true;
	  }
	  function CheckHex(Hex)
	  {
	  var TemHex  = Hex;
	  var Loopj   = 0;
	  var Tempi   = 0;
	  var Tempj   = 1;
	  var section = 0;
	  var num     = 0;
	  for (Loopj = 0 ; Loopj < TemHex.length ; Loopj++)
	  {
	  section = TemHex.substring(Tempi, Tempj);
	  num = parseInt(section, 16);
	  if ( true == isNaN(num) )
	  {
	  return false;
	  }
	  Tempi++;
	  Tempj++;
	  }
	  return true;
	  }
	  function CheckTime(Time1,Time2)
	  {
	  var TemTime1 = Time1;
	  var TemTime2 = Time2;
	  if ( TemTime1.length > 10 || '' == TemTime1 )
	  {
	  return 1;
	  }
	  if ( TemTime2.length > 10 || '' == TemTime2 )
	  {
	  return 2;
	  }
	  if ( true != isPlusInteger(TemTime1))
	  {
	  return 1;
	  }
	  if ( true != isPlusInteger(TemTime2))
	  {
	  return 2;
	  }
	  TemTime1 = parseInt(Time1);
	  TemTime2 = parseInt(Time2);
	  if ( TemTime1 > 1073741825 || TemTime1 < 60 )
	  {
	  return 1;
	  }
	  if ( TemTime2 > 4294967295 || TemTime2 < 60 )
	  {
	  return 2;
	  }
	  if ( TemTime2 <= TemTime1 )
	  {
	  return 3;
	  }
	  return true;
	  }
	  function disableRASrv()
	  {
	  with (document.forms[1])
	  {
	  setCheck('radvdSrvType', 0);
	  setDisplay('RAAssConnection', 0);
	  setDisplay('RadvdPrefixCfg', 0);
	  }
	  }
	  function enableRASrv(formLoad)
	  {
	  with (document.forms[1])
	  {
	  setCheck('radvdSrvType', 1);
	  setDisplay('RAAssConnection', 1);
	  if ("Normal" == RAUseWan.value)
	  {
	  setDisplay('RadvdPrefixCfg', 1);
	  }
	  }
	  }
	  
	  function CheckRAPrefix(Prefix, type)
	  {
	  var IpAddress1 = Prefix.split(':');
	  var IpAddress3 = Prefix;
	  if (1 == type && '' == IpAddress3)
	  {
	  return true;
	  }
	  if (true != isGlobalIpv6Address(IpAddress3))
	  {
	  return false;
	  }
	  return true;
	  }
	  function CheckRATime(Time1,Time2)
	  {
	  var TemTime1 = Time1;
	  var TemTime2 = Time2;
	  if (TemTime1.length > 10 || '' == TemTime1)
	  {
	  return 1;
	  }
	  if (TemTime2.length > 10 || '' == TemTime2)
	  {
	  return 2;
	  }
	  if (true != isPlusInteger(TemTime1))
	  {
	  return 1;
	  }
	  if (true != isPlusInteger(TemTime2))
	  {
	  return 2;
	  }
	  TemTime1 = parseInt(Time1);
	  TemTime2 = parseInt(Time2);
	  if (TemTime1 > 4294967295 || TemTime1 < 600)
	  {
	  return 1;
	  }
	  if (TemTime2 > 4294967295 || TemTime2 < 600)
	  {
	  return 2;
	  }
	  if (TemTime2 <= TemTime1)
	  {
	  return 3;
	  }
	  return true;
	  }
	  function RAIntervalValue(vMin, vMax)
	  {
		  var MinInterval = vMin;
		  var MaxInterval = vMax;
		  if ('' == MinInterval)
		  {
			  return 1;
		  }
		  if ('' == MaxInterval)
		  {
			  return 2;
		  }
		  MinInterval = parseFloat(vMin);
		  MaxInterval = parseFloat(vMax);
		  
		  if ( MinInterval < 3 || MinInterval > 1350 )
			  return 1;
		  if ( MaxInterval > 1800 || MaxInterval < 4 )
			  return 2;
		  if ( MaxInterval < MinInterval )
			  return 3;
	  
		  if ( MinInterval > (MaxInterval*0.75) )
			  return 4;
	  
		  return true;
	  }
	  
	  function RACheckForm(type)
	  {
		  with (document.forms[1])
		  {
			  if (1 != getCheckVal('radvdSrvType') || "Normal" != RAUseWan.value)
			  {
				  if ( 1 == getCheckVal('radvdSrvType') )
				  {
						  RAManagedEn_Flag.value = ( 1 == getCheckVal('ramflag') ) ? '1' : '0';
						  RAOtherEn_Flag.value = ( 1 == getCheckVal('raoflag') ) ? '1' : '0';
				  }
	  
				  return true;
			  }
			  if (true != CheckRAPrefix(radvdPrefix.value,0))
			  {
				  alert("<%tcWebApi_get("String_Entry","RadvdPrefixText","s")%>\"" + radvdPrefix.value + "\"<%tcWebApi_get("String_Entry","LANJS6Text","s")%>");
				  return false;
			  }
			  if (true != CheckLength(RAPrefixLen.value))
			  {
				  alert("<%tcWebApi_get("String_Entry","LANJS7Text","s")%>\"" + RAPrefixLen.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				  return false;
			  }
			  switch (CheckRATime(PreferredLifetime.value,ValidLifetime.value))
			  {
			  case 1 :
			  {
				  alert("<%tcWebApi_get("String_Entry","TimeText","s")%>\"" + PreferredLifetime.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				  return false;
			  }
			  case 2 :
			  {
				  alert("<%tcWebApi_get("String_Entry","TimeText","s")%>\"" + ValidLifetime.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				  return false;
			  }
			  case 3 :
			  {
				  alert("<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%>" + ValidLifetime.value + "<%tcWebApi_get("String_Entry","LANJS10Text","s")%>" + PreferredLifetime.value);
				  return false;
			  }
			  default:
			  break;
			  }
			  switch (RAIntervalValue(RACycMin.value, RACycMax.value)){
				  case 1 :
				  {
					  alert("<%tcWebApi_get("String_Entry","LANJS11Text","s")%>\"" + RACycMin.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
					  return false;
				  }
				  case 2 :
				  {
					  alert("<%tcWebApi_get("String_Entry","LANJS12Text","s")%>\"" + RACycMax.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
					  return false;
				  }
				  case 3 :
				  {
					  alert("<%tcWebApi_get("String_Entry","LANJS12Text","s")%>" + RACycMax.value + "<%tcWebApi_get("String_Entry","LANJS13Text","s")%>" + RACycMin.value);
					  return false;
				  }
				  case 4 :
				  {
					  var temp = parseFloat(RACycMax.value) * 0.75;
					  alert("<%tcWebApi_get("String_Entry","LANJS11Text","s")%>" + RACycMin.value + "<%tcWebApi_get("String_Entry","LANJS14Text","s")%>" + temp.toString());
					  return false;
				  }
				  default:
					  break;
			  }
		  }
		  return true;
	  }
	  function AddRASubmitParam(Form)
	  {
	  with (document.forms[1])
	  {
	  /*Form.addParameter('y.RouterAdvertisementEnable', getCheckVal('radvdSrvType'));
	  if (1 == getCheckVal('radvdSrvType'))
	  {
	  Form.addParameter('y.UseAllocatedWAN', getValue('RAUseWan'));
	  Form.addParameter('y.AssociatedConnection', getValue('radvdPrefix'));
	  }
	  if (1 == getCheckVal('radvdSrvType') && "Normal" == RAUseWan.value)
	  {
	  Form.addParameter('y.Prefix', getValue('radvdPrefix'));
	  Form.addParameter('y.PrefixLength', getValue('RAPrefixLen'));
	  Form.addParameter('y.Preferredlifetime', getValue('PreferredLifetime'));
	  Form.addParameter('y.Validlifetime', getValue('ValidLifetime'));
	  }
	  var RequestFile = '/html/network/dhcp.asp';
	  var url = 'setcfg.cgi?'
	  + 'y=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_SLAAC'
	  + '&RequestFile=' + RequestFile;
	  Form.setAction(url);*/
	  }
	  }
	  function RASubmit()
	  {
	  if (RACheckForm() == true)
	  {
	  //var Form = new webSubmitForm();
	  //AddRASubmitParam(Form);
	  //Form.submit();
	  document.forms[1].RA_Flag.value = "1";
	  if( true == setEBooValueCookie(document.forms[1]) )
		  document.forms[1].submit();
	  
	  }
	  }
	  function disableDhcpSrv()
	  {
	  with (document.forms[0])
	  {
	  dhcpSrvType[1].checked = false;
	  dhcpEthStart.disabled = 1;
	  dhcpEthEnd.disabled = 1;
	  enableRelay.disabled = 1;
	  IpPoolIndex.disabled = 1;
	  dhcpEthStartFrag.disabled = 1;
	  dhcpEthEndFrag.disabled = 1;
	  dhcpLeasedTimeFrag.disabled = 1;
	  setDisplay("DhcprelayIP", 0);
	  setDisplay("dhcpstartaddr",0);
	  setDisplay("dhcpendaddr",0);
	  setDisplay("dhcplease",0);
	  }
	  }
	  function enableDhcpSrv(formLoad)
	  {
	  with (document.forms[0])
	  {
	  //dhcpSrvType[1].checked = true;
	  dhcpEthStart.disabled = 0;
	  dhcpEthEnd.disabled = 0;
	  /*if (formLoad == 0)
	  setDhcpAddresses(ethIpAddress.value);
	  else
	  {*/
	  dhcpEthStart.value = dhcpStart;
	  dhcpEthEnd.value = dhcpEnd;
	  //}
	  
	  setDisable('dhcpLeasedTimeFrag', 0);
	  setDisable('IpPoolIndex',0);
	  setDisable('dhcpEthStartFrag',0);
	  setDisable('dhcpEthEndFrag',0);
	  setDisable('enableRelay',0);
	  setDisplay("DhcprelayIP", 0);
	  setDisplay("dhcpstartaddr",1);
	  setDisplay("dhcpendaddr",1);
	  setDisplay("dhcplease",1);
	  }
	  }
	  function disableDhcpSrvRelay()
	  {
	  with (document.forms[0])
	  {
	  dhcpSrvAddr.disabled = 1;
	  }
	  }
	  function enableDhcpSrvRelay()
	  {
	  with ( document.forms[0] )
	  {
	  if (dhcpEthStart.value != "")
	  dhcpSrvAddr.value = dhcpEthStart.value;
	  else
	  dhcpSrvAddr.value = dhcpStart;
	  dhcpSrvAddr.disabled = 0;
	  }
	  }
	  function typeClick()
	  {
	  with (document.forms[0])
	  {
		  if ( natEnbl == '1' )
		  {
			  if ( dhcpSrvType[0].checked == true )
			  {
				  disableDhcpSrv();
			  }
			  else if( dhcpSrvType[1].checked == true )
			  {
				  enableDhcpSrv(0);
			  }
			  else
			  {
				  disableDhcpSrv();
				  setDisplay("DhcprelayIP",1);
				  getElById('dhcpRelayServerIP').focus();
			  }
		  }
		  else
		  {
			  if (dhcpSrvType[0].checked == true)
			  {
				  disableDhcpSrv();
				  disableDhcpSrvRelay();
			  }
			  else if (dhcpSrvType[1].checked == true)
			  {
				  enableDhcpSrv(0);
				  disableDhcpSrvRelay();
			  }
		  }
	  }
	  }
	  function LoadFrame()
	  {
		  with (document.forms[0])
		  {
			  dhcpSecPortRelay();
			  IPV4_Flag.value = "0";
			  typeClick();
			  IpPoolIndexChange();
			  oldAddrPrimary = ethIpAddress.value ;
			  oldMaskPrimary = ethSubnetMask.value;
		  }
		  with (document.forms[1])
		  {
			  RA_Flag.value = "0";
			  RAUseWanChange();
			  RATypeClick();
		  }
		  with (document.forms[2])
		  {
			  Dhcp1_Flag.value = "0";
			  typev6Click();
			  UseWanChange();
		  }
	  }
	  function isEndGTEStart(EndIp, StartIp)
	  {
	  addrEnd = EndIp.split('.');
	  addrStart = StartIp.split('.');
	  E = parseInt(addrEnd[3]) + 1;
	  S = parseInt(addrStart[3]) + 1;
	  if (E < S)
	  return false;
	  return true;
	  }
	  function ipIsInIP(subStartIp, subEndIp, StartIp, EndIp)
	  {
	  addrEnd = EndIp.split('.');
	  addrStart = StartIp.split('.');
	  subAddrEnd = subEndIp.split('.');
	  subAddrStart = subStartIp.split('.');
	  for (i = 0; i < 4; i++)
	  {
	  seg = parseInt(addrEnd[i]);
	  subSeg = parseInt(subAddrEnd[i]);
	  if (subSeg > seg)
	  return false;
	  seg = parseInt(addrStart[i]);
	  subSeg = parseInt(subAddrStart[i]);
	  if ((subSeg > 0) && (subSeg < seg))
	  return false;
	  }
	  return true;
	  }
	  function  ipConfilt( StartIp1 , EndIp1, StartIp2, EndIp2)
	  {
	  if (!( isValidIpAddress(StartIp1)
	  && isValidIpAddress(EndIp1)
	  &&isValidIpAddress(StartIp2)
	  &&isValidIpAddress(EndIp2)))
	  {
	  return false;
	  }
	  var StartIp1A = StartIp1.split('.');
	  var EndIp1A= EndIp1.split('.');
	  var StartIp2A = StartIp2.split('.');
	  var EndIp2A = EndIp2.split('.');
	  var StarIp1Value = parseInt(StartIp1A[3]);
	  var  EndIp1Value = parseInt(EndIp1A[3]);
	  var StarIp2Value = parseInt(StartIp2A[3]);
	  var EndIp2Value = parseInt(EndIp2A[3]);
	  if ((StarIp1Value >EndIp2Value)  || (EndIp1Value <StarIp2Value))
	  {
	  return false;
	  }
	  return true;
	  }
	  function IP2binary(ip)
	  {
		  var IPstr = [];
		  var IPaddr=ip.split('.');
		  for(var i =0;i<4;i++)
		  {
			  var IPnum = parseInt(IPaddr[i]).toString(2);
			  var count = 8 - IPnum.length;
			  for(var j = 0;j < count; j++)
			  {
				  IPnum = "0" + IPnum;
			  }
			  IPstr += IPnum;
		  }
		  return IPstr;
	  }
	  function binary2IP(binary)
	  {
		  if(binary.length == 32)
		  {
			  a = parseInt(binary.substr(0, 8), 2);
			  b = parseInt(binary.substr(8, 8), 2);
			  c = parseInt(binary.substr(16, 8), 2);
			  d = parseInt(binary.slice(-8), 2);
			  return a + '.' + b + '.' + c +'.' + d;
		  }
		  return false;
	  }
	  function get_network(ip)
	  {
		  var IpAddrPart=ethIpAddress.value.split('.');
		  var maskPart=ethSubnetMask.value.split('.');
		  var netNumber = [];
		  for(var i = 0,num=IpAddrPart.length;i<num;i++)
		  {
		  netNum=parseInt(IpAddrPart[i]) & parseInt(maskPart[i]);
		  netNumber.push(netNum);
		  }
		  netNumber = netNumber.join('.');
		  return netNumber;
	  }
	  function get_broadcast(ip,mask)
	  {
		  var broadcast = [];
		  var mask_binary = IP2binary(ethSubnetMask.value);
		  var IP_binary = IP2binary(ethIpAddress.value);
		  var mask_zero = mask_binary.split(0).length - 1;
		  var one_number = new Array(mask_zero + 1).join('1');
		  cast = IP_binary.slice(0,-mask_zero) + one_number;
		  broadcast.push(binary2IP(cast));
		  return broadcast;
	  }
	  function CheckForm(type)
	  {
	  with (document.forms[0])
	  {
	  var lanMask = ethSubnetMask.value;
	  maskParts = lanMask.split('.');
	  if (isValidSubnetMask(lanMask) == false || parseInt(maskParts[3]) >= 254)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS38Text","s")%> ');
	  return false;
	  }
	  if(ethIpAddress.value == get_network(ethIpAddress.value))
	  {
	  alert(ethIpAddress.value + '<%tcWebApi_get("String_Entry","LANJS36Text","s")%> ');
	  return false;
	  }
	  if(ethIpAddress.value == get_broadcast(ethIpAddress.value,ethSubnetMask.value))
	  {
	  alert(ethIpAddress.value + '<%tcWebApi_get("String_Entry","LANJS37Text","s")%> ');
	  return false;
	  }
	  if (isValidIpAddress(ethIpAddress.value) == false)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + ethIpAddress.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%> ');
	  return false;
	  }
	  if (isBroadcastIp(ethIpAddress.value, ethSubnetMask.value) == true)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + ethIpAddress.value + '"<%tcWebApi_get("String_Entry","LANJS1Text","s")%> ');
	  return false;
	  }
	  if (dhcpSrvType[1].checked == true)
	  {
	  if (dhcpEthStart.value == '0.0.0.0')
	  {
	  alert('<%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%> "' + dhcpEthStart.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if (dhcpEthEnd.value == '0.0.0.0')
	  {
	  alert('<%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if ((dhcpEthStart.value != '0.0.0.0')&&(dhcpEthEnd.value != '0.0.0.0'))
	  {
	  if (isValidIpAddress(dhcpEthStart.value) == false ||
	  !(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthStart.value, ethSubnetMask.value)))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%>"' + dhcpEthStart.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if (isBroadcastIp(dhcpEthStart.value, ethSubnetMask.value) == true)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS15Text","s")%>  "' + dhcpEthStart.value + '"<%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
	  return false;
	  }
	  if (isValidIpAddress(dhcpEthEnd.value) == false ||
	  !(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthEnd.value, ethSubnetMask.value)))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if (isBroadcastIp(dhcpEthEnd.value, ethSubnetMask.value) == true)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS16Text","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
	  return false;
	  }
	  if (!(isEndGTEStart(dhcpEthEnd.value, dhcpEthStart.value)))
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS17Text","s")%>");
	  return false;
	  }
	  if ( !isEndGTEStart(dhcpEthStartFrag.value,dhcpEthStart.value) || !isEndGTEStart(dhcpEthEnd.value,dhcpEthEndFrag.value) )
	  {
	  var devType = document.forms[0].IpPoolIndex.value;
	  alert(devType+"<%tcWebApi_get("String_Entry","LANJS18Text","s")%>");
	  return false;
	  }
	  if (dhcpEthStart.value == ethIpAddress.value)
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS19Text","s")%>");
	  return false;
	  }
	  if (dhcpEthEnd.value == ethIpAddress.value)
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS20Text","s")%>");
	  return false;
	  }
	  }
	  if ((dhcpEthStartFrag.value == '')
	  &&(dhcpEthEndFrag.value == '')
	  &&(dhcpLeasedTimeFrag.value ==''))
	  {
	  dhcpEthStartFrag.value = '0.0.0.0';
	  dhcpEthEndFrag.value = '0.0.0.0';
	  dhcpLeasedTimeFrag.value ='86400';
	  }
	  else
	  {
	  if ((dhcpEthStartFrag.value != '0.0.0.0')&&(dhcpEthEndFrag.value != '0.0.0.0'))
	  {
	  if (isValidIpAddress(dhcpEthStartFrag.value) == false ||
	  !(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthStartFrag.value, ethSubnetMask.value)))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS21Text","s")%>"' + dhcpEthStartFrag.value + '"  <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if (isBroadcastIp(dhcpEthStartFrag.value, ethSubnetMask.value) == true)
	  {
	  alert(' <%tcWebApi_get("String_Entry","LANJS22Text","s")%> "' + dhcpEthStartFrag.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
	  return false;
	  }
	  if (isValidIpAddress(dhcpEthEndFrag.value) == false ||
	  !(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthEndFrag.value, ethSubnetMask.value)))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS23Text","s")%>"' + dhcpEthEndFrag.value + '"  <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return false;
	  }
	  if (isBroadcastIp(dhcpEthEndFrag.value, ethSubnetMask.value) == true)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS24Text","s")%> "' + dhcpEthEndFrag.value + '"  <%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
	  return false;
	  }
	  if (!(isEndGTEStart(dhcpEthEndFrag.value, dhcpEthStartFrag.value)))
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS25Text","s")%>");
	  return false;
	  }
	  if (dhcpEthStartFrag.value == ethIpAddress.value)
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS26Text","s")%>");
	  return false;
	  }
	  if (dhcpEthEndFrag.value == ethIpAddress.value)
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS27Text","s")%>");
	  return false;
	  }
	  }
	  else if((dhcpEthStartFrag.value == '0.0.0.0')&&(dhcpEthEndFrag.value == '0.0.0.0'))
	  {
	  }
	  else
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS28Text","s")%>');
	  return false;
	  }
	  }
	  if (IpPoolIndex.value == "STB")
	  {
	  /*if (!ipIsInIP(dhcpEthStartFrag.value, dhcpEthEndFrag.value, dhcpEthStart.value , dhcpEthEnd.value))
	  {
	  alert("IP��STB����Ҫ��IP��֮�⡣");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_2, dhcpEnd1_2))
	  {
	  alert("IP��STB��IP ��Phone ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_3, dhcpEnd1_3))
	  {
	  alert("IP��STB��IP ��Camera ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_4, dhcpEnd1_4))
	  {
	  alert("IP��STB��IP ��Computer ��ͻ!");
	  return false;
	  }*/
	  }
	  else if (IpPoolIndex.value == "Phone")
	  {
	  /*if (!ipIsInIP(dhcpEthStartFrag.value, dhcpEthEndFrag.value, dhcpEthStart.value , dhcpEthEnd.value))
	  {
	  alert("IP��Phone����Ҫ��IP��֮�⡣");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_1, dhcpEnd1_1))
	  {
	  alert("IP��Phone ��IP ��STB ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_3, dhcpEnd1_3))
	  {
	  alert("IP��Phone ��IP ��Camera��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_4, dhcpEnd1_4))
	  {
	  alert("IP��Phone ��IP ��Computer ��ͻ!");
	  return false;
	  }*/
	  }
	  else if(IpPoolIndex.value == "Camera")
	  {
	  /*if(!ipIsInIP(dhcpEthStartFrag.value, dhcpEthEndFrag.value, dhcpEthStart.value , dhcpEthEnd.value))
	  {
	  alert("IP��Camera����Ҫ��IP��֮�⡣");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_1, dhcpEnd1_1))
	  {
	  alert("IP��Camera ��IP ��STB ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_2, dhcpEnd1_2))
	  {
	  alert("IP��Camera ��IP ��Phone ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_4, dhcpEnd1_4))
	  {
	  alert("IP��Camera ��IP ��Computer ��ͻ!");
	  return false;
	  }*/
	  }
	  else if(IpPoolIndex.value == "Computer")
	  {
	  /*if(!ipIsInIP(dhcpEthStartFrag.value, dhcpEthEndFrag.value, dhcpEthStart.value , dhcpEthEnd.value))
	  {
	  alert("IP��Computer����Ҫ��IP��֮�⡣");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_1, dhcpEnd1_1))
	  {
	  alert("IP��Computer ��IP ��STB ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_2, dhcpEnd1_2))
	  {
	  alert("IP��Computer ��IP ��Phone ��ͻ!");
	  return false;
	  }
	  else if (ipConfilt (dhcpEthStartFrag.value, dhcpEthEndFrag.value,dhcpStart1_3, dhcpEnd1_3))
	  {
	  alert("IP��Computer ��IP ��Camera ��ͻ!");
	  return false;
	  }*/
	  }
	  }
	  else
	  {
	  if ( natEnbl == '1' )
	  {
	  }
	  else
	  {
	  }
	  }
	  if ( dhcpSrvType[1].checked == true
	  && ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
	  {
		  RouteIPChangeFlag.value="1";
	  }
	  oldAddrPrimary = ethIpAddress.value;
	  oldMaskPrimary = ethSubnetMask.value;
	  }
	  with (document.forms[2])
	  {
	  switch (type)
	  {
	  case 3:
	  {
	  if (1 != getCheckVal('dhcp6SrvType') || "Normal" != UseWan.value)
	  {
	  return true;
	  }
	  if ("" != dhcpPrefix.value)
	  {
	  if (true != CheckPrefix(dhcpPrefix.value,0))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%>"' + dhcpPrefix.value +'" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
	  return false;
	  }
	  }
	  if ("" != dhcpPrefix.value || ("" != PrefixLen.value && 0 != PrefixLen.value))
	  {
	  if (true != CheckLength(PrefixLen.value))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS7Text","s")%>"' + PrefixLen.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
	  return false;
	  }
	  }
	  if ("" != dhcpPrefix.value || ("" != t1.value && 0 != t1.value) || ("" != t2.value && 0 != t2.value))
	  {
	  switch (CheckTime(t1.value,t2.value))
	  {
	  case 1 :
	  {
	  alert('<%tcWebApi_get("String_Entry","TimeText","s")%> "' + t1.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
	  return false;
	  }
	  case 2 :
	  {
	  alert('<%tcWebApi_get("String_Entry","TimeText","s")%>"' + t2.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
	  return false;
	  }
	  case 3 :
	  {
	  alert('<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%>' + t2.value + '<%tcWebApi_get("String_Entry","LANJS33Text","s")%>' + '<%tcWebApi_get("String_Entry","LANJS29Text","s")%> ' + t1.value);
	  return false;
	  }
	  default:
	  break;
	  }
	  }
	  if ("" == DnsSrvOne.value && "" != DnsSrvTwo.value)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%> "' + DnsSrvOne.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
	  return false;
	  }
	  if (true != CheckPrefix(DnsSrvOne.value,1))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%>"' + DnsSrvOne.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
	  return false;
	  }
	  if (true != CheckPrefix(DnsSrvTwo.value,1))
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%> "' + DnsSrvTwo.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
	  return false;
	  }
	  break;
	  }
	  case 1:
	  {
	  }
	  break;
	  case 2:
	  {
	  }
	  break;
	  default:
	  break;
	  }
	  }
	  return true;
	  }
	  function setDhcpAddresses(lanIp)
	  {
	  with (document.forms[0])
	  {
	  if (isValidIpAddress(lanIp) == false)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + lanIp + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
	  return;
	  }
	  var lanMask = ethSubnetMask.value;
	  var Start = dhcpEthStart.value;
	  var End = dhcpEthEnd.value;
	  addrParts = lanIp.split('.');
	  maskParts = lanMask.split('.');
	  if ( addrParts.length != 4 )
	  return false;
	  if ( maskParts.length != 4 )
	  return false;
	  if (isValidSubnetMask(lanMask) == false || parseInt(maskParts[3]) >= 254)
	  {
	  alert('<%tcWebApi_get("String_Entry","LANJS38Text","s")%> ');
	  return false;
	  }
	  t1 = parseInt(addrParts[3]) + 1;
	  var broadcast = get_broadcast(lanIp,lanMask);
	  broadcast = broadcast.toString();
	  castPart = broadcast.split('.');
	  t2 = parseInt(castPart[3]) - 1;
	  if (dhcpEthStart.value != '' && t1 >= 255)
	  {
	  alert("<%tcWebApi_get("String_Entry","LANJS34Text","s")%>");
	  return false;
	  }
	  dhcpEthStart.value = dhcpEthEnd.value = "";
	  for (i = 0; i < 3; i++)
	  {
	  dhcpEthStart.value = dhcpEthStart.value + addrParts[i] + ".";
	  dhcpEthEnd.value = dhcpEthEnd.value + addrParts[i] + ".";
	  }
	  dhcpEthStart.value = dhcpEthStart.value + t1;
	  dhcpEthEnd.value = dhcpEthEnd.value + t2;
	  if ( dhcpSrvType[1].checked == true
	  && ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
	  {
	  <% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
	  alert('<%tcWebApi_get("String_Entry","LANJS31Text","s")%>');
	  <% else %>	
	  alert('<%tcWebApi_get("String_Entry","LANJS32Text","s")%>');
	  <% end if %>
	  changeAddrFlag = true;
	  RouteIPChangeFlag.value="1";
	  IpPoolIndex.value = "Computer";
	  dhcpEthStartFrag.value = dhcpEthStart.value;
	  dhcpEthEndFrag.value= dhcpEthEnd.value;
	  poolIndex = '1';
	  dhcpStart1_1 = dhcpEthStartFrag.value;
	  dhcpEnd1_1 = dhcpEthEndFrag.value;
	  dhcpStart1_2 = dhcpStart1_1;
	  dhcpEnd1_2 = dhcpEthEndFrag.value;
	  dhcpStart1_3 = dhcpStart1_1;
	  dhcpEnd1_3 = dhcpEthEndFrag.value;
	  dhcpStart1_4 = dhcpStart1_1;
	  dhcpEnd1_4 = dhcpEthEndFrag.value;
	  dhcpStart1_5 = dhcpStart1_1;
	  dhcpEnd1_5 = dhcpEthEndFrag.value;
	  }
	  }
	  }
	  function IpPoolIndexChange()
	  {
	  with ( document.forms[0] ) {
	  var index=IpPoolIndex.value;
	  if(index == 'HGW')
	  {
		  if(dhcpStart1_5 != "N/A")
			  dhcpEthStartFrag.value = dhcpStart1_5;
		  else
			  dhcpEthStartFrag.value = "";
		  if(dhcpEnd1_5 != "N/A")
			  dhcpEthEndFrag.value = dhcpEnd1_5;
		  else
			  dhcpEthEndFrag.value = "";
	  setCheck('enableRelay',enblrelay_hgw);
	  }
	  else if(index == 'STB')
	  {
	  dhcpEthStartFrag.value = dhcpStart1_1;
	  dhcpEthEndFrag.value = dhcpEnd1_1;
	  setCheck('enableRelay',enblrelay_stb);
	  }
	  else if(index == 'Phone')
	  {
	  dhcpEthStartFrag.value = dhcpStart1_2;
	  dhcpEthEndFrag.value = dhcpEnd1_2;
	  setCheck('enableRelay',enblrelay_phone);
	  }
	  else if(index == 'Camera')
	  {
	  dhcpEthStartFrag.value = dhcpStart1_3;
	  dhcpEthEndFrag.value = dhcpEnd1_3;
	  setCheck('enableRelay',enblrelay_camera);
	  }
	  else if(index == 'Computer')
	  {
	  dhcpEthStartFrag.value = dhcpStart1_4;
	  dhcpEthEndFrag.value = dhcpEnd1_4;
	  setCheck('enableRelay',enblrelay_computer);
	  }
	  }
	  }
	  
	  function getPortRelayStr(relayinfstr, pr_str)
	  {
	  if (getCheckVal(pr_str) == 1)
	  {
	  if (relayinfstr == '')
	  {
	  return  getValue(pr_str);
	  }
	  else
	  {
	  return  ',' + getValue(pr_str);
	  }
	  }
	  return '';
	  }
	  function secPortRelayStr()
	  {
	  /*var PortRelayArray = dhcpst[0].PortRelayStr.split(',');
	  var InsId;
	  var handle;
	  for (i = 0; i < PortRelayArray.length; i++)
	  {
	  InsId = PortRelayArray[i].substr(PortRelayArray[i].lastIndexOf('.') + 1)
	  if (PortRelayArray[i].indexOf('LANEthernetInterfaceConfig') > 0)
	  {
	  handle =  'setCheck(' + '\'PortRelay_lan' + InsId + '\'' + ',1)';
	  }
	  else if (PortRelayArray[i].indexOf('WLANConfiguration') > 0)
	  {
	  handle =  'setCheck(' + '\'PortRelay_ssid' + InsId + '\'' + ',1)';
	  }
	  else
	  {
	  break;
	  }
	  eval(handle);
	  }*/
	  }
	  function AddSubmitParam(Form,type)
	  {
	  /*if (type == 1 || type == 2 || type == 3)
	  {
	  with (document.forms[2])
	  {
	  switch(type)
	  {
	  case 3:
	  {
	  Form.addParameter('y.DHCPServerEnable',getCheckVal('dhcp6SrvType'));
	  if ( 1 == getCheckVal('dhcp6SrvType') )
	  {
	  Form.addParameter('y.UseAllocatedWAN',getValue('UseWan'));
	  }
	  if ( 1 == getCheckVal('dhcp6SrvType') && "Normal" == UseWan.value )
	  {
	  Form.addParameter('y.Prefix',getValue('dhcpPrefix'));
	  if ( '' == getValue('PrefixLen') )
	  {
	  Form.addParameter('y.PrefixLength',0);
	  }
	  else
	  {
	  Form.addParameter('y.PrefixLength',getValue('PrefixLen'));
	  }
	  if ( '' == getValue('t1') )
	  {
	  Form.addParameter('y.Preferredlifetime',0);
	  }
	  else
	  {
	  Form.addParameter('y.Preferredlifetime',getValue('t1'));
	  }
	  if ( '' == getValue('t2') )
	  {
	  Form.addParameter('y.Validlifetime',0);
	  }
	  else
	  {
	  Form.addParameter('y.Validlifetime',getValue('t2'));
	  }
	  var DnsStr = '';
	  DnsStr = '';
	  if (DnsSrvOne.value != '')
	  {
	  DnsStr = getValue('DnsSrvOne');
	  if (DnsSrvTwo.value != '')
	  {
	  DnsStr = getValue('DnsSrvOne') + ',' + getValue('DnsSrvTwo');
	  }
	  }
	  else if (DnsSrvTwo.value != '') 
	  {
	  DnsStr = getValue('DnsSrvTwo');
	  }
	  Form.addParameter('y.DNSServer',DnsStr);
	  Form.addParameter('y.DomainName',getValue('DomainNameText'));
	  }
	  var RequestFile = '/html/network/dhcp.asp';
	  var url = 'setcfg.cgi?'
	  + 'y=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_DHCPv6'
	  + '&RequestFile=' + RequestFile;
	  Form.setAction(url);
	  break;
	  }
	  case 1:
	  break;
	  case 2:
	  break;
	  default:
	  return;
	  }
	  }
	  }
	  else
	  {
	  Form.addParameter('x.IPInterfaceIPAddress',getValue('ethIpAddress'));
	  Form.addParameter('x.IPInterfaceSubnetMask',getValue('ethSubnetMask'));
	  Form.usingPrefix('y');
	  with (document.forms[0])
	  {
	  var isRelay = getCheckVal('enableRelay');
	  Form.addParameter('DHCPServerEnable',getRadioVal('dhcpSrvType'));
	  if (1 == getRadioVal('dhcpSrvType'))
	  {
	  if (IpPoolIndex.value == '1')
	  {
	  Form.addParameter('X_CT-COM_STB-MinAddress',dhcpEthStartFrag.value);
	  Form.addParameter('X_CT-COM_STB-MaxAddress',dhcpEthEndFrag.value);
	  Form.addParameter('X_CT-COM_STB-DHCPRelay',isRelay);
	  if (changeAddrFlag == true)
	  {
	  Form.addParameter('X_CT-COM_Phone-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Phone-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MaxAddress','0.0.0.0');
	  }
	  }
	  else if (IpPoolIndex.value == '2')
	  {
	  Form.addParameter('X_CT-COM_Phone-MinAddress',dhcpEthStartFrag.value);
	  Form.addParameter('X_CT-COM_Phone-MaxAddress',dhcpEthEndFrag.value);
	  Form.addParameter('X_CT-COM_Phone-DHCPRelay',isRelay);
	  if (changeAddrFlag == true)
	  {
	  Form.addParameter('X_CT-COM_STB-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_STB-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MaxAddress','0.0.0.0');
	  }
	  }
	  else if (IpPoolIndex.value == '3')
	  {
	  Form.addParameter('X_CT-COM_Camera-MinAddress',dhcpEthStartFrag.value);
	  Form.addParameter('X_CT-COM_Camera-MaxAddress',dhcpEthEndFrag.value);
	  Form.addParameter('X_CT-COM_Camera-DHCPRelay',isRelay);
	  if (changeAddrFlag == true)
	  {
	  Form.addParameter('X_CT-COM_STB-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_STB-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Phone-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Phone-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Computer-MaxAddress','0.0.0.0');
	  }
	  }
	  else if (IpPoolIndex.value == '4')
	  {
	  Form.addParameter('X_CT-COM_Computer-MinAddress',dhcpEthStartFrag.value);
	  Form.addParameter('X_CT-COM_Computer-MaxAddress',dhcpEthEndFrag.value);
	  Form.addParameter('X_CT-COM_Computer-DHCPRelay',isRelay);
	  if (changeAddrFlag == true)
	  {
	  Form.addParameter('X_CT-COM_STB-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_STB-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Phone-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Phone-MaxAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MinAddress','0.0.0.0');
	  Form.addParameter('X_CT-COM_Camera-MaxAddress','0.0.0.0');
	  }
	  }
	  Form.addParameter('MinAddress',getValue('dhcpEthStart'));
	  Form.addParameter('MaxAddress',getValue('dhcpEthEnd'));
	  Form.addParameter('DHCPLeaseTime',getValue('dhcpLeasedTimeFrag'));
	  Form.addParameter('DHCPServerEnable',getRadioVal('dhcpSrvType'));
	  }
	  Form.addParameter('X_CT_COM_Port-DHCPRelayEnable',getCheckVal('enablePortRelay'));
	  var relayinfstr = '';
	  if (getCheckVal('enablePortRelay') == 1)
	  {
	  for (i = 1; i <= 4; i++)
	  {
	  relayinfstr = relayinfstr + getPortRelayStr(relayinfstr,'PortRelay_lan'+i);
	  relayinfstr = relayinfstr + getPortRelayStr(relayinfstr,'PortRelay_ssid'+i);
	  }
	  }
	  Form.addParameter('X_CT_COM_RelayLanInterface', relayinfstr);
	  Form.endPrefix();
	  top.lanDevIndex = IpPoolIndex.value;
	  }
	  var RequestFile = 'html/network/dhcp.asp';
	  if (getValue('ethIpAddress') != host[0][1])
	  {
	  RequestFile = '';
	  }
	  var url = 'setcfg.cgi?'
	  + 'y=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement'
	  + '&x=InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1'
	  + '&RequestFile=' + RequestFile;
	  Form.setAction(url);
	  }*/
	  }
	  </SCRIPT>
</HEAD>

<!-- <BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=808 align=center 
border=0>
  <TBODY>
  <TR>
    <TD height=1>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% else %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONTYLOGOSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% else %>
      <TABLE height=90 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% end if %> 
<% end if %>
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=358>
            <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD vAlign=bottom align=right><SPAN class=curUserName>&nbsp; 
                  </SPAN></TD>
                <TD class=welcom vAlign=bottom align=middle width=120><%tcWebApi_get("String_Entry","TitleWelcomeText","s")%></TD>
                <TD vAlign=bottom width=50><A onclick=DoLogout() 
                  href="/cgi-bin/logout.cgi" id=logOut name=logOut target=_top><SPAN 
                  class=logout><%tcWebApi_get("String_Entry","TitleLogOutText","s")%>
      </SPAN></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE id=table2 height=100 cellSpacing=0 cellPadding=0 width=808 
border=0>
        <TBODY>
        <TR>
          <TD class=LocationDisplay id=LocationDisplay align=middle width=163 
          bgColor=#ef8218 rowSpan=3></TD>
          <TD width=434 bgColor=#427594 height=33>
            <P align=right><FONT face=<%tcWebApi_get("String_Entry","RomanText","s")%> color=#ffffff><B><FONT face=<%tcWebApi_get("String_Entry","RomanText","s")%>
            color=#ffffff size=6><INPUT id=Selected_Menu type=hidden 
            value="<%tcWebApi_get("String_Entry","ContentNetText","s")%>-><%tcWebApi_get("String_Entry","ContentLANText","s")%>" name=Net_DHCP> </FONT></B><SPAN 
            class=GatewayName><%tcWebApi_get("String_Entry","TitleGateWayNameText","s")%>
            <SCRIPT 
            language=javascript>
document.write(top.gateWayName);
</SCRIPT>
             </SPAN></FONT></P></TD>
          <TD width=211 bgColor=#ef8218 height=33>
            <P class=GatewayType align=center><%tcWebApi_get("String_Entry","TitleGateWayTypeText","s")%>
            <SCRIPT language=javascript>
document.write(top.ModelName);
</SCRIPT>
             </P></TD></TR>
        <TR>
          <TD id=MenuArea_L1 vAlign=bottom bgColor=#ef8218 colSpan=2 
          height=43>&nbsp;</TD></TR>
        <TR>
          <TD id=MenuArea_L2 bgColor=#427594 colSpan=2 
      height=24></TD></TR></TBODY></TABLE> -->
	  <body onload="FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload="DoUnload()">
		<INPUT id=Selected_Menu type=hidden 
					value="Net->Binding" name=Net_Bind> 
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
										MakeHeader('Gateway Name:','Gateway Type:','Net','LAN','Welcome!','#');
										</SCRIPT>
									</div>
									<div class="">
								 <div class="scoop-inner-content">
			
			
																	  <h1 class="heading_big bei pb-3">LAN</h1>
																	  <div class="white_box">
																			<form id='ConfigForm' name="ConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
			
																					<h1 class="heading_grey heading_margin"><img src="../img/wanip.png" width="45" height="40" class="img_sub" alt=""/> IPv4 Configuration</h1>
																					<div class="container-fluid">
												 <input type="hidden" name="portDHCPRelayFlag" id="portDHCPRelayFlag" value="N/A">
								  <input type="hidden" name="portLan1" id="portLan1" value="N/A">
								  <input type="hidden" name="portLan2" id="portLan2"value="N/A">
								  <input type="hidden" name="portLan3" id="portLan3" value="N/A">
								  <input type="hidden" name="portLan4" id="portLan4" value="N/A">
								  <input type="hidden" name="portSSID1" id="portSSID1" value="N/A">
								  <input type="hidden" name="portSSID2" id="portSSID2" value="N/A">
								  <input type="hidden" name="portSSID3" id="portSSID3" value="N/A">
								  <input type="hidden" name="portSSID4" id="portSSID4" value="N/A">
								  <input type="hidden" name="DeviceDHCPRelayFlag" id="DeviceDHCPRelayFlag" value="N/A">
								  <input type="hidden" name="IPV4_Flag" id="IPV4_Flag" value="0">
								  <input type="hidden" name="Change_Flag" id="Change_Flag" value="0">
								  <input type="hidden" name="LANChange" id="LANChange" value="0">
								  <input type="hidden" name="EthendIPcount" id="EthendIPcount" value="100">
								  <input type="hidden" name="DeviceendIPcount" id="DeviceendIPcount" value="80">
								  <script language="JavaScript" type="text/JavaScript">
									function dhcpSecPortRelay()
								  {
									  with (document.forms[0])
									  {
										  if(getCheckVal('enablePortRelay') == 1)
											  {
											  setDisplay('portrelayInfo', 1);			
											  document.ConfigForm.portDHCPRelayFlag.value="Yes";
											  }
										  else
										  {
												  setDisplay('portrelayInfo', 0);
												  document.ConfigForm.portDHCPRelayFlag.value="No";
										  }
									  }
								  }
									function checkportcheckboxstate()
									{
										var	vForm = document.ConfigForm;
									  
									  if(vForm.PortRelay_lan1.checked)
										  vForm.portLan1.value = "Yes";
									  else vForm.portLan1.value = "No";
									  if(vForm.PortRelay_lan2.checked)
										  vForm.portLan2.value = "Yes";
									  else vForm.portLan2.value = "No";
									  if(vForm.PortRelay_lan3.checked)
										  vForm.portLan3.value = "Yes";
									  else vForm.portLan3.value = "No";
									  if(vForm.PortRelay_lan4.checked)
										  vForm.portLan4.value = "Yes";
									  else vForm.portLan4.value = "No";
									  if(vForm.PortRelay_ssid1.checked)
										  vForm.portSSID1.value = "Yes";
									  else vForm.portSSID1.value = "No";
									  if(vForm.PortRelay_ssid2.checked)
										  vForm.portSSID2.value = "Yes";
									  else vForm.portSSID2.value = "No";
									  if(vForm.PortRelay_ssid3.checked)
										  vForm.portSSID3.value = "Yes";
									  else vForm.portSSID3.value = "No";
									  if(vForm.PortRelay_ssid4.checked)
										  vForm.portSSID4.value = "Yes";
									  else vForm.portSSID4.value = "No";
									}
									function GetEndSubStartCount(EndIp, StartIp)
									{
										var vret;
									  addrEnd = EndIp.split('.');
									  addrStart = StartIp.split('.');
									  E = parseInt(addrEnd[3]) + 1;
									  S = parseInt(addrStart[3]);
									  vret = E - S;
									  return vret;
									  
									}
									function btnSaveIPv4()
									{
										if(CheckForm(1) == false)
										  return false;
									  var	vForm = document.ConfigForm;
									  vForm.EthendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEnd.value, vForm.dhcpEthStart.value);
									  vForm.DeviceendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEndFrag.value, vForm.dhcpEthStartFrag.value);
									  
									   checkportcheckboxstate();
									
									  vForm.IPV4_Flag.value = "1";
									  if( true == setEBooValueCookie(vForm) )
										  vForm.submit();
									}
									function devicedhcpRelay()
									{
										var	vForm = document.ConfigForm;
									  if(vForm.enableRelay.checked)
										  vForm.DeviceDHCPRelayFlag.value = "Yes";
									  else vForm.DeviceDHCPRelayFlag.value = "No";
									}
									
									function initLeaseTimeTable()
									{
										var leaseTime = '<% tcWebApi_get("Dhcpd_Common","lease","s") %>';
										var optname = new Array('1<%tcWebApi_get("String_Entry","MinuteText","s")%>', '1<%tcWebApi_get("String_Entry","HourText","s")%>', '1<%tcWebApi_get("String_Entry","DayText","s")%>', '1<%tcWebApi_get("String_Entry","WeekText","s")%>');
										var optvalue = new Array('60', '3600', '86400', '604800');
										var cusname = leaseTime + '<%tcWebApi_get("String_Entry","SecondsText","s")%>';
										var hascusopt = true;
										var isSel = 0;
			  
										with (getElById('dhcpLeasedTimeFrag'))
										  {
											  for( i=0; i< optname.length; i++)
											  {
												  var opt = new Option(optname[i], optvalue[i]);
												  if ( leaseTime == optvalue[i] )
												  {
													  opt.selected = true
													  isSel = i;
													  hascusopt = false;
												  }
												  options.add ( opt );
												  options[isSel].setAttribute('selected', 'true');
											  }
											  
											  
											  if ( hascusopt && isInteger(leaseTime) && '0' != leaseTime )
											  {
												  var optcus = new Option(cusname, leaseTime);
												  optcus.selected = true
												  options.add ( optcus );
												  isSel = i;
												  options[isSel].setAttribute('selected', 'true');
											  }
										  }
									}
									</script>
									<div class="lighter_grey_bg">
										<h2 class="sub_heading">Local Network Configuration</h2>
												<p>DHCP open, close and lease time(1 minute,1 hour,1 day,1 week) in the side of user.</p>
												<p>DHCP address range setting and the map of device type.</p>
												<p> DHCP work mode setting(DHCP server and DHCP relay).</p>
										</div>


								<div class="row">
										<div class="col-md-4 form-group">
												<label><%tcWebApi_get("String_Entry","LANIPAddressText","s")%></label>
	<input type="text" class="form-control" maxlength="15" onchange="setDhcpAddresses(this.value)"
name="ethIpAddress" id="ethIpAddress" value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>"/>
										</div>
										<div class="col-md-4 form-group">
												<label><%tcWebApi_get("String_Entry","LANMaskText","s")%></label>
	<input type="text" class="form-control" maxlength="15" onchange="setDhcpAddresses(ethIpAddress.value)"
name="ethSubnetMask" id="ethSubnetMask" value="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>">
										</div>
										<div class="col-md-12 form-group">
												<div class=" custom-radio custom-control-inline">
	<input  id="dhcpSrvType" onclick="typeClick(1)" type="radio" value="0" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") end if %>><%tcWebApi_get("String_Entry","LANDHCPDISABLEText","s")%>
	
	<!-- <label class="custom-control-label" for="dhcpSrvType">Disable DHCP Server</label>-->
														</div>
														<div class="custom-control custom-radio custom-control-inline">
														 <input id="dhcpSrvType" onclick="typeClick(1)"  type="radio" value="1" name="dhcpSrvType" selected <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %>>
                                                         <%tcWebApi_get("String_Entry","LANDHCPENABLEText","s")%>
														</div>
												<div class="custom-control custom-radio custom-control-inline">
														 <!-- <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
														  <label class="custom-control-label" for="customRadioInline3">Enable DHCP Relay</label>-->
		  <input id="dhcpSrvType" onclick="typeClick(1)"  type="radio" value="2" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %>><%tcWebApi_get("String_Entry","LANDHCPENABLEText","s")%>
														</div>
										</div>
										<div class="col-md-4 form-group" style="display: none;">
												<label>Device Type:</label>
	<SELECT onchange="IpPoolIndexChange()" size=1 id="IpPoolIndex" name="IpPoolIndex" class="custom-select">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
<OPTION value="HGW" >HGW
<OPTION value="STB" >STB
		  <OPTION value="Phone" >Phone
		  <OPTION value="Camera" >Camera
		  <OPTION value="Computer" selected>Computer</OPTION>
		  </SELECT>
										</div>
										<div class="col-md-12">

												<div class="col-md-6 form-group" id="dhcpstartaddr">
														<label style="margin-left:0px !important;"><%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%></label>
														<div class="row">
														<div class="col-md-6 row"> 
	<input  type="text" class="form-control" maxlength="15" onchange="InPutChange()" id="dhcpEthStart" name="dhcpEthStart" value="<%if tcWebApi_get("Dhcpd_Common","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if %>" style="width:120px">
														</div>
														<div class="col-md-6" style="display: none;">
															<input type="text" class="form-control" maxlength="15" id="dhcpEthStartFrag" name="dhcpEthStartFrag" value="<%if tcWebApi_get("Dhcpd_Option60","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","start","s") end if %>" style="width:120px"></div>
														</div>
												</div>
										</div>
										<div class="col-md-12">

												<div class="col-md-6 form-group" id="dhcpendaddr">
														<label class="row"><%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%></label>
														<div class="row">
														<div class="col-md-6 row">
															<input type="text" class="form-control" maxLength="15" onchange="InPutChange()" id="dhcpEthEnd" name="dhcpEthEnd" value="<%if tcWebApi_get("Dhcpd_Common","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if %>" style="width:120px"/></div>
														<div class="col-md-6" style="display: none;">
															<input maxlength="15" class="form-control"  id="dhcpEthEndFrag" name="dhcpEthEndFrag" value="<%if tcWebApi_get("Dhcpd_Option60","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","pool_count","s") end if %>" style="width:120px"/></div>
														</div>
												</div>
										</div>
										<div class="col-md-4 form-group" id="dhcplease">
												<label><%tcWebApi_get("String_Entry","DhcpLeasedTimeText","s")%></label><br>
	<select class="custom-select" size=1 name='dhcpLeasedTimeFrag' onchange="InPutChange()" id='dhcpLeasedTimeFrag' style="width:120px">
</select>
<script language="JavaScript" type="text/javascript">
	initLeaseTimeTable();
function isManuallyIpv4Dns()
{
	var dproxyActive = 'Yes';
	var dproxyType = '0';

	if ((dproxyActive == "Yes") && (dproxyType == "1"))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function isIpv4BroadcastIp(ipAddress)
{
	tmpIp = ipAddress.split('.');

	if((parseInt(tmpIp[0]) > 223) || ( 127 == parseInt(tmpIp[0])))
	{
		return true;
	}
	return false;
}

function iptv4DnsSourceListChg()
{
	var selectObj = document.getElementById("iptv4DnsSource");
	var selectIndex = selectObj.selectedIndex;
	var selectValue = selectObj.options[selectIndex].value;

	if ( selectValue == "ManuallyOption" )
	{
		setDisplay('ipv4DnsServer',1);
	}
	else
	{
		setDisplay('ipv4DnsServer',0);
	}
}

function ipv4DnsSubmit()
{
	var selectObj = document.getElementById("iptv4DnsSource");
	var selectIndex = selectObj.selectedIndex;
	var selectValue = selectObj.options[selectIndex].value;
	var manuallyOptionStr = document.getElementById("ipv4OptionManu").value;
	var automaticallyOptionStr = document.getElementById("ipv4OptionAuto").value;

	with (document.forms['Ipv4DnsForm'])
	{
		if ((isValidIpAddress(ipv4DnsSrvOne.value) == false) || (isIpv4BroadcastIp(ipv4DnsSrvOne.value)))
		{
			alert('Address "' + ipv4DnsSrvOne.value + '" is invalid. ');
			return false;
		}
		if ((isValidIpAddress(ipv4DnsSrvTwo.value) == false) || (isIpv4BroadcastIp(ipv4DnsSrvTwo.value)))
		{
			alert('Address "' + ipv4DnsSrvTwo.value + '" is invalid. ');
			return false;
		}
		Iptv4Dns_Flag.value = "1";
		if (selectValue == manuallyOptionStr)
		{
			ManuallySelectFlag.value = "1";
			Dproxy_Entry_Active_value.value = "Yes";
			Dproxy_Entry_type_value.value = "1";
			console.log("jiaxing000");
		}
		else
		{
			Dproxy_Entry_type_value.value = "0";
			Dproxy_Entry_Active_value.value = "Yes";
			ManuallySelectFlag.value = "0";
			console.log("jiaxing001");
		}
		if( true == setEBooValueCookie(document.forms['Ipv4DnsForm']) )
		{
			document.forms['Ipv4DnsForm'].submit();
		}
	}
	return true;
}
																		</script>


				<!-- <div class="col-md-12 form-group" id="divlandns">
				<label>N/A</label>
				<div class="custom-control custom-radio custom-control-inline">
<input id="dns_config" type="radio"  onclick="lan_dns_server(1)"  value="Enable" name="dns_config" unchecked>
				 <label>N/A</label>
<input id="dns_config" type="radio" onclick="lan_dns_server(1)" value="Disable" name="dns_config" checked>
				 <label> N/A</label>
				</div>
				 <div class="col-md-3 form-group row">
					  <label>N/A</label>
						  <input type="hidden" id="PRIDNS" name="PRIDNS" value="">
						<input type="hidden" id="SECDNS" name="SECDNS" value="">
						<input type="hidden" id="config_dns" name="config_dns" value="">
					 <input maxLength="15"class="form-control" name="primarydnsserver" id="primarydnsserver" value="">
																</div>
				 <div class="col-md-3 form-group row">
					  <label>N/A</label>
					 <input maxLength="15"class="form-control" name="secondarydnsserver" id="secondarydnsserver" value="">
																</div> -->
				</div>
				<div class="col-md-4 form-group">
				<div class="custom-control custom-checkbox" style="display:none">
				<input type="hidden" name="RouteIPChangeFlag" id="RouteIPChangeFlag" value="0"/>
				<input class="custom-control-input" type="checkbox" onclick="devicedhcpRelay()" id="enableRelay" name="enableRelay" />
																  <label class="custom-control-label" for="enableRelay">Device DHCP Relay: </label>
																</div>
					</div>
					 <div class="col-md-12 form-group" id="portrelayEnable" style="display:none">
					 <div class="col-md-4 form-group">
				<div class="custom-control custom-checkbox" >
				<input class="custom-control-input" id="enablePortRelay" onclick="dhcpSecPortRelay()" type="checkbox" name="enablePortRelay" />
																  <label class="custom-control-label" for="enableRelay"> <%tcWebApi_get("String_Entry","DhcpSecPortRelayText","s")%>  </label>
																</div>
					</div>
														 </div>
				<div class="col-md-12 form-group" id="portrelayInfo" style="display:none">
																<div class="custom-control custom-checkbox custom-control-inline" id="sec_lan1">
				   <input class="custom-control-input"  id="PortRelay_lan1" type="checkbox" name="PortRelay_lan1"  <%if tcWebApi_get("Dhcpd_Common","PortLan1","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_lan1">LAN 1</label>
																</div>

						<div class="custom-control custom-checkbox custom-control-inline" id="sec_ssid1">
				  <input class="custom-control-input"  id="PortRelay_ssid1" type="checkbox" name="PortRelay_ssid1" <%if tcWebApi_get("Dhcpd_Common","PortSSID1","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_ssid1">SSID 1</label>
																</div>

						<div class="custom-control custom-checkbox custom-control-inline" id="sec_lan2">
				 <input class="custom-control-input"  id="PortRelay_lan2" type="checkbox" name="PortRelay_lan2"  <%if tcWebApi_get("Dhcpd_Common","PortLan2","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_lan2">LAN 2</label>
																</div>


						<div class="custom-control custom-checkbox custom-control-inline" id="sec_ssid2">
				<input class="custom-control-input"  id="PortRelay_ssid2" type="checkbox" name="PortRelay_ssid2" <%if tcWebApi_get("Dhcpd_Common","PortSSID2","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_ssid2">SSID 2 </label>
																</div>

					<div class="custom-control custom-checkbox custom-control-inline" id="sec_lan3">
				<input class="custom-control-input"  id="PortRelay_lan3" type="checkbox" name="PortRelay_lan3" <%if tcWebApi_get("Dhcpd_Common","PortLan3","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_lan3">LAN 3 </label>
																</div>

					<div class="custom-control custom-checkbox custom-control-inline" id="sec_ssid3">
			  <input class="custom-control-input" id="PortRelay_ssid3"
type="checkbox" name="PortRelay_ssid3" <%if tcWebApi_get("Dhcpd_Common","PortSSID3","h") = "Yes" then asp_Write("checked") end if %> />
					  <label class="custom-control-label" for="PortRelay_ssid3">SSID 3 </label>
																</div>

					 <div class="custom-control custom-checkbox custom-control-inline" id="sec_lan4">
			  <input class="custom-control-input" id="PortRelay_lan4" type="checkbox" name="PortRelay_lan4" <%if tcWebApi_get("Dhcpd_Common","PortLan4","h") = "Yes" then asp_Write("checked") end if %> />
					  <label class="custom-control-label" for="PortRelay_lan4">LAN 4 </label>
																</div>


					 <div class="custom-control custom-checkbox custom-control-inline" id="sec_ssid4">
			 <input class="custom-control-input" id="PortRelay_ssid4" type="checkbox" name="PortRelay_ssid4" <%if tcWebApi_get("Dhcpd_Common","PortSSID4","h") = "Yes" then asp_Write("checked") end if %>/>
					  <label class="custom-control-label" for="PortRelay_ssid4">SSID 4 </label>
																</div>

												</div>

			<div class="col-md-12 form-group" id="DhcprelayIP">
			<div class="col-md-3 form-group">
																<label><%tcWebApi_get("String_Entry","DhcpRelayServerIP","s")%></label><br>
					 <input type="text" class="form-control" maxLength="15" name="dhcpRelayServerIP" id="dhcpRelayServerIP" value="<%if tcWebApi_get("DhcpRelay_Entry","Server","h" ) <> "N/A" then tcWebApi_get("DhcpRelay_Entry","Server","s" ) end if %>" style="width:120px">
																</div>
			</div>



			<div class="col-md-12">
														<hr class="margin_adjs" style="width:106%" />
														<div class="form-footer text-right p-3 ">
				<button class="btn btn-orang btn-lg " onclick="btnSaveIPv4();" type="button" id="saveIPv4" name="saveIPv4" value="Apply" style="text-align: right; margin-right:0px; margin-left:900px"><%tcWebApi_get("String_Entry","DhcpButtonSaveText","s")%></button>
														</div>
					 </div>

									  </div>
									  <hr class="margin_adjs" />
									  </div>

										 </form>
		  <form id="Ipv4DnsForm" name="Ipv4DnsForm" action="/cgi-bin/net-dhcp.asp" method="post">
			  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				  <TBODY>
				  <div>

					</div>
					  <table border="0" width=500>

					  <TR>
						  <TD width=2> </TD>
						  <TD width=114> <h2>DNS</h2><BR></TD>
					  </TR>
				  </table>
					  <TR>
						  <TD>
							  <TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
								  <TBODY>
									  <TR>
										  <TD width=120 align=left>DNS Server Source:&nbsp;&nbsp;</TD>
										  <TD align=left>
											  <SELECT class="custom-select" id=iptv4DnsSource name="iptv4DnsSource" onchange='iptv4DnsSourceListChg()'>
												  <OPTION value="AutomaticallyOption" id=ipv4OptionAuto>Automatically
												  </OPTION>
												  <OPTION value="ManuallyOption" id=ipv4OptionManu>Manually
												  </OPTION>
											  </SELECT>
										  </TD>
										  <TD>
											  <INPUT type="hidden" name="Iptv4Dns_Flag" value="0">
											  <INPUT type="hidden" name="ManuallySelectFlag" value="0">
											  <INPUT type="hidden" name="Dproxy_Entry_Active_value" value="Yes">
											  <INPUT type="hidden" name="Dproxy_Entry_type_value" value="0">
										  </TD>
									  </TR>
								  </TBODY>
							  </TABLE>
						  </TD>
					  <TR>
						  <TD>
							  <div id="ipv4DnsServer" style="display:none">
								  <TABLE>
									  <TBODY>
										  <TR>
											  <TD align=right width=120 >Primary DNS:&nbsp;&nbsp;&nbsp;</TD>
											  <TD align=left width=307><INPUT class="form-control" maxLength=39 name="ipv4DnsSrvOne" value="168.95.1.1"></TD>
										  </TR>
										  <TR>
											  <TD align=right width=120>Secondary DNS:&nbsp;&nbsp;&nbsp;</TD>
											  <TD align=left width=307><INPUT class="form-control" maxLength=39 name="ipv4DnsSrvTwo" value="168.95.1.2"></TD>
										  </TR>

										  <TR>
											  <TD><BR></TD>
										  </TR>
									  </TBODY>
								  </TABLE>
							  </div>
						  </TD>
					  </TR>



				  </TBODY>
			  </TABLE>
		  </form>

			<div class="col-md-12">
														<hr class="margin_adjs" />
														<div class="form-footer p-3 text-right">
				<button class="btn btn-orang btn-lg " onclick="ipv4DnsSubmit();" type="button" id="saveIPv4Dns" name="saveIPv4Dns" value="Apply">SAVE</button>
														</div>
					 </div>

			</div>
										<div class="white_box1">

												<h1 class="heading_grey heading_margin pb-4">
			<img src="../img/wanip.png" width="45" height="40" class="img_sub" alt=""/> <span style="vertical-align:middle"><%tcWebApi_get("String_Entry","IPV6SettingText","s")%> <span></h1>


												<div class="container-fluid">
														<div class="lighter_grey_bg">
																<p><%tcWebApi_get("String_Entry","IPV60Text","s")%></p>
														</div>
												<div >
		 <form class="row" id="RAConfigForm" name="RAConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
			
														<div class="col-md-12 form-group">
															
																<h2 class="sub_heading"><%tcWebApi_get("String_Entry","RASettingText","s")%><input type="hidden" id="RA_Flag" name="RA_Flag" value="0">
<input type="hidden" id="RAEnable_Flag" name="RAEnable_Flag" value="<% tcWebApi_get("Radvd_Entry","Enable","s") %>">
<input type="hidden" id="RAMode" name="RAMode" value="<% tcWebApi_get("Radvd_Entry","Mode","s") %>">
<input type="hidden" id="RAManagedEn_Flag" name="RAManagedEn_Flag" value="<% tcWebApi_get("Radvd_Entry","ManagedEnable","s") %>">
<input type="hidden" id="RAOtherEn_Flag" name="RAOtherEn_Flag" value="<% tcWebApi_get("Radvd_Entry","OtherEnable","s") %>">
<script language="JavaScript" type="text/JavaScript">
	function RAUseWanChange()
	{
		with (document.forms[1])
		{
			if ("Normal" == RAUseWan.value && 1 == getCheckVal('radvdSrvType'))
			{
				setDisplay('RadvdPrefixCfg', 1);
				RAMode.value = "1";
			}
			else
			{
				setDisplay('RadvdPrefixCfg', 0);
				RAMode.value = "0";
			}
			
			setDisplay('rapdsourcepart', ('Normal' == RAUseWan.value) ? 0 : 1);
			setDisplay('ramoflagdisp', ('Normal' == RAUseWan.value) ? 0 : 1);
		}
	}
	function RATypeClick()
	{
		with (document.forms[1])
		{
			if (getCheckVal('radvdSrvType') == 0)
			{
				disableRASrv();
				RAEnable_Flag.value = "0";
			}
			else
			{
				enableRASrv(1);
				RAEnable_Flag.value = "1";
				RAUseWanChange();
			}
		}
	}
	function RAMOClick(flag)
	{
		with (document.forms[1])
		{
			if(0 == flag){
				if (getCheckVal('radvdmanageden') == 0)
				{
					RAManagedEn_Flag.value = "0";
				}
				else
				{
					RAManagedEn_Flag.value = "1";
				}
			}
			else if(1 == flag){
				if (getCheckVal('radvdotheren') == 0)
				{
					RAOtherEn_Flag.value = "0";
				}
				else
				{
					RAOtherEn_Flag.value = "1";
				}
			}
		}
	}
	
	var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
		// num 0
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryName = vArrayStr.split(','); 
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
		var vEntryIndex = vArrayStr.split(',');
		<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "5") %>
		// num 6
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vIPVersion = vArrayStr.split(',');
	
		function dnsSourceListChg()
		{
			var dnsSourceType = getSelectVal('dnssource');
			
			if ( '998' == dnsSourceType )
			{
				setDisplay('dnssourcepart_2', 1);
				setDisplay('dnssourcepart_3', 1);
			}
			else
			{
				setDisplay('dnssourcepart_2', 0);
				setDisplay('dnssourcepart_3', 0);
			}
		}
	
		function initDnsSourceList()
		{
			var DnsSourceIdx = '<% tcWebApi_get("Dhcp6s_Entry","DNSWANConnection","s") %>';
			var DnsType = '<% tcWebApi_get("Dhcp6s_Entry","DNSType","s") %>';
			var i = 0;
			var isSel = -1;
			var itemCnt = 0;
		
			with (getElById('dnssource'))
			{
				for( i=0; i< parseInt(nEntryNum) + 2; i++)
				{
					var opt;
	
					if ( 0 == i )
						opt = new Option('HGWProxy', '999');
					else if ( 1 == i )
						opt = new Option('Static', '998');
					else
					{
						var WAN_Entry = i - 2;
						var CONName = vEntryName[WAN_Entry];
						if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
							|| 'IPv4' == vIPVersion[WAN_Entry] )
							continue;
	
						opt = new Option(CONName, vEntryIndex[WAN_Entry]);
					}
					
					if ( 0 == i && '2' == DnsType )
					{
						opt.selected = true;
						isSel = 0;
					}
					else if ( 1 == i && '1' == DnsType )
					{
						opt.selected = true;
						isSel = 1;
					}
					else if ( i > 1 &&  '0' == DnsType && DnsSourceIdx == vEntryIndex[i - 2] )
					{
						opt.selected = true;
						isSel = itemCnt;
					}
					
					itemCnt ++;
					options.add ( opt );
				}
				
				if ( isSel >= 0 )
					options[isSel].setAttribute('selected', 'true');
			}
		}
		
		function initRaPDSourceList()
		{
			var RaPdSourceIdx = '<% tcWebApi_get("Radvd_Entry","DelegatedWanConnection","s") %>';
			var RaPdType = '<% tcWebApi_get("Radvd_Entry","AutoPrefix","s") %>';
			var RaPdTmpUseIdx = '<% tcWebApi_get("WanInfo_Common","PDRUNIFIdx","s") %>';
			var i = 0;
			var isSel = -1;
			var bakSel = -1;
			var itemCnt = 0;
	
			with (getElById('rapdsource'))
			{
				for( i=0; i< parseInt(nEntryNum); i++)
				{
					var opt;
					var CONName = vEntryName[i];
	
					if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
						|| 'IPv4' == vIPVersion[i] )
						continue;
	
					opt = new Option(CONName, vEntryIndex[i]);
	
					if ( 'N/A' == RaPdType || 0 == RaPdSourceIdx.length )
					{
						if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
						{
							opt.selected = true;
							isSel = itemCnt;
						}
					}
					else
					{
						if (  'N/A' != RaPdSourceIdx && RaPdSourceIdx == vEntryIndex[i] )
						{
							opt.selected = true;
							isSel = itemCnt;
						}
						else
						{
							if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
							{
								bakSel = itemCnt;
							}
						}
					}
	
					itemCnt ++;
					options.add ( opt );
				}
				if ( isSel >= 0 )
					options[isSel].setAttribute('selected', 'true');
				else if ( bakSel >= 0 )
				{
						options[bakSel].selected = true;
						options[bakSel].setAttribute('selected', 'true');
				}
			}
		}
					  </script>
					  </h2>
					  <div class="custom-control custom-checkbox">
<INPUT  class="custom-control-input" id="radvdSrvType" onclick="RATypeClick();" type="checkbox" name="radvdSrvType" checked>
<label class="custom-control-label" for="radvdSrvType">SLAAC Enable</label>
					  </div>
			  </div>
<div class="row col-md-12" id="RAAssConnection" style="display: none">
			  <div class="col-md-4 form-group">
					  <label><%tcWebApi_get("String_Entry","RASettingModeText","s")%></label>
					  <br>
<select class="custom-select" id="RAUseWan" onchange="RAUseWanChange()" name="RAUseWan">
<OPTION value="Normal" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANDHCPmanualDNSRelayText","s")%></OPTION>
<OPTION value="UseAllocatedSubnet" selected <%if tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANDHCPautoDNSRelayText","s")%></OPTION>
</SELECT>
			  </div>
			  <div class="col-md-4 form-group" id='rapdsourcepart' style="display: none">
					  <label><%tcWebApi_get("String_Entry","RAPrefixText","s")%></label>
					  <br>
<select class="custom-select" id="rapdsource" name="rapdsource">
	<option value="0">1_TR069_INTERNET_R_VID_46</option>
	</select>
<script language=JavaScript type=text/javascript>
initRaPDSourceList();
</script>
			  </div>
			  <div class="col-md-12 form-group" id='ramoflagdisp' style="display: none">
					  <div class="custom-control custom-checkbox custom-control-inline">
<input class="custom-control-input" type="checkbox" name="ramflag" id="ramflag" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
						<label class="custom-control-label" for="ramflag"> <%tcWebApi_get("String_Entry","RAManagedEnableText","s")%></label>
					  </div>
					  <div class="custom-control custom-checkbox custom-control-inline">
					   <input class="custom-control-input" type="checkbox" name="raoflag" id="raoflag" checked <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
						<label class="custom-control-label" for="raoflag"> <%tcWebApi_get("String_Entry","RAOtherEnableText","s")%></label>
					  </div>
			  </div>
</div>

<div class="col-md-12" id="RadvdPrefixCfg" style="display: none">
<div class="row">
					  <div class="col-md-3 form-group" id="NamePrefix">
					  <label><%tcWebApi_get("String_Entry","RadvdPrefixText","s")%> *</label>
<input type="text" class="form-control"  maxLength=39 onchange="this.value = this.value.toLowerCase( )" id="radvdPrefix" name="radvdPrefix" value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>"/>
					  </div>
					  <div class="col-md-3 form-group" id="NamePrefixLen">
					  <label><%tcWebApi_get("String_Entry","RadvdNamePrefixLenText","s")%> *</label>
							  <div class="input-group">
<input type="text" class="form-control" maxLength=2 id="RAPrefixLen" name="RAPrefixLen" value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>"/>
								<div class="input-group-append">
									  <span class="input-group-text">[16 - 64]</span>
								</div>
									  </div>
					  </div>
					  <div class="col-md-3 form-group">
					  <label><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%> *</label>
							  <div class="input-group">
<input type="text" class="form-control" maxLength=10 id="PreferredLifetime" name="PreferredLifetime" value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>"/>
								<div class="input-group-append">
									  <span class="input-group-text">[600 - 4294967295 S]</span>
								</div>
									  </div>
					  </div>
					  <div class="col-md-3 form-group">
					  <label><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%> *</label>
							  <div class="input-group">
<input type="text" class="form-control" maxLength=10 id="ValidLifetime" name="ValidLifetime" value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>"/>
								<div class="input-group-append">
									  <span class="input-group-text">[600 - 4294967295 S]</span>
								</div>
									  </div>
					  </div>
					  <div class="col-md-12 form-group">
					  <div class="custom-control custom-checkbox custom-control-inline">
<input type="checkbox" class="custom-control-input" onClick="RAMOClick(0);" name="radvdmanageden" id="radvdmanageden" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
						<label class="custom-control-label" for="radvdmanageden"><%tcWebApi_get("String_Entry","RadvdradvdmanagedenText","s")%></label>
					  </div>
					  <div class="custom-control custom-checkbox custom-control-inline">
<input type="checkbox" class="custom-control-input" onClick="RAMOClick(1);" name="radvdotheren" id="radvdotheren" checked <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
						<label class="custom-control-label" for="radvdotheren"><%tcWebApi_get("String_Entry","RadvdradvdotherenText","s")%></label>
					  </div>
			  </div>
					  <div class="col-md-3 form-group">
					  <label><%tcWebApi_get("String_Entry","LANJS11Text","s")%></label>
							  <div class="input-group">
<input type="text" class="form-control" maxLength="4" name="RACycMin" value="200"/>
								<div class="input-group-append">
									  <span class="input-group-text">[3 - 1350 S]</span>
								</div>
									  </div>
					  </div>
					  <div class="col-md-3 form-group">
					  <label><%tcWebApi_get("String_Entry","LANJS12Text","s")%></label>
							  <div class="input-group">
<input type="text" class="form-control" maxLength="4" name="RACycMax" value="<%if tcWebApi_get("Radvd_Entry","MaxRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxRAInterval","s") end if%>">
								<div class="input-group-append">
									  <span class="input-group-text">[4 - 1800 S]</span>
								</div>
									  </div>
					  </div>
			  </div>
</div>
			  <div class="col-md-12">
			  <hr class="margin_adjs" />
			  <div class="form-footer text-right p-3">
<button class="btn btn-orang btn-lg" type="button" onclick="RASubmit();"
name="btnRASubmit" value="Apply"><%tcWebApi_get("String_Entry","DHCPSAVEBUTTON","s")%></button>
			  </div>
					  <hr class="margin_adjs" />
			  </div>
</form>
<form class="row" id="ConfigForm1" name="ConfigForm1" action="/cgi-bin/net-dhcp.asp" method="post" >
			  <div class="col-md-12 form-group" >
					  <h2 class="sub_heading"><%tcWebApi_get("String_Entry","DHCPSettingText","s")%><input type="hidden" name="Dhcp1_Flag" value="0"/>
<input type="hidden" name="EnDHCPServerFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>"/>
<input type="hidden" name="DHCPSetTypeFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>"/>
<script language="JavaScript" type="text/JavaScript">
	function typev6Click()
{
with ( document.forms[2] )
{
if (getCheckVal('dhcp6SrvType') == 0)//unchecked
{
disableDhcp6Srv();
EnDHCPServerFlag.value = "0";
}
else
{
enableDhcp6Srv(1);
EnDHCPServerFlag.value = "1";
}
dnsSourceDisp();
}
}

function dnsSourceHide()
{
setDisplay('dnssourcepart', 0);
setDisplay('dnssourcepart_2', 0);
setDisplay('dnssourcepart_3', 0);
}
function dnsSourceDisp()
{
with (document.forms[2])
{
if (1 == getCheckVal('dhcp6SrvType'))
{
if ( 'Normal' == UseWan.value )
{
dnsSourceHide();
}
else
{
setDisplay('dnssourcepart', 1);
dnsSourceListChg();
}
}
else
{
dnsSourceHide();
}
}
}

function UseWanChange()
{
with (document.forms[2])
{
if ( ("Normal" == UseWan.value) && (1 == getCheckVal('dhcp6SrvType')) )
{
setDisplay('DHCP6SPrefixCfg', 1);
DHCPSetTypeFlag.value = "1";
}
else
{
if( "UseAllocatedSubnet" == UseWan.value)
DHCPSetTypeFlag.value = "0";
else if( "UseAllocatedOther" == UseWan.value)
DHCPSetTypeFlag.value = "2";
setDisplay('DHCP6SPrefixCfg', 0);
}

dnsSourceDisp();
}
}

function DhcpCheckForm(type)
{
with (document.forms[2])
{
if (1 != getCheckVal('dhcp6SrvType') || "Normal" != UseWan.value)
{
if ( 1 == getCheckVal('dhcp6SrvType') )
{
var dnsSourceType = getSelectVal('dnssource');

if ( '998' == dnsSourceType )
{
  if ("" == DnsSrvOne_Source.value || true != CheckPrefix(DnsSrvOne_Source.value,1))
  {
	  alert('<%tcWebApi_get("String_Entry","Dhcp6DnsSrvOneText","s")%>"' + DnsSrvOne_Source.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%> ');
	  return false;
  }
  
  if ("" != DnsSrvTwo_Source.value && true != CheckPrefix(DnsSrvTwo_Source.value,1))
  {
	  alert('<%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%> "' + DnsSrvTwo_Source.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%> ');
	  return false;
  }	
}
}

return true;
}

if (true != CheckPrefix(dhcpPrefix.value,0))
{
alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%>  "' + dhcpPrefix.value +'" <%tcWebApi_get("String_Entry","LANJS6Text","s")%> ');
return false;
}

if (true != CheckLength(PrefixLen.value))
{
alert("<%tcWebApi_get("String_Entry","LANJS7Text","s")%> \"" + PrefixLen.value + "\"<%tcWebApi_get("String_Entry","LANJS5Text","s")%> ");
return false;
}

switch (CheckTime(t1.value,t2.value))
{
case 1 :
{
alert('<%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%>"' + t1.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
return false;
}
case 2 :
{
alert('<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%> "' + t2.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
return false;
}
case 3 :
{
alert('<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%> ' + t2.value + '<%tcWebApi_get("String_Entry","LANJS30Text","s")%> ' + '<%tcWebApi_get("String_Entry","LANJS29Text","s")%>  ' + t1.value);
return false;
}
}

if ("" == DnsSrvOne.value || true != CheckPrefix(DnsSrvOne.value,1))
{
alert('<%tcWebApi_get("String_Entry","DHCP6DNSserverText","s")%>  "' + DnsSrvOne.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
return false;
}

if ("" != DnsSrvTwo.value && true != CheckPrefix(DnsSrvTwo.value,1))
{
alert('<%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%>  "' + DnsSrvTwo.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
return false;
}		
}
return true;
}

function btnDhcp1Save()
{
if (DhcpCheckForm() == true){
document.ConfigForm1.Dhcp1_Flag.value = "1";
if( true == setEBooValueCookie(document.ConfigForm1) )
document.ConfigForm1.submit();
}
}
	</script>
	</h2>
	<div class="custom-control custom-checkbox">
<input class="custom-control-input" id="dhcp6SrvType" onclick="typev6Click()" type=checkbox name="dhcp6SrvType" <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>

	  <label class="custom-control-label" for="dhcp6SrvType"><%tcWebApi_get("String_Entry","Dhcp6SrvTypeText","s")%><%tcWebApi_get("String_Entry","Dhcp6SrvEnableText","s")%></label>
	</div>
</div>
<div class="row col-md-12" id="AssConnection">
<div class="col-md-4 form-group">
	<label><%tcWebApi_get("String_Entry","Dhcp6SrvTypeModeText","s")%></label><br>
<select class="custom-select" id="UseWan"  onchange="UseWanChange()" name="UseWan">
	
	<OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedSubnetText","s")%></OPTION> 
	<OPTION value="Normal" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvNormalModeText","s")%></OPTION>

	<OPTION  value="UseAllocatedOther" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedOtherText","s")%></OPTION>

</select>
</div>

<div class="col-md-4 form-group" id='dnssourcepart'>
	<label><%tcWebApi_get("String_Entry","Dhcp6dnssourcepartText","s")%></label><br>
<select class="custom-select" id='dnssource' name="dnssource" onchange='dnsSourceListChg()'></SELECT>
<script language=JavaScript type=text/javascript>
initDnsSourceList();
</script>
</div>

<div class="col-md-4 form-group" id='dnssourcepart_2' style="display: none">
	<label><%tcWebApi_get("String_Entry","DHCP6DNSserverText","s")%></label>
<input type="text" class="form-control" maxLength=39 name="DnsSrvOne_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG>
</div>

<div class="col-md-4 form-group" id='dnssourcepart_3' style="display: none">
	<label><%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%></label>
<input type="text" class="form-control" maxLength=39 name="DnsSrvTwo_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
</div>

</div>
<div  class="col-md-12" id="DHCP6SPrefixCfg" style="display: none">

	<div class="row">
			<div class="col-md-3 form-group" >
					<label><%tcWebApi_get("String_Entry","DHCP6SPrefixCfgText","s")%></label>
					<br>
<SELECT id="AddrFormat" name="AddrFormat" class="custom-select">
<OPTION value="AddrPool" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "AddrPool" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6AddrPoolText","s")%></OPTION>
<OPTION value="EUI64" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "EUI64" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6EUI64Text","s")%></OPTION>
</SELECT>
			</div>
			<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","LANJS4Text","s")%> *</label>
<input type="text" class="form-control" maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="dhcpPrefix" value="">
	</div>
	<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","LANJS7Text","s")%> *</label>
			<div class="input-group">
<input type="text" class="form-control" maxLength=2 name="PrefixLen" value=""/>
			  <div class="input-group-append">
					<span class="input-group-text">[16 - 64]</span>
			  </div>
					</div>
	</div>
	<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%> *</label>
			<div class="input-group">
<input type="text" class="form-control" maxLength=10 name="t1" value="<%if tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "s") end if%>"/>
			  <div class="input-group-append">
					<span class="input-group-text">[60 - 4294967295 S]</span>
			  </div>
					</div>
	</div>
	<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%> *</label>
			<div class="input-group">
<input type="text" class="form-control" maxLength=10 name="t2" value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>"/>
			  <div class="input-group-append">
					<span class="input-group-text">[60 - 4294967295 S]</span>
			  </div>
					</div>
	</div>
			<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","DHCP6DNSserverText","s")%> *</label>
<input type="text" class="form-control" maxLength=39 name="DnsSrvOne" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>" />
	</div>
			<div class="col-md-3 form-group">
	<label><%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%></label>
<input type="text" class="form-control" maxLength=39 name="DnsSrvTwo" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
	</div>

	</div>
</div>

<div class="col-md-4 form-group" id='DHCP6SDomainName' style="display: none">
	<label>Domain name</label>
<input type="text" class="form-control" maxLength="16" name="DomainNameText" value="">
</div>

<div class="col-md-12">
<hr class="margin_adjs" />
<div class="form-footer text-right p-3">
<button  class="btn btn-orang btn-lg " type="button" onclick="btnDhcp1Save();" id="save_dhcp" name="save_dhcp" value="Apply"><%tcWebApi_get("String_Entry","DHCPSAVEBUTTON","s")%></button>
</div>
</div>
</form>
</div>

</div>

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
</div>
</div>
<!--//set display none-->


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script type="text/javascript" src="/JS/jquery.min.js"></script>
<script type="text/javascript" src="/JS/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="/Dashboard/Modules/leftmenu/js/Loader.js"></script>-->
<script type="text/javascript"  src="/JS/popper.min.js"></script>
<script  type="text/javascript" src="/JS/scoop.js"></script>
<script  type="text/javascript" src="/JS/left_menu.js"></script>
<script  type="text/javascript" src="/JS/jquery_mCustomScrollbar_concat.js"></script>
<script  type="text/javascript" src="/JS/jquery_mousewheel.js"></script>   


      <SCRIPT 
      language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>

      <!-- <TABLE id=table3 height=15 cellSpacing=0 cellPadding=0 width=808 
//         border=0><TBODY>
//         <TR>
//           <TD height=15><IMG height=15 src="/img/panel1.gif" width=164 
//             border=0> </TD>
//           <TD><IMG height=15 src="/img/panel2.gif" width=645 border=0> 
//           </TD></TR></TBODY></TABLE></TD></TR>
//   <TR>
//     <TD vAlign=top> -->
      

      <!-- <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=157 bgColor=#ef8218 height=30>
            <P class=Item_L1><%tcWebApi_get("String_Entry","IPV4SettingText","s")%></P></TD>
          <TD width=8 bgColor=#ef8218>��</TD>
          <TD width=474>��</TD>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") ="Yes" then %>
          <TD vAlign=top width=170 background=/img/panel4.gif rowSpan=6>
<% else %>
          <TD vAlign=top width=170 background=/img/panel4.gif rowSpan=8>
<%end if %>
            <TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
              <TBODY>
              <TR>
                <TD valign='top'><A 
                  href="/cgi-bin/help_content.asp#<%tcWebApi_get("String_Entry","LANJS35Text","s")%>" 
                  target=_blank><IMG height=34 src="<%tcWebApi_get("String_Entry","IMGHelpText","s")%>" 
                  width=40 border=0></A></TD></TR>
<% if tcwebApi_get("WebCustom_Entry","isWebTYLOGOSupported","h") = "Yes" then %>
              <TR>
                <TD valign='bottom'><IMG src='/img/tybottom.jpg' height=76 width=112></TD></TR>
<% end if %>  
              </TBODY></TABLE>�� </TD></TR>
        <TR>
          <TD vAlign=top width=157 bgColor=#e7e7e7 height=10></TD>
          <TD width=7 background=/img/panel3.gif>��</TD>
          <TD></TD></TR>
        <TR>
          <TD vAlign=top width=157 bgColor=#e7e7e7 height=30>
            <P class=Item_L2></P></TD>
          <TD width=7 background=/img/panel3.gif>��</TD>
          <TD>
            <FORM name="ConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <>"Yes" then %>
                <B><%tcWebApi_get("String_Entry","LANDHCP0Text","s")%></B><BR><BR><%tcWebApi_get("String_Entry","LANDHCP1Text","s")%><BR><%tcWebApi_get("String_Entry","LANDHCPAddrSetText","s")%><BR>
                <%tcWebApi_get("String_Entry","LANDHCPModeSetText","s")%><BR><BR>
<% end if %>  
                      <input type="hidden" name="portDHCPRelayFlag" id="portDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","PortDHCPRelay","s") %>">
                      <input type="hidden" name="portLan1" id="portLan1" value="<% tcWebApi_get("Dhcpd_Common","PortLan1","s") %>">
                      <input type="hidden" name="portLan2" id="portLan2"value="<% tcWebApi_get("Dhcpd_Common","PortLan2","s") %>">
                      <input type="hidden" name="portLan3" id="portLan3" value="<% tcWebApi_get("Dhcpd_Common","PortLan3","s") %>">
                      <input type="hidden" name="portLan4" id="portLan4" value="<% tcWebApi_get("Dhcpd_Common","PortLan4","s") %>">
                      <input type="hidden" name="portSSID1" id="portSSID1" value="<% tcWebApi_get("Dhcpd_Common","PortSSID1","s") %>">
                      <input type="hidden" name="portSSID2" id="portSSID2" value="<% tcWebApi_get("Dhcpd_Common","PortSSID2","s") %>">
                      <input type="hidden" name="portSSID3" id="portSSID3" value="<% tcWebApi_get("Dhcpd_Common","PortSSID3","s") %>">
                      <input type="hidden" name="portSSID4" id="portSSID4" value="<% tcWebApi_get("Dhcpd_Common","PortSSID4","s") %>">
                      <input type="hidden" name="DeviceDHCPRelayFlag" id="DeviceDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","DeviceDHCPRelay","s") %>">
                      <input type="hidden" name="IPV4_Flag" id="IPV4_Flag" value="0">
                      <input type="hidden" name="EthendIPcount" id="EthendIPcount" value="100">
                      <input type="hidden" name="DeviceendIPcount" id="DeviceendIPcount" value="80">  -->
                      
                  <!-- <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=150 height="24"><%tcWebApi_get("String_Entry","LANIPAddressText","s")%></TD>
                      <TD><INPUT maxLength=15 onchange=setDhcpAddresses(this.value) 
                      name="ethIpAddress" id="ethIpAddress" value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>"></TD></TR>
                    <TR>
                      <TD><%tcWebApi_get("String_Entry","LANMaskText","s")%></TD>
                      <TD><INPUT maxLength=15 onchange=setDhcpAddresses(ethIpAddress.value) 
                        name="ethSubnetMask" id="ethSubnetMask" value="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>"></TD></TR></TBODY></TABLE><BR>
                  <DIV id=upnpInfo>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY></TBODY></TABLE></DIV>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>		  
                    <TBODY>
                    <TR>
                      <TD colSpan=2><INPUT id=dhcpSrvType onclick="typeClick()" type=radio value="0" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") end if %>> &nbsp;&nbsp;<%tcWebApi_get("String_Entry","LANDHCPDISABLEText","s")%>
                        </TD></TR>
                    <TR>
                      <TD colSpan=2><INPUT id="dhcpSrvType" onclick="typeClick()"  type=radio  value="1" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %>> <NOBR>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","LANDHCPENABLEText","s")%></TD>
                      <TD>&nbsp;&nbsp;&nbsp;</TD>
                      <TD style="display:block"><NOBR><%tcWebApi_get("String_Entry","DEVICEMODEText","s")%>&nbsp; <SELECT onchange="IpPoolIndexChange()" size=1 id="IpPoolIndex" name="IpPoolIndex"> 
                      	<OPTION value="HGW" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "HGW" then asp_Write("selected") end if%>>HGW
                          <OPTION value="STB" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "STB" then asp_Write("selected") end if%>>STB
						  <OPTION value="Phone" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Phone" then asp_Write("selected") end if%>>Phone
						  <OPTION value="Camera" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Camera" then asp_Write("selected") end if%>>Camera
						  <OPTION value="Computer" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Computer" then asp_Write("selected") end if%>>Computer</OPTION>
						  </SELECT></NOBR></TD></TR>
					<TR>
 						<TD colSpan=2><INPUT id="dhcpSrvType" onclick="typeClick()"  type=radio  value="2" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "2" then asp_Write("checked") end if %>> <NOBR>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","LANDHCPRelayENABLEText","s")%></TD>
					</TR>
                    <TR id="dhcpstartaddr">
                      <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%></TD>
                      <TD><INPUT maxLength=15 id="dhcpEthStart" name="dhcpEthStart" value="<%if tcWebApi_get("Dhcpd_Common","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if %>"></TD>
                      <TD>&nbsp;&nbsp;&nbsp;</TD>
                      <TD style="display:block"><INPUT maxLength=15 id="dhcpEthStartFrag" name="dhcpEthStartFrag" value="<%if tcWebApi_get("Dhcpd_Option60","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","start","s") end if %>"></TD></TR>
                    <TR id="dhcpendaddr">
                      <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%></TD>
                      <TD><INPUT maxLength=15 id="dhcpEthEnd" name="dhcpEthEnd" value="<%if tcWebApi_get("Dhcpd_Common","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if %>"></TD>
                      <TD>&nbsp;&nbsp;&nbsp;</TD>
                      <TD style="display:block"><INPUT maxLength=15 id="dhcpEthEndFrag" name="dhcpEthEndFrag" value="<%if tcWebApi_get("Dhcpd_Option60","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","pool_count","s") end if %>"></TD></TR>
                    <TR id="dhcplease">
                      <TD><NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","DhcpLeasedTimeText","s")%></NOBR></TD>
                      <TD><SELECT size=1 name='dhcpLeasedTimeFrag' id='dhcpLeasedTimeFrag'>
                      	</SELECT>
                        <SCRIPT language=JavaScript type=text/javascript>
												initLeaseTimeTable();
												</SCRIPT>
                      </TD>
                      <TD>&nbsp;&nbsp;&nbsp;<input type=hidden name=RouteIPChangeFlag id=RouteIPChangeFlag value=0></TD>
                      <TD style="display:none"><%tcWebApi_get("String_Entry","DevicedhcpRelayText","s")%> <INPUT type=checkbox onclick=devicedhcpRelay() id=enableRelay name=enableRelay <%if tcWebApi_get("Dhcpd_Common","DeviceDHCPRelay","h") = "Yes" then asp_Write("checked") end if %>>
					  </TD></TR>
					  </TBODY></TABLE>
                  <DIV id=portrelayEnable>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                              <TD style="display:none"> <BR>
                                <%tcWebApi_get("String_Entry","DhcpSecPortRelayText","s")%> 
					  <INPUT id=enablePortRelay onclick="dhcpSecPortRelay()" type=checkbox name="enablePortRelay" <%if tcWebApi_get("Dhcpd_Common","PortDHCPRelay","h") = "Yes" then asp_Write("checked") end if%>> 
					  </TD></TR></TBODY></TABLE></DIV>
                  <DIV id=portrelayInfo>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD>
                        <DIV id=sec_lan1><INPUT id=PortRelay_lan1 type=checkbox name="PortRelay_lan1" <%if tcWebApi_get("Dhcpd_Common","PortLan1","h") = "Yes" then asp_Write("checked") end if %>> LAN 1 &nbsp; </DIV>
                        <DIV id=sec_ssid1><INPUT id=PortRelay_ssid1 
                        type=checkbox name="PortRelay_ssid1" <%if tcWebApi_get("Dhcpd_Common","PortSSID1","h") = "Yes" then asp_Write("checked") end if %>> SSID 1 </DIV></TD>
                      <TD>
                        <DIV id=sec_lan2><INPUT id=PortRelay_lan2 type=checkbox name="PortRelay_lan2" <%if tcWebApi_get("Dhcpd_Common","PortLan2","h") = "Yes" then asp_Write("checked") end if %>> LAN 2 &nbsp; </DIV>
                        <DIV id=sec_ssid2><INPUT id=PortRelay_ssid2 
                        type=checkbox name="PortRelay_ssid2" <%if tcWebApi_get("Dhcpd_Common","PortSSID2","h") = "Yes" then asp_Write("checked") end if %>> SSID 2 </DIV></TD>
                      <TD>
                        <DIV id=sec_lan3><INPUT id=PortRelay_lan3 type=checkbox name="PortRelay_lan3" <%if tcWebApi_get("Dhcpd_Common","PortLan3","h") = "Yes" then asp_Write("checked") end if %>> LAN 3 &nbsp; </DIV>
                        <DIV id=sec_ssid3><INPUT id=PortRelay_ssid3 
                        type=checkbox name="PortRelay_ssid3" <%if tcWebApi_get("Dhcpd_Common","PortSSID3","h") = "Yes" then asp_Write("checked") end if %>> SSID 3 </DIV></TD>
                      <TD>
                        <DIV id=sec_lan4><INPUT id=PortRelay_lan4 type=checkbox name="PortRelay_lan4" <%if tcWebApi_get("Dhcpd_Common","PortLan4","h") = "Yes" then asp_Write("checked") end if %>> LAN 4 &nbsp; </DIV>
                        <DIV id=sec_ssid4><INPUT id=PortRelay_ssid4 type=checkbox name="PortRelay_ssid4" <%if tcWebApi_get("Dhcpd_Common","PortSSID4","h") = "Yes" then asp_Write("checked") end if %>> SSID 4 
                  </DIV></TD></TR></TBODY></TABLE>
                      </DIV>
                      <P align=center> 
                        <INPUT style="DISPLAY: none" onclick=btnSaveIPv4() type=button name=button id=button_s value= "<%tcWebApi_get("String_Entry","DhcpButtonSaveText","s")%>"  >
                        <INPUT style="DISPLAY: none" onclick=btnSaveIPv4() type=button name=button id=button_r value= "<%tcWebApi_get("String_Entry","DhcpButtonSaveRestartText","s")%>" >
                      </P>
                      <DIV id=DhcprelayIP><NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","DhcpRelayServerIP","s")%>
                        <INPUT maxLength=15 name="dhcpRelayServerIP" id="dhcpRelayServerIP" value="<%if tcWebApi_get("DhcpRelay_Entry","Server","h" ) <> "N/A" then tcWebApi_get("DhcpRelay_Entry","Server","s" ) end if %>"></NOBR></P>
                      </DIV></TD>
                <TD width=10>&nbsp;</TD></TR><BR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD align=middle width=307>
				<input type=button onclick="btnSaveIPv4()" id=saveIPv4 name=saveIPv4 value="<%tcWebApi_get("String_Entry","DhcpButtonSaveText","s")%>"></TD>
                <TD width=10>&nbsp;</TD></TR></TBODY></TABLE></FORM></TD></TR>
        <TR>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") ="Yes" then %> 
          <TD vAlign=top width=157 bgColor=#e7e7e7></TD>
          <TD width=8 background=/img/panel3.gif></TD>
<% else %>
          <TD width=157 bgColor=#ef8218 height=30>
            <P class=Item_L1><%tcWebApi_get("String_Entry","IPV6SettingText","s")%></P></TD>
          <TD width=8 bgColor=#ef8218>��</TD>
<% end if %> 
          <TD width=474>��</TD></TR>
        <TR>
          <TD vAlign=top width=157 bgColor=#e7e7e7></TD>
          <TD width=8 background=/img/panel3.gif>��</TD>
          <TD>
              <FORM name="RAConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") ="Yes" then %>               
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="display:none;">
<% else %>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<% end if %>  
              <TBODY>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <P><%tcWebApi_get("String_Entry","IPV60Text","s")%></P>
                      <BR></TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD width=147><B><%tcWebApi_get("String_Entry","RASettingText","s")%></B><BR>
                      <input type="hidden" id="RA_Flag" name="RA_Flag" value="0">
                      <input type="hidden" id="RAEnable_Flag" name="RAEnable_Flag" value="<% tcWebApi_get("Radvd_Entry","Enable","s") %>">
                      <input type="hidden" id="RAMode" name="RAMode" value="<% tcWebApi_get("Radvd_Entry","Mode","s") %>">
                      <input type="hidden" id="RAManagedEn_Flag" name="RAManagedEn_Flag" value="<% tcWebApi_get("Radvd_Entry","ManagedEnable","s") %>">
			<input type="hidden" id="RAOtherEn_Flag" name="RAOtherEn_Flag" value="<% tcWebApi_get("Radvd_Entry","OtherEnable","s") %>"> -->
                      
<!-- </TD></TR>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD>
//                   <TABLE>
//                     <TBODY>
//                     <TR>
//                       <TD align=right width=120>SLAAC:&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT id=radvdSrvType onclick="RATypeClick();" type=checkbox name="radvdSrvType" <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","RAEnableText","s")%>
// 					  </TD></TR></TBODY></TABLE></TD></TR>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD>
//                   <DIV id=RAAssConnection style="DISPLAY: none">
//                   <TABLE>
//                     <TBODY>
//                     <TR>
//                       <TD align=right width=120><%tcWebApi_get("String_Entry","RASettingModeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><SELECT id=RAUseWan onchange="RAUseWanChange()" name="RAUseWan"> 
// 				<OPTION value="Normal" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANDHCPmanualDNSRelayText","s")%></OPTION> 
// 						<OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANDHCPautoDNSRelayText","s")%></OPTION>
// 						</SELECT></TD></TR>
//                     <TR id='rapdsourcepart' style="display: none">
//                       <TD align=right><%tcWebApi_get("String_Entry","RAPrefixText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left>
//                           <SELECT id=rapdsource name="rapdsource"></SELECT>
// 	              		      <script language=JavaScript type=text/javascript>
// 	                        initRaPDSourceList();
// 	                        </script>
//                       </TD>
//                     </TR>
// 										<TR id='ramoflagdisp' style="display: none">
// 					          	<TD align=right>&nbsp;</TD>
// 					         		<TD align=left>
// 												  <input type="checkbox" name="ramflag" id="ramflag" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","RAManagedEnableText","s")%>
// 													<input type="checkbox" name="raoflag" id="raoflag" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","RAOtherEnableText","s")%></TD>
// 					          </TR>
// 									</TBODY></TABLE></DIV></TD></TR>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD>
//                   <DIV id=RadvdPrefixCfg style="DISPLAY: none">
//                   <TABLE>
//                     <TBODY>
//                     <TR id=NamePrefix>
//                       <TD align=right width=120><%tcWebApi_get("String_Entry","RadvdPrefixText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=39 onchange="this.value = this.value.toLowerCase( )" id="radvdPrefix" name="radvdPrefix" value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>"> <STRONG 
//                         style="COLOR: #ff0033">*</STRONG></TD></TR>
//                     <TR id=NamePrefixLen>
//                       <TD width=120 height="26" align=right><%tcWebApi_get("String_Entry","RadvdNamePrefixLenText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=2 id="RAPrefixLen" name="RAPrefixLen" value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>"> <STRONG 
//                         style="COLOR: #ff0033">*</STRONG>[16 - 64]</TD></TR>
//                     <TR>
//                       <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=10 id="PreferredLifetime" name="PreferredLifetime" value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>"> 
//                         <STRONG style="COLOR: #ff0033">*</STRONG>[600 - 4294967295 S]</TD></TR>
//                     <TR>
//                       <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=10 id="ValidLifetime" name="ValidLifetime" value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>"> 
//                         <STRONG style="COLOR: #ff0033">*</STRONG>[600 - 4294967295 S]</TD></TR>
// 					<TR>
//                               <TD align=right width=120>&nbsp;&nbsp;&nbsp;</TD>
//                               <TD align=left width=307>
// 							  	<input type="checkbox" onClick="RAMOClick(0);" name="radvdmanageden" id="radvdmanageden" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","RadvdradvdmanagedenText","s")%>
// 								<input type="checkbox" onClick="RAMOClick(1);" name="radvdotheren" id="radvdotheren" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","RadvdradvdotherenText","s")%></TD>
//                             </TR>
// 					<TR>
//                               <TD align=right width=120><%tcWebApi_get("String_Entry","LANJS11Text","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=4 name="RACycMin" value="<%if tcWebApi_get("Radvd_Entry","MinRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MinRAInterval","s") end if%>">
//                                 <STRONG style="COLOR: #ff0033">*</STRONG>[3 - 
//                                 1350 S]</TD>
//                             </TR>
// 					<TR>
//                               <TD align=right width=120><%tcWebApi_get("String_Entry","LANJS12Text","s")%>&nbsp;&nbsp;&nbsp;</TD>
//                       <TD align=left width=307><INPUT maxLength=4 name="RACycMax" value="<%if tcWebApi_get("Radvd_Entry","MaxRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxRAInterval","s") end if%>">
//                                 <STRONG style="COLOR: #ff0033">*</STRONG>[4 - 
//                                 1800 S]</TD>
//                             </TR></TBODY></TABLE></DIV></TD></TR>
//               <TR>
//                 <TD colSpan=2><BR></TD></TR>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD align=middle width=307>
//                   <input type=button onclick="RASubmit()" id=btnRASubmit name=btnRASubmit value="<%tcWebApi_get("String_Entry","DHCPSAVEBUTTON","s")%>"></TD></TR>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD>
//                   <HR>
//                 </TD></TR></TBODY></TABLE></FORM></TD></TR>
//         <TR>
//           <TD vAlign=top width=157 bgColor=#e7e7e7></TD>
//           <TD width=8 background=/img/panel3.gif>��</TD>
//           <TD>
//             <FORM id=ConfigForm1 name="ConfigForm1" action="/cgi-bin/net-dhcp.asp" method="post">
// <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") ="Yes" then %>            
//             <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="display:none;">
// <% else %>
//             <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
// <% end if %>
//               <TBODY>
//               <TR>
//                 <TD width=10>&nbsp;</TD>
//                 <TD width=147><B><%tcWebApi_get("String_Entry","DHCPSettingText","s")%></B><BR>
//                       <input type="hidden" name="Dhcp1_Flag" value="0"> 
//                       <input type="hidden" name="EnDHCPServerFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>">
//                       <input type="hidden" name="DHCPSetTypeFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>"> -->
                     
                    <!-- </TD>
                  </TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","Dhcp6SrvTypeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT id=dhcp6SrvType onclick="typev6Click()" type=checkbox name="dhcp6SrvType" <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvEnableText","s")%></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <DIV id=AssConnection style="DISPLAY: none">
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","Dhcp6SrvTypeModeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><SELECT id=UseWan  onchange="UseWanChange()" name="UseWan"> 
						<OPTION value="Normal" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvNormalModeText","s")%></OPTION> 
						<OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedSubnetText","s")%></OPTION> 
						<OPTION  value="UseAllocatedOther" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedOtherText","s")%></OPTION>
						  </SELECT></TD></TR>
						         <TR id='dnssourcepart' style="display: none">
                      <TD align=right width=120><%tcWebApi_get("String_Entry","Dhcp6dnssourcepartText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307>
                          <SELECT id=dnssource name="dnssource" onchange='dnsSourceListChg()'></SELECT>
	              		      <script language=JavaScript type=text/javascript>
	                        initDnsSourceList();
	                        </script>
                       </TD>
                    </TR> 
										<TR id='dnssourcepart_2' style="display: none">
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6DNSserverText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=39 name="DnsSrvOne_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG>
                      </TD></TR>
                    <TR id='dnssourcepart_3' style="display: none">
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=39 name="DnsSrvTwo_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
                      </TD></TR>
						  </TBODY></TABLE></DIV></TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <DIV id=DHCP6SPrefixCfg style="DISPLAY: none">
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6SPrefixCfgText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307>
                          <SELECT id=AddrFormat name="AddrFormat"> 
                          <OPTION value="AddrPool" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "AddrPool" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6AddrPoolText","s")%></OPTION> 
                          <OPTION value="EUI64" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "EUI64" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6EUI64Text","s")%></OPTION>
                          </SELECT>
                       </TD>
                    </TR> 
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","LANJS4Text","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="dhcpPrefix" value="<%if tcWebApi_get("Dhcp6s_Entry","PrefixIPv6", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG></TD></TR>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","LANJS7Text","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=2 name="PrefixLen" value="<%if tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG>[16 - 64]</TD></TR>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=10 name="t1" value="<%if tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG>[60 - 1073741825 S]</TD></TR>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=10 name="t2" value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG>[60 
                        - 4294967295 S]</TD></TR>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6DNSserverText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=39 name="DnsSrvOne" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>"><STRONG style="COLOR: #ff0033">*</STRONG></TD></TR>
                    <TR>
                      <TD align=right width=120><%tcWebApi_get("String_Entry","DHCP6SecDNSserverText","s")%>&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307><INPUT maxLength=39 name="DnsSrvTwo" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>"></TD></TR></TBODY></TABLE></DIV></TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <DIV id=DHCP6SDomainName style="DISPLAY: none">
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=right width=120>Domain 
                      name:&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left width=307>
					  <INPUT maxLength=16 name=DomainNameText value="<%if tcWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then tcWebApi_get("Ddns_Entry","MYHOST","s") end if%>">
					  </TD></TR></TBODY></TABLE></DIV></TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD align=middle width=307>
                	<input type=button onclick="btnDhcp1Save()" id=save_dhcp name=save_dhcp value="<%tcWebApi_get("String_Entry","DHCPSAVEBUTTON","s")%>">
				</TD></TR></TBODY></TABLE></FORM></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=808 
        border=0><TBODY>
        <TR>
          <TD width=162 bgColor=#ef8218>��</TD>
          <TD width=278 bgColor=#427594>��</TD>
          <TD width=196 bgColor=#427594>
            <P align=center>&nbsp;&nbsp;<img src="/img/cancel.gif" width="80" height="23" border="0" id="btnCancel" onClick=""--> 
<!-- InstanceEndEditable -->
			<!-- </P></TD>
          <TD width=170 
bgColor=#313031>��</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR></BODY> --> 
	</body>
</HTML>
