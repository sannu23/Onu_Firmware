<%
if Request_Form("SSID_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","wlan_id", "wlSsidIdx")
end if

If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "CANADA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "COLOMBIA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "DOMINICAN REPUBLIC" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "GUATEMALA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "MEXICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "NORWAY" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PANAMA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PUERTO RICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UNITED STATES" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	else
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion1")
	end if
End If
if Request_Form("Save_Flag") = "1" then

	if Request_Form("isDot1XSupported")  = "1" then
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter")
			TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter")
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key")
		if Request_Form("isDot1XEnhanceSupported") = "1" then
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP5")
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port5")
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key5")
		end if
	end if		

	if Request_Form("wlSsidIdx") <> tcWebApi_get("WebCurSet_Entry","wlan_id", "h") then
		tcWebApi_constSet("WebCurSet_Entry", "wlan_id", "0")
	else
if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then	
	TCWebApi_set("WLan_Common","HT_TxStream","TxStream_Action")	
	TCWebApi_set("WLan_Common","HT_RxStream","RxStream_Action")	
end if	
	TCWebApi_set("WLan_Common", "APOn", "hwlEnbl")
	TCWebApi_set("WLan_Common","WirelessMode", "hwlgMode")
if tcWebApi_get("Info_WLan","isWHNATSupported","h") = "Yes" then 	
	TCWebApi_set("WLan_Common","WHNAT","WLANTxOffload")
end if
if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then	
	TCWebApi_set("WLan_Common","ITxBfEn","WLanITxBfEn")
	TCWebApi_set("WLan_Common","ETxBfEnCond","WLanETxBfEnCond")
	TCWebApi_set("WLan_Common","ETxBfIncapable","WLanETxBfIncapable")
end if	
	TCWebApi_set("WLan_Common","Channel", "wlChannel")
	TCWebApi_set("WLan_Entry","HT_RATE", "wlRate")
	if Request_Form("wlTxPwr") = "6" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel", "6")
		tcWebApi_constSet("WLan_Common","PaMode", "1")
		tcWebApi_constSet("WLan_Common","PowerLevel", "128")
	elseif Request_Form("wlTxPwr") = "1" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel","1")
		tcWebApi_constSet("WLan_Common","PowerLevel", "100")
		tcWebApi_constSet("WLan_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "2" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel","2")
		tcWebApi_constSet("WLan_Common","PowerLevel", "80")
		tcWebApi_constSet("WLan_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "3" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel","3")
		tcWebApi_constSet("WLan_Common","PowerLevel", "60")
		tcWebApi_constSet("WLan_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "4" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel","4")
		tcWebApi_constSet("WLan_Common","PowerLevel", "40")
		tcWebApi_constSet("WLan_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "5" then
		tcWebApi_constSet("WLan_Common","TxPowerLevel","5")
		tcWebApi_constSet("WLan_Common","PowerLevel", "20")
		tcWebApi_constSet("WLan_Common","PaMode", "0")
	end if
	TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
  	TCWebApi_set("WLan_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan_Common","DtimPeriod","wlNetReauth")
	if Request_Form("bwControl") = "0" then
		tcWebApi_constSet("WLan_Common","HT_BW","0")
	else
		tcWebApi_constSet("WLan_Common","HT_BW","1")
	end if
	TCWebApi_set("WLan_Common","HT_GI","giControl")	
	TCWebApi_set("WLan_Entry", "HideSSID", "hwlHide")
	TCWebApi_set("WLan_Entry","SSID", "wlSsid")	
	if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then
	TCWebApi_set("WLan_Entry","HT_MCS","wlMcs")
	end if 
	TCWebApi_set("WLan_Entry","EnableSSID","henableSsid")
        tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "0")
	if Request_Form("hwlgMode") = "6" then
		if Request_Form("bwControl") = "1" then
			tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
		end if
	end if	
	if Request_Form("hwlgMode") = "7" then
		if Request_Form("bwControl") = "1" then
			tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
		end if
	end if
	if Request_Form("hwlgMode") = "9" then
		if Request_Form("bwControl") = "1" then
			tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
		end if
	end if
	if Request_Form("hwlgMode") = "16" then
		if Request_Form("bwControl") = "1" then
			tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
		end if
	end if
	if Request_Form("hwlgMode") = "16" then
		if Request_Form("bwControl") = "1" then
			tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
		end if
	end if	
	if tcwebApi_get("WebCustom_Entry","isMaxStaNumSupported","h" ) = "Yes" then
		TCWebApi_set("WLan_Entry","MaxStaNum", "wlAssociateNum")
	end if
	TCWebApi_set("WLan_Entry", "AuthMode","hwlAuthMode")
	TCWebApi_set("WLan_Entry","WPAPSK","wlWpaPsk")
	TCWebApi_set("WLan_Entry","WEPAuthType","wlWep")
	TCWebApi_set("WLan_Entry","AuthKeyLen","wlKeyBit")
	TCWebApi_set("WLan_Entry","EncrypType","wlWpa")
	TCWebApi_set("WLan_Entry","DefaultKeyID","wlKeyIndex")
	TCWebApi_set("WLan_Entry","Key1Str","hwlKeys0")
	TCWebApi_set("WLan_Entry","Key2Str","hwlKeys1")
	TCWebApi_set("WLan_Entry","Key3Str","hwlKeys2")
	TCWebApi_set("WLan_Entry","Key4Str","hwlKeys3")
	If tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan_Common", "TWTSupport", "TWTSupport")
		TCWebApi_set("Wlan_Common", "MuOfdmaDlEnable", "WlanMuOfdmaDlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuOfdmaUlEnable", "WlanMuOfdmaUlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuMimoDlEnable", "WlanMuMimoDlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuMimoUlEnable", "WlanMuMimoUlEnable_flag")
		TCWebApi_set("Wlan_Common", "SREnable", "WlanSREnable_flag")
	End if
	If tcwebApi_get("WebCustom_Entry","is11AXEnhanceModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan_Common", "IndividualTWTSupport", "IndividualTWTSupport_flag")
		TCWebApi_set("Wlan_Common", "HELDPCE", "HELDPC_flag")
		TCWebApi_set("Wlan_Common", "SpatialReuse", "SpatialReuse_flag")		
		TCWebApi_set("Wlan_Common", "BSSColorNum", "BSSColorNum_flag")
		TCWebApi_set("Wlan_Common", "RTS", "RTS_flag")
		TCWebApi_set("Wlan_Common", "CBSSIDMaxIndex", "CBSSIDMaxIndex_flag")
	End if

if Request_Form("WpsActive") = "0" then 
	TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeNone")
else
	TCWebApi_set("WLan_Entry","WPSMode","hWPSMode")
	if Request_form("hWPSMode") = "0" then
		TCWebApi_set("WLan_Entry","enrolleePinCode","pinvalue")
	end if	
	if Request_Form("hWpsStart") = "1" then 
		TCWebApi_set("Info_WLan","WPSActiveStatus","hWpsStart")
		TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
	else
		if tcWebApi_get("Info_WLan","wlanWPStimerRunning", "h") = "0" then
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
		elseif tcWebApi_get("Info_WLan","wlanWPStimerRunning", "h") = "N/A" then
				TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
		end if
	end if
end if
	
if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then 
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltAction")
	end if
	TCWebApi_set("WLan_Entry","WLan_MAC0","WLANFLT_MAC1")	
	TCWebApi_set("WLan_Entry","WLan_MAC1","WLANFLT_MAC2")	
	TCWebApi_set("WLan_Entry","WLan_MAC2","WLANFLT_MAC3")		
	TCWebApi_set("WLan_Entry","WLan_MAC3","WLANFLT_MAC4")		
	TCWebApi_set("WLan_Entry","WLan_MAC4","WLANFLT_MAC5")	
	TCWebApi_set("WLan_Entry","WLan_MAC5","WLANFLT_MAC6")	
	TCWebApi_set("WLan_Entry","WLan_MAC6","WLANFLT_MAC7")		
	TCWebApi_set("WLan_Entry","WLan_MAC7","WLANFLT_MAC8")
end if
	TCWebApi_commit("WLan_Entry")
	tcWebApi_save()
end if
end if

if Request_Form("isWDSSupported") = "1" then
	TCWebApi_set("WLan_WDS","WdsEnable","WLAN_WDS_Active")
	tcWebApi_constSet("WLan_Common","a", "1")
	if Request_form("WLAN_WDS_Active") = "1" then
		tcWebApi_constSet("WLan_Common","b", "1")
		if Request_Form("wlSecurMode") = "None" then
			TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_NONE")
		elseif Request_Form("wlSecurMode") = "Basic" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_WEP")
				if Request_Form("wlKeyIndex") = "1" then
					TCWebApi_set("WLan_WDS","WdsKey","hwlKeys0")
				elseif Request_Form("wlKeyIndex") = "2" then
					TCWebApi_set("WLan_WDS","WdsKey","hwlKeys1")
				elseif Request_Form("wlKeyIndex") = "3" then
					TCWebApi_set("WLan_WDS","WdsKey","hwlKeys2")
				elseif Request_Form("wlKeyIndex") = "4" then
					TCWebApi_set("WLan_WDS","WdsKey","hwlKeys3")
				end if
		else
			tcWebApi_constSet("WLan_Common","c", "1")
			TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
			TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
		end if
			TCWebApi_set("WLan_WDS","Wds_MAC0","WLANWDS_PEER_MAC1")
			TCWebApi_set("WLan_WDS","Wds_MAC1","WLANWDS_PEER_MAC2")
			TCWebApi_set("WLan_WDS","Wds_MAC2","WLANWDS_PEER_MAC3")
			TCWebApi_set("WLan_WDS","Wds_MAC3","WLANWDS_PEER_MAC4")
	end if
	TCWebApi_save()
end if
If Request_Form("WpsOOB")="1" Then
	TCWebApi_set("Info_WLan","WPSOOBActive","WpsOOB")
	tcWebApi_commit("WLan_Entry")
end if

If Request_Form("WpsGenerate") = "1" then
			TCWebApi_set("Info_WLan","WPSGenPinCode","WpsGenerate")
			TCWebApi_commit("WLan_Entry")
end if
%>

<HTML><HEAD><TITLE><%tcWebApi_get("String_Entry","WLANText","s")%></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<link href="/css/scoop-vertical.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/simple-line-icons.css" rel="stylesheet">
    <link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">

<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<style>
		.lighter_grey_bg {
			background: #eeeeee;
			padding: 20px 30px;
			margin-right: -15px;
			margin-left: -15px;
			margin-bottom: 20px;
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
		
		</style>


	<SCRIPT 
      	language=javascript>
	MakeMenu(getElById ('Selected_Menu').value);
	</SCRIPT>

      
	<SCRIPT language=JavaScript type=text/javascript>
var UserLevel = 1;

<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
		var oldwpsTimerRunningData = "<% tcWebApi_getbywifiid("Info_WLan","wlanWPStimerRunning_","wlan_id") %>";
		var oldwlanWPSStatus = "<% tcWebApi_getbywifiid("Info_WLan", "wlanWPSStatus_", "wlan_id") %>";		
<% end if %>

function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegion = document.ConfigForm.hCountryRegion;
	var ctlCountryRegion0 = document.ConfigForm.CountryRegion0;
	var ctlCountryRegion1 = document.ConfigForm.CountryRegion1;
	var ctlCountryRegion2 = document.ConfigForm.CountryRegion2;
	var ctlCountryRegion3 = document.ConfigForm.CountryRegion3;
	var ctlCountryRegion4 = document.ConfigForm.CountryRegion4;
	var ctlCountryRegion5 = document.ConfigForm.CountryRegion5;
	if(vCountryName == "CANADA" || vCountryName == "COLOMBIA" || vCountryName == "DOMINICAN REPUBLIC" || vCountryName == "GUATEMALA" || vCountryName == "MEXICO" ||
	   vCountryName == "NORWAY" || vCountryName == "PANAMA" || vCountryName == "PUERTO RICO" || vCountryName == "UNITED STATES" || vCountryName == "TAIWAN" || vCountryName == "UZBEKISTAN")
		ctlCountryRegion.value = ctlCountryRegion0.value;	
	else	
		ctlCountryRegion.value = ctlCountryRegion1.value;
	loadChannelList();
	document.ConfigForm.CountryChange.value = 1;
	}
function doStartWPS(){
	var pinLen = 8;
	var Form = new webSubmitForm();
	if (addParameter(Form) == false)
	{
		return;
	}	
	if(getSelectVal("wpsmode") == 'ap-pin')
	{
		var pinval = getElement('pinvalue');
		if(isSafeStringIn(pinval.value,'0123456789') == false)
		{
			alert('<%tcWebApi_get("String_Entry","PINIntegerText","s")%> ');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		var pinValue = pinval.value;
		if(pinValue.length != pinLen)
		{
			alert('<%tcWebApi_get("String_Entry","EightDigitPINText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		if(isvalidpin(pinValue) == false)
		{
			alert('<%tcWebApi_get("String_Entry","RightPINText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
	}
	var temp = getSelectVal("wpsmode");
	if(temp == 'ap-pin')
	{
		setText('hWPSMode', 0);
	}
	else
	{
		setText('hWPSMode', 1);
	}	
	setText('hWpsStart',1);
	if(getValue('isInWPSing')==0){
		alert("<%tcWebApi_get("String_Entry","EnableIn2MinutesText","s")%>");
	}
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
	top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
<% end if %>
	SubmitForm();	
	//document.ConfigForm.submit();
}

function doGenerate(){
	document.ConfigForm.WpsGenerate.value = "1";
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function stWlan(domain,enable,ssid,mode,channel,rate,power,wlHide,BeaconType,Encryption,AuthMode,KeyIndex,EncryptionLevel,WPAModes,IEEE11iEModes,BWControl,GIControl,MCSValue,TxRxStream,WPAWPA2Modes,WPSMode,PINValue)
{
	this.domain = domain;
	this.enable = enable;
	if(ssid == 'N/A')
		this.ssid = '';
	else
		this.ssid = ssid;
	
	var WirelessMode = 'b,g';
	if (mode == '0')
		WirelessMode = 'b,g';
	else if (mode == '1')
		WirelessMode = 'b';
	else if (mode == '4')
		WirelessMode = 'g';
	else if (mode == '6')
		WirelessMode = 'n';
	else if (mode == '7')
		WirelessMode = 'g,n';
	else if (mode == '9')
		WirelessMode = 'b,g,n';		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>	
	else if (mode == '16')
		WirelessMode = 'g,n,ax';
<% end if %>
	else
		WirelessMode = 'b,g';			
	this.mode = WirelessMode;
	
	//this.channel = channel;
	if(channel == 'N/A')
		this.channel = 'Auto';
	else
		this.channel = channel;

	//this.rate = rate;
	if(rate == 'N/A')
		this.rate = 'Auto';
	else
		this.rate = rate;
	
	
	if(power == 'N/A')
		this.power = '1';
	else
		this.power = power;
	if (wlHide == '1')
		this.wlHide = '1';
	else
		this.wlHide = '0';

	var SecurMode = 'None';
	if (BeaconType == 'WEP-64Bits')
		SecurMode = 'Basic';
	else if (BeaconType == 'WEP-128Bits')
		SecurMode = 'Basic';
	else if (BeaconType == 'WPAPSK')
		SecurMode = 'WPA';
	else if (BeaconType == 'WPA2PSK')
		SecurMode = '11i';
	else if (BeaconType == 'WPAPSKWPA2PSK')
		SecurMode = 'WPAand11i';
	else if (BeaconType == 'Radius-WEP64')
		SecurMode = 'radius64';
	else if (BeaconType == 'Radius-WEP128')
		SecurMode = 'radius128';
	else if (BeaconType == 'WPA')
		SecurMode = 'wpaOnly';
	else if (BeaconType == 'WPA2')
		SecurMode = 'wpa2Only';
	else if (BeaconType == 'WPA1WPA2')
		SecurMode = 'wpa1and2';
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	else if (BeaconType == 'WPA3PSK')
		SecurMode = 'WPA3-SAE';
	else if (BeaconType == 'WPA2PSKWPA3PSK')
		SecurMode = 'WPA3 Transition';
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
	else if (BeaconType == 'WPA3')
		SecurMode = 'WPA3';
	else if (BeaconType == 'WPA3-192Bit')
		SecurMode = 'WPA3-192Bit';
<% end if %>
<% end if %>
	else//'OPEN'
		SecurMode = 'None';
	this.BeaconType = SecurMode;
	
	this.Encryption = Encryption;
	if(AuthMode == 'N/A')
		this.AuthMode = 'Both';
	else
		this.AuthMode = AuthMode;
	if(KeyIndex == 'N/A')
		this.KeyIndex = '1';
	else
		this.KeyIndex = KeyIndex;
	if(parseInt(EncryptionLevel.substr(4)) == '64')
		this.EncypBit = '64';
	else if(parseInt(EncryptionLevel.substr(4)) == '128')
		this.EncypBit = '128';
	else
		this.EncypBit = '64';
	if((WPAModes == 'N/A') || (WPAModes == 'NONE') || (WPAModes == 'WEP'))
		this.WPAModes = 'TKIP';
	else
		this.WPAModes = WPAModes;
	if((IEEE11iEModes == 'N/A') || (IEEE11iEModes == 'NONE') || (IEEE11iEModes == 'WEP'))
		this.IEEE11iEModes = 'TKIP';
	else
		this.IEEE11iEModes = IEEE11iEModes;
	this.BWControl = BWControl;
	this.GIControl = GIControl;
	if(MCSValue == 'N/A')
		this.MCSValue = '33';//Auto
	else
		this.MCSValue = MCSValue;
	this.TxRxStream = TxRxStream;	
	if((WPAWPA2Modes == 'N/A') || (WPAWPA2Modes == 'NONE') || (WPAWPA2Modes == 'WEP'))
		this.WPAWPA2Modes = 'TKIP';
	else
		this.WPAWPA2Modes = WPAWPA2Modes;	
	if(WPSMode == '1' || WPSMode == 'N/A')
		this.WPSMode = 'ap-pbc';
	else	
		this.WPSMode = 'ap-pin';
	this.PINValue = PINValue;
}
var srt_device = "<% tcWebApi_get("WLan_Common", "rt_device","s") %>";
var str_trstream = "1";
if(srt_device != "N/A")
{
	if(srt_device.substr(3) == "2")
		str_trstream = "2";
}
var Wlan = new Array(new stWlan("domain","<% tcWebApi_get("WLan_Entry", "EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry","SSID","s") %>","<% tcWebApi_get("WLan_Common","WirelessMode","s") %>","<% tcWebApi_get("WLan_Common","Channel","s") %>","<% tcWebApi_get("WLan_Entry","HT_RATE","s") %>","<% tcWebApi_get("WLan_Common","TxPowerLevel","s") %>","<% tcWebApi_get("WLan_Entry","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry","AuthMode","s") %>","WEPEncryption","<% tcWebApi_get("WLan_Entry","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry","DefaultKeyID","s") %>","<% tcWebApi_get("WLan_Entry","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Common","HT_BW","s") %>","<% tcWebApi_get("WLan_Common","HT_GI","s") %>","<% tcWebApi_get("WLan_Entry","HT_MCS","s") %>", str_trstream,"<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Entry","WPSMode","s") %>","<% tcWebApi_get("WLan_Entry","enrolleePinCode","s") %>"),null);
var enbl = <% tcWebApi_get("WLan_Common","APOn","s") %>;
var ssidIdx = 0;
var state = enbl;
var wlHide = Wlan[0].wlHide;
var band = 2;
var phy = 'g';
var wepEnable = getWepSwitch();
var wlCorerev = 8;
var ssidAccessAttr = 'Subscriber';
var beaconTypeAccessAttr = 'Subscriber';
var EnableAccessAttr = 'Subscriber';
var wpsV2Support = '<% tcWebApi_get("WLan_Entry0","WscV2Support", "s") %>';
function getWepSwitch()
{
	if (Wlan[ssidIdx].Encryption == 'WEPEncryption')
	{
		return 1;
	}
	else if (Wlan[ssidIdx].Encryption == 'None')
	{
		return 0;
	}
}
function hideOption(selObject, index)
{
	var oldOption = selObject.children(index);
	var oldStr = oldOption.innerText;
	var newOption = document.createElement('<div' + oldOption.outerHTML.match(/(<\w*)([^>]*)(>)/)[2] +'>');
	newOption.innerText  = oldStr;
	newOption.swapNode(oldOption);
}
function hideWlSecInfo(hidden)
{
	var status = 'visible';
	with ( document.forms[0] )
	{
		var i = 0;
		if ( hidden == 1 )
		{
			status = 'hidden';
			wlHide.disabled = 1;
			wlSsid.disabled = 1;
		}
		else
		{
			wlHide.disabled = 0;
			wlSsid.disabled = 0;
		}
	}
}
function wlSecCbClick(cb)
{
	if ( cb.checked == true )
	{
		hideWlSecInfo(0);
	}
	else
	{
		hideWlSecInfo(1);
	}
}
function getPreauth(wlPreauth) {
	var ret;
	if ( wlPreauth == "on" )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function isValidWPAPskKey(val) {
	var ret = false;
	var len = val.length;
	var maxSize = 64;
	var minSize = 8;
	if ( len >= minSize && len < maxSize )
	{
		if(val.match(/[^\x00-\xff]/g))
   	    {
			ret = false;
		 } else {
   	        for ( i = 0; i < len; i++)
				if (val.charAt(i) == ','){
				break;
				}
			if ( i == len)
				ret = true;
   	    }
	} else if ( len == maxSize ) {
		for ( i = 0; i < maxSize; i++ )
		if ( isHexaDigit(val.charAt(i)) == false )
		break;
		if ( i == maxSize )
		ret = true;
	} else
		ret = false;
	return ret;
}
function hideAllElements()
{
	setDisplay("wlWpaD", 0);
	setDisplay("wpaPreShareKey", 0);
	setDisplay("wpaGTKRekey", 0);
	setDisplay("wlRadius", 0);
	setDisplay("Preauth", 0);
	setDisplay("NetReauth", 0);
	setDisplay("wlWepD", 0);
	setDisplay("keyInfo", 0);
	setDisplay("wlWPARekeyInter", 0);
}
function encrypChange()
{
	with ( document.forms[0] )
	{
		var securmode = getSelectVal('wlSecurMode')
		switch(securmode)
		{
			case 'None':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsNoneText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","RandomAccessText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","NotUseText","s")%>";
				break;
			}
			case 'Basic':
			case 'radius64': 
			case 'radius128': 
			{
				wlKeys[0].disabled = 0;
				wlKeys[1].disabled = 0;
				wlKeys[2].disabled = 0;
				wlKeys[3].disabled = 0;
				wlKeyIndex.length = 0;
				wlKeyIndex[0] = new Option("1", "1");
				wlKeyIndex[1] = new Option("2", "2");
				wlKeyIndex[2] = new Option("3", "3");
				wlKeyIndex[3] = new Option("4", "4");
				setSelect('wlKeyIndex',Wlan[ssidIdx].KeyIndex) ;
                                if(securmode == 'Basic')
                                {
        	setDisplay("keyInfo", 1);
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWEPText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUserText","s")%>";
                                }
                                else if(securmode == 'radius64')
				{
					setDisplay("keyInfo", 0);
					getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeRadius64Text","s")%>"
					+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySet64BitByUserText","s")%>";
				}
				else if(securmode == 'radius128')
				{
					setDisplay("keyInfo", 0);
					getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeRadius128Text","s")%>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySet128BitByUserText","s")%>";
				}
				break;
			}
			case 'WPA':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPAText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser2Text","s")%>";
				break;
			}
			case '11i':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA2Text","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
			case 'WPAand11i':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA2ConfigureText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
			case 'wpaOnly':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPAText","s")%>";
				break;
			}
			case 'wpa2Only': 
			{
				getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPA2Text","s")%>";
				break;
			}
			case 'wpa1and2':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPA1WPA2Text","s")%>";
				break;
			}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
			case 'WPA3-SAE':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA3PSKText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
			case 'WPA3 Transition':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA2WPA3PSKText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			case 'WPA3':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA3Text","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
			case 'WPA3-192Bit':
			{
				getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA3192BitText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>";
				break;
			}
<% end if %>
<% end if %>
			default:
				break;
		}
	}
}
function wlKeyBitChange()
{
	with(document.forms[0])
	{
		var wlKeyBitLen = getSelectVal('wlKeyBit');
		if(wlKeyBitLen == 64)
		{
			getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter1Text","s")%>";
		}
		else
		{
			getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter2Text","s")%>";
		}
	}
}
function authModeChange(OnPageLoad)
{
	with ( document.forms[0] )
	{
		var SecurMode = getSelectVal('wlSecurMode');
		var mode = getValue('wlgMode');
		var i, algos;
	if(SecurMode == "None" || SecurMode == "Basic"){
		document.getElementById("wds_div").style.display="none";
		}
	else if(document.getElementById("wds_div") != null){
		document.getElementById("wds_div").style.display="";
		}
		hideAllElements();
		switch ( SecurMode )
		{
		case 'None':
			setDisplay("wlWepD", 0);
			setDisplay("keyInfo", 0);
			setDisplay("wpsinfo", 1);
			wpsModeChange();

			break;
		case 'Basic':
		case 'shared':
			setDisplay("wlWepD", 1);
			setDisplay("keyInfo", 1);
			setDisplay("wpsinfo", 1);

			break;
		case 'radius':
			setDisplay("wlRadius", 1);
			setDisplay("wlWepD", 1);
			break;
		case 'radius64':
		case 'radius128':
			setDisplay("wlRadius", 1);
			setDisplay("keyInfo", 1); 
			break;
		case 'wpaOnly':
		case 'wpa2Only':
		case 'wpa1and2':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		case 'WPA3':
		case 'WPA3-192Bit':
<% end if %>
<% end if %>
			setDisplay("wlWpaD", 1);
			setDisplay("wlRadius", 1);
			setDisplay("wlWPARekeyInter", 1);
			break;
		case 'wpa2':
		case 'wpa2mix':
			setDisplay("Preauth", 1);
			setDisplay("NetReauth", 1);
		case 'wpa':
			setDisplay("wlWpaD", 1);
			setDisplay("wlRadius", 1);
			break;
		case '11i':
		case 'psk2mix':
		case 'WPA':
		case 'WPAand11i':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		case 'WPA3-SAE':
		case 'WPA3 Transition':
<% end if %>
			setDisplay("wlWpaD", 1);
			setDisplay("wpaPreShareKey", 1);
			setDisplay("wpsinfo", 1);
			wpsModeChange();

			break;
		}
		if(OnPageLoad==1)
		{
			if ("n" == mode)
				algos = new Array(new Array('AES','AES'));
			else
				algos = new Array(new Array('TKIP','TKIP'), new Array('AES','AES'),new Array('TKIP+AES','TKIPAES')
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
								,new Array('GCMP256','GCMP256')
<% end if %>
<% end if %>
			);
			wlWpa.length = algos.length;
			for (var i in algos)
			{
				wlWpa[i] = new Option(algos[i][0], algos[i][1]);
				wlWpa[i].value = algos[i][1];
				if (Wlan[ssidIdx].BeaconType == 'WPA'
				&& wlWpa[i][1] == Wlan[ssidIdx].WPAModes)
				{
					wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == '11i'
				&& wlWpa[i][1] ==  Wlan[ssidIdx].IEEE11iEModes)
				{
					wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == 'WPAand11i'
				&& wlWpa[i][1] ==  Wlan[ssidIdx].WPAWPA2Modes)
				{
					wlWpa[i].selected = true;
				}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3-SAE'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == 'WPA3 Transition'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3' && wlWpa[i][1] == 'AES'){
					wlWpa[i].selected = true;
			}
<% end if %>
<% end if %>
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		for (var idx = 0; idx < wlWpa.length; idx++)
		{
			var tmpWpa = wlWpa.options[idx].value;
			wlWpa.options[idx].disabled = false;			
			tmpWpa = tmpWpa.toUpperCase();
			if(((tmpWpa == "NONE") || (tmpWpa == "AES") || (tmpWpa == "TKIP") || (tmpWpa == "TKIPAES")) && 1 != isBackHaul && 1 != isFrontHaul)
			{
				wlWpa.options[idx].disabled = false;
			}
			else if(((tmpWpa == "NONE")  || (tmpWpa == "AES"))&& (1 == isBackHaul || 1 == isFrontHaul))
			{
				wlWpa.options[idx].disabled = false;
			}
			else
			{
				wlWpa.options[idx].disabled = true;
			}
		}
<% end if %>
		if (SecurMode == 'WPA' || SecurMode =='wpaOnly' || SecurMode =='wpa2Only' ||SecurMode =='wpa1and2' )
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>	
			|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
	) 
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].WPAModes);
		}
		else if (SecurMode == '11i')
		{
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;	
			}					
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
					|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			)  
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].IEEE11iEModes);
		}
		else if (SecurMode == 'WPAand11i')
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			 		|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			 )
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].WPAWPA2Modes);
		}
		else if (SecurMode == 'Basic')
		{
			document.forms[0].wlKeyBit.disabled=false;
			wlWep.length = 0;
			wlWep[0] = new Option("open", "OpenSystem");
			wlWep[1] = new Option("share", "SharedKey");
			wlWep[2] = new Option("open+share", "Both");
			if(OnPageLoad==1)
			{
				setSelect('wlWep',Wlan[ssidIdx].AuthMode);
			}
			else
			{
				setSelect('wlWep', "Both");
			}
		}
		else if (SecurMode == 'radius64')
		{
			document.forms[0].wlKeyBit.disabled=true;
			document.forms[0].wlKeyBit.options[1].selected=true;
			wlKeyBitChange(); 
		}
		else if (SecurMode == 'radius128')
		{
			document.forms[0].wlKeyBit.disabled=true;
			document.forms[0].wlKeyBit.options[0].selected=true;
			wlKeyBitChange(); 
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3-SAE')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
		else if (SecurMode == 'WPA3 Transition')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "AES");	
		}
		else if (SecurMode == 'WPA3-192Bit'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "GCMP256")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "GCMP256");	
		}
<% end if %>
<% end if %>
		if ((1 == isBackHaul || 1 == isFrontHaul) && SecurMode != 'None')
		{
			document.forms[0].wlWpa.selectedIndex = 1;
		}
	}
	encrypChange();
}

function doBroadcastSSIDChange()
{
	with ( document.forms[0] )
	{	
		if(wpsV2Support == 1)
		{
			if(wlSsidIdx[0].selected == true && enableWps.checked == true && wlHide.checked == true)
			{
					var rv = confirm("<%tcWebApi_get("String_Entry","BroadcastCancellText","s")%>");
					if (rv == false)
					{
						wlHide.checked = false;
					}
					else
					{
						wlHide.checked = true;
						enableWps.checked = false;
						WpsActive.value = "0";					
					}
			} 
		} 
  }	
	return 1;
}

function wpapsk_window()
{
	var psk_window = window.open("", "", "toolbar=no,width=500,height=100");
	psk_window.document.write("The WPA Pre-Shared Key is " + wpaPskKey);
	psk_window.document.close();
}
function getGmodeIndex(mode) {
	var ret = 0;
	switch(mode) {
		case '0':
			ret = 3;
			break;
		case '4':
			ret = 1;
			break;
		case '5':
			ret = 2;
			break;
		default:
			ret = 0;
			break;
	}
	return ret;
}

var isMeshBssCfg = 0;
var isBackHaul = 0;
var isFrontHaul = 0;
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "0" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry0","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "1" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "2" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry2","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "3" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry3","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "4" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry4","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "5" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry5","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "6" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry6","BackHaul","s") %>";
<% elseif tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "7" then %>
isBackHaul = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry7","BackHaul","s") %>";
<% end if %>
function easymesh_onload(type)
{
	var wl_authMode="", wl_encrypType = "";
	var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
	var bss_al_mac = "";
	var bss_fh_support = 0, bss_bh_support = 0;
	var node_idx = document.forms[0].wlSsidIdx.value;
	node_idx = parseInt(node_idx) + 1;
	isMeshBssCfg = 0;
	var SSID1_Enabel = "<% tcWebApi_get("Wlan11ac_Entry0","EnableSSID","s") %>";

	if(mapDevRole != 1 && mapDevRole != 2)
	{
		console.log("EasyMesh Device Role is neither Controller nor Agent!");
		return;
	}
	bss_al_mac = "<% tcWebApi_get("Mesh_radio2gbssinfo","AL-MAC","s") %>";
	
	switch(parseInt(node_idx))
	{
		case 1:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry0","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry0","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry0","EncrypType","s") %>";
			break;
		case 2:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry1","EncrypType","s") %>";
			break;
		case 3:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry2","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry2","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry2","EncrypType","s") %>";
			break;
		case 4:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry3","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry3","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry3","EncrypType","s") %>";
			break;
		case 5:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry4","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry4","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry4","EncrypType","s") %>";
			break;
		case 6:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry5","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry5","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry5","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry5","EncrypType","s") %>";
			break;
		case 7:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry6","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry6","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry6","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry6","EncrypType","s") %>";
			break;
		case 8:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry7","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry7","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry7","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry7","EncrypType","s") %>";
			break;
		case 9:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry8","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry8","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry8","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry8","EncrypType","s") %>";
			break;
		case 10:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry9","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry9","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry9","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry9","EncrypType","s") %>";
			break;
		case 11:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry10","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry10","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry10","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry10","EncrypType","s") %>";
			break;
		case 12:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry11","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry11","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry11","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry11","EncrypType","s") %>";
			break;
		case 13:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry12","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry12","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry12","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry12","EncrypType","s") %>";
			break;
		case 14:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry13","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry13","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry13","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry13","EncrypType","s") %>";
			break;
		case 15:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry14","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry14","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry14","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry14","EncrypType","s") %>";
			break;
		case 16:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry15","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry15","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry15","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry15","EncrypType","s") %>";
			break;
		default:
			bss_al_mac = "";
			bss_fh_support = 0;
			bss_bh_support = 0;
			wl_authMode = "";
			wl_encrypType = "";
			break;
	}
	isFrontHaul = parseInt(bss_fh_support).toString() == "1" ? 1 : 0;
	al_mac = al_mac.toUpperCase();
	bss_al_mac = bss_al_mac.toUpperCase();
	if( (al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
		|| (bss_al_mac == null) || (bss_al_mac == "N/A") || (bss_al_mac == "") || (bss_al_mac == "00:00:00:00:00:00") )
	{
		return;
	}
	
	if( ((bss_al_mac == al_mac) || (bss_al_mac == "FF:FF:FF:FF:FF:FF"))
			&& ((1 == bss_fh_support) || (1 == bss_bh_support)) && ((SSID1_Enabel == "1") || (node_idx != "1")) )
	{
		var wlSecurMode = document.forms[0].wlSecurMode;
		for (var idx=0; idx < wlSecurMode.length; idx++) 
		{
			var tmpSecurMode = wlSecurMode.options[idx].value;
			tmpSecurMode = tmpSecurMode.toUpperCase();
			if(((tmpSecurMode == "NONE") || (tmpSecurMode == "WPA3-SAE") || (tmpSecurMode == "WPA3 TRANSITION" )|| (tmpSecurMode == "11I") || (tmpSecurMode == "WPA") || (tmpSecurMode == "WPAAND11I")) && 1 != isBackHaul &&1 !=bss_fh_support)
			{
				wlSecurMode.options[idx].disabled = false;
			}
			else if(((tmpSecurMode == "NONE") || (tmpSecurMode == "WPA3-SAE") || (tmpSecurMode == "WPA3 TRANSITION" ) || (tmpSecurMode == "11I")) && 1 == isBackHaul && 1 !=bss_fh_support)
			{
				wlSecurMode.options[idx].disabled = false;
			}
			else if(((tmpSecurMode == "NONE") || (tmpSecurMode == "WPA3 TRANSITION" )|| (tmpSecurMode == "11I")) && 1 ==bss_fh_support)
			{
				wlSecurMode.options[idx].disabled = false;
			}
			else
			{
				wlSecurMode.options[idx].disabled = true;
			}
		}

		var wlWpa = document.forms[0].wlWpa;
		for (var idx=0; idx < wlWpa.length; idx++) 
		{
			var tmpWpa = wlWpa.options[idx].value;
			tmpWpa = tmpWpa.toUpperCase();
			if(((tmpWpa == "NONE") || (tmpWpa == "AES") || (tmpWpa == "TKIP") || (tmpWpa == "TKIPAES")) && 1 != isBackHaul && 1 != bss_fh_support)
			{
				wlWpa.options[idx].disabled = false;
			}
			else if(((tmpWpa == "NONE")  || (tmpWpa == "AES"))&& (1 == isBackHaul || 1 == bss_fh_support))
			{
				wlWpa.options[idx].disabled = false;
			}
			else
			{
				wlWpa.options[idx].disabled = true;
			}
		}

		if((1 != isBackHaul && 1 != isFrontHaul) && (wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK") && (wl_authMode.toUpperCase() != "WPAPSK") && (wl_authMode.toUpperCase() != "WPAPSKWPA2PSK")&& (wl_authMode.toUpperCase() != "WPA3PSK") && (wl_authMode.toUpperCase() != "WPA2PSKWPA3PSK") )
		{
			alert('<%tcWebApi_get("String_Entry","HintOpenEasyMeshText4","s")%>');
		}
		else if(1 == isBackHaul && 1 != isFrontHaul  && (wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK") && (wl_authMode.toUpperCase() != "WPA3PSK") && (wl_authMode.toUpperCase() != "WPA2PSKWPA3PSK")  )
		{
			alert('<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>');
		}
		else if(1 == isFrontHaul && (wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK") && (wl_authMode.toUpperCase() != "WPA2PSKWPA3PSK")  )
		{
			alert('<%tcWebApi_get("String_Entry","HintOpenEasyMeshText8","s")%>');
		}
		
		if(wl_authMode.toUpperCase() != "OPEN" && type == 1)
		{
			if(1 != isBackHaul && 1 != isFrontHaul && (wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES") && (wl_encrypType.toUpperCase() != "TKIP") && (wl_encrypType.toUpperCase() != "TKIPAES"))
			{
				alert('<%tcWebApi_get("String_Entry","HintOpenEasyMeshText5","s")%>');
			}
			else if(( 1 == isBackHaul || 1 != isFrontHaul ) && (wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
			{
				alert('<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>');
			}	
		}

		isMeshBssCfg = 1;
	}

	return;	
}
<% end if %>

function gModeChange()
{
	with ( document.forms[0] )
	{
		var mode = getValue('wlgMode');
		if ((mode == 'b,g,n') || (mode == 'n'))
		{
			setDisplay('wlTransferRate',0);
			if (curUserName == sptUserName)
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',1);
<% end if %>
				setDisplay('11NbwControl',1);
				setDisplay('11NgiControl',1);
			}
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
			loadMCSList();
<% end if %>
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>		
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
<% end if %>
<% end if %>

		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (mode == 'g,n,ax' || mode == 'n,ax') {
			setDisplay('wlTransferRate',0);
			if (curUserName == sptUserName)
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',1);
<% end if %>
				setDisplay('11NbwControl',1);
				setDisplay('11NgiControl',1);
			}
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
			loadMCSList();
<% end if %>
		}
<% end if %>
		else
		{
			setDisplay('wlTransferRate',1);
			if (curUserName == sptUserName)
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',0);
<% end if %>
				setDisplay('11NbwControl',0);
				setDisplay('11NgiControl',0);
			}
			loadRateList();
		}
		loadAuthModeList();
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		easymesh_onload(0);
<% end if %>
	}
}
function loadChannelList()
{
	var CountryRegion = document.ConfigForm.hCountryRegion.value;
	
	if (band == "2")
	{
		document.forms[0].wlChannel.length = 0;
		document.forms[0].wlChannel[0] = new Option("Auto", "0");
		if(CountryRegion == "0"){
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
		}
		else  if (CountryRegion == "2"){
			document.forms[0].wlChannel[1] = new Option("10", "10");
			document.forms[0].wlChannel[2] = new Option("11", "11");		
		}
		else  if (CountryRegion == "3"){
			document.forms[0].wlChannel[1] = new Option("10", "10");
			document.forms[0].wlChannel[2] = new Option("11", "11");
			document.forms[0].wlChannel[3] = new Option("12", "12");
			document.forms[0].wlChannel[4] = new Option("13", "13");					
		}
		else  if (CountryRegion == "4"){
			document.forms[0].wlChannel[1] = new Option("4", "4");		
		}
		else  if (CountryRegion == "5"){
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
			document.forms[0].wlChannel[12] = new Option("12", "12");
			document.forms[0].wlChannel[13] = new Option("13", "13");
			document.forms[0].wlChannel[14] = new Option("14", "14");					
		}
		else  if (CountryRegion == "6"){
			document.forms[0].wlChannel[1] = new Option("3", "3");
			document.forms[0].wlChannel[2] = new Option("4", "4");
			document.forms[0].wlChannel[3] = new Option("5", "5");
			document.forms[0].wlChannel[4] = new Option("6", "6");
			document.forms[0].wlChannel[5] = new Option("7", "7");
			document.forms[0].wlChannel[6] = new Option("8", "8");
			document.forms[0].wlChannel[7] = new Option("9", "9");					
		}								
		else{//1 or else
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
			document.forms[0].wlChannel[12] = new Option("12", "12");
			document.forms[0].wlChannel[13] = new Option("13", "13");
		}
	}
	else  if (band == "1")
	{
		document.forms[0].wlChannel[0] = new Option("Auto", "0");
	}
	else
	{
		document.forms[0].wlChannel[0] = new Option("Auto", "0")
	}
	setSelect('wlChannel',Wlan[ssidIdx].channel);
}

<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
function loadMCSList()
{
	document.forms[0].wlMcs.options.length = 0;
	document.forms[0].wlMcs[0] = new Option("Auto", "33", false, Wlan[ssidIdx].MCSValue == "33");
	if (Wlan[0].TxRxStream == '1')
	{
		if ("0" == getSelectVal('bwControl'))
		{
			if ("0" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("6.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("13 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("19.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("26 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("39 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("52 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("58.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("65 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("7.2 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("14.4 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("21.7 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("28.9 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("43.3 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("57.8 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("65 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("72.2 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
		else
		{
			if ("0" == getSelectVal('giControl'))
		{
				document.forms[0].wlMcs[1] = new Option("13.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("27 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("40.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("54 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("81 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("108 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("121.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("135 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("15 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("30 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("45 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("60 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("90 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("120 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("135 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("150 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
	}
	else if (Wlan[0].TxRxStream == '2')
	{
		if ("0" == getSelectVal('bwControl'))
		{
			if ("0" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("13 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("26 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("39 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("52 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("78 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("104 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("117 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("130 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("14.4 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("28.9 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("43.3 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("57.8 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("86.7 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("115.6 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("130.0 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("144.4 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
		else
		{
			if ("0" == getSelectVal('giControl'))
		{
				document.forms[0].wlMcs[1] = new Option("27 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("54 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("81 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("108 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("162 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("216 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("243 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("270 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("30 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("60 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("90 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("120 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("180 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("240 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("270 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("300 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
	}
	//setSelect('wlMcs',Wlan[ssidIdx].MCSValue);
}
<% end if %>
function loadRateList() {
	document.forms[0].wlRate.options.length = 0;
	var mode = getValue('wlgMode');
	if (band == "2")
	{ 
		if (mode == "b" )
		{ 
			document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.forms[0].wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.forms[0].wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.forms[0].wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.forms[0].wlRate[4] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
		}
		else
		{
			document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.forms[0].wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.forms[0].wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.forms[0].wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.forms[0].wlRate[4] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
			document.forms[0].wlRate[5] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
			document.forms[0].wlRate[6] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
			document.forms[0].wlRate[7] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
			document.forms[0].wlRate[8] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
			document.forms[0].wlRate[9] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
			document.forms[0].wlRate[10] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
			document.forms[0].wlRate[11] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
			document.forms[0].wlRate[12] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
		}
	}
	else if (band == "1")
	{ 
		document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
		document.forms[0].wlRate[1] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
		document.forms[0].wlRate[2] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
		document.forms[0].wlRate[3] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
		document.forms[0].wlRate[4] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
		document.forms[0].wlRate[5] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
		document.forms[0].wlRate[6] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
		document.forms[0].wlRate[7] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
		document.forms[0].wlRate[8] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
	}
	else
	{
		document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
	}
	//setSelect('wlRate',Wlan[ssidIdx].rate);
}

function loadSsidIdxList()
{
	var ssidNum = 0;
	var multiFlag = "<% tcWebApi_get("WLan_Common","MultiSSIDConfigEnable","s") %>";
<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
	var WlanIndex = "<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>";
	var ssidselsectFlag = 0;
	var ssidindex = 1;
	var ssid1 = "<% tcWebApi_get("WLan_Entry0","EnableSSID","s") %>";
	var ssid2 = "<% tcWebApi_get("WLan_Entry1","EnableSSID","s") %>";
	var ssid3 = "<% tcWebApi_get("WLan_Entry2","EnableSSID","s") %>";
	var ssid4 = "<% tcWebApi_get("WLan_Entry3","EnableSSID","s") %>";
	<% if tcwebApi_get("WebCustom_Entry","isMultiUserITFSupported","h") = "Yes" then %>
	var ssid5 = "<% tcWebApi_get("WLan_Entry4", "EnableSSID", "s") %>";
	var ssid6 = "<% tcWebApi_get("WLan_Entry5", "EnableSSID", "s") %>";
	var ssid7 = "<% tcWebApi_get("WLan_Entry6", "EnableSSID", "s") %>";
	var ssid8 = "<% tcWebApi_get("WLan_Entry7", "EnableSSID", "s") %>";
<% end if %>
<% end if %>
	if(multiFlag == "Yes")
	{
		ssidNum = <% tcWebApi_get("WLan_Common","BssidNum","s") %>;
	}
	else
	{
		ssidNum = '1';//only can edit and query 0 index of ssid
	}
<% if tcwebApi_get("WebCustom_Entry","isCTPONCZNXSupported","h") = "Yes" then %>
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then %>
	if(ssidNum > "1" && ssidNum <= "8")
	{
		ssidNum = '1';//only can edit and query 0 index of ssid for second user.
	}
<% end if %>
<% end if %>
	document.forms[0].wlSsidIdx.options.length = 0;
	document.forms[0].wlSsidIdx[0] = new Option("SSID1", "0");
	<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
	if(ssidNum > "1")
	{
		if ( (ssid2 == "0") || (ssid2 == "1") )
		{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID2", "1");
			ssidindex++;
		}
<% if tcwebApi_get("WebCustom_Entry","isCTPONOnlyTwoSSIDSupported","h") <> "Yes" then %>
		if ( (ssid3 == "0") || (ssid3 == "1") ) 
		{
			if ( ssidNum > "2" )
		{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID3", "2");
			ssidindex++;
		}
		}
		if ( (ssid4 == "0") || (ssid4 == "1") ) 
		{
			if ( ssidNum > "3" )
		{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID4", "3");
			ssidindex++;
		}
		}
		<% if tcwebApi_get("WebCustom_Entry", "isMultiUserITFSupported", "h") = "Yes" then %>
		if ( (ssid5 == "0") || (ssid5 == "1") )
		{
			if ( ssidNum > "4" )
			{
				document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID5", "4");
			ssidindex++;
		}
		}
		if ( (ssid6 == "0") || (ssid6 == "1") )
		{
			if ( ssidNum > "5" )
			{
				document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID6", "5");
			ssidindex++;
		}
		}
		if ( (ssid7 == "0") || (ssid7 == "1") )
		{
			if ( ssidNum > "6" )
			{
				document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID7", "6");
				ssidindex++;
			}
		}
		if ( (ssid8 == "0") || (ssid8 == "1") )
		{
			if ( ssidNum > "7" )
			{
				document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID8", "7");
				ssidindex++;
			}
		}
		<% end if %>
<% end if %>
	}
<% else %>
	for(var i = 1; i < ssidNum; i++)
	{
		var ssidName = "SSID" + (i + 1).toString();
		document.forms[0].wlSsidIdx[i] = new Option(ssidName, i.toString());
	}
<% end if %>
	<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
	for(var i = 0; i < document.forms[0].wlSsidIdx.options.length; i++) 
	{
		if(document.forms[0].wlSsidIdx.options[i].value == WlanIndex)
		{
			setSelect('wlSsidIdx',WlanIndex);
			ssidselsectFlag = 1;
			break;
		}
	}
	if(ssidselsectFlag != 1)
	{
		setSelect('wlSsidIdx',0);
		selChangedSSID();
	}
<% else %>
	setSelect('wlSsidIdx', <% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>);
<% end if %>	
}
function loadMCastRateList() {
	if (band == "2") { 
		if (phy == "b") {
			document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
			document.forms[0].wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.forms[0].wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.forms[0].wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.forms[0].wlMCastRate[4] = new Option("11 Mbps", "11000000");
		}
		else {
			document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
			document.forms[0].wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.forms[0].wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.forms[0].wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.forms[0].wlMCastRate[4] = new Option("6 Mbps", "6000000");
			document.forms[0].wlMCastRate[5] = new Option("9 Mbps", "9000000");
			document.forms[0].wlMCastRate[6] = new Option("11 Mbps", "11000000");
			document.forms[0].wlMCastRate[7] = new Option("12 Mbps", "12000000");
			document.forms[0].wlMCastRate[8] = new Option("18 Mbps", "18000000");
			document.forms[0].wlMCastRate[9] = new Option("24 Mbps", "24000000");
			document.forms[0].wlMCastRate[10] = new Option("36 Mbps", "36000000");
			document.forms[0].wlMCastRate[11] = new Option("48 Mbps", "48000000");
			document.forms[0].wlMCastRate[12] = new Option("54 Mbps", "54000000");
		}
	}
	else if (band == "1") { 
		document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
		document.forms[0].wlMCastRate[1] = new Option("6 Mbps", "6000000");
		document.forms[0].wlMCastRate[2] = new Option("9 Mbps", "9000000");
		document.forms[0].wlMCastRate[3] = new Option("12 Mbps", "12000000");
		document.forms[0].wlMCastRate[4] = new Option("18 Mbps", "18000000");
		document.forms[0].wlMCastRate[5] = new Option("24 Mbps", "24000000");
		document.forms[0].wlMCastRate[6] = new Option("36 Mbps", "36000000");
		document.forms[0].wlMCastRate[7] = new Option("48 Mbps", "48000000");
		document.forms[0].wlMCastRate[8] = new Option("54 Mbps", "54000000");
	}
	else {
		document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
	}
}
function loadAuthModeList(){
	var mode = getValue('wlgMode');
	document.forms[0].wlSecurMode.options.length = 0;
						  
	if (mode == "n"){
		document.forms[0].wlSecurMode[0] = new Option("None", "None",false,Wlan[ssidIdx].BeaconType=="None");
		document.forms[0].wlSecurMode[1] = new Option("WPA-PSK", "WPA",false,Wlan[ssidIdx].BeaconType=="WPA");
		document.forms[0].wlSecurMode[2] = new Option("WPA2-PSK", "11i",false,Wlan[ssidIdx].BeaconType=="11i");
		document.forms[0].wlSecurMode[3] = new Option("WPA-PSK/WPA2-PSK", "WPAand11i",false,Wlan[ssidIdx].BeaconType=="WPAand11i");
	<% if tcwebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		document.forms[0].wlSecurMode[4] = new Option("Radius-WEP64", "radius64",false,Wlan[ssidIdx].BeaconType=="radius64");
		document.forms[0].wlSecurMode[5] = new Option("Radius-WEP128", "radius128",false,Wlan[ssidIdx].BeaconType=="radius128");
		document.forms[0].wlSecurMode[6] = new Option("WPA", "wpaOnly",false,Wlan[ssidIdx].BeaconType=="wpaOnly");
		document.forms[0].wlSecurMode[7] = new Option("WPA2", "wpa2Only",false,Wlan[ssidIdx].BeaconType=="wpa2Only");
		document.forms[0].wlSecurMode[8] = new Option("WPA1WPA2", "wpa1and2",false,Wlan[ssidIdx].BeaconType=="wpa1and2");
	<% end if %> 
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		var idx = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3-SAE", "WPA3-SAE",false,Wlan[ssidIdx].BeaconType=="WPA3-SAE");
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3 Transition", "WPA3 Transition",false,Wlan[ssidIdx].BeaconType=="WPA3 Transition");
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		var idx21x = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3", "WPA3",false,Wlan[ssidIdx].BeaconType=="WPA3");
<% end if %>
<% end if %>
	}
	else {
		document.forms[0].wlSecurMode[0] = new Option("None", "None",false,Wlan[ssidIdx].BeaconType=="None");
		document.forms[0].wlSecurMode[1] = new Option("WEP", "Basic",false,Wlan[ssidIdx].BeaconType=="Basic");
		document.forms[0].wlSecurMode[2] = new Option("WPA-PSK", "WPA",false,Wlan[ssidIdx].BeaconType=="WPA");
		document.forms[0].wlSecurMode[3] = new Option("WPA2-PSK", "11i",false,Wlan[ssidIdx].BeaconType=="11i");
		document.forms[0].wlSecurMode[4] = new Option("WPA-PSK/WPA2-PSK", "WPAand11i",false,Wlan[ssidIdx].BeaconType=="WPAand11i");
	<% if tcwebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		document.forms[0].wlSecurMode[5] = new Option("Radius-WEP64", "radius64",false,Wlan[ssidIdx].BeaconType=="radius64");
		document.forms[0].wlSecurMode[6] = new Option("Radius-WEP128", "radius128",false,Wlan[ssidIdx].BeaconType=="radius128");
		document.forms[0].wlSecurMode[7] = new Option("WPA", "wpaOnly",false,Wlan[ssidIdx].BeaconType=="wpaOnly");
		document.forms[0].wlSecurMode[8] = new Option("WPA2", "wpa2Only",false,Wlan[ssidIdx].BeaconType=="wpa2Only");
		document.forms[0].wlSecurMode[9] = new Option("WPA1WPA2", "wpa1and2",false,Wlan[ssidIdx].BeaconType=="wpa1and2");
	<% end if %> 
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		var idx = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3-SAE", "WPA3-SAE",false,Wlan[ssidIdx].BeaconType=="WPA3-SAE");
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3 Transition", "WPA3 Transition",false,Wlan[ssidIdx].BeaconType=="WPA3 Transition");
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		var idx21x = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3", "WPA3",false,Wlan[ssidIdx].BeaconType=="WPA3");
		document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3-192Bit", "WPA3-192Bit",false,Wlan[ssidIdx].BeaconType=="WPA3-192Bit");
<% end if %>
<% end if %>
	}
	authModeChange(1);
	doWPSUseChange();
}
function doWPScheck()
{
	var wlan=document.ConfigForm;
	if(wlan.enableWps.checked == true)
	{
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") <> "1"  then %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		if( wlan.wlSecurMode.value == "WPA3-SAE")
		{
			alert("We should not use WEP or wpa3 when WPS function turned on!");
			return 0;			
		}
<% end if %>
<% end if %>
		return 1;
	}	
	return 1;
}
function doWPSUseChange(){
	doWPScheck();
	if(document.forms[0].enableWps.checked && getSelectVal('wlSecurMode') == "Basic")
	{
		alert("<%tcWebApi_get("String_Entry","ForWEPText","s")%>");
		document.forms[0].enableWps.checked = false;
		return;
	}
	if(wpsV2Support == 1)
	{
		if(document.forms[0].enableWps.checked)
		{
			if(getSelectVal('wlWpa') == "TKIP" &&	(getSelectVal('wlSecurMode') == "WPA" || getSelectVal('wlSecurMode') == "WPAand11i" || getSelectVal('wlSecurMode') == "11i"))
			{
				alert("<%tcWebApi_get("String_Entry","ForWPAText","s")%>");
				document.forms[0].enableWps.checked = false;
				return;
			}
	
			if(document.forms[0].wlHide.checked == true)
			{
				alert("<%tcWebApi_get("String_Entry","UnableOpenWPSText","s")%>");
				document.forms[0].enableWps.checked = false;
				return;
			}
		}		
	}
	if(document.forms[0].enableWps.checked)
	{
		setDisplay("wpsmodeTR", 1);
		setDisplay("btnStartWPS", 1);
		setDisplay("wpssta", 1);
		setDisplay("ResetOOB", 1);
		setDisplay("pinval", 1);		
		setDisplay("pinGenerate", 1);
		if( document.forms[0].wpsmode.value == "ap-pbc")
		{ 
			setDisplay("pinval", 0);		
			setDisplay("pinGenerate", 0);
		}	
		document.forms[0].WpsActive.value = "1";
}
	else
	{
		if(getValue('isInWPSing')!=0)	//WPS is running
		{
			alert("<%tcWebApi_get("String_Entry","WPSWorkingText","s")%>");
			document.forms[0].enableWps.checked = true;
			document.forms[0].WpsActive.value = "1";
			return;		
		}
		else
		{
		setDisplay("wpsmodeTR", 0);
		setDisplay("btnStartWPS", 0);
		setDisplay("wpssta", 0);
		setDisplay("ResetOOB", 0);
		setDisplay("pinval", 0);		
		setDisplay("pinGenerate", 0);
		document.forms[0].WpsActive.value = "0";
	}
	}
	return;
}

function wpsModeChange()
{
	with ( document.forms[0])
	{
		if (document.forms[0].enableWps.checked)
		{
		var temp = getSelectVal("wpsmode");
			if (temp == 'ap-pin')
		{
			setDisplay("pinGenerate", 1);			
			setDisplay("pinval", 1);
		}
		else
		{
			setDisplay("pinGenerate", 0);			
			setDisplay("pinval", 0);
		}
	}
		else
		{
			setDisplay("pinGenerate", 0);			
			setDisplay("pinval", 0);
		}
	}
}
function wpsContChange()
{
	with ( document.forms[0])
	{
		var temp = getCheckVal("wpsControl");
		if (temp == 0)
		{
			setDisable("wpsMode", 1);
			setDisable("pinValue", 1);
		}
		else
		{
			setDisable("wpsMode", 0);
			setDisable("pinValue", 0);
		}
	}
}
function isvalidpin(val)
{
	var ret = false;
	var len = val.length;
	var pinSize = 8;
	var pinvalue = new Array();
	if ( len !=  pinSize)
	{
		return false;
	}
	else
	{
		for(i = 0; i < pinSize; i++ )
		{
			pinvalue[i] = parseInt(val.charAt(i),10);
		}
		var accum = 0;
		accum = (pinvalue[0] + pinvalue[2] + pinvalue[4] + pinvalue[6]) * 3 + pinvalue[1] + pinvalue[3] + pinvalue[5] + pinvalue[7];
		if (0 == (accum % 10))
		{
			return true; 
		}
		else
		{
			return false; 
		}
	}
	return ret;
}
function getAfterBurnerIndex(afterburner)
{
	var ret;
	if ( afterburner == "auto" )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function getTpcDbIndex(val) {
	var ret;
	if ( val == "0" )
		ret = 0;
	else if ( val == "2" )
		ret = 1;
	else if ( val == "3" )
		ret = 2;
	else if ( val == "4" )
		ret = 3;
	else ret = 0;
	return ret;
}
function ChannelChange() {
}
function getBandIndex(b) {
	var ret;
	if ( b == '1' )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function wl_afterburner_options(OnPageLoad) {
}
function wl_recalc(OnPageLoad)
{
	with ( document.forms[0] )
	{
		wl_afterburner_options(OnPageLoad);
	}
}
function updateCurChannel() {
}

<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
function getTimerRunningData()
{
	var wpsTimerRunningData = '';
	
	$.ajaxSetup({
			async : false,
			cache : false
		});
	
	$.getJSON("/cgi-bin/getWPSPara.asp", function(data, status){
				wpsTimerRunningData = data.wpsTimerRunningData;
  	});
	
	top.getWlanWpsTimerCount--;	
	return wpsTimerRunningData;
}

function getwlanWPSStatus()
{
	var wlanWPSStatus = '';
	
	$.ajaxSetup({
			async : false,
			cache : false
		});
	
	$.getJSON("/cgi-bin/getWPSPara.asp", function(data, status){
				wlanWPSStatus = data.wlanWPSStatus;
  	});
	return wlanWPSStatus;
}

function getWPStimerRunning()
{
	clearTimeout(getWPStimerRunning);
	{
		var wpsTimerRunningData = '';
		if(top.getWlanWpsTimerCount > 0)
		{
			wpsTimerRunningData = getTimerRunningData();
			var wlanWPSStatus = getwlanWPSStatus();			
			if(('N/A' == wpsTimerRunningData) || ('' == wpsTimerRunningData) || (oldwpsTimerRunningData == wpsTimerRunningData) || (oldwlanWPSStatus == wlanWPSStatus))
			{
				document.ConfigForm.btnStartWPS.value = 'waiting......';				
				document.getElementById("WPSProcess").innerHTML = oldwlanWPSStatus;
				document.ConfigForm.btnStartWPS.disabled = "disabled";
				setTimeout(getWPStimerRunning, 1000);
			}
			else
			{
				top.getWlanWpsTimerCount = 0;								
				switch(wlanWPSStatus)
				{
					case "In progress":
						document.getElementById("WPSProcess").innerHTML = 'Inprogress';						
						break;
					case "Configured":
						document.getElementById("WPSProcess").innerHTML = 'Configured';						
						break;
					case "WPS process Fail":
						document.getElementById("WPSProcess").innerHTML = 'WPS process Fail';								
						break;
					case "Idle":
						document.getElementById("WPSProcess").innerHTML = 'Idle';						
						break;
					default:
						document.getElementById("WPSProcess").innerHTML = wlanWPSStatus;
						break;
				}				
				switch(wpsTimerRunningData)
				{
					case "1":
						document.ConfigForm.btnStartWPS.value = 'Stop WPS';
						break;
					default:
						document.ConfigForm.btnStartWPS.value = 'Start WPS';
						break;
				}
				document.ConfigForm.btnStartWPS.disabled = "";
			}
		}
		else
		{
			switch(oldwlanWPSStatus)
			{
				case "In progress":
					document.getElementById("WPSProcess").innerHTML = 'Inprogress';						
					break;
				case "Configured":
					document.getElementById("WPSProcess").innerHTML = 'Configured';						
					break;
				case "WPS process Fail":
					document.getElementById("WPSProcess").innerHTML = 'WPS process Fail';								
					break;
				case "Idle":
					document.getElementById("WPSProcess").innerHTML = 'Idle';						
					break;
				default:
					document.getElementById("WPSProcess").innerHTML = wlanWPSStatus;
					break;
			}			
			switch(oldwpsTimerRunningData)
			{
				case "1":
					document.ConfigForm.btnStartWPS.value = 'Stop WPS';
					break;
				default:
					document.ConfigForm.btnStartWPS.value = 'Start WPS';
					break;
			}			
			document.ConfigForm.btnStartWPS.disabled = "";
		}
	}
}

<% end if %>

function LoadFrame()
{
	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true){	//if wds enable
			autoWLAN_WDS_Active();
		}else if(document.ConfigForm.WLAN_WDS_Active[1].checked == true){	//if wds disable
			autoWLAN_WDS_Deactive();
		}
	}
	with ( document.forms[0] )
	{
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>		
	if(initFlag == true)
	{
		initWLanTxBeamFormingSel();
		initFlag = false;
	}
<% end if %>
<% end if %>

		setCheck('wlEnbl', enbl);
		setCheck('wlHide', Wlan[ssidIdx].wlHide);
		if ( phy == "g" )
		{
			if(Wlan[ssidIdx].mode == "b/g")
			{
				setSelect('wlgMode', "b,g");
			}
			else
			{
				setSelect('wlgMode',Wlan[ssidIdx].mode);
			}
		}
<% if tcWebApi_get("WLan_Common","HT_BW","h") = "1" then %>
	<% if tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") = "1" then %>
		setSelect('bwControl',"1");
	<% else %>
		setSelect('bwControl',"2");
	<% end if %>
<% else %>
		setSelect('bwControl',"0");
<% end if %>	
		setSelect('giControl',Wlan[ssidIdx].GIControl);
		loadChannelList();
		loadSsidIdxList();
		gModeChange();
<% if tcWebApi_get("WLan_Common","PaMode","h") = "1" then %>
<% if tcWebApi_get("WLan_Common","TxPowerLevel","h") = "1" then %>
		setSelect('wlTxPwr',"6");
<% else %>
		setSelect('wlTxPwr',Wlan[ssidIdx].power);
<% end if %>
<% else %>
		setSelect('wlTxPwr',Wlan[ssidIdx].power);
<% end if %>		
		setCheck('wlHide',Wlan[ssidIdx].wlHide);
<% if tcWebApi_get("WebCustom_Entry","isUBUSSupported","h") = "Yes"  then %>		
		var node_idx = <% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>;
		var hgwsleep = <% tcWebApi_get("Timer_Common","HGWSleep","s") %>
		var wifienablemask = <% tcWebApi_get("Timer_Common","WifiEnableMask","s") %>	
		if( hgwsleep == "0"  || 0 == ((wifienablemask)>>(node_idx) & 1))
		{
				Wlan[ssidIdx].enable = 0;
		}
<% end if %>		
		setCheck('enableSsid',Wlan[ssidIdx].enable);
		setText('wlSsid',Wlan[ssidIdx].ssid);
		setSelect('wlSecurMode',Wlan[ssidIdx].BeaconType);
		setDisplay('wlInfo',enbl);
		setDisplay('authen',enbl);
		setDisplay('wlUserTip',enbl);
		setSelect('wlKeyBit',Wlan[ssidIdx].EncypBit);//setSelect('wlKeyBit',parseInt(Wlan[ssidIdx].EncypBit)+24);		
		wlKeyBitChange();
		if (ssidAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('wlSsid',1);
		}
		if ( EnableAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('enableSsid',1);
		}
		if ( beaconTypeAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('wlSecurMode',1);
		}
	}
	setSelect("wpsmode", Wlan[ssidIdx].WPSMode);
	if (getSelectVal("wpsmode") == 'ap-pin')
	{
		setText("pinvalue", Wlan[ssidIdx].PINValue);
	}
	authModeChange(1);
<% if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then %>
	if(document.ConfigForm.WLAN_FltActive[0].checked == true){	
		autoWLAN_Flt_Active();
	}else if(document.ConfigForm.WLAN_FltActive[1].checked == true){	
		autoWLAN_Flt_Deactive();
	}
<% end if %>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	easymesh_onload(1);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
	getWPStimerRunning();
<% end if %>

}

function isValidIpAddr(ip1,ip2,ip3,ip4)
{
	if(ip1==0 || ip4==0 || ip4==255 || ip1==127 )	
		return false;			

	return true;	
}

function inValidIPAddr(Address)
{
	var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var i;

	if(address == null) { 
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}

	digits = address[0].split(".");
	for(i=0; i < 4; i++)
	{
		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
		{ 
			alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
			return true;
		}
	}
	if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false))
	{
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}
	
	return false;
}

function checkRadiusSetting()
{
	var Radiusip = document.ConfigForm.radiusSVR_IP.value;
	var Radiusport = document.ConfigForm.radiusSVR_Port.value;
	var Radiuskey= document.ConfigForm.radiusSVR_Key.value;
	var RadiusReAuthTime=document.ConfigForm.radiusSVR_ReAuthInter.value;

	if( inValidIPAddr(Radiusip) )
	{
		return false;
	}
	
	if(isNaN(Radiusport) || Radiusport < 0 || Radiusport > 65535)
	{	
		alert("<%tcWebApi_get("String_Entry","RadiusServerPortTipsText","s")%>");
		return false;
	}
	
	if (Radiuskey.length == 0)
	{
		alert("<%tcWebApi_get("String_Entry","RadiusShareSecretTipsText","s")%>");
		return false; 
	}
	
	if (isNaN(RadiusReAuthTime) || RadiusReAuthTime.length == 0)
	{
		alert("<%tcWebApi_get("String_Entry","RadiusReauthIntervalTipsText","s")%>");
		return false; 
	}
	
}

function checkWePKeyValue(KeyBit,index,wlKeys)
{
	var val = wlKeys[index-1].value;
	var SecurMode = getSelectVal('wlSecurMode');
	if(SecurMode == "radius64" || SecurMode == "radius128") {
		return true;
	}
	if ( val == '')
	{
		alert('<%tcWebApi_get("String_Entry","KeyNotEmptyText","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	var vKey = 0;
	for (vKey = 0; vKey < 4; vKey++)
	{
		val = wlKeys[vKey].value;
		if ( val != '' )
		{
			if ( KeyBit == '128' )
			{
				if (isValidKey(val, 13) == false )
				{
					alert('<%tcWebApi_get("String_Entry","SecretKeyText","s")%> "' + val + '" <%tcWebApi_get("String_Entry","InvalidWEPKey1Text","s")%>');
					setCheck('wlEnbl',1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
}
			}
			else
			{
				if ( isValidKey(val, 5) == false )
				{
					alert('<%tcWebApi_get("String_Entry","SecretKeyText","s")%>"' + val + '" <%tcWebApi_get("String_Entry","InvalidWEPKey2Text","s")%>');
					setCheck('wlEnbl',1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
				}
			}
		}
	}

	return true;
}

function addParameter(Form)
{
	var url = '';
	var temp = '';
	var pinLen = 8;
	Form.usingPrefix('y');
	var phymode = getValue('wlgMode');
	Form.addParameter('Standard',phymode);
	if(phymode == 'b' || phymode == 'g' || phymode== 'b/g' ||phymode== 'b,g')
	{
		Form.addParameter('MaxBitRate',getSelectVal('wlRate'));
	}
	else
	{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
		Form.addParameter('X_ATP_11NHtMcs',getSelectVal('wlMcs'));
<% end if %>
		Form.addParameter('X_ATP_Wlan11NBWControl',getSelectVal('bwControl'));
		Form.addParameter('X_ATP_Wlan11NGIControl',getSelectVal('giControl'));
	}
	Form.addParameter('Enable',getCheckVal('enableSsid'));
	Form.addParameter('Channel',getSelectVal('wlChannel'));
	Form.addParameter('X_CT-COM_SSIDHide',getCheckVal('wlHide'));
	Form.addParameter('X_CT-COM_Powerlevel',getSelectVal('wlTxPwr'));
	var ssid = getValue('wlSsid');
	if (ssid == '' )
	{
		alert('SSID<%tcWebApi_get("String_Entry","EmptyText","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	if (ssid.length > 32)
	{
		alert('SSID "' + getValue('wlSsid') + '" <%tcWebApi_get("String_Entry","EqualOrLesser32Text","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	if (<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %> == 0)
	{
		if(document.forms[0].isCUCSupport.value == 1){
			var preLen= document.forms[0].SSIDPre.value.length;
			var the_substring = ssid.substring(0, preLen);
			if (the_substring != document.forms[0].SSIDPre.value)
			{
				alert('SSID1 "' + getValue('wlSsid') + '" <%tcWebApi_get("String_Entry","Should1Text","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
		}

	}
	if (isValidAscii(ssid) != '')
	{
		alert("SSID<%tcWebApi_get("String_Entry","InvalidCharacterText","s")%> '" + isValidAscii(ssid) + "'");
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}

<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
	var deviceNum = parseInt(getValue('wlAssociateNum'),10);
  if (isPlusInteger(deviceNum) == false
      || parseInt(deviceNum) < 1
      || parseInt(deviceNum) > 32
      || !isInteger(getValue('wlAssociateNum')))
  {
      alert('<%tcWebApi_get("String_Entry","NumberConnectText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));      
      return false;
  }
<%end if%>
	Form.addParameter('SSID',ssid);
	var AuthMode = getSelectVal('wlSecurMode');
	Form.addParameter('BeaconType',AuthMode);
	Form.endPrefix();

	var KeyBit = getSelectVal('wlKeyBit');
	var index = parseInt(getSelectVal('wlKeyIndex'));
	var wlKeys = getElById('wlKeys');
	if (AuthMode == 'None')
	{
		Form.addParameter('y.BasicEncryptionModes','None');
		Form.addParameter('y.BasicAuthenticationMode','OpenSystem');
		return true;
	}
	else if (AuthMode == 'Basic')
	{
		var wepauthtype = getSelectVal('wlWep');
		if ( (wepauthtype == 'OpenSystem')
		||(wepauthtype == 'SharedKey')
		||(wepauthtype == 'Both'))
		{
			if( false == checkWePKeyValue(KeyBit,index,wlKeys) )
					{
							return false;
						}
			Form.addParameter('y.WEPEncryptionLevel',(KeyBit-24)+'-bit');
			Form.addParameter('y.WEPKeyIndex',index);
			for (l = 1; l <= 4; l++)
			{
				Form.addParameter('k' + l +  '.InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.WEPKey.' + l + '.' + 'WEPKey',
				wlKeys[l-1].value);
			}
		}
		Form.addParameter('y.BasicEncryptionModes','WEPEncryption');
		Form.addParameter('y.BasicAuthenticationMode',wepauthtype);
		return true;
	}
	else if (AuthMode == 'WPA' || AuthMode == '11i' || AuthMode == 'WPAand11i'
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					 || AuthMode == 'WPA3-SAE' || AuthMode == 'WPA3 Transition'
<% end if %>)
	{
		value = getValue('wlWpaPsk');
		if (isValidWPAPskKey(value) == false )
		{
			alert('WPA  <%tcWebApi_get("String_Entry","PreliminaryKeyText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		Form.addParameter('y.X_ATP_WPSMode', getSelectVal('wpsmode'));
		if(getSelectVal("wpsmode") == 'ap-pin')
		{
			var pinval = getElement('pinvalue');
			if(isSafeStringIn(pinval.value,'0123456789') == false)
			{
				alert('<%tcWebApi_get("String_Entry","PINIntegerText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			var pinValue = pinval.value;
			if(pinValue.length != pinLen)
			{
				alert('<%tcWebApi_get("String_Entry","EightDigitPINText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			if(isvalidpin(pinValue) == false)
			{
				alert('<%tcWebApi_get("String_Entry","RightPINText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			Form.addParameter('y.X_ATP_WPSPinValue', getValue('pinvalue'));
		}
		Form.addParameter('k.PreSharedKey.1.PreSharedKey',value);
		if (AuthMode == 'WPA')
		{
			Form.addParameter('y.WPAEncryptionModes',getSelectVal('wlWpa'));
		}
		else  if (AuthMode == '11i')
		{
			Form.addParameter('y.IEEE11iEncryptionModes',getSelectVal('wlWpa'));
		}
		else  if (AuthMode == 'WPAand11i')
		{
			Form.addParameter('y.WPAWPA2EncryptionModes',getSelectVal('wlWpa'));
		}
	}
	else if(AuthMode == 'radius64' || AuthMode == 'radius128')
	{
		if(false == checkRadiusSetting() ||false == checkWePKeyValue(KeyBit,index,wlKeys))
		{
			return false;
		}
	}
	else if(AuthMode == 'wpaOnly' || AuthMode == 'wpa2Only' || AuthMode == 'wpa1and2'
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	|| AuthMode == 'WPA3' || AuthMode == 'WPA3-192Bit'
<% end if %>
	)
	{
		if( false == checkRadiusSetting())
		{
			return false;
		}
		
		if(checkRekeyinteral(document.ConfigForm.WPARekeyInter.value))
		{
			return false;
		}
	}
	
	return true;
}
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>
var initFlag = true;
function initWLanTxBeamFormingSel()			/*init TxBeamforming sel*/
{
	var ITxBfEn = "<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>";
	var ETxBfEnCond = "<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>";
	var ETxBfIncapable = "<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>";
	if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		/*Both*/
	{
		document.ConfigForm.WLanTxBeamForming[0].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		/*Explicit*/
	{
		document.ConfigForm.WLanTxBeamForming[1].selected = true;
	}
	else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		/*Implicit*/
	{
		document.ConfigForm.WLanTxBeamForming[2].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		/*Disable*/
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
	else
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
}

function doVHTTxBeamFormingChange()
{
	if(document.ConfigForm.WLanTxBeamForming[0].selected == true)			/*Both*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLanTxBeamForming[1].selected == true)		/*Explicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLanTxBeamForming[2].selected == true)		/*Implicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else if(document.ConfigForm.WLanTxBeamForming[3].selected == true)		/*Disable*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
}
<% end if %>	
<% end if %>

function WDSKeyCheck(object) {
	var keyvalue=object.value;
	var wdskeylen=object.value.length;
 	if(wdskeylen < 8) {
  	alert('WDS Key length error!');
		return true;
	}else if(wdskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('WDS Key Hex value error!');
				return true;
			}
		}
	}else if(wdskeylen > 64) {
    alert('WDS Key length error!');
		return true;
	}			
	return false;
}

function quotationCheck(object, limit_len) {
	var len = object.value.length;
	var c;
	var i, j = 0;
  for (i = 0; i < len; i++)
  {
	 	var c = object.value.charAt(i);
	  if (c == '"')
		{
			j += 6;
		}
		else
			j++;
  }
 	if (j > limit_len-1)
	{
    alert('too many quotation marks!');		
    return true;
	}	
	return false;
}

function SubmitForm()
{
	if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
		checkRTS(document.ConfigForm.RTSThreshold.value) ||
		checkFrag(document.ConfigForm.FragmentThreshold.value)){
		return false;
	}
	

	if(enbl == 1)
	{
	if(getValue('isInWPSing')!=0 && getValue('hWpsStart')!=1)
	{
		alert("<%tcWebApi_get("String_Entry","WPSIsWorkingText","s")%>");
		return;
	}		
	}		

	var Form = new webSubmitForm();
	var enable = getCheckVal('wlEnbl');
	Form.addParameter('x.WLANConfiguration.1.X_CT-COM_APModuleEnable',enable);
	var wlandomain = 'InternetGatewayDevice.LANDevice.1.WLANConfiguration.'
	+(ssidIdx + 1);
<% if tcWebApi_get("WebCustom_Entry", "isUBUSSupported", "h") = "Yes" then	%>
		var wifiswitchval =	"<% tcWebApi_get("WLan_Common", "wifiswitch", "s") %>";
		var wifiswitchval11ac =	"<% tcWebApi_get("WLan11ac_Common", "wifiswitch", "s") %>";

	if((wifiswitchval != 'on') && (wifiswitchval11ac != 'on'))
	{
		setCheck('wlEnbl',0);
		alert("<%tcWebApi_get("String_Entry","UbusWifiSwitchAlert","s")%>");
		return false;
	}

		var wpsswitchval =	"<% tcWebApi_get("WLan_Common", "wpsswitch", "s") %>";
		var wpsswitchval11ac =	"<% tcWebApi_get("WLan11ac_Common", "wpsswitch", "s") %>";
	if ( document.forms[0].enableWps.checked )
	{	
		if((wpsswitchval != 'on') && (wpsswitchval11ac != 'on'))
		{
			document.forms[0].enableWps.checked = false;
			alert("<%tcWebApi_get("String_Entry","UbusWPSSwitchAlert","s")%>");
			return false ;
		}
	}
<% end if %>
	if(state == 1 && enable == 1)
	{
		if (addParameter(Form) == false)
		{
			return;
		}
		if(!doWPScheck())
		{
			return;
		}
		var SecurMode = getSelectVal('wlSecurMode');
		if (SecurMode == 'None')
		{
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain
			+ '&RequestFile=html/network/wlan.asp');
		}
		else if (SecurMode == 'Basic')
		{

			if(document.forms[0].enableWps.checked)
			{
				alert("<%tcWebApi_get("String_Entry","ForWEPText","s")%>");
				return;
			}		

			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain + '&k1=' + '&k2='
			+ '&k3=' + '&k4='
			+ '&RequestFile=html/network/wlan.asp');
		}
		else if (SecurMode == 'WPA' || SecurMode == '11i' || SecurMode == 'WPAand11i')
		{
			if(wpsV2Support == 1 && document.forms[0].enableWps.checked && getSelectVal('wlWpa') == "TKIP")
			{
				alert("<%tcWebApi_get("String_Entry","ForWPAText","s")%>");
				return;
			}
			
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain + '&k=' + wlandomain 
			+ '&RequestFile=html/network/wlan.asp');
		}
	}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		if(isMeshBssCfg)
		{
			if(1 != isBackHaul && 1 != isFrontHaul && (SecurMode != 'None') && (SecurMode != '11i') && (SecurMode != 'WPA') && (SecurMode != 'WPAand11i') && (SecurMode != 'WPA3-SAE') && (SecurMode != 'WPA3 Transition'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText6","s")%>");
				return;
			}
			else if(1 == isBackHaul && 1 != isFrontHaul && (SecurMode != 'None') && (SecurMode != '11i') && (SecurMode != 'WPA3-SAE') && (SecurMode != 'WPA3 Transition'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>");
				return;
			}
			else if(1 != isBackHaul && 1 == isFrontHaul && (SecurMode != 'None') && (SecurMode != '11i') && (SecurMode != 'WPA3 Transition'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText8","s")%>");
				return;
			}
			else if(1 == isBackHaul && 1 == isFrontHaul && (SecurMode != 'None') && (SecurMode != '11i') && (SecurMode != 'WPA3 Transition'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText8","s")%>");
				return;
			}
			var sel_wlWpa = getSelectVal('wlWpa');
			if(SecurMode != 'None')
			{
				if( 1 != isBackHaul && 1 != isFrontHaul && (sel_wlWpa != "NONE") && (sel_wlWpa != "AES") && (sel_wlWpa != "TKIP") && (sel_wlWpa != "TKIPAES"))
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText5","s")%>");
					return;
				}
				else if( ( 1 == isBackHaul || 1 == isFrontHaul ) && (sel_wlWpa != "NONE") && (sel_wlWpa != "AES"))
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>");
					return;
				}
			}
		}
<% end if %>
	else
	{
		Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
		+ '&y='+ wlandomain
		+ '&RequestFile=html/network/wlan.asp');
	}
	//Form.submit();
	setDisable('btnOK',1);
	SetCtlValue();
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>	
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>
	doVHTTxBeamFormingChange();
<% end if %>	
<% end if %>	
	var mode = getValue('wlgMode');
	var SecurMode1 = getSelectVal('wlSecurMode');
	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
		{
			if((SecurMode1 == 'WPA') || (SecurMode1 == '11i') || (SecurMode1 == 'WPAand11i' ))
			{
				if (WDSKeyCheck(document.ConfigForm.WDS_Key))
				{
					return false;
				}
				if(quotationCheck(document.ConfigForm.WDS_Key, 385) )
				{
					return false;	 
				} 
			}
		}
		
		if(doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC1)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC2)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC3)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC4))
		{
			return false;
	}
	}
<% if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then %>
	if(document.ConfigForm.WLAN_FltActive[0].checked == true)
	{
		if(doMACcheck(document.ConfigForm.WLANFLT_MAC1)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC2)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC3)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC4)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC5)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC6)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC7)||
			doMACcheck(document.ConfigForm.WLANFLT_MAC8))
		{
			return false;
		}
	}
<% end if %>
	
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}
function wlClickEnble(wlEnbleCl)
{   
	if (wlEnbleCl.checked == true)
	{
		if (state == 1)
		{
			setDisplay('wlInfo',1);
			setDisplay('authen',1);
			setDisplay('wlUserTip',1);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			setDisplay('wlMeshTip',1);
<% end if %>
		}
	}
	else
	{
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		wlEnbleCl.checked = true;
		alert("Please keep wifi is enable when mesh is enable.");
		return;
		//setDisplay('wlMeshTip',0);
<% end if %>
		setDisplay('wlInfo',0);
		setDisplay('authen',0);
		setDisplay('wlUserTip',0);
	}
}

function SetCtlValue()
{	
	with ( document.forms[0])
	{
		var enable = getCheckVal('wlEnbl');
		if(enable == 1)
			setText('hwlEnbl', 1);
		else
			setText('hwlEnbl', 0);
		enable = getCheckVal('enableSsid');
		if(enable == 1)
			setText('henableSsid', 1);
		else
			setText('henableSsid', 0);
		var hide = getCheckVal('wlHide');
		if(hide == 1)
			setText('hwlHide', 1);
		else
			setText('hwlHide', 0);		
		
		var temp = getSelectVal("wpsmode");
		if(temp == 'ap-pin')
		{
			setText('hWPSMode', 0);
		}
		else
		{
			setText('hWPSMode', 1);
		}
		
		setText('hwlKeys0', wlKeys[0].value);
		setText('hwlKeys1', wlKeys[1].value);
		setText('hwlKeys2', wlKeys[2].value);
		setText('hwlKeys3', wlKeys[3].value);
		
		var mode = '0';
		WirelessMode = getSelectVal('wlgMode');
		if (WirelessMode == 'b,g')
			mode = '0';
		else if (WirelessMode == 'b')
			mode = '1';
		else if (WirelessMode == 'g')
			mode = '4';
		else if (WirelessMode == 'n')
			mode = '6';
		else if (WirelessMode == 'g,n')
			mode = '7';
		else if (WirelessMode == 'b,g,n')
			mode = '9';		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		else if (WirelessMode == 'g,n,ax')
		{
			mode = '16';
		}
<% end if %>
		else
			mode = '0';			
		setText('hwlgMode', mode);		
		
		var BeaconType = 'OPEN';
		var SecurMode = getSelectVal('wlSecurMode');
		if (SecurMode == 'Basic')
		{
			var wlKeyBitLen = getSelectVal('wlKeyBit');
			if(wlKeyBitLen == 128)
				BeaconType = 'WEP-128Bits';
			else
				BeaconType = 'WEP-64Bits';
		}
		else if (SecurMode == 'WPA')
			BeaconType = 'WPAPSK';
		else if (SecurMode == '11i')
			BeaconType = 'WPA2PSK';
		else if (SecurMode == 'WPAand11i')
			BeaconType = 'WPAPSKWPA2PSK';
		else if (SecurMode == 'radius64')
			BeaconType = 'Radius-WEP64';
		else if (SecurMode == 'radius128')
			BeaconType = 'Radius-WEP128';
		else if (SecurMode == 'wpaOnly')
			BeaconType = 'WPA';
		else if (SecurMode == 'wpa2Only')
			BeaconType = 'WPA2';
		else if (SecurMode == 'wpa1and2')
			BeaconType = 'WPA1WPA2';
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3-SAE')
			BeaconType = 'WPA3PSK';
		else if (SecurMode == 'WPA3 Transition')
			BeaconType = 'WPA2PSKWPA3PSK';
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		else if (SecurMode == 'WPA3')
			BeaconType = 'WPA3';
		else if (SecurMode == 'WPA3-192Bit')
			BeaconType = 'WPA3-192Bit';
<% end if %>
<% end if %>
		else//'None'
			BeaconType = 'OPEN';
		setText('hwlAuthMode', BeaconType);
		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		var wlanMuOfdmaDl = getCheckVal('wlanMuOfdmaDlEnable');
		if(wlanMuOfdmaDl == 1)
		{
			setText('WlanMuOfdmaDlEnable_flag', 1);
			setText('WlanMuOfdmaUlEnable_flag', 1);
		}
		else
		{
			setText('WlanMuOfdmaDlEnable_flag', 0);
			setText('WlanMuOfdmaUlEnable_flag', 0);
		}
		var wlanMuMimoDl = getCheckVal('wlanMuMimoDlEnable');
		if(wlanMuMimoDl == 1)
		{
			setText('WlanMuMimoDlEnable_flag', 1);
			setText('WlanMuMimoUlEnable_flag', 1);
		}
		else
		{
			setText('WlanMuMimoDlEnable_flag', 0);
			setText('WlanMuMimoUlEnable_flag', 0);
		}
		var wlanSR = getCheckVal('wlanSREnable');
		if(wlanSR == 1)
		{
			setText('WlanSREnable_flag', 1);
		}
		else
		{
			setText('WlanSREnable_flag', 0);
		}
<% end if %>
		
		setText('Save_Flag', 1);
	}
}

function selChangedSSID()
{
	document.ConfigForm.SSID_Flag.value = "1";
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function autoWLAN_WDS_Active()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = false;
		document.ConfigForm.WDS_Key.disabled = false;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = false;
}

function autoWLAN_WDS_Deactive()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = true;
		document.ConfigForm.WDS_Key.disabled = true;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = true;
}


function autoWLAN_Flt_Active()
{
	if(document.ConfigForm.WLAN_FltAction != null){
		document.ConfigForm.WLAN_FltAction.disabled = false;
	}
	document.ConfigForm.WLANFLT_MAC1.disabled = false;
	document.ConfigForm.WLANFLT_MAC2.disabled = false;
	document.ConfigForm.WLANFLT_MAC3.disabled = false;
	document.ConfigForm.WLANFLT_MAC4.disabled = false;
	document.ConfigForm.WLANFLT_MAC5.disabled = false;
	document.ConfigForm.WLANFLT_MAC6.disabled = false;
	document.ConfigForm.WLANFLT_MAC7.disabled = false;
	document.ConfigForm.WLANFLT_MAC8.disabled = false;
}	

function autoWLAN_Flt_Deactive()
{
	if(document.ConfigForm.WLAN_FltAction != null){
		document.ConfigForm.WLAN_FltAction.disabled = true;
	}
	document.ConfigForm.WLANFLT_MAC1.disabled = true;
	document.ConfigForm.WLANFLT_MAC2.disabled = true;
	document.ConfigForm.WLANFLT_MAC3.disabled = true;
	document.ConfigForm.WLANFLT_MAC4.disabled = true;
	document.ConfigForm.WLANFLT_MAC5.disabled = true;
	document.ConfigForm.WLANFLT_MAC6.disabled = true;
	document.ConfigForm.WLANFLT_MAC7.disabled = true;
	document.ConfigForm.WLANFLT_MAC8.disabled = true;
}

function doHexCheck(c)
{
  if ((c >= "0")&&(c <= "9"))
  {
    return 1;
  }
  else if ((c >= "A")&&(c <= "F"))
  {
    return 1;
  }
  else if ((c >= "a")&&(c <= "f"))
  {
    return 1;
  }

  return -1;
}

function isNumeric(s)
{
  var len = s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}

function checkRekeyinteral(value) 
{
	if (!isNumeric(value)) {
		alert("<%tcWebApi_get("String_Entry","WPAGroupintegerText","s")%>"); 
		return true;
	}
	if (value < 10 || value > 4194303) {
		alert("<%tcWebApi_get("String_Entry","WPAGrouprangeText","s")%>");
		return true;
	}	
	return false;
}


function checkBeacon(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","BeaconIntervalintegerText","s")%>");    
    return true;
  }
  if (value < 20 || value > 1000) {
    alert("<%tcWebApi_get("String_Entry","BeaconIntervalrangeText","s")%>");    
    return true;  	
  }
  return false;
}

function checkRTS(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","RTSThresholdintegerText","s")%>");    
    return true;
  }
  if (value < 1500 || value > 2347) {
    alert("<%tcWebApi_get("String_Entry","RTSThresholdrangeText","s")%>");    
    return true;  	
  }
  return false;
}

function checkFrag(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdintegerText","s")%>");    
    return true;
  }
  if (value < 256 || value > 2346) {
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdrangeText","s")%>");    
    return true;  	
  }
  if (value % 2) {
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdevenText","s")%>");    
    return true;  	
  }
  return false;
}


function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";

  if ( len == 0 )
  {
    object.value ="00:00:00:00:00:00";
    return false;
  }

  if ( len == 12 )
  {
    var newAddr = "";
    var i = 0;

    for ( i = 0; i < len; i++ )
    {
      var c = szAddr.charAt(i);
      
      if ( doHexCheck(c) < 0 )
      {
      	alert("Invalid MAC Address");        
        return true;
      }
      if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
        newAddr = newAddr + ":";
      newAddr = newAddr + c;
    }
    object.value = newAddr;
  }
  else if ( len == 17 )
  {
    var i = 2;
    var c0 = szAddr.charAt(0);
    var c1 = szAddr.charAt(1);

    if ( (doHexCheck(c0) < 0) || (doHexCheck(c1) < 0) )
    {
			alert("Invalid MAC Address");       	
			return true;
    }
    
    i = 2;
    while ( i < len )
    {
      var c0 = szAddr.charAt(i);
      var c1 = szAddr.charAt(i+1);
      var c2 = szAddr.charAt(i+2);  
      if ( (c0 != ":") || (doHexCheck(c1) < 0) || (doHexCheck(c2) < 0) )
      {
				alert("Invalid MAC Address");         	
				return true;
      }
      i = i + 3;
    }
  }
  else
  {
		alert("Invalid MAC Address");         	
		return true;
  }

  return false;
}
function doResetOOB(){
	document.ConfigForm.WpsOOB.value = 1;
if( true == setEBooValueCookie(document.ConfigForm) )
{
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
	top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
<% end if %>
	document.ConfigForm.submit();
}
}

</SCRIPT>

</HEAD>
<body onload="FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload="DoUnload()">
	<INPUT id=Selected_Menu type=hidden 
	value="<%tcWebApi_get("String_Entry","ContentNetText","s")%>-><%tcWebApi_get("String_Entry","ContentWLANText","s")%>" name="Net_Wlan">
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
							MakeHeader('<%tcWebApi_get("String_Entry","GatewayNameText","s")%>','<%tcWebApi_get("String_Entry","ModeText","s")%>','<%tcWebApi_get("String_Entry","ContentNetText","s")%>','<%tcWebApi_get("String_Entry","ContentWLANText","s")%>','<%tcWebApi_get("String_Entry","WelcomeSettingText","s")%>','<%tcWebApi_get("String_Entry","logoHerf","s")%>');
							</SCRIPT>
						</div>
						<div class="">
	 
	 
	 
							  <div class="scoop-inner-content">
	 
	 
													<h1 class="heading_big bei pb-3">WLAN</h1>
	 
														<div class="white_box">
															   <h1 class="heading_grey"style="color:#fd7e14">
							<img src="../img/wlan.png" width="45" height="40" class="img_sub" alt=""/> <span style="vertical-align:middle"><%tcWebApi_get("String_Entry","WLANText","s")%> </span></h1>
	 
									   <form name="ConfigForm" action="/cgi-bin/net-wlan.asp" method="post">
				  <INPUT TYPE="HIDDEN" ID="hCountryRegion" NAME="hCountryRegion" value="<% tcWebApi_get("WLan_Common","CountryRegion","s") %>" >
				  <INPUT TYPE="HIDDEN" ID="CountryName" NAME="CountryName" value="<% tcWebApi_get("WLan_Common","Country","s") %>" >
				  <INPUT TYPE="HIDDEN" ID="CountryChange" NAME="CountryChange" VALUE="0" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion0" NAME="CountryRegion0" value="0" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion1" NAME="CountryRegion1" value="1" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion2" NAME="CountryRegion2" value="2" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion3" NAME="CountryRegion3" value="3" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion4" NAME="CountryRegion4" value="4" >
				  <INPUT TYPE="HIDDEN" ID="CountryRegion5" NAME="CountryRegion5" value="5" >
	 <% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
						<INPUT TYPE="HIDDEN" NAME="WLanITxBfEn" value="<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>">
						<INPUT TYPE="HIDDEN" NAME="WLanETxBfEnCond" value="<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>">
						<INPUT TYPE="HIDDEN" NAME="WLanETxBfIncapable" value="<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>">
	 <% end if %>
	 <% if tcWebApi_get("WLan_Common","rt_device","h") = "7915" then %>
						<INPUT TYPE="HIDDEN" NAME="is11AXModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
						<INPUT TYPE="HIDDEN" NAME="isWPA3ModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
	 <% end if %>
	 <input type="hidden" id="hwlKeys0" name="hwlKeys0" value="0">
						<input type="hidden" id="hwlKeys1" name="hwlKeys1" value="0">
						<input type="hidden" id="hwlKeys2" name="hwlKeys2" value="0">
						<input type="hidden" id="hwlKeys3" name="hwlKeys3" value="0">
						<input type="hidden" id="hwlgMode" name="hwlgMode" value="0">
						<input type="hidden" id="hwlAuthMode" name="hwlAuthMode" value="0">
						<input type="hidden" id="hwlEnbl" name="hwlEnbl" value="0">
						<input type="hidden" id="hWPSMode" name="hWPSMode" value="0">
						<input type="hidden" id="henableSsid" name="henableSsid" value="0">
						<input type="hidden" id="hwlHide" name="hwlHide" value="0">
						<INPUT TYPE="hidden" id="isInWPSing" NAME="isInWPSing" value="<%If TCWebApi_get("Info_WLan","wlanWPStimerRunning","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPStimerRunning","s") else asp_write("0") end if%>">
						<INPUT TYPE="HIDDEN" id="WpsConfModeAll" NAME="WpsConfModeAll" value="7">
						<INPUT TYPE="HIDDEN" id="WpsConfModeNone" NAME="WpsConfModeNone" value="0">
						<INPUT TYPE="hidden" id="hWpsStart" NAME="hWpsStart" value="0">
						<INPUT TYPE="hidden" id="WpsOOB" NAME="WpsOOB" value="0">
						<INPUT TYPE="hidden" id="WpsGenerate" NAME="WpsGenerate" value="0">
						<INPUT TYPE="hidden" id="isCUCSupport" NAME="isCUCSupport" value="<%if tcWebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
						<INPUT type="hidden" id="SSIDPre" NAME="SSIDPre" value="<%tcWebApi_get("WLan_Common","SSIDPre","s")%>">
						<INPUT type="HIDDEN" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
						<INPUT type="HIDDEN" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
						<INPUT TYPE="HIDDEN" ID="isWDSSupported" NAME="isWDSSupported" value="<% if tcWebApi_get("Info_WLan","isWDSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
						<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_NONE" NAME="WDS_EncrypType_NONE" value="NONE" >
						<INPUT TYPE="HIDDEN" ID="currentTime" NAME="currentTime" value="" >
															   <div class="container-fluid">
															   <hr class="margin_adjs" />
															   <div class="row">
																	 <div class="col-md-12 form-group">
																			<div class="custom-control custom-checkbox">
										  <INPUT onclick=wlClickEnble(this) type="checkbox" value="ON" id="wlEnbl" name="wlEnbl"  class="custom-control-input" >
																			 <label class="custom-control-label" for="wlEnbl"><%tcWebApi_get("String_Entry","EnableWirelessText","s")%></label>
																			</div>
																	 </div>
									 <div class="row col-md-12" id="wlInfo">
																	 <div class="col-md-3 form-group">
																			<label><%tcWebApi_get("String_Entry","SelectModeText","s")%></label>
										<SELECT class="custom-select" onchange="gModeChange()" size="1" id="wlgMode"
						name=wlgMode>
											<OPTION value=b,g,n selected>802.11b/g/n <%tcWebApi_get("String_Entry","MixText","s")%>
											<OPTION value=b,g>802.11b/g <%tcWebApi_get("String_Entry","MixText","s")%></OPTION>
											<OPTION value=n>802.11n</OPTION>
											<OPTION value=g>802.11g</OPTION>
											<OPTION value=b>802.11b</OPTION>
											<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
						<OPTION value=g,n,ax> 802.11g/n/ax <%tcWebApi_get("String_Entry","MixText","s")%></OPTION>
																				  <% end if %>
											</SELECT>
						  <SCRIPT language=JavaScript type=text/javascript>
							 if (curUserName != sptUserName)
								getElement("div_gMode").style.display = "none";
						</SCRIPT>
	 
																	 </div>
	 
																	 <div class="col-md-3 form-group" id="wlTransferRate">
																	    <label>Transmitted Power</label>
																	    <select class="custom-select"></select>
									<SELECT  class="custom-select" size="1" name="wlRate" id="wlRate"></SELECT></TD></TR>
				 <SCRIPT language=JavaScript type=text/javascript>
					//if (curUserName != sptUserName)
					//      getElement("wlTransferRate").style.display = "none";
				 </SCRIPT>
																 </div>
																 <div class="col-md-3 form-group" id="wlPutOutPower">
																	    <label><%tcWebApi_get("String_Entry","TransmittedPowerText","s")%></label>
									<SELECT class="custom-select" size=1 id="wlTxPwr" name="wlTxPwr">
									 
																	 
						  <OPTION value=5>9%</OPTION>
						  <OPTION value=4>15%</OPTION>
						  <OPTION value=3>25%</OPTION>
						  <OPTION value=2>50%</OPTION>
						  <OPTION value=1>75%</OPTION>
						  <OPTION value=6 selected>100%</OPTION>
						  </SELECT>
						  <SCRIPT language=JavaScript type=text/javascript>
							 //if (curUserName != sptUserName)
							 //        getElement("wlPutOutPower").style.display = "none";
				  </SCRIPT>
																	 </div>
									 <div class="col-md-3 form-group">
																				  <label><%tcWebApi_get("String_Entry","WlanBeaconIntervalText","s")%></label>
																				  <div class="input-group">
											 <input type="text" class="form-control" id="BeaconInterval" name="BeaconInterval"  MAXLENGTH="4" VALUE="<% If tcWebApi_get("WLan_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","BeaconPeriod","s") else asp_Write("100") end if %>">
																					<div class="input-group-append">
																						<span class="input-group-text">(<%tcWebApi_get("String_Entry","BeaconRangeTipText","s")%>)</span>
																					</div>
																						</div>
																				  </div>
	 
																	 <div class="col-md-3 form-group">
																			<label><%tcWebApi_get("String_Entry","SelectChannelText","s")%></label>
																						<SELECT class="custom-select" ID="Countries_Channels" NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" style="display: none">
	
     
                    	<SCRIPT language=JavaScript type=text/javascript>
			if (curUserName != sptUserName)
				getElement("div_gMode").style.display = "none";
			</SCRIPT>
			<TR>
            <TD><font color="#000000"><%tcWebApi_get("String_Entry","SelectChannelText","s")%></font></TD>
            <TD>
            	<SELECT ID="Countries_Channels" NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >	
								<SCRIPT language=javascript >
									var countryarr = new Array(98);
									countryarr[0]="ALBANIA";
									countryarr[1]="ALGERIA";
									countryarr[2]="ARGENTINA";
									countryarr[3]="ARMENIA";
									countryarr[4]="AUSTRALIA";
									countryarr[5]="AUSTRIA";
									countryarr[6]="AZERBAIJAN";
									countryarr[7]="BAHRAIN";
									countryarr[8]="BELARUS";
									countryarr[9]="BELGIUM";
									countryarr[10]="BELIZE";
									countryarr[11]="BOLIVIA";
									countryarr[12]="BRAZIL";
									countryarr[13]="BRUNEI DARUSSALAM";
									countryarr[14]="BULGARIA";
									countryarr[15]="CANADA";
									countryarr[16]="CHILE";
									countryarr[17]="CHINA";
									countryarr[18]="COLOMBIA";
									countryarr[19]="COSTA RICA";
									countryarr[20]="CROATIA";
									countryarr[21]="CYPRUS";
									countryarr[22]="CZECH REPUBLIC";
									countryarr[23]="DENMARK";
									countryarr[24]="DOMINICAN REPUBLIC";
									countryarr[25]="ECUADOR";
									countryarr[26]="EGYPT";
									countryarr[27]="ELSALVADOR";
									countryarr[28]="FINLAND";
									countryarr[29]="FRANCE";
									countryarr[30]="GEORGIA";
									countryarr[31]="GERMANY";
									countryarr[32]="GREECE";
									countryarr[33]="GUATEMALA";
									countryarr[34]="HONDURAS";
									countryarr[35]="HONGKONG";
									countryarr[36]="HUNGARY";
									countryarr[37]="ICELAND";
									countryarr[38]="INDIA";
									countryarr[39]="INDONESIA";
									countryarr[40]="IRAN";
									countryarr[41]="IRELAND";
									countryarr[42]="ISRAEL";
									countryarr[43]="ITALY";
									countryarr[44]="JAPAN";
									countryarr[45]="KAZAKHSTAN";
									countryarr[46]="KOREA DEMOCRATIC";
									countryarr[47]="KOREA REPUBLIC";
									countryarr[48]="LATVIA";
									countryarr[49]="LEBANON";
									countryarr[50]="LIECHTENSTEIN";
									countryarr[51]="LITHUANIA";
									countryarr[52]="LUXEMBOURG";
									countryarr[53]="MACAU";
									countryarr[54]="MACEDONIA";
									countryarr[55]="MALAYSIA";
									countryarr[56]="MEXICO";
									countryarr[57]="MONACO";
									countryarr[58]="MOROCCO";
									countryarr[59]="NETHERLANDS";
									countryarr[60]="NEW ZEALAND";
									countryarr[61]="NORWAY";
									countryarr[62]="OMAN";
									countryarr[63]="PAKISTAN";
									countryarr[64]="PANAMA";
									countryarr[65]="PERU";
									countryarr[66]="PHILIPPINES";
									countryarr[67]="POLAND";
									countryarr[68]="PORTUGAL";
									countryarr[69]="PUERTO RICO";
									countryarr[70]="QATAR";
									countryarr[71]="ROMANIA";
									countryarr[72]="RUSSIA";
									countryarr[73]="SAUDI ARABIA";
									countryarr[74]="SINGAPORE";
									countryarr[75]="SLOVAKIA";
									countryarr[76]="SLOVENIA";
									countryarr[77]="SOUTH AFRICA";
									countryarr[78]="SPAIN";
									countryarr[79]="SWEDEN";
									countryarr[80]="SWITZERLAND";
									countryarr[81]="SYRIAN ARAB REPUBLIC";
									countryarr[82]="TAIWAN";
									countryarr[83]="THAILAND";
									countryarr[84]="TRINIDAD AND TOBAGO";
									countryarr[85]="TUNISIA";
									countryarr[86]="TURKEY";
									countryarr[87]="UKRAINE";
									countryarr[88]="UNITED ARAB EMIRATES";
									countryarr[89]="UNITED KINGDOM";
									countryarr[90]="UNITED STATES";
									countryarr[91]="URUGUAY";
									countryarr[92]="UZBEKISTAN";
									countryarr[93]="VENEZUELA";
									countryarr[94]="VIETNAM";
									countryarr[95]="YEMEN";
									countryarr[96]="ZIMBABWE";
									countryarr[97]="Undefined";

									for(i=0;i<98;i++)
									{
										if(document.ConfigForm.CountryName.value.match(countryarr[i]) != null)
										{
											document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
											document.ConfigForm.Countries_Channels[i].selected=true;
										}
										else
										{
											if(countryarr[i].match("TAIWAN") !=null){
												document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
											}
											else
											{
												document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
												document.ConfigForm.Countries_Channels[i].selected=false;
											}
										}
									}	
								</SCRIPT>				
							 </SELECT>
							 <SELECT class="custom-select" ID="wlChannel" NAME="wlChannel" SIZE="1" onChange="ChannelChange()"></SELECT>
</div>

<div class="col-md-3 form-group">
<label><%tcWebApi_get("String_Entry","CurrentChannelText","s")%></label>
		 <INPUT class="form-control" TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if %>" disabled >
			<SCRIPT language=JavaScript type=text/javascript>
				var t = new Date();
				var year = t.getFullYear();
				var month = t.getMonth() + 1;
				var day = t.getDate();
				var hour = t.getHours();
				var minute = t.getMinutes();
				var second = t.getSeconds();
				var curTime = "" + year + ((month<10)?"0":"") + month + ((day<10)?"0":"") + day + ((hour<10)?"0":"") + hour + ((minute<10)?"0":"") + minute + ((second<10)?"0":"") + second;
				var lastTime = "<%tcWebApi_get("WebCurSet_Entry","24G_channel_update_time","s")%>";
				//var interval = getTimeDifference(curTime, lastTime);
				interval = Math.abs(Number(curTime) - Number(lastTime));

				//show the real value after 20s
				if (isNaN(lastTime) || (interval >= 20) || (document.ConfigForm.wlChannel.value == "0"))
				{
					//use real value
					document.ConfigForm.CurrentChannel.value = "<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>";
				}
				else
				{
					//use select value
					document.ConfigForm.CurrentChannel.value = "<% If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if %>";
																	if (document.ConfigForm.CurrentChannel.value == "0")
					{
					   //use real value
					   document.ConfigForm.CurrentChannel.value = "<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>";
					}
				}
			 </SCRIPT>
							 </div>

							  <div class="col-md-3 form-group">
										  <label><%tcWebApi_get("String_Entry","WlanRTSThresholdText","s")%></label>
										  <div class="input-group">
	<input type="text" class="form-control" id="RTSThreshold" name="RTSThreshold" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","RTSThreshold","s") else asp_Write("2347") end if %>">
											<div class="input-group-append">
												<span class="input-group-text">(<%tcWebApi_get("String_Entry","RTSrangeTipText","s")%>)</span>
											</div>
												</div>
										  </div>
							 <div class="col-md-3 form-group">
										  <label><%tcWebApi_get("String_Entry","WlanFragmentThresholdText","s")%></label>
										  <div class="input-group">

	<INPUT type="text" class="form-control" id="FragmentThreshold" name="FragmentThreshold"  MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","FragThreshold","s") else asp_Write("2346") end if %>">
											<div class="input-group-append">
												<span class="input-group-text">(<%tcWebApi_get("String_Entry","FragmentRangeTipText","s")%>)</span>
											</div>
												</div>
										  </div>
	<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>
							 <div class="col-md-3 form-group" id="trTxBeamforming">
									<label><%tcWebApi_get("String_Entry","FixTransmissionText","s")%></label>
<SELECT class="custom-select" NAME="WLanTxBeamForming">
				<option value="3">Both</option>
				<option value="2">Explicit TxBF</option>
				<option value="1">Implicit TxBF</option>
				<option value="0">Disable</option>
		  </SELECT>
							 </div>
<% end if %>
<% end if %>

<div class="col-md-3 form-group" id="trSSID">
									<label>SSID <%tcWebApi_get("String_Entry","IndexText","s")%></label>
<SELECT class="custom-select"  onchange="selChangedSSID()" size=1 id="wlSsidIdx" name="wlSsidIdx"></SELECT>
<input type="hidden" id="SSID_Flag" name="SSID_Flag" value="0">
							 </div>

<div class="col-md-3 form-group">
									<label>SSID:</label>
<Input type="text" class="form-control" size=10 id="wlSsid" name="wlSsid" VALUE="<% If tcWebApi_get("WLan_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry","SSID","s") end if %>"/>
							 </div>
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
<div  id="11NmcsControl">
									<label><%tcWebApi_get("String_Entry","RateText","s")%></label>
<SELECT class="custom-select" size=1 id="wlMcs" name="wlMcs"></SELECT>
</div>
<% end if %>

<div class="col-md-3 form-group" id="11NbwControl">
	   <label><%tcWebApi_get("String_Entry","BandwidthText","s")%> </label>
<SELECT id=bwControl class="custom-select" onchange=<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then loadMCSList() end if %> size=1 id="bwControl" name="bwControl">
<OPTION value=0 selected>20 MHZ</OPTION>
<OPTION value=1>20/40 MHZ</OPTION>
<OPTION value=2>40 MHZ</OPTION>
</SELECT>

				
                    	<SCRIPT language=JavaScript type=text/javascript>
			if (curUserName != sptUserName)
				getElement("switchChannel").style.display = "none";
			</SCRIPT>

                  
		<SCRIPT language=JavaScript type=text/javascript>
		if (curUserName != sptUserName)
			getElement("11NbwControl").style.display = "none";
		</SCRIPT>
</div>
 
<div class="col-md-3 form-group" id="11NgiControl">
									   <label><%tcWebApi_get("String_Entry","ProtectIntervalText","s")%></label>
   <SELECT id=giControl  class="custom-select" onchange=<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then loadMCSList() end if %> size="1" name="giControl">
   <OPTION value="0" selected>Long </OPTION>
   <OPTION value="1">Short</OPTION></SELECT>

                    
		<SCRIPT language=JavaScript type=text/javascript>
		if (curUserName != sptUserName)
			getElement("11NgiControl").style.display = "none";
		</SCRIPT>
                   </div>
				   <div class="col-md-3 form-group" >
						 <label>DTIM <%tcWebApi_get("String_Entry","IntervalText","s")%></label>
				   <div class="input-group">
						 <INPUT TYPE="TEXT" ID="DTIM" NAME="DTIM" class="form-control" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","DtimPeriod","s") else asp_Write("1") end if %>" >
				   <div class="input-group-append">
						 <span class="input-group-text">(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~255)
						 </span>
				   </div>
				   </div>
				   </div>
	  
																	  <div class="col-md-12 form-group">
																			 <div class="custom-control custom-checkbox">
										 <input type="checkbox" id="enableSsid" name="enableSsid" class="custom-control-input">
																			  <label class="custom-control-label" for="enableSsid"><%tcWebApi_get("String_Entry","EnableSSIDText","s")%></label>
																			 </div>
																	  </div>
																	  <div class="col-md-3 form-group">
																			 <label><%tcWebApi_get("String_Entry","ConnectDeviceText","s")%></label>
										 <input type="text" class="form-control" size="10" name="wlAssociateNum" value="<%tcWebApi_get("WLan_Entry","MaxStaNum","s")%>">
																	  </div>
																	  <div class="col-md-3 form-group align-self-center">
																			 <label > </label>
																			 <div class="custom-control custom-checkbox">
										 <INPUT type="checkbox" value="ON" onClick="doBroadcastSSIDChange();" id="wlHide" name="wlHide" class="custom-control-input" >
																			  <label class="custom-control-label" for="wlHide"><%tcWebApi_get("String_Entry","CancelBroadcastText","s")%></label>
																			 </div>
																	  </div>
																	  <!-- <div class="col-md-12 form-group">
																			 <h2 class="sub_heading"><%tcWebApi_get("String_Entry","EnableGuestWifiText","s")%></h2>
																		 <div class="custom-control custom-radio custom-control-inline">
										 <input  class="custom-control-input" type="RADIO" id="EGWIFI_Enable_Selection_open" name="EGWIFI_Enable_Selection" value="1" <%If tcWebApi_get("WLan_Entry","EnableGuestWifi","h") = "1" then asp_Write("checked") end if %> />
																					 <label class="custom-control-label" for="EGWIFI_Enable_Selection_open"><%tcWebApi_get("String_Entry","OpenText","s")%></label>
																		 </div>
																		 <div class="custom-control custom-radio custom-control-inline">
										 <input  class="custom-control-input" type="RADIO" id="EGWIFI_Enable_Selection_close" name="EGWIFI_Enable_Selection" value="0" <%If tcWebApi_get("WLan_Entry","EnableGuestWifi","h") = "0" then asp_Write("checked") end if %><% If tcWebApi_get("WLan_Entry","EnableGuestWifi","h") = "N/A" then asp_Write("checked") end if %> />
																					 <label class="custom-control-label" for="EGWIFI_Enable_Selection_close"><%tcWebApi_get("String_Entry","CloseText","s")%></label>
																		 </div>
																	  </div> -->
	  </div>
	  
																	  <div class="col-md-12"></div>
									  <div class="col-md-12 row" id="authen">
									  <div style="width:100%" id="wpsinfo" style="display:none">
	  
									  <div class="col-md-12 form-group" id="wpsenableTR">
																			 <div class="custom-control custom-checkbox">
										 <input class="custom-control-input"  type="checkbox" id="enableWps" name="enableWps" <%if tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if%> onclick="doWPSUseChange()"/>
						<input type="hidden" id="WpsActive" name="WpsActive" value="0"/>
																			  <label class="custom-control-label" for="enableWps">WPS <%tcWebApi_get("String_Entry","EnableText","s")%></label>
																			 </div>
																	  </div>
	  
									  <div class="col-md-3 form-group" id="wpsmodeTR" style="display:none">
																			 <label>WPS <%tcWebApi_get("String_Entry","ModeText","s")%></label>
										   <SELECT id="wpsmode"  class="custom-select"onchange="wpsModeChange()" size="1" name="wpsmode">
						<option value=ap-pbc <%if tcWebApi_get("WLan_Entry","WPSMode","h") = "1" then asp_Write("selected") end if%>>PBC</option>
						<option value=ap-pin <%if tcWebApi_get("WLan_Entry","WPSMode","h") = "0" then asp_Write("selected") end if%>>PIN</option>
						</SELECT>
																	  </div>
	  
									  <div class="col-md-12">
																	  <div class="form-group">
									   <input id="btnStartWPS" class="btn btn-orang-1" name="btnStartWPS" value="<%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "N/A" then asp_Write("Start WPS") end if%>" onclick="doStartWPS();" type="button"/>
									  </div>
																	  </div>
	  
									  <div class="col-md-12" id="pinGenerate" style="display:none">
																			 <div class="form-group">
																			 <label><strong>AP self PIN code</strong>: <span><% tcWebApi_get("Info_WLan", "wlanSelfPinCode", "s") %></span></label>
												   <input type="button" class="btn btn-border-1" id="pin_generate" name="pin_generate" value="Generate" onclick="doGenerate()"/>
																			 </div>
																	  </div>
	  
										<div class="col-md-12" id="pinval" style="display:none">
																			 <div class="form-group">
																			 <label>enrollee PIN code</label>
												<input id="pinvalue" class="form-control" name="pinvalue" size="9" maxlength="9" value="<% If tcWebApi_get("WLan_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("WLan_Entry","enrolleePinCode","s") end if %>" type="text"/>
																			 </div>
																	  </div>
									  <div class="col-md-12" id="wpssta" >
																			 <div class="form-group">
									  <% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
												 <label>WPS <%tcWebApi_get("String_Entry","StatusText","s")%><strong id="WPSProcess" name="WPSProcess"><% if tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Idle" then asp_Write("Idle")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "In progress" then asp_Write("Inprogress")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Configured" then asp_Write("Configured")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "WPS process Fail" then asp_Write("WPS process Fail")
									  else tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "s") end if %></strong><span>
								<% else %>
								<% if tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Idle" then asp_Write("Idle")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "In progress" then asp_Write("Inprogress")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Configured" then asp_Write("Configured")
									  elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "WPS process Fail" then asp_Write("WPS process Fail")
									  else tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "s") end if%>
								<% end if %>
												 </span></label>
	  
																			 </div>
																	  </div>
	  
									  <div class="col-md-12">
																	  <div class="form-group">
									  <input id="ResetOOB" class="btn btn-orang-1" name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" >
									  </div>
	  
																	  </div>
	  
									   </div>
																	  <div class="col-md-3 form-group">
																			 <label><%tcWebApi_get("String_Entry","SecuritySetText","s")%></label>
										 <select class="custom-select" onchange="authModeChange(0)" size=1 id="wlSecurMode" name="wlSecurMode">
						   </select>
																	  </div>
	  
									  <div class="col-md-3 form-group" id="Preauth">
																			 <label>WPA2 <%tcWebApi_get("String_Entry","PreCertificationText","s")%></label>
										 <SELECT class="custom-select" size="1" id="wlPreauth" name="wlPreauth">
										 <OPTION value=off selected>Disabled</OPTION>
										 <OPTION value=on>Enabled</OPTION>
										 </SELECT>
																	  </div>
	  
									 <div class="col-md-3 form-group" id="NetReauth">
																			 <label><%tcWebApi_get("String_Entry","RecertificationIntervalText","s")%></label>
										 <input type="text" class="form-control" maxLength="10" name="wlNetReauth" value="<%if TCWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then TCWebApi_get("WLan_Common","DtimPeriod","s") end if%>">
																	  </div>
	  
																	  <div class="col-md-3 form-group" id="wpaPreShareKey">
																			 <label>WPA <%tcWebApi_get("String_Entry","PreCertificationKeyText","s")%></label>
											 <span id="inpsw">
												   <input id="inpswPwd" type="password" class="form-control" maxLength="65" name="wlWpaPsk"
												   value="<%if tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>">
												   <span class="input-group-text">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)&nbsp;&nbsp;<i class="fa fa-eye" onclick="inpsShowhide()" id="inpswEye"></i></span></span>
												   <script language="JavaScript" type="text/JavaScript">
													function WDSshowhide(){
								 var eye = document.getElementById("WDSeye");
													var pwd = document.getElementById("WDS_Key");
	   
					   if (pwd.type == "password") {
						  pwd.type = "text";
							  eye.className='fa fa-eye-slash'
					   }else {
						  pwd.type = "password";
						  eye.className='fa fa-eye'
					   }
				 }
	   
						  function inpsShowhide(){
								 var eye = document.getElementById("inpswEye");
													var pwd = document.getElementById("inpswPwd");
	   
					   if (pwd.type == "password") {
						  pwd.type = "text";
							  eye.className='fa fa-eye-slash'
					   }else {
						  pwd.type = "password";
						  eye.className='fa fa-eye'
					   }
				 }
											  </script>
	   
											  <%if TCWebApi_get("WebCurSet_Entry","IsSupportShowPSW","h" ) = "1" then%>
																			  <div class="custom-control custom-checkbox">
										  <input class="custom-control-input" id="cb_enablshowpsw" onclick="doshowpswChange()" type=checkbox name="cb_enablshowpsw">
																			   <label class="custom-control-label" for="cb_enablshowpsw"><%tcWebApi_get("String_Entry","ShowPassowrdText","s")%></label>
																			  </div>
	  
						
						<script language="JavaScript" type="text/JavaScript">
						
						function doshowpswChange() {
							with (getElById('ConfigForm')){
								var tempvalue1 = wlWpaPsk.value;
								if (cb_enablshowpsw.checked) {
									inpsw.innerHTML = "<input style=\"FONT-FAMILY: '<%tcWebApi_get("String_Entry","NewRomanText","s")%>'\" type=\"text\" maxLength=65 name=\"wlWpaPsk\" value=" +document.ConfigForm.wlWpaPsk.value+ ">";
								}
								else {
									inpsw.innerHTML = "<input style=\"FONT-FAMILY: '<%tcWebApi_get("String_Entry","NewRomanText","s")%>'\" type=\"password\" maxLength=65 name=\"wlWpaPsk\" value=" +document.ConfigForm.wlWpaPsk.value+ ">";
								}
								wlWpaPsk.value = tempvalue1;
							}
						
						}
						
						</script>
						<%end if%>
					</div>
<div class="col-md-3 form-group" id="wpaGTKRekey" style="display: none">
						   <label>WPA <%tcWebApi_get("String_Entry","PiarKeyText","s")%></label>
<input type="text" class="form-control" maxLength="10" id="wlWpaGtkRekey"  name="wlWpaGtkRekey"/>
					</div>

<div class="row col-md-12" id="wlRadius">
					<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","RadiusServiceIPText","s")%></label>
<input class="form-control" name="radiusSVR_IP" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if %>"  maxlength="15"/>
					</div>

					<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","RadiusServicePortText","s")%></label>
<input  class="form-control" name="radiusSVR_Port" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if %>" maxlength="5"/>
					</div>
					<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","RadiusSharedSecretText","s")%></label>
<input  class="form-control" name="radiusSVR_Key" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if %>"  maxlength="63"/>
					</div>

<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","BackUpServiceIPText","s")%></label>
<input class="form-control" name="bakradiusSVR_IP" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if %>"  maxlength="15">
					</div>

<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","BackUpServicePortText","s")%></label>
<input class="form-control" name="bakradiusSVR_Port" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if %>" maxlength="5">
					</div>

<div class="col-md-3 form-group">
						   <label><%tcWebApi_get("String_Entry","BackUpSharedSecretText","s")%></label>
<input  class="form-control"  name="bakradiusSVR_Key" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if %>" size="20" maxlength="63">
					</div>

<% end if %>


					<div class="col-md-3 form-group">
								 <label><%tcWebApi_get("String_Entry","ReAuthIntervalText","s")%></label>
								 <div class="input-group">
<input  class="form-control" type="text" name="radiusSVR_ReAuthInter" value="<% if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if %>" size="20" maxlength="63">
								   <div class="input-group-append">
									   <span class="input-group-text">seconds</span>
								   </div>
									   </div>
								 </div>
</div>

					<div class="col-md-3 form-group" id="wlWPARekeyInter">
								 <label><%tcWebApi_get("String_Entry","WPAGroupKeyUpdateIntervalText","s")%></label>
								 <div class="input-group">
<input  class="form-control" type="text" id="WPARekeyInter" name="WPARekeyInter" maxlength="7" onchange="checkRekeyinteral(this.value)">

						<script language="JavaScript" type="text/JavaScript">
						var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
						if("N/A" == rekeystr || "" == rekeystr)
						{
							document.getElementById('WPARekeyInter').value = "3600";
							}						
						else
						{
							document.getElementById('WPARekeyInter').value = rekeystr;
						}
						
						</script>
						  <div class="input-group-append">
							<span class="input-group-text">seconds</span>
						</div>
							</div>
					  </div>
		 <div class="col-md-3 form-group" id="wlWpaD">
				<label>WPA <%tcWebApi_get("String_Entry","EncriptionText","s")%></label>
<select class="custom-select" id="wlWpa" name="wlWpa"></select>
		 </div>
		 <div class="col-md-3 form-group" id="wlWepD">
				<label>WEP <%tcWebApi_get("String_Entry","CertificationText","s")%></label>
<select class="custom-select" id="wlWep" name="wlWep"></select>
		 </div>
<div class="row col-md-12" id="keyInfo">
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","EncriptionLengthText","s")%></label>
<SELECT  class="custom-select" id="wlKeyBit" onchange="wlKeyBitChange()" id="wlKeyBit" name="wlKeyBit">
<OPTION value=128 selected>128-bit</OPTION>
<OPTION value=64>64-bit</OPTION>
</SELECT>
		 </div>
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","CurentKeyIndexText","s")%></label>
<SELECT class="custom-select" size="1" id="wlKeyIndex" name="wlKeyIndex"></SELECT>
		 </div>
		 <div class="col-md-12"></div>
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","KeyText","s")%> 1</label>
<input class="form-control" maxLength="26" id="wlKeys1" name="wlKeys" value="<%if tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>"/>
				<p id="wlKeyBitTip" class="light_grey_text"><%tcWebApi_get("String_Entry","Enter2Text","s")%> </p>
		 </div>
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","KeyText","s")%> 2</label>
<input  class="form-control" maxLength="26" id="wlKeys2" name="wlKeys" value="<%if tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>"/>
		 </div>
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","KeyText","s")%> 3</label>
<input class="form-control" maxLength="26" id="wlKeys3" name="wlKeys" value="<%if tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>"/>
		 </div>
		 <div class="col-md-3 form-group">
				<label><%tcWebApi_get("String_Entry","KeyText","s")%>  4</label>
<input maxLength="26" id="wlKeys4" class="form-control" name="wlKeys" value="<%if tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>"/>
		 </div>
</div>

<% If tcWebApi_get("Info_WLan","isWDSSupported","h") = "Yes" Then %>
		 <div class="col-md-12 form-group">
				<h2 class="sub_heading">WDS<%tcWebApi_get("String_Entry","EnableText","s")%></h2>
				<div class="custom-control custom-radio custom-control-inline">
<input  class="custom-control-input" type="RADIO" id="WLAN_WDS_Active_Open" name="WLAN_WDS_Active" value="1" onClick="autoWLAN_WDS_Active()" <%If tcWebApi_get("WLan_WDS","WdsEnable","h") <> "0" then asp_Write("checked") end if %> />
						<label class="custom-control-label" for="WLAN_WDS_Active_Open"><%tcWebApi_get("String_Entry","OpenText","s")%></label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="RADIO" id="WLAN_WDS_Active_Close" name="WLAN_WDS_Active" value="0" onClick="autoWLAN_WDS_Deactive()" <%If tcWebApi_get("WLan_WDS","WdsEnable","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_WDS","WdsEnable","h") = "N/A" then asp_Write("checked") end if%> />
						<label class="custom-control-label" for="WLAN_WDS_Active_Close"><%tcWebApi_get("String_Entry","CloseText","s")%></label>
					  </div>
		 </div>


<div class="row col-md-12" id="wds_div">
		 <div class="col-md-3 form-group">
				<label>WDS<%tcWebApi_get("String_Entry","EncryptionTypeText","s")%></label>
<SELECT class="custom-select" ID="WDS_EncrypType_Selection" NAME="WDS_EncrypType_Selection" SIZE="1">
<OPTION value="TKIP" <% If tcWebApi_get("WLan_WDS","WdsEncrypType","h") = "TKIP" then asp_Write("selected") end if %> >TKIP</OPTION>
<OPTION value="AES"<% if tcWebApi_get("WLan_WDS","WdsEncrypType","h") = "AES" then asp_Write("selected") end if %> >TKIPAES</OPTION>
</SELECT>
		 </div>
		 <div class="col-md-3 form-group">
				<label>WDS<%tcWebApi_get("String_Entry","KeyText","s")%></label>
<INPUT  class="form-control" TYPE="password" ID="WDS_Key" NAME="WDS_Key" MAXLENGTH="64" VALUE="<% If tcWebApi_get("WLan_WDS","WdsKey","h") <> "N/A" then tcWebApi_get("WLan_WDS","WdsKey","s") end if %>" >
				<span class="input-group-text">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)&nbsp;&nbsp;<i class="fa fa-eye" onclick="WDSshowhide()" id="WDSeye"></i></span>
		 </div>
</div>
		 <div class="col-md-12"></div>
		 <div class="col-md-3 form-group">
				<label>WDS Peer MAC #1</label>
<INPUT  class="form-control" TYPE="TEXT" ID="WLANWDS_PEER_MAC1" NAME="WLANWDS_PEER_MAC1"  MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC0","s") end if %>" />
		 </div>
		 <div class="col-md-3 form-group">
				<label>WDS Peer MAC #2</label>
<INPUT TYPE="TEXT"  class="form-control" ID="WLANWDS_PEER_MAC2" NAME="WLANWDS_PEER_MAC2" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC1","s") end if %>" />
		 </div>
		 <div class="col-md-3 form-group">
				<label>WDS Peer MAC #3</label>
<INPUT TYPE="TEXT"  class="form-control" ID="WLANWDS_PEER_MAC3" NAME="WLANWDS_PEER_MAC3"  MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC2","s") end if %>" >
		 </div>
		 <div class="col-md-3 form-group">
				<label>WDS Peer MAC #4</label>
				<INPUT   class="form-control" TYPE="TEXT" ID="WLANWDS_PEER_MAC4" NAME="WLANWDS_PEER_MAC4"  MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC3","s") end if %>" >
		 </div>
<%end if %>

<div class="row col-md-12 form-group" id="MacFilter" name="MacFilter" style="<%if tcWebApi_get("WifiAntiFouling_Common","Level","h") = "3" then asp_Write("display:none") end if %>" >
		 <div class="col-md-12 form-group">
				<h2 class="sub_heading" style="color:#fd7e14">MAC Filter</h2>
				<div class="custom-control custom-radio custom-control-inline">
<INPUT class="custom-control-input" TYPE="RADIO" ID="WLAN_FltActive_Open" NAME="WLAN_FltActive" VALUE="1" onClick="autoWLAN_Flt_Active()" <% If tcWebApi_get("WLan_Entry","AccessPolicy","h") <> "0" then asp_Write("checked") end if %> >
						<label class="custom-control-label" for="WLAN_FltActive_Open"><%tcWebApi_get("String_Entry","OpenText","s")%></label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline">
						<INPUT  class="custom-control-input" TYPE="RADIO" ID="WLAN_FltActive_Close" NAME="WLAN_FltActive" VALUE="0" onClick="autoWLAN_Flt_Deactive()" <% If tcWebApi_get("WLan_Entry","AccessPolicy","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("WLan_Entry","AccessPolicy","h") = "N/A" then asp_Write("checked") end if %> >
						<label class="custom-control-label" for="WLAN_FltActive_Close"><%tcWebApi_get("String_Entry","CloseText","s")%></label>
					  </div>
		 </div>
		 <div class="col-md-3 form-group">
				<label>Action</label>
<SELECT ID="WLAN_FltAction" NAME="WLAN_FltAction" SIZE="1"  class="form-control">
<OPTION value="1" <% if tcWebApi_get("WLan_Entry","AccessPolicy","h") = "1" then asp_Write("selected") end if %>>Allow</OPTION>
<OPTION value="2" <% if tcWebApi_get("WLan_Entry","AccessPolicy","h") = "2" then asp_Write("selected") end if %>>Deny</OPTION>
</SELECT>
		 </div>
		 <div class="col-md-12"></div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#1</label>
<INPUT class="form-control" TYPE="TEXT" ID="WLANFLT_MAC1" NAME="WLANFLT_MAC1" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC0","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC0","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#2</label>
<INPUT class="form-control" TYPE="TEXT" ID="WLANFLT_MAC2" NAME="WLANFLT_MAC2" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC1","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC1","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#3</label>
<INPUT class="form-control" TYPE="TEXT" ID="WLANFLT_MAC3" NAME="WLANFLT_MAC3" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC2","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC2","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#4</label>
<INPUT  class="form-control" TYPE="TEXT" ID="WLANFLT_MAC4" NAME="WLANFLT_MAC4" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC3","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC3","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#5</label>
<INPUT TYPE="TEXT"  class="form-control" ID="WLANFLT_MAC5" NAME="WLANFLT_MAC5" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC4","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC4","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#6</label>
<INPUT TYPE="TEXT"  class="form-control" ID="WLANFLT_MAC6" NAME="WLANFLT_MAC6" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC5","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC5","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#7</label>
				<INPUT TYPE="TEXT" class="form-control" ID="WLANFLT_MAC7" NAME="WLANFLT_MAC7" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC6","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC6","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
		 <div class="col-md-3 form-group">
				<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#8</label>
<INPUT TYPE="TEXT"  class="form-control" ID="WLANFLT_MAC8" NAME="WLANFLT_MAC8" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan_Entry","WLan_MAC7","h") <> "N/A" then tcWebApi_get("WLan_Entry","WLan_MAC7","s") end if %>" onBlur="doMACcheck(this)">
		 </div>
</div>

</div>
<div class="col-md-12 row" >
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>

<div class="col-md-3 form-group">
				<label>TxStream</label>
<SELECT NAME="TxStream_Action" SIZE="1"  class="custom-select">
<OPTION value="1" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "1" then asp_Write("selected") end if %>>1
<OPTION value="2" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "2" then asp_Write("selected") end if %>>2
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>
<OPTION value="3" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "3" then asp_Write("selected") end if %>>3
<OPTION value="4" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "4" then asp_Write("selected") end if %>>4
<% end if %>
</SELECT>
		 </div>
<div class="col-md-3 form-group">
				<label>RxStream</label>
<SELECT NAME="RxStream_Action" SIZE="1"  class="custom-select">
<OPTION value="1" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "1" then asp_Write("selected") end if %>>1
<OPTION value="2" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "2" then asp_Write("selected") end if %>>2
<% if tcWebApi_get("Info_WLan","isTxRxStreamSupported","h") <> "Yes" then %>
<OPTION value="3" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "3" then asp_Write("selected") end if %>>3
<OPTION value="4" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "4" then asp_Write("selected") end if %>>4
<% end if %>
</SELECT>
		 </div>

<% end if %>

<% if tcWebApi_get("Info_WLan","isWHNATSupported","h") = "Yes" then %>
<div class="col-md-3 form-group">
				<label>WHNAT</label>
<select id="WLANTxOffload" name="WLANTxOffload" size="1" class="custom-select">
<option value="0" <% if tcWebApi_get("WLan_Common","WHNAT","h") = "0" then asp_Write("selected") end if %> >Disable</option>
<option value="1" <% if tcWebApi_get("WLan_Common","WHNAT","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Common","WHNAT","h") = "N/A" then asp_Write("selected") end if %> >Enable</option>
</select>
		 </div>
<% end if %>
</div>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
<div class="col-md-3 form-group">
<label>TWT <%tcWebApi_get("String_Entry","EnableTest","s")%>:</label>
<select id="TWTSupport" name="TWTSupport" class="custom-select">
<option value=0 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "0" then asp_Write("selected") end if %> >Disable</option>
<option value=1 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "1" then asp_Write("selected") end if %> >Enable</option>
<option value=2 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "2" then asp_Write("selected") end if %> >Mandatory</option>
</select>
</div>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "is11AXEnhanceModeSupported", "h") = "Yes" then %>
<TABLE cellSpacing=0 cellPadding=0 border=0 >
<TBODY>
<TR>
<TD width="130">BSS Color:</TD>
<TD>
<INPUT style="WIDTH: 123px" size="3" name="BSSColorNum_flag" id="BSSColorNum_flag" value=<% tcWebApi_get("Wlan_Common", "BSSColorNum", "s") %>>
</TD>
</TR>
</TBODY>
<TBODY>
<TR>
<TD width="130"><%tcWebApi_get("String_Entry","TimeOfDurationTest","s")%></TD>
<TD>
<INPUT style="WIDTH: 123px" size="8" name="RTS_flag" id="RTS_flag" value=<% tcWebApi_get("Wlan_Common", "RTS", "s") %>>32us
</TD>
</TR>
</TBODY>
<TBODY>
<TR>
<TD width="130"><%tcWebApi_get("String_Entry","BSSIDMaxIndexTest","s")%></TD>
<TD>
<select id="CBSSIDMaxIndex_flag" name="CBSSIDMaxIndex_flag">
<option value=1 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "1" then asp_Write("selected") end if %> >1</option>
<option value=2 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "2" then asp_Write("selected") end if %> >2</option>
<option value=3 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "3" then asp_Write("selected") end if %> >3</option>
<option value=4 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "4" then asp_Write("selected") end if %> >4</option>
<option value=5 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "5" then asp_Write("selected") end if %> >5</option>
<option value=6 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "6" then asp_Write("selected") end if %> >6</option>
<option value=7 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "7" then asp_Write("selected") end if %> >7</option>
<option value=8 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "8" then asp_Write("selected") end if %> >8</option>
</select>
</TD>
</TR>
</TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 border=0 >
<TBODY>
<TR>
<TD width="130"><%tcWebApi_get("String_Entry","PersonalTWTEnableTest","s")%></TD>
<TD>
<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportDisable" value=0 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") <> "1" then asp_Write("checked") end if %> <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") <> "2" then asp_Write("checked") end if %>>
<font color="#000000"><%tcWebApi_get("String_Entry","CloseText","s")%> </font>
<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportEnable" value=1 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") = "1" then asp_Write("checked") end if %>>
<font color="#000000"><%tcWebApi_get("String_Entry","EnableTest","s")%> </font>
<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportMandatory" value=2 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") = "2" then asp_Write("checked") end if %>>
<font color="#000000"><%tcWebApi_get("String_Entry","ForceTest","s")%> </font>
</TD>
</TR>
</TBODY>
<TBODY>
<TR>
<TD width="130">HE LDPC:</TD>
<TD>
<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCDisable" value=0 <% if tcWebApi_get("Wlan_Common", "HELDPCE", "h") <> "1" then asp_Write("checked") end if %>>
<font color="#000000"><%tcWebApi_get("String_Entry","CloseText","s")%> </font>
<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCEnable" value=1 <% if tcWebApi_get("Wlan_Common", "HELDPCE", "h") = "1" then asp_Write("checked") end if %>>
<font color="#000000"><%tcWebApi_get("String_Entry","EnableTest","s")%> </font>
</TD>
</TR>
</TBODY>
<TBODY>
<TR>
<TD width="130">Spatial Reuse:</TD>
<TD>
	<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseDisable" value=0 <% if tcWebApi_get("Wlan_Common", "SpatialReuse", "h") <> "1" then asp_Write("checked") end if %>>
		<font color="#000000"><%tcWebApi_get("String_Entry","CloseText","s")%> </font>
		<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseEnable" value=1 <% if tcWebApi_get("Wlan_Common", "SpatialReuse", "h") = "1" then asp_Write("checked") end if %>>
		<font color="#000000"><%tcWebApi_get("String_Entry","EnableTest","s")%> </font>
  </TD>
</TR>
</TBODY>
</TABLE>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		<input type="hidden" id="WlanMuOfdmaDlEnable_flag" name="WlanMuOfdmaDlEnable_flag" value="<% if tcWebApi_get("Wlan_Common","MuOfdmaDlEnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","MuOfdmaDlEnable","s") end if %>">
		<input type="hidden" id="WlanMuOfdmaUlEnable_flag" name="WlanMuOfdmaUlEnable_flag" value="<% if tcWebApi_get("Wlan_Common","MuOfdmaUlEnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","MuOfdmaUlEnable","s") end if %>">
		<input type="hidden" id="WlanMuMimoDlEnable_flag" name="WlanMuMimoDlEnable_flag" value="<% if tcWebApi_get("Wlan_Common","MuMimoDlEnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","MuMimoDlEnable","s") end if %>">
		<input type="hidden" id="WlanMuMimoUlEnable_flag" name="WlanMuMimoUlEnable_flag" value="<% if tcWebApi_get("Wlan_Common","MuMimoUlEnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","MuMimoUlEnable","s") end if %>">
		<input type="hidden" id="WlanSREnable_flag" name="WlanSREnable_flag" value="<% if tcWebApi_get("Wlan_Common","SREnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","SREnable","s") end if %>">
		<div class="col-md-12">
			  <div class="row">

					 <div class="col-md-3 form-group align-self-center">
						   <label></label>
						   <div class="custom-control custom-checkbox">
						   <INPUT type="checkbox" class="custom-control-input" id="wlanMuOfdmaDlEnable"<% if tcWebApi_get("Wlan_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %>  name="wlanMuOfdmaDlEnable">
								  <label class="custom-control-label" for="wlanMuOfdmaDlEnable">MU-OFDMA<%tcWebApi_get("String_Entry","EnableTest","s")%>:</label>
					 </div>
			  </div>
			  <div class="col-md-3 form-group align-self-center">
					 <label></label>
					 <div class="custom-control custom-checkbox">
						   <INPUT type="checkbox" class="custom-control-input" id="wlanMuMimoDlEnable"<% if tcWebApi_get("Wlan_Common","MuMimoDlEnable","h") = "1" then asp_Write("checked") end if %>  name="wlanMuMimoDlEnable">
						   <label class="custom-control-label" for="wlanMuMimoDlEnable">MU-MIMO<%tcWebApi_get("String_Entry","EnableTest","s")%>:</label>
			  </div>
		</div>
		<div class="col-md-3 form-group align-self-center">
			  <label></label>
			  <div class="custom-control custom-checkbox">
					 <INPUT type="checkbox" class="custom-control-input" id="wlanSREnable"<% if tcWebApi_get("Wlan_Common","SREnable","h") = "1" then asp_Write("checked") end if %>  name="wlanSREnable">
					 <label class="custom-control-label" for="wlanSREnable">SR<%tcWebApi_get("String_Entry","EnableTest","s")%>:</label>
		</div>
  </div>
			  </div>
		</div>

<% end if %>

<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
<DIV id="wlMeshTip">
<p><strong><%tcWebApi_get("String_Entry","HintOpenEasyMeshText1","s")%></strong></p>
</DIV>
<% end if %>
						   <div class="col-md-12 form-group" id="wlUserTip">
								  <h2 class="sub_heading"><%tcWebApi_get("String_Entry","PromotText","s")%></h2>
								  <p class="normal_text"><%tcWebApi_get("String_Entry","RandomAccessText","s")%></p>
								  <p class="normal_text"><%tcWebApi_get("String_Entry","NotUseText","s")%></p>
						   </div>

			 </div>
						   <hr class="margin_adjs" />

<div class="form-footer text-right">
<input type="hidden" name="Save_Flag" value="0">
						   <button class="btn btn-orang btn-lg" type="button" id="btnOK" onclick="SubmitForm()">Apply</button>
						   <button class="btn btn-secondary btn-lg" type="button"  id="btnCancel" onclick="RefreshPage()">Cancel</button>
						   </div>
			  </div>
</form>
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

					
<script language="JavaScript">
var enableOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aSSIDEnable","s")%>";
var beaconTypeOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanBeaconType","s")%>";
var ssidOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanSSID","s")%>";
if(enableOpenFlag == "0")
	getElById('enableSsid').disabled = true;
if(beaconTypeOpenFlag == "0")
	getElById('wlSecurMode').disabled = true;
if(ssidOpenFlag == "0")
	getElById('wlSsid').disabled = true;
</script>
<script type="text/javascript" src="/JS/jquery.min.js"></script>
<script type="text/javascript" src="/JS/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="/Dashboard/Modules/leftmenu/js/Loader.js"></script>-->
<script type="text/javascript"  src="/JS/popper.min.js"></script>
<script  type="text/javascript" src="/JS/scoop.js"></script>
<script  type="text/javascript" src="/JS/left_menu.js"></script>
<script  type="text/javascript" src="/JS/jquery_mCustomScrollbar_concat.js"></script>
<script  type="text/javascript" src="/JS/jquery_mousewheel.js"></script>  
</BODY></HTML>
