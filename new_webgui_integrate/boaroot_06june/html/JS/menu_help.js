//var AclFilterEditRule = new Array();
//var AclEditNumber = -1;
//var ssidIdx = 0;
//var lanDevIndex = 1;
//var QoSCurInterface = '';
//var DDNSProvider = '';
//var curUser = '<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>';
//var ripIndex = "";
//var previousPage = "";
//var gateWayName = '<%tcWebApi_get("DeviceInfo","GateWay","s")%>';
//<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
//var ModelName_dev = '<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%>';
//<% if tcwebApi_get("WebCustom_Entry","isCTSFUC9Supported","h") = "Yes" then %>
//var ModelName = "SFU";
//<% else %>
//var ModelName = "E8-B-GPON";
//<% end if %>
//<% else %>
//var ModelName = '<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%>';
//<% end if %> 
//var IPv6Support = '<%tcWebApi_get("WebCustom_Entry","isIPv6Supported","s")%>';
//var ipsecSupport = '<%tcWebApi_get("WebCustom_Entry","isIpsecSupported","s")%>';
//var pageMap =  new Array();//pageMap[8][9]
//var voipType = '<%tcWebApi_get("VoIPBasic_Common", "SIPProtocol","s")%>';

//var Content_Status='<%tcWebApi_get("String_Entry","ContentStatusText","s")%>';
//var Content_DeviceInfo='<%tcWebApi_get("String_Entry","ContentDeviceInfoText","s")%>';
//var Content_NetInfo='<%tcWebApi_get("String_Entry","ContentNetInfoText","s")%>';
//var Content_UserInfo='<%tcWebApi_get("String_Entry","ContentUserInfoText","s")%>';
//var Content_VoIPInfo='<%tcWebApi_get("String_Entry","ContentVoIPInfoText","s")%>';
//var Content_CWMPInfo='<%tcWebApi_get("String_Entry","ContentCWMPStatusText","s")%>';

//var Content_Net='<%tcWebApi_get("String_Entry","ContentNetText","s")%>';
//var Content_WAN='<%tcWebApi_get("String_Entry","ContentWANText","s")%>';
//var Content_Binding='<%tcWebApi_get("String_Entry","ContentBindingText","s")%>';
//var Content_LAN='<%tcWebApi_get("String_Entry","ContentLANText","s")%>';
//var Content_WLAN='<%tcWebApi_get("String_Entry","ContentWLANText","s")%>';
//var Content_WLAN5G='<%tcWebApi_get("String_Entry","ContentWLAN5GText","s")%>';
//var Content_CWMP='<%tcWebApi_get("String_Entry","ContentCWMPText","s")%>';
//var Content_Iphone='<%tcWebApi_get("String_Entry","ContentIphoneText","s")%>';
//var Content_Qos='<%tcWebApi_get("String_Entry","ContentQosText","s")%>';
//var Content_Time='<%tcWebApi_get("String_Entry","ContentTimeText","s")%>';
//var Content_Route='<%tcWebApi_get("String_Entry","ContentRouteText","s")%>';
//var Content_QosBand='<%tcWebApi_get("String_Entry","ContentQoSBandWidthText","s")%>';

//var Content_Security='<%tcWebApi_get("String_Entry","ContentSecurityText","s")%>';
//var Content_WANSet='<%tcWebApi_get("String_Entry","ContentWANSetText","s")%>';
//var Content_Firewall='<%tcWebApi_get("String_Entry","ContentFirewallText","s")%>';
//var Content_MACFilter='<%tcWebApi_get("String_Entry","ContentMACFilterText","s")%>';
//var Content_PortFilter='<%tcWebApi_get("String_Entry","ContentPortFilterText","s")%>';
//var Content_AclFilter='<%tcWebApi_get("String_Entry","ContentAclFilterText","s")%>';
//var Content_Parental='<%tcWebApi_get("String_Entry","ContentParentalText","s")%>';

//var Content_APP='<%tcWebApi_get("String_Entry","ContentAPPText","s")%>';
//var Content_DDNS='<%tcWebApi_get("String_Entry","ContentDDNSText","s")%>';
//var Content_NAT='<%tcWebApi_get("String_Entry","ContentAdvancedNATText","s")%>';
//var Content_UPNP='<%tcWebApi_get("String_Entry","ContentUPNPText","s")%>';
//var Content_VoIPSet='<%tcWebApi_get("String_Entry","ContentVoIPSetText","s")%>';
//var Content_IGMPOrMLD='<%tcWebApi_get("String_Entry","ContentIGMPMLDText","s")%>';
//var Content_IGMP='<%tcWebApi_get("String_Entry","ContentIGMPText","s")%>';
//var Content_DailyAPP='<%tcWebApi_get("String_Entry","ContentDailyAPPText","s")%>';
//var Content_SAMBA='<%tcWebApi_get("String_Entry","ContentSAMBAText","s")%>';
//var Content_VPN='<%tcWebApi_get("String_Entry","ContentVPNText","s")%>';
//var Content_SNMP='<%tcWebApi_get("String_Entry","ContentSNMPText","s")%>';

//var Content_Management='<%tcWebApi_get("String_Entry","ContentManageText","s")%>';
//var Content_UserManagement='<%tcWebApi_get("String_Entry","ContentUserManagementText","s")%>';
//var Content_DeviceManagement='<%tcWebApi_get("String_Entry","ContentDeviceManagementText","s")%>';
//var Content_LogManagement='<%tcWebApi_get("String_Entry","ContentLogManagementText","s")%>';
//var Content_Upgrade='<%tcWebApi_get("String_Entry","ContentUpgradeText","s")%>'

//var Content_Diagnose='<%tcWebApi_get("String_Entry","ContentDiagnoseText","s")%>';
//var Content_InternetDiagnose='<%tcWebApi_get("String_Entry","ContentInternetDiagnoseText","s")%>';
//var Content_Help='<%tcWebApi_get("String_Entry","ContentHelpText","s")%>';
//var Content_UseHelp='<%tcWebApi_get("String_Entry","ContentUseHelpText","s")%>';

//for (i = 0; i < 8; i++)
//{
//    pageMap[i] = new Array();
//}
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "0")%>
//pageMap[0][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit0","s") %>';
//pageMap[1][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit1","s") %>';
//pageMap[2][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit2","s") %>';
//pageMap[3][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit3","s") %>';
//pageMap[4][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit4","s") %>';
//pageMap[5][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit5","s") %>';
//pageMap[6][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit6","s") %>';
//pageMap[7][0] = '<% tcWebApi_get("dynDisp_Entry","MainMaskBit7","s") %>';
//pageMap[0][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[0][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[0][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//pageMap[0][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//pageMap[0][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[0][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[0][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[0][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "1")%>
//pageMap[1][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[1][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[1][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
//if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
//if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
//pageMap[1][4] = 0;
//<%else%>
//pageMap[1][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if
//else%>
//pageMap[1][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if
//else%>
//pageMap[1][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if %>
//pageMap[1][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[1][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[1][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[1][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "2")%>
//pageMap[2][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[2][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[2][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isWLanSupported","h") = "Yes" then%>
//pageMap[2][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% else %>
//pageMap[2][4] = 0;
//<% end if %>
//pageMap[2][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[2][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[2][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[2][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isCTPHONEAPPSupported","h") = "Yes" then%>
//pageMap[2][9] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit8","s") %>';
//<% else %>
//pageMap[2][9] = 0;
//<% end if %>
//<% if tcWebApi_get("WebCustom_Entry", "isCTPONCYJXSupported","h") = "Yes" then%>
//pageMap[2][10] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit9","s") %>';
//<% else %>
//pageMap[2][10] = 0;
//<% end if %>
//<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
//pageMap[2][11] = 1;
//<% else %>
//pageMap[2][11] = 0;
//<% end if %>
//<% if tcWebApi_get("WebCustom_Entry", "isStaticNatSupported","h") = "Yes" then %>
//pageMap[2][12] = 1;
//<% else %>
//pageMap[2][12] = 0;
//<% end if %>
//<% if tcWebApi_get("WebCustom_Entry", "isL2ogreWebSupported","h") = "Yes" then %>
//pageMap[2][13] = 1;
//<% else %>
//pageMap[2][13] = 0;	
//<% end if %>
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "3")%>
//pageMap[3][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[3][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[3][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//pageMap[3][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//pageMap[3][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isParentalSupported","h") = "Yes" then %>
//pageMap[3][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//<% else %>
//pageMap[3][6] = 0;
//<% end if %>
//pageMap[3][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[3][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isMacDupDetect","h") = "Yes" then %>
//pageMap[3][9] = 1;
//<% else %>
//pageMap[3][9] = 0;
//<% end if %>
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "4")%>
//pageMap[4][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[4][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[4][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
//if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
//if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
//pageMap[4][4] = 0;
//<%else%>
//pageMap[4][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if
//else%>
//pageMap[4][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if
//else%>
//pageMap[4][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//<% end if %>
//pageMap[4][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[4][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isSambaWebSupported","h") = "Yes" then %>
//pageMap[4][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//<% else %>
//pageMap[4][7] = 0;
//<% end if %>
//pageMap[4][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% if tcWebApi_get("WebCustom_Entry", "isSnmpWebSupported","h") = "Yes" then %>
//pageMap[4][9] = 1;	
//<% else %>
//pageMap[4][9] = 0;	
//<% end if %>
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "5")%>
//pageMap[5][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[5][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[5][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//pageMap[5][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//pageMap[5][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[5][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[5][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[5][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
//pageMap[6][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[6][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[6][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//pageMap[6][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//pageMap[6][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[6][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[6][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[6][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';
//<% tcWebApi_set("dynDisp_Entry", "CurPage", "7")%>
//pageMap[7][1] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit0","s") %>';
//pageMap[7][2] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit1","s") %>';
//pageMap[7][3] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit2","s") %>';
//pageMap[7][4] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit3","s") %>';
//pageMap[7][5] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit4","s") %>';
//pageMap[7][6] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit5","s") %>';
//pageMap[7][7] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit6","s") %>';
//pageMap[7][8] = '<% tcWebApi_get("dynDisp_Entry","CurMaskBit7","s") %>';

// JavaScript Document
var curUserName = curUser;
if (typeof(curUserName) == "undefined")
	curUserName = '0';
var vPageMap = pageMap;
if(voipType!= null)
	var VoipType = voipType;
else
	var VoipType = "SIP";
//if (typeof(vPageMap) == "undefined")
//	top.window.location.href="/cgi-bin/content.asp";
var sysUserName = '1';
var sptUserName = '0';
var ctcqdUserName = 'ctcqd';
var bandRegName = 'regAcc';
var usrUserName = 0;
var iCount = 0;
var IsIPv6Support = IPv6Support;
if (typeof(IsIPv6Support) == "undefined")
	IsIPv6Support = 'No';
var isIpsecSupport = ipsecSupport;
if (typeof(isIpsecSupport) == "undefined")
	isIpsecSupport = 'No';
var MenuArray = new Array();

var Menu_Status = Content_Status;
var Menu_DeviceInfo = Content_DeviceInfo;
var Menu_NetInfo = Content_NetInfo;
var Menu_UserInfo = Content_UserInfo;
var Menu_VoIPInfo = Content_VoIPInfo;
var Menu_CWMPInfo = Content_CWMPInfo;

var Menu_Net = Content_Net;
var Menu_WAN = Content_WAN;
var Menu_Binding = Content_Binding;
var Menu_LAN = Content_LAN;
var Menu_WLAN = Content_WLAN;
var Menu_WLAN5G = Content_WLAN5G;
var Menu_CWMP = Content_CWMP;
var Menu_Iphone = Content_Iphone;
var Menu_Time = Content_Time;
var Menu_Qos = Content_Qos;
var Menu_Route = Content_Route;
var Menu_QosBand = Content_QosBand;

var Menu_Security=Content_Security;
var Menu_WANSet=Content_WANSet;
var Menu_Firewall=Content_Firewall;
var Menu_MACFilter=Content_MACFilter;
var Menu_PortFilter=Content_PortFilter;
var Menu_AclFilter=Content_AclFilter;
var Menu_Parental=Content_Parental;

var Menu_APP = Content_APP;
var Menu_DDNS = Content_DDNS;
var Menu_NAT = Content_NAT;
var Menu_UPNP = Content_UPNP;
var Menu_VoIPSet = Content_VoIPSet;
var Menu_IGMPOrMLD = Content_IGMPOrMLD;
var Menu_IGMP = Content_IGMP;
var Menu_DailyAPP = Content_DailyAPP;
var Menu_SAMBA = Content_SAMBA;
var Menu_VPN = Content_VPN;
var Menu_SNMP = Content_SNMP;

var Menu_Management = Content_Management;
var Menu_UserManagement = Content_UserManagement;
var Menu_DeviceManagement = Content_DeviceManagement;
var Menu_LogManagement = Content_LogManagement;
var Menu_Upgrade = Content_Upgrade;

var Menu_Diagnose = Content_Diagnose;
var Menu_InternetDiagnose = .Content_InternetDiagnose;
var Menu_Help = Content_Help;
var Menu_UseHelp = Content_UseHelp;

//QS->0
//Sta->1
if(vPageMap[1][0] == '1'){
	if(vPageMap[1][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-device.asp", "");
	else if(vPageMap[1][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-network.asp", "");
	else if(vPageMap[1][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-user.asp", "");
	else if(vPageMap[1][4] == '1')
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-VoIP.asp", "");
	else if(vPageMap[1][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Status, "/cgi-bin/sta-acs.asp", "");							
}
if(vPageMap[1][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_DeviceInfo, "/cgi-bin/sta-device.asp", "");
if(vPageMap[1][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_NetInfo, "/cgi-bin/sta-network.asp", "");
if(vPageMap[1][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_UserInfo, "/cgi-bin/sta-user.asp", "");
if(vPageMap[1][4] == '1')
    if(VoipType == 'H.248')
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_VoIPInfo, "/cgi-bin/sta-VoIP248.asp", "");
	else
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_VoIPInfo, "/cgi-bin/sta-VoIP.asp", "");
if(vPageMap[1][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_CWMPInfo, "/cgi-bin/sta-acs.asp", "");
//Net->2
if(vPageMap[2][0] == '1'){
	if(vPageMap[2][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-wanset.asp", "");
	else if(vPageMap[2][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-binding.asp", "");
	else if(vPageMap[2][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-dhcp.asp", "");
	else if(vPageMap[2][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-wlan.asp", "");
	else if(vPageMap[2][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-tr069.asp", "");
	else if(vPageMap[2][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-phoneapp.asp", "");
	else if(vPageMap[2][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-qos.asp", "");
	else if(vPageMap[2][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-time.asp", "");
	else if(vPageMap[2][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/net-routeset.asp", "");	
	else if(vPageMap[2][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Net, "/cgi-bin/qos-dslimit.asp", "");								
}
if(vPageMap[2][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_WAN, "/cgi-bin/net-wanset.asp", "");
if(vPageMap[2][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Binding, "/cgi-bin/net-binding.asp", "");
if(vPageMap[2][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_LAN, "/cgi-bin/net-dhcp.asp", "");
if(vPageMap[2][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_WLAN, "/cgi-bin/net-wlan.asp", "");
if(vPageMap[2][11] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_WLAN5G, "/cgi-bin/net-wlan11ac.asp", "");
if(vPageMap[2][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_CWMP, "/cgi-bin/net-tr069.asp", "");
if(vPageMap[2][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Iphone, "/cgi-bin/net-phoneapp.asp", "");
if(vPageMap[2][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Qos, "/cgi-bin/net-qos.asp", "");
if(vPageMap[2][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Time, "/cgi-bin/net-time.asp", "");
if(vPageMap[2][8] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Route, "/cgi-bin/net-routeset.asp", "");
if(vPageMap[2][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_QosBand, "/cgi-bin/qos-dslimit.asp", "");
//Sec->3
if(vPageMap[3][0] == '1'){
	if(vPageMap[3][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-urlfilter.asp", "");
	else if(vPageMap[3][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-firewall.asp", "");
	else if(vPageMap[3][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-macfilter.asp", "");
	else if(vPageMap[3][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-portfilter.asp", "");				
	else if(vPageMap[3][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-aclfilter.asp", "");				
	else if(vPageMap[3][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Security, "/cgi-bin/sec-parental.asp", "");			
}
if(vPageMap[3][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_WANSet, "/cgi-bin/sec-urlfilter.asp", "");
if(vPageMap[3][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Firewall, "/cgi-bin/sec-firewall.asp", "");
if(vPageMap[3][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_MACFilter, "/cgi-bin/sec-macfilter.asp", "");
if(vPageMap[3][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_PortFilter, "/cgi-bin/sec-portfilter.asp", "");
if(vPageMap[3][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_AclFilter, "/cgi-bin/sec-aclfilter.asp", "");
if(vPageMap[3][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_Parental, "/cgi-bin/sec-parental.asp", "");
//App->4
if(vPageMap[4][0] == '1'){
	if(vPageMap[4][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-ddns.asp", "");
	else if(vPageMap[4][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-natset.asp", "");
	else if(vPageMap[4][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-upnp.asp", "");
	else if(vPageMap[4][4] == '1')
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-VoIP.asp", "");
	else if(vPageMap[4][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-igmpset.asp", "");
	else if(vPageMap[4][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-daily.asp", "");						
	else if(vPageMap[4][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-samba.asp", "");								
	else if(vPageMap[4][8] == '1') {
		if(isIpsecSupport == 'Yes')
			MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-ipsecList.asp", "");
	}		
	else if(vPageMap[4][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_APP, "/cgi-bin/app-snmp.asp", "");	
}
if(vPageMap[4][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_DDNS, "/cgi-bin/app-ddns.asp", "");
if(vPageMap[4][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_NAT, "/cgi-bin/app-natset.asp", "");
if(vPageMap[4][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_UPNP, "/cgi-bin/app-upnp.asp", "");
if(vPageMap[4][4] == '1')
	if(VoipType == 'H.248')
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_VoIPSet, "/cgi-bin/app-VoIP248.asp", "");
	else
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_VoIPSet, "/cgi-bin/app-VoIP.asp", "");
if(vPageMap[4][5] == '1')
{
	if(IsIPv6Support == 'Yes')
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_IGMPOrMLD, "/cgi-bin/app-igmpset.asp", "");
	else
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_IGMP, "/cgi-bin/app-igmpset.asp", "");
}
if(vPageMap[4][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_DailyAPP, "/cgi-bin/app-daily.asp", "");
	if(vPageMap[4][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_SAMBA, "/cgi-bin/app-samba.asp", "");
if(vPageMap[4][8] == '1') {
	if(isIpsecSupport == 'Yes')
		MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_VPN, "/cgi-bin/app-ipsecList.asp", "");
}
if(vPageMap[4][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_SNMP, "/cgi-bin/app-snmp.asp", "");
//Mag->5
if(vPageMap[5][0] == '1'){
	if(vPageMap[5][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Management, "/cgi-bin/mag-account.asp", "");
	else if(vPageMap[5][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Management, "/cgi-bin/mag-reset.asp", "");
	else if(vPageMap[5][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Management, "/cgi-bin/mag-syslogmanage.asp", "");		
}
if(vPageMap[5][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_UserManagement, "/cgi-bin/mag-account.asp", "");
if(vPageMap[5][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_DeviceManagement, "/cgi-bin/mag-reset.asp", "");
if(vPageMap[5][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_LogManagement, "/cgi-bin/mag-syslogmanage.asp", "");
//Diag->6
if(vPageMap[6][0] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Diagnose, "/cgi-bin/diag-quickdiagnose.asp", "");
if(vPageMap[6][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_InternetDiagnose, "/cgi-bin/diag-quickdiagnose.asp", "");
//Help->7
if(vPageMap[7][0] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(1, Menu_Help, "/cgi-bin/help.asp", "");
if(vPageMap[7][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, Menu_UseHelp, "/cgi-bin/help.asp", "");

MenuArray[iCount++] = new MenuNodeConstruction(0, "", "", "");

function MenuNodeConstruction(Level, Text, Link, Target)
{
    this.Level = Level;
    this.Text = Text;
    this.Link = Link;
    this.Target = Target;
}

function MakeMenu(Selected_Menu, MenuId, selectMenu)
{
	var Menu = Selected_Menu.split("->");
	MakeMenu_L2(Menu[1], MakeMenu_L1(Menu[0]), MenuId, selectMenu);
}

function MakeMenu_L1(Menu_Text)
{
	var Menu_L2_Start;
	var Code = '<table border="0" cellpadding="0" cellspacing="0" height="43px">';
	
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td height="15px"><img src="/img/back_button.jpg"></td>';
			}
			else
			{
				Menu_L2_Start = iCount + 1;
				Code += '<td height="15px"><img src="/img/selected_button.jpg"></td>';
			}
		}
	}
	Code += '</tr><tr>';
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 1)
		{
			var s = MenuArray[iCount].Link;
			var x = s.lastIndexOf("/");
			var y = s.indexOf(".asp");
			var ss = s.substring(x+1,y);
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td bgcolor="#EF8218" height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + ss + '  name=' + ss + ' class="Menu_L1_Link"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
			else
			{
				Code += '<td bgcolor="#427594" height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + ss + '  name=' + ss + ' class="Menu_L1_Active"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
		}
	}
	Code += '</tr></table>';
	//getElement('MenuArea_L1').innerHTML = Code;
	return Menu_L2_Start;
}

function LoadPage(strIndex)
{
	var index = parseInt(strIndex);
	location = MenuArray[index].Link;
}

function MakeMenu_L2(Menu_Text, Start, MenuId, selectMenu)
{
	var Code = '';
	for (var iCount = Start; (MenuArray[iCount].Level != 0) && (MenuArray[iCount].Level != 1); iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 2)
		{
			var s = MenuArray[iCount].Link;
			var x = s.lastIndexOf("/");
			var y = s.indexOf(".asp");
			var ss = s.substring(x+1,y);
			if (MenuArray[iCount].Text == Menu_Text && selectMenu) {
			    Code += '<li class=" active"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + ss + '  name=' + ss + ' >' + MenuArray[iCount].Text + '</a></td>';
			}
			else  {
			    Code += '<li class=" "><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + ss + '  name=' + ss + ' >' + MenuArray[iCount].Text + '</a></td>';
			}
			 
			Code += '';
		}
	}
	Code += '';
	getElement(MenuId).innerHTML = Code;
}
 
function DisplayLocation(Selected_Menu)
{
	var Menu = Selected_Menu.split("->");
	getElement('LocationDisplay').innerHTML = Menu[0];
}

function getElement(sId)
{
    var ele = getElementByName(sId); 
    if (ele == null)
    {
        return getElementById(sId);
    }
    return ele;
}

function getElementByName(sId)
{    // standard
    if (document.getElementsByName)
    {
        var element = document.getElementsByName(sId);
		
        if (element.length == 0)
        {
            return null;
        }
        else if (element.length == 1)
        {
            return 	element[0];
        }
		
        return element;		
    }
}
function getElById(sId)
{
    return getElement(sId);
}

function getElementById(sId)
{
    if (document.getElementById)
    {
        return document.getElementById(sId);	
    }
    else if (document.all)
    {
        // old IE
        return document.all(sId);
    }
    else if (document.layers)
    {
        // Netscape 4
        return document.layers[sId];
    }
    else
    {
        return null;
    }
}