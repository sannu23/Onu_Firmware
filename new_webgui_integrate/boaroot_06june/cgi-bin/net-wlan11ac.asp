<%
If Request_Form("wlanWEPFlag")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
  TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
	if Request_Form("wlTxPwr") = "6" then
		tcWebApi_constSet("WLan11ac_Common","TxPower", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "1")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "128")
	elseif Request_Form("wlTxPwr") = "1" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","80")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "2" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","60")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "80")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "3" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","30")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "60")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "4" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","15")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "40")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "5" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","9")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "20")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	end if
	if tcWebApi_get("Info_WLan11ac","isWHNATSupported","h") = "Yes" then 	
		TCWebApi_set("WLan11ac_Common","WHNAT","WLANTxOffload")
	end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		If Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if	
			If tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			End if
		else
			TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
		End if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","WLANMCS")
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
	
	TCWebApi_set("WLan11ac_Common","BasicRate","BasicRate_Value1")
	
	TCWebApi_set("WLan11ac_Entry","SSID","ESSID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
	TCWebApi_set("WLan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("WLan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
	end if
if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then 
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("WLan11ac_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("WLan11ac_Entry","AccessPolicy","WLAN_FltAction")
	end if
end if
	if Request_Form("isWPSSupported") = "1" then
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("WLan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if
if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then 
	TCWebApi_set("WLan11ac_Entry","WLan_MAC0","WLANFLT_MAC1")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC1","WLANFLT_MAC2")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC2","WLANFLT_MAC3")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC3","WLANFLT_MAC4")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC4","WLANFLT_MAC5")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC5","WLANFLT_MAC6")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC6","WLANFLT_MAC7")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC7","WLANFLT_MAC8")
end if
	TCWebApi_set("WLan11ac_Entry","AuthMode","WEP_Selection_val")
	TCWebApi_save()
end if

If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "ARGENTINA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "ARMENIA" then	
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "AUSTRIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "AZERBAIJAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "BELGIUM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BELIZE" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BOLIVIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BRAZIL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BRUNEI DARUSSALAM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BULGARIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "CROATIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "CYPRUS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "CZECH REPUBLIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "DENMARK" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "EGYPT" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "ESTONIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "FINLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "FRANCE" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")	
	elseif Request_Form("Countries_Channels") = "GEORGIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "GERMANY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "GREECE" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "HUNGARY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ICELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "INDONESIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "IRAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "IRELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ITALY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "JAPAN" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand9")
	elseif Request_Form("Countries_Channels") = "KOREA DEMOCRATIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "KOREA REPUBLIC" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "LATVIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LITHUANIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LUXEMBOURG" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "MONACO" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "NETHERLANDS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PERU" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "PHILIPPINES" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "POLAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PORTUGAL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SLOVAKIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SLOVENIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SOUTH AFRICA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SPAIN" then             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SWEDEN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SWITZERLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "TRINIDAD AND TOBAGO" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TUNISIA" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TURKEY" then  
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "UNITED KINGDOM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")	
	elseif Request_Form("Countries_Channels") = "URUGUAY" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "VENEZUELA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	else
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
	end if
	TCWebApi_save()
End If
IF Request_Form("wlanWEPFlag")="2" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	TCWebApi_save()
End if
If Request_Form("wlanWEPFlag")="3" Then
	if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then
		TCWebApi_set("WLan11ac_Common","HT_TxStream","TxStream_Action")	
		TCWebApi_set("WLan11ac_Common","HT_RxStream","RxStream_Action")		
	end if
	TCWebApi_set("WLan11ac_Entry","AuthMode","WEP_Selection_val")	
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
  TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
	if Request_Form("wlTxPwr") = "6" then
		tcWebApi_constSet("WLan11ac_Common","TxPower", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "1")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "128")
	elseif Request_Form("wlTxPwr") = "1" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","80")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "2" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","60")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "80")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "3" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","30")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "60")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "4" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","15")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "40")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "5" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","9")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "20")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	end if
	if tcWebApi_get("Info_WLan11ac","isWHNATSupported","h") = "Yes" then 	
		TCWebApi_set("WLan11ac_Common","WHNAT","WLANTxOffload")
	end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		if Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if
			if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			end if
		end if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then 
		TCWebApi_set("WLan11ac_Entry","HT_MCS","WLANMCS")
		end if 
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")

	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")	
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
	TCWebApi_set("WLan11ac_Entry","SSID","ESSID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")	
	TCWebApi_set("WLan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("WLan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
	end if

	if Request_Form("isDot1XSupported")  = "1" then
		if Request_Form("WEP_Selection")  = "Radius-WEP64" then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter1")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusSVR_IP1")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Port","radiusSVR_Port1")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Key","radiusSVR_Key1")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP1")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port1")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key1")
			end if
		elseif Request_Form("WEP_Selection")  = "Radius-WEP128"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter2")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusSVR_IP2")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Port","radiusSVR_Port2")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Key","radiusSVR_Key2")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP2")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port2")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key2")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter3")
			TCWebApi_set("WLan11ac_Entry","RekeyInterval","WPARekeyInter3")			
			TCWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusSVR_IP3")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Port","radiusSVR_Port3")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Key","radiusSVR_Key3")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP3")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port3")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key3")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA2"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter4")
			TCWebApi_set("WLan11ac_Entry","RekeyInterval","WPARekeyInter4")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusSVR_IP4")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Port","radiusSVR_Port4")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Key","radiusSVR_Key4")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP4")				
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port4")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key4")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter5")
			TCWebApi_set("WLan11ac_Entry","RekeyInterval","WPARekeyInter5")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusSVR_IP5")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Port","radiusSVR_Port5")
			TCWebApi_set("WLan11ac_Entry","RADIUS_Key","radiusSVR_Key5")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP5")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port5")
				TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key5")
			end if
		end if	
	end if	
if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then 
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("WLan11ac_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("WLan11ac_Entry","AccessPolicy","WLAN_FltAction")
	end if
end if 
	if Request_Form("isWPSSupported") = "1" then	
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("WLan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if		
	if Request_Form("isWDSSupported") = "1" then
		TCWebApi_set("WLan11ac_WDS","WdsEnable","WLAN_WDS_Active")
		if Request_form("WLAN_WDS_Active") = "1" then
			if Request_Form("WEP_Selection") = "OPEN" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_NONE")
			elseif Request_Form("WEP_Selection") = "Basic"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_WEP")
				if Request_Form("wlKeyIndex") = "1" then
					TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key13")	
				elseif Request_Form("wlKeyIndex") = "2" then
					TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key23")
				elseif Request_Form("wlKeyIndex") = "3" then
					TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key33")
				elseif Request_Form("wlKeyIndex") = "4" then
					TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key43")
				end if
			elseif Request_Form("WEP_Selection") = "WPAPSK" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2PSK" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPAPSKWPA2PSK"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA1WPA2"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			end if
				
			TCWebApi_set("WLan11ac_WDS","Wds_MAC0","WLANWDS_PEER_MAC1")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC1","WLANWDS_PEER_MAC2")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC2","WLANWDS_PEER_MAC3")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC3","WLANWDS_PEER_MAC4")
		end if
	end if			
	if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then 	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC0","WLANFLT_MAC1")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC1","WLANFLT_MAC2")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC2","WLANFLT_MAC3")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC3","WLANFLT_MAC4")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC4","WLANFLT_MAC5")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC5","WLANFLT_MAC6")	
	TCWebApi_set("WLan11ac_Entry","WLan_MAC6","WLANFLT_MAC7")		
	TCWebApi_set("WLan11ac_Entry","WLan_MAC7","WLANFLT_MAC8")	
	end if
	if Request_Form("WEP_Selection") = "Basic"  then
		TCWebApi_set("WLan11ac_Entry","WEPAuthType","WEP_TypeSelection1")
		TCWebApi_set("WLan11ac_Entry","DefaultKeyID","wlKeyIndex")
		TCWebApi_set("WLan11ac_Entry","Key1Str","WEP_Key13")	
		TCWebApi_set("WLan11ac_Entry","Key2Str","WEP_Key23")		
		TCWebApi_set("WLan11ac_Entry","Key3Str","WEP_Key33")		
		TCWebApi_set("WLan11ac_Entry","Key4Str","WEP_Key43")
		
	elseif Request_Form("WEP_Selection") = "WEP-64Bits"  then
		TCWebApi_set("WLan11ac_Entry","WEPAuthType","WEP_TypeSelection1")
		TCWebApi_set("WLan11ac_Entry","DefaultKeyID","DefWEPKey3")
		TCWebApi_set("WLan11ac_Entry","Key1Str","WEP_Key132")	
		TCWebApi_set("WLan11ac_Entry","Key2Str","WEP_Key232")		
		TCWebApi_set("WLan11ac_Entry","Key3Str","WEP_Key332")		
		TCWebApi_set("WLan11ac_Entry","Key4Str","WEP_Key432")
		if Request_form("WLAN_WDS_Active") = "1" then
			TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key")
		end if
	elseif Request_Form("WEP_Selection")  = "WEP-128Bits" then
		TCWebApi_set("WLan11ac_Entry","WEPAuthType","WEP_TypeSelection2")
		TCWebApi_set("WLan11ac_Entry","DefaultKeyID","DefWEPKey4")
		TCWebApi_set("WLan11ac_Entry","Key1Str","WEP_Key14")	
		TCWebApi_set("WLan11ac_Entry","Key2Str","WEP_Key24")		
		TCWebApi_set("WLan11ac_Entry","Key3Str","WEP_Key34")		
		TCWebApi_set("WLan11ac_Entry","Key4Str","WEP_Key44")
		if Request_form("WLAN_WDS_Active") = "1" then
			TCWebApi_set("WLan11ac_WDS","WdsKey","WEP_Key")
		end if
		
	elseif Request_Form("WEP_Selection")  = "Radius-WEP64" then
		TCWebApi_set("WLan11ac_Entry","DefaultKeyID","DefWEPKey1")			
	elseif Request_Form("WEP_Selection")  = "Radius-WEP128" then
		TCWebApi_set("WLan11ac_Entry","DefaultKeyID","DefWEPKey2")
	elseif Request_Form("WEP_Selection")  = "WPAPSK" then
		TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey2")
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection5")
		TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval2")
	elseif Request_Form("WEP_Selection")  = "WPA2PSK" then
		TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey1")
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection4")
		TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval1")
	elseif Request_Form("WEP_Selection")  = "WPAPSKWPA2PSK"  then
		TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey3")
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection6")
		TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval3")
	elseif Request_Form("WEP_Selection")  = "WPA"  then
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection1")
	elseif Request_Form("WEP_Selection")  = "WPA2"  then
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection2")
	elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection3")
	end if
	If tcwebApi_get("WebCustom_Entry","isWPA3ModeSupported","h" ) = "Yes" then
		if Request_Form("WEP_Selection")  = "WPA2PSKWPA3PSK"  then
			TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey_WPA2WPA3")
			TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection_WPA2WPA3")
			TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval_WPA2WPA3")
		elseif Request_Form("WEP_Selection")  = "WPA3PSK"  then
			TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey_WPA3")
			TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection_WPA3")
			TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval_WPA3")
		end if
		If tcwebApi_get("Info_WLan11ac","isDot1XSupported","h" ) = "Yes" then
			if Request_Form("WEP_Selection")  = "WPA3"  then
				TCWebApi_set("WLan11ac_Entry","EncrypType","WPA3_TKIP_Selection1")
				TCWebApi_set("WLan11ac_Common","session_timeout_interval","WPA3_radiusSVR_ReAuthInter3")
				TCWebApi_set("WLan11ac_Entry","RekeyInterval","WPA3_WPARekeyInter")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Server","WPA3_radiusSVR_IP")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Port","WPA3_radiusSVR_Port")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Key","WPA3_radiusSVR_Key")
				if Request_Form("isDot1XEnhanceSupported") = "1" then
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","WPA3_bakradiusSVR_IP")
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","WPA3_bakradiusSVR_Port")
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","WPA3_bakradiusSVR_Key")
				end if
			elseif Request_Form("WEP_Selection")  = "WPA3-192Bit"  then
				TCWebApi_set("WLan11ac_Entry","EncrypType","WPA3_192Bit_TKIP_Selection1")
				TCWebApi_set("WLan11ac_Common","session_timeout_interval","WPA3_192Bit_radiusSVR_ReAuthInter")
				TCWebApi_set("WLan11ac_Entry","RekeyInterval","WPA3_192Bit_WPARekeyInter")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Server","WPA3_192Bit_radiusSVR_IP")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Port","WPA3_192Bit_radiusSVR_Port")
				TCWebApi_set("WLan11ac_Entry","RADIUS_Key","WPA3_192Bit_radiusSVR_Key")
				if Request_Form("isDot1XEnhanceSupported") = "1" then
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Server","WPA3_192Bit_bakradiusSVR_IP")
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Port","WPA3_192Bit_bakradiusSVR_Port")
					TCWebApi_set("WLan11ac_Entry","BAK_RADIUS_Key","WPA3_192Bit_bakradiusSVR_Key")
				end if
			end if 
		end if 
	end if
	If tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) = "Yes" then
		TCWebApi_set("WLan11ac_Common", "TWTSupport", "TWTSupport_flag")
		TCWebApi_set("WLan11ac_Common", "MuOfdmaDlEnable", "Wlan11acMuOfdmaDlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuOfdmaUlEnable", "Wlan11acMuOfdmaUlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuMimoDlEnable", "Wlan11acMuMimoDlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuMimoUlEnable", "Wlan11acMuMimoUlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "SREnable", "Wlan11acSREnable_flag")
	End if	
	If tcwebApi_get("WebCustom_Entry","is11AXEnhanceModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan11ac_Common", "BSSColorNum", "BSSColorNum_flag")
		TCWebApi_set("Wlan11ac_Common", "RTS", "RTS_flag")
		TCWebApi_set("Wlan11ac_Common", "CBSSIDMaxIndex", "CBSSIDMaxIndex_flag")
		TCWebApi_set("Wlan11ac_Common", "IndividualTWTSupport", "IndividualTWTSupport_flag")
		TCWebApi_set("Wlan11ac_Common", "HELDPCE", "HELDPC_flag")
		TCWebApi_set("Wlan11ac_Common", "SpatialReuse", "SpatialReuse_flag")
	End if	
	
	if Request_Form("isWPSSupported") = "1" then
	TCWebApi_set("WLan11ac_Entry","WPSConfStatus","WPSConfigured")
	end if			
	TCWebApi_save()
	tcWebApi_commit("WLan11ac_Entry")	
End If
if Request_Form("isWDSSupported") = "1" then
	If Request_Form("wlanWEPFlag")="4" Then
		TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
	End If
	TCWebApi_save()
End If
if Request_Form("isWPSSupported") = "1" then
If Request_Form("WpsStart")="1" Then
	TCWebApi_set("Info_WLan11ac","WPSActiveStatus","WpsStart")
	TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
	if Request_form("WPSMode_Selection") = "0" then
		TCWebApi_set("WLan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
	end if
	TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
	tcWebApi_commit("WLan11ac_Entry")
End If
If Request_Form("WpsOOB")="1" Then
	TCWebApi_set("Info_WLan11ac","WPSOOBActive","WpsOOB")
	tcWebApi_commit("WLan11ac_Entry")
end if

If Request_Form("WpsGenerate") = "1" then
	TCWebApi_set("Info_WLan11ac","WPSGenPinCode","WpsGenerate")
	TCWebApi_commit("WLan11ac_Entry")
end if
	TCWebApi_save()
end if
%>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="0" type="image/x-icon">
    <link rel="stylesheet" href="/Dashboard/Modules/fontawesome/css/font-awesome.min.css">
    <title><%tcWebApi_get("String_Entry","WLAN5GText","s")%></title>
    <link href="/css/scoop-vertical.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/simple-line-icons.css" rel="stylesheet">
    <link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
    <!-- <script language="javascript" src="/JS/menu.js"></script> -->
<script language="javascript" src="/JS/script.js"></script>
<script language="javascript" src="/JS/util.js"></script>
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
 <!-- <SCRIPT language=JavaScript type=text/javascript >
HT5GExtCh = new Array(22);
HT5GExtCh[0] = 1;
HT5GExtCh[1] = 0;
HT5GExtCh[2] = 1;
HT5GExtCh[3] = 0;
HT5GExtCh[4] = 1;
HT5GExtCh[5] = 0;
HT5GExtCh[6] = 1;
HT5GExtCh[7] = 0;
HT5GExtCh[8] = 1;
HT5GExtCh[9] = 0;
HT5GExtCh[10] = 1;
HT5GExtCh[11] = 0;
HT5GExtCh[12] = 1;
HT5GExtCh[13] = 0;
HT5GExtCh[14] = 1;
HT5GExtCh[15] = 0;
HT5GExtCh[16] = 1;
HT5GExtCh[17] = 0;
HT5GExtCh[18] = 1;
HT5GExtCh[19] = 0;
HT5GExtCh[20] = 1;
HT5GExtCh[21] = 0;


var wpsenable;

var wepidx;
var WEPSelectIndex;
function SetCtlValue()
{	

}

function CongigureClass()
{
	this.WPSConfStatus = '2';
}
var Configure = new CongigureClass();

function doCheckWepSelectIndex()
{

		WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex;

	return true;	
}


function doStartWPS(){
    var temp = getSelectVal("WPSMode_Selection");
	if(temp == 'ap-pin')
	{
        if (document.ConfigForm.isInWPSing.value==0)
        {
            var pincode = document.ConfigForm.WPSEnrolleePINCode;
            var len = pincode.value.length;
            if(doPINCodeCheck(pincode) == false)
            {
                return ;
            }
    
    
            if(len <= 0)
            {
              alert("WPS PIN code couldn't be null!");
                return;
            }


        }
	}
	if(document.ConfigForm.isInWPSing.value==0){
		alert("Please Start WPS peer within 2 minutes.");
	}
	document.ConfigForm.WpsStart.value = 1;
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function doResetOOB(){
	document.ConfigForm.WpsOOB.value = 1;
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function doGenerate(){
	document.ConfigForm.WpsGenerate.value = "1";
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}


function strESSIDCheck(str) {
	if(str.value.match(/[^\x00-\xff]/g)){
		alert("Invalid SSID Input!");
		return true;
	}
	if(document.ConfigForm.ESSID.value.length <= 0){
		alert("SSID is empty");
		return true;
	}

	return false;
}	

function LoadFrame()
{
	doCheckSSID();
	RefreshChannPage();
	doCheckWepSelectIndex();	

	if(document.ConfigForm.isDot1XSupported.value==1)
	{
		if(document.ConfigForm.isAuthenTypeSupported.value==1)
		{
			document.getElementById("WEP_Selection_div").style.display="none";
			document.getElementById("WEP_Selection_show_div").style.display="";
			doWEPChange2();
		}
		else
		{
			document.getElementById("WEP_Selection_div").style.display="";
			document.getElementById("WEP_Selection_show_div").style.display="none";
		}
	}	
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=2){
			document.ConfigForm.Is11acMode.value=1;
		}else{
			document.ConfigForm.Is11acMode.value=0;
		}

		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){

			if(InsExtChOpt(document.ConfigForm.Channel_ID.value) == 1)
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 1;
				else
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 0;
				document.ConfigForm.WLANExtensionChannel.disabled = true;	
		}
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}

	if(document.ConfigForm.isInWPSing.value==1){
		document.ConfigForm.ResetOOB.disabled = true;
		document.ConfigForm.BUTTON.disabled = true;
		document.ConfigForm.CancelBtn.disabled = true;
	}
	if(document.ConfigForm.wlan_VC.value==0 || document.ConfigForm.wlan_VC.value==1){
		wpsenable = document.ConfigForm.UseWPS_Selection.checked;
	}

	wepidx = WEPSelectIndex;

	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true){	//if wds enable
			autoWLAN_WDS_Active();
		}else if(document.ConfigForm.WLAN_WDS_Active[1].checked == true){	//if wds disable
			autoWLAN_WDS_Deactive();
		}
	}
	
	if(document.ConfigForm.bharti_ssid2.value==1)
		doloadSSID2();		
		

		McsRefreshPage();

}

function doCheckSSID()
{	
	var ssid_val = document.ConfigForm.wlan_VC.value;	
	var ssid_optval = document.ConfigForm.SSID_INDEX.value;	
	if(ssid_val != ssid_optval)	
	{		
		document.ConfigForm.wlanWEPFlag.value = 2;	
		if( true == setEBooValueCookie(document.ConfigForm) )	
			document.ConfigForm.submit();	
	}
}	

function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegionABand = document.ConfigForm.hCountryRegionABand;
	var ctlCountryRegionABand0 = document.ConfigForm.CountryRegionABand0;
	var ctlCountryRegionABand1 = document.ConfigForm.CountryRegionABand1;
	var ctlCountryRegionABand2 = document.ConfigForm.CountryRegionABand2;
	var ctlCountryRegionABand3 = document.ConfigForm.CountryRegionABand3;
	var ctlCountryRegionABand4 = document.ConfigForm.CountryRegionABand4;
	var ctlCountryRegionABand5 = document.ConfigForm.CountryRegionABand5;
	var ctlCountryRegionABand6 = document.ConfigForm.CountryRegionABand6;
	var ctlCountryRegionABand7 = document.ConfigForm.CountryRegionABand7;
	var ctlCountryRegionABand8 = document.ConfigForm.CountryRegionABand8;
	var ctlCountryRegionABand9 = document.ConfigForm.CountryRegionABand9;
	var ctlCountryRegionABand10 = document.ConfigForm.CountryRegionABand10;
	var ctlCountryRegionABand11 = document.ConfigForm.CountryRegionABand11;
	var ctlCountryRegionABand12 = document.ConfigForm.CountryRegionABand12;
	var ctlCountryRegionABand13 = document.ConfigForm.CountryRegionABand13;
	var ctlCountryRegionABand14 = document.ConfigForm.CountryRegionABand14;
	if(vCountryName == "ARGENTINA")
		ctlCountryRegionABand.value = ctlCountryRegionABand14.value;
	else if (vCountryName == "ARMENIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "AUSTRALIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
	else if (vCountryName == "AUSTRIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "AZERBAIJAN")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "BAHRAIN")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "BELARUS")
        ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BELGIUM")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BELIZE")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BOLIVIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BRAZIL")
		ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "BRUNEI DARUSSALAM")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BULGARIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
    else if (vCountryName == "CANADA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
    else if (vCountryName == "CHILE")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "CHINA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
    else if (vCountryName == "COLOMBIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
    else if (vCountryName == "COSTA RICA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "CROATIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "CYPRUS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;		
	else if (vCountryName == "CZECH REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "DENMARK")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "DOMINICAN REPUBLIC")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "EGYPT")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "EL SALVADOR")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "ESTONIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FINLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FRANCE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "GEORGIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "GERMANY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "GREECE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "GUATEMALA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "HONDURAS")
        ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "HONG KONG")
        ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "HUNGARY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "ICELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "INDIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "INDONESIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "IRAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "IRAQ")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "IRELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
    else if (vCountryName == "ISRAEL")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "ITALY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "JAPAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "JORDAN")
    	ctlCountryRegionABand.value = ctlCountryRegionABand6.value;
	else if (vCountryName == "KAZAKHSTAN")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "KOREA DEMOCRATIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "KOREA REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "KUWAIT")
    	ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LATVIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LEBANON")
    	ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
    else if (vCountryName == "LIECHTENSTEIN")
    	ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LITHUANIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LUXEMBOURG")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "MONACO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "MACEDONIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "MALAYSIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "MALTA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "MEXICO")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "MONACO")
    	ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "MOROCCO")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "NETHERLANDS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "NEW ZEALAND")
    	ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "NIGERIA")
        ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "NORWAY")
        ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "OMAN")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "PAKISTAN")
        ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "PANAMA")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "PERU")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "PHILIPPINES")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "POLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PORTUGAL")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PUERTO RICO")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "QATAR")
        ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "ROMANIA")
        ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "RUSSIA")
        ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "SAUDI ARABIA")
        ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "SINGAPORE")
        ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "SLOVAK REPUBLIC")
        ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SLOVENIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SOUTH AFRICA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "SPAIN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SRI LANKA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "SWEDEN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SWITZERLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "TAIWAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "THAILAND")
    	ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "TRINIDAD AND TOBAGO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "TUNISIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "TURKEY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "UKRAINE")
    	ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "UNITED ARAB EMIRATES")
        ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "UNITED KINGDOM")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand13.value;
	else if (vCountryName == "UNITED STATES")
    	ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "URUGUAY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
	else if (vCountryName == "UZBEKISTAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "VENEZUELA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "VIETNAM")
    	ctlCountryRegionABand.value = ctlCountryRegionABand7.value;
	else if (vCountryName == "YEMEN")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "ZIMBABWE")
    	ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	else if (vCountryName == "SERBIA")
    	ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else
		ctlCountryRegionABand.value = ctlCountryRegionABand11.value;

	RefreshChannPage();
	if(document.ConfigForm.RTDEVICE.value == "7615")
	{
		initWLan11ac2ndFrequencySel();
		VHTBandwidthRefreshPage();
	}
	document.ConfigForm.CountryChange.value = 1; 
}

var bInit = 1;
function RefreshChannPage(){
	var index = 0;
	var ctlChannel_ID = document.ConfigForm.Channel_ID;
	var vChannel = ctlChannel_ID.value;
	var vCountryRegionABand = document.ConfigForm.hCountryRegionABand.value;
	if(bInit == 1){
		vChannel = "0";
		bInit = 0;
	}
	ctlChannel_ID.length = 0;
	if(vCountryRegionABand == 0){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 1){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("124", "124");
		ctlChannel_ID.options[index++] = new Option("128", "128");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
	}else if(vCountryRegionABand == 2){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
	}else if(vCountryRegionABand == 3){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else if(vCountryRegionABand == 4){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 5){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else if(vCountryRegionABand == 6){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
	}else if(vCountryRegionABand == 7){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("124", "124");
		ctlChannel_ID.options[index++] = new Option("128", "128");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
    }else if(vCountryRegionABand == 8){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
	}else if(vCountryRegionABand == 9){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 10){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 11){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else if(vCountryRegionABand == 12){
     	ctlChannel_ID.options[index++] = new Option("AUTO", "0");
     	ctlChannel_ID.options[index++] = new Option("36", "36");
     	ctlChannel_ID.options[index++] = new Option("40", "40");
     	ctlChannel_ID.options[index++] = new Option("44", "44");
     	ctlChannel_ID.options[index++] = new Option("48", "48");
     	ctlChannel_ID.options[index++] = new Option("52", "52");
     	ctlChannel_ID.options[index++] = new Option("56", "56");
     	ctlChannel_ID.options[index++] = new Option("60", "60");
     	ctlChannel_ID.options[index++] = new Option("64", "64");
     	ctlChannel_ID.options[index++] = new Option("100", "100");
     	ctlChannel_ID.options[index++] = new Option("104", "104");
     	ctlChannel_ID.options[index++] = new Option("108", "108");
     	ctlChannel_ID.options[index++] = new Option("112", "112");
     	ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
     	ctlChannel_ID.options[index++] = new Option("124", "124");
     	ctlChannel_ID.options[index++] = new Option("128", "128");
     	ctlChannel_ID.options[index++] = new Option("132", "132");
     	ctlChannel_ID.options[index++] = new Option("136", "136");
     	ctlChannel_ID.options[index++] = new Option("140", "140");
     	ctlChannel_ID.options[index++] = new Option("144", "144");
    }else if(vCountryRegionABand == 13){
        ctlChannel_ID.options[index++] = new Option("AUTO", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
        ctlChannel_ID.options[index++] = new Option("124", "124");
        ctlChannel_ID.options[index++] = new Option("128", "128");
        ctlChannel_ID.options[index++] = new Option("132", "132");
        ctlChannel_ID.options[index++] = new Option("136", "136");
        ctlChannel_ID.options[index++] = new Option("140", "140");
        ctlChannel_ID.options[index++] = new Option("144", "144");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        ctlChannel_ID.options[index++] = new Option("165", "165");
    }else if(vCountryRegionABand == 14){
        ctlChannel_ID.options[index++] = new Option("AUTO", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("132", "132");
        ctlChannel_ID.options[index++] = new Option("136", "136");
        ctlChannel_ID.options[index++] = new Option("140", "140");
        ctlChannel_ID.options[index++] = new Option("144", "144");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        ctlChannel_ID.options[index++] = new Option("165", "165");
    }else{
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("124", "124");
		ctlChannel_ID.options[index++] = new Option("128", "128");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
		ctlChannel_ID.options[index++] = new Option("144", "144");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}
	ctlChannel_ID.options[0].selected=true;
	SelectValue(ctlChannel_ID, vChannel);

	if(document.ConfigForm.Is11nMode.value == "1"){
		document.getElementById("11nMode_0_div").style.display="none";
		document.getElementById("11nMode_1_div").style.display="";
	}else{
		document.getElementById("11nMode_0_div").style.display="";
		document.getElementById("11nMode_1_div").style.display="none";
	}

	if(document.ConfigForm.WLANChannelBandwidth.value == "1")

	{
	    document.getElementById("HT_BW_1_div").style.display="";
		if(document.ConfigForm.Is11acMode.value == "1"){
			document.getElementById("11acMode_1_div").style.display="";
		}else{
			document.getElementById("11acMode_1_div").style.display="none";
		}
	}else{
	    document.getElementById("HT_BW_1_div").style.display="none";
		document.getElementById("11acMode_1_div").style.display="none";
	}	
	if(document.ConfigForm.isWPSSupported.value == "1")
	{
		if(document.ConfigForm.wlan_VC.value == 0 || document.ConfigForm.wlan_VC.value == 1){
			if(document.ConfigForm.UseWPS_Selection.checked == true)
				document.getElementById("WPSConfMode_1_div").style.display="";
			else
				document.getElementById("WPSConfMode_1_div").style.display="none";
		}
	}
	var vAuthMode = document.ConfigForm.WEP_Selection.value;
	if(document.getElementById("Radius-WEP64_div") != null) 
		document.getElementById("Radius-WEP64_div").style.display="none";
	if(document.getElementById("Radius-WEP128_div") != null)
		document.getElementById("Radius-WEP128_div").style.display="none";
	if(document.getElementById("WPA_div") != null)
		document.getElementById("WPA_div").style.display="none";
	if(document.getElementById("WPA2_div") != null)
		document.getElementById("WPA2_div").style.display="none";
	if(document.getElementById("WPA1WPA2_div") != null)
		document.getElementById("WPA1WPA2_div").style.display="none";


	if(document.getElementById("WPA3_div") != null)
		document.getElementById("WPA3_div").style.display="none";
	if(document.getElementById("WPA3_192Bit_div") != null)
		document.getElementById("WPA3_192Bit_div").style.display="none";


		
	if(vAuthMode == "Radius-WEP64"){
		if(document.getElementById("Radius-WEP64_div") != null) 
			document.getElementById("Radius-WEP64_div").style.display="";
	}
	if(vAuthMode == "Radius-WEP128"){
		if(document.getElementById("Radius-WEP128_div") != null)
			document.getElementById("Radius-WEP128_div").style.display="";
	}
	if(vAuthMode == "WPA"){
		if(document.getElementById("WPA_div") != null)
			document.getElementById("WPA_div").style.display="";
	}
	if(vAuthMode == "WPA2"){
		if(document.getElementById("WPA2_div") != null)
			document.getElementById("WPA2_div").style.display="";
	}
	if(vAuthMode == "WPA1WPA2"){
		if(document.getElementById("WPA1WPA2_div") != null)
			document.getElementById("WPA1WPA2_div").style.display="";
	}


	if(vAuthMode == "WPA3"){
		if(document.getElementById("WPA3_div") != null)
			document.getElementById("WPA3_div").style.display="";
	}
	if(vAuthMode == "WPA3-192Bit"){
		if(document.getElementById("WPA3_192Bit_div") != null)
			document.getElementById("WPA3_192Bit_div").style.display="";
	}


		
	if(document.getElementById("WEP-64Bits_div") != null)
		document.getElementById("WEP-64Bits_div").style.display="none";
	if(document.getElementById("WEP-128Bits_div") != null)
		document.getElementById("WEP-128Bits_div").style.display="none";
	if(document.getElementById("WPA2PSK_div") != null)
		document.getElementById("WPA2PSK_div").style.display="none";
	if(document.getElementById("WPAPSK_div") != null)
		document.getElementById("WPAPSK_div").style.display="none";
	if(document.getElementById("WPAPSKWPA2PSK_div") != null)
		document.getElementById("WPAPSKWPA2PSK_div").style.display="none";	

	if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
		document.getElementById("WPA2PSKWPA3PSK_div").style.display="none";	
	if(document.getElementById("WPA3PSK_div") != null)
		document.getElementById("WPA3PSK_div").style.display="none";

	if(vAuthMode == "WEP-64Bits"){
		if(document.getElementById("WEP-64Bits_div") != null)
			document.getElementById("WEP-64Bits_div").style.display="";
	}else if(vAuthMode == "WEP-128Bits"){
		if(document.getElementById("WEP-128Bits_div") != null)
			document.getElementById("WEP-128Bits_div").style.display="";
	}else if(vAuthMode == "WPA2PSK"){
		if(document.getElementById("WPA2PSK_div") != null)
			document.getElementById("WPA2PSK_div").style.display="";
	}else if(vAuthMode == "WPAPSK"){
		if(document.getElementById("WPAPSK_div") != null)
			document.getElementById("WPAPSK_div").style.display="";
	}else if(vAuthMode == "WPAPSKWPA2PSK"){
		if(document.getElementById("WPAPSKWPA2PSK_div") != null)
			document.getElementById("WPAPSKWPA2PSK_div").style.display="";	
	}

	else if(vAuthMode == "WPA2PSKWPA3PSK"){
		if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
			document.getElementById("WPA2PSKWPA3PSK_div").style.display="";	
	}else if(vAuthMode == "WPA3PSK"){
		if(document.getElementById("WPA3PSK_div") != null)
			document.getElementById("WPA3PSK_div").style.display="";	
	}

	
	if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="none";
	if(vAuthMode == "OPEN")
		;
	else if(vAuthMode == "WEP-64Bits")
		;
	else if(vAuthMode == "WEP-128Bits")
		;
	else if(vAuthMode == "Radius-WEP64")
		;
	else if(vAuthMode == "Radius-WEP128")
		;
	else if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="";
}

var MCSInit = 1;
function McsRefreshPage(){
	var rt_device = "7663";
	var index = 0;
	var WLANMCS_ID = document.ConfigForm.WLANMCS;
	var vWLANMCS = WLANMCS_ID.value;
	var ls11acmode = document.ConfigForm.Is11acMode.value;
	if(MCSInit == 1){
		vWLANMCS = "33";
		MCSInit = 0;
	}
	WLANMCS_ID.length = 0;
	WLANMCS_ID.options[index++] = new Option("0", "0");
	WLANMCS_ID.options[index++] = new Option("1", "1");
	WLANMCS_ID.options[index++] = new Option("2", "2");
	WLANMCS_ID.options[index++] = new Option("3", "3");
	WLANMCS_ID.options[index++] = new Option("4", "4");
	WLANMCS_ID.options[index++] = new Option("5", "5");
	WLANMCS_ID.options[index++] = new Option("6", "6");
	WLANMCS_ID.options[index++] = new Option("7", "7");
	if(ls11acmode == "1"){
		WLANMCS_ID.options[index++] = new Option("8", "8");
		if (document.ConfigForm.WLANChannelBandwidth.selectedIndex != 0)
		WLANMCS_ID.options[index++] = new Option("9", "9");
	}
	else if (rt_device == "7612" || rt_device == "7613" || rt_device == "7615") {
		WLANMCS_ID.options[index++] = new Option("8", "8");
		WLANMCS_ID.options[index++] = new Option("9", "9");
		WLANMCS_ID.options[index++] = new Option("10", "10");
		WLANMCS_ID.options[index++] = new Option("11", "11");
		WLANMCS_ID.options[index++] = new Option("12", "12");
		WLANMCS_ID.options[index++] = new Option("13", "13");
		WLANMCS_ID.options[index++] = new Option("14", "14");
		WLANMCS_ID.options[index++] = new Option("15", "15");
	}
	WLANMCS_ID.options[index++] = new Option("AUTO", "33");
	
	WLANMCS_ID.options[0].selected=true;
	SelectValue(WLANMCS_ID, vWLANMCS);
}




function dowpscheck(){				//modified by fred to support WPS2.0
	var wlan=document.ConfigForm;
	if(wlan.SSID_INDEX.value==0){	
		if(wlan.UseWPS_Selection.checked == true){
			//check if WscV2Supported

		//do simple check if only WPS 1.0 supported, use original check code in 1.0

		//WEPSelectIndex 1=WEP64,2=WEP128,3=Radius-WEP64,4=Radius-WEP128

		if(wlan.WEP_Selection.value == "WPA3PSK" || wlan.WEP_Selection.value == "WPA2PSKWPA3PSK")
				return 1;

		if(WEPSelectIndex == 1 || WEPSelectIndex == 7 || WEPSelectIndex == 6){
			alert("We should not use WEP when WPS function turned on!");
			if(wpsenable){
				wlan.UseWPS_Selection.checked = true;
			}else{
				wlan.UseWPS_Selection.checked = false;
			}
			return 0;
		}else{
			return 1;
		}

	
		}
		else{
			return 1;
		}
	}else{
		return 1;
	}
}


function doSSIDEnable(){
	var wlan=document.ConfigForm;
	wlan.ESSID_Enable_Selection.checked = true;
	LoadFrame();
	return 1;
}


function doBroadcastSSIDChange(ctl){
	//check if WscV2Supported


	
	return 1;	
}

function doEncryptionChange(object){
	//check if WscV2Supported


	return 1;
}


function doWEPChange(){
	doCheckWepSelectIndex();
	var wlan=document.ConfigForm;	



	//do simple check if only WPS 1.0 supported, use original check code in 1.0


	if(wlan.WEP_Selection.value != "WPA3PSK" && wlan.WEP_Selection.value != "WPA2PSKWPA3PSK"){

	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection.checked == true) &&(WEPSelectIndex == 1 || WEPSelectIndex == 2 || WEPSelectIndex == 6 || WEPSelectIndex == 7))
	{
		alert("We should not use WEP when WPS function turned on!");
		wlan.WEP_Selection.selectedIndex = wepidx;
	}

	}


	
	if(WEPSelectIndex == 0)
	{
		var rv = confirm("Your network will be set to OPEN without security setting, we strongly suggest you choose WPAPSK or WPA2PSK encryption!!");
		if (rv == false)
		{
			wlan.WEP_Selection.selectedIndex = wepidx;
		}
	}
	wlan.wlanWEPFlag.value = 1;
	document.ConfigForm.WEP_Selection_val.value = document.ConfigForm.WEP_Selection.value;

	LoadFrame();
}

function doWEPChange2(){

	if(dowpscheck()){

		document.ConfigForm.wlanWEPFlag.value = 1;
		if(WEPSelectIndex != 9){

			document.ConfigForm.WEP_Selection.selectedIndex = 9;

			if( true == setEBooValueCookie(document.ConfigForm) )
				document.ConfigForm.submit();
		}

	}

}

function doWDSEncrypTypeChange(){
		document.ConfigForm.wlanWEPFlag.value = 4;
}

function doSSIDChange(){
	document.ConfigForm.wlanWEPFlag.value = 2;
	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function doExtChaLockChange() {
	if(document.ConfigForm.WirelessMode.selectedIndex >= 1){
		if(document.ConfigForm.RTDEVICE.value == "7615")
		{
			initWLan11ac2ndFrequencySel();
			VHTBandwidthRefreshPage();
		}

		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){

			document.ConfigForm.wlanWEPFlag.value = 1;
			LoadFrame();
		}
	}
}

function doWirelessModeChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	if(document.ConfigForm.WirelessMode.selectedIndex>1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=2){
			document.ConfigForm.Is11acMode.value=1;
		}else{
			document.ConfigForm.Is11acMode.value=0;	
		}
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}
	LoadFrame();
}

function doVHTBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	LoadFrame();
}

function doChannelBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	LoadFrame();
}

function doExtChannChange(){
	if(document.ConfigForm.WLANExtensionChannel.selectedIndex==0){
		document.ConfigForm.ExtChannFlag.value = 0;
	}else{
		document.ConfigForm.ExtChannFlag.value = 1;
	}
}


function doWPSUseChange(){
    if (document.ConfigForm.UseWPS_Selection.checked)
    {
        setDisplay("WPSConfMode_1_div", 1);
    }
    else
    {
        setDisplay("WPSConfMode_1_div", 0);
    }

	if(dowpscheck()){
		document.ConfigForm.wlanWEPFlag.value = 1;
		RefreshChannPage();
		LoadFrame();
	}
}

function doWPSModeChange()
{
	with ( document.ConfigForm)
	{
		if (document.ConfigForm.UseWPS_Selection.checked)
		{
            var temp = getSelectVal("WPSMode_Selection");
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


function wpapskCheck(object) {
	var keyvalue=object.value;
	var wpapsklen=object.value.length;
 	if(wpapsklen >= 8 && wpapsklen < 64){
  	if(keyvalue.match(/[^\x00-\xff]/g))
 	  {
			alert("Pre-Shared Key should be between 8 and 63 ASCII characters or 64 Hex string.");
			return true;
 	  }
	}else if(wpapsklen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert("Pre-Shared Key Hex value error!");
				return true;
			}
		}
	}else {
    alert("Pre-Shared Key length error!");
		return true;
	}			
	return false;
}

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

function doWEPTypeChange(){

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

function doNonSympolCheck(c)
{
	if ((c >= "0")&&(c <= "9"))
	{
		return 1;
	}
	else if ((c >= "A")&&(c <= "Z"))
	{
		return 1;
	}
	else if ((c >= "a")&&(c <= "z"))
	{
		return 1;
	}

  return -1;
}

function doKEYcheck(object)
{
	var index = object.value.indexOf("0x");
	len=object.value.length;
	
	if(len == 0){
		return true;
	}

	if(WEPSelectIndex==1)
	{
		if(len==5)/*wep 64*/
		{
			return true;
		}
		else if(len==10)/*wep 64*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid key");
						return false;
				}
			}
		}
		else
		{
			alert("Invalid Key Value");
			return false;
		}
	}
	else if(WEPSelectIndex==2)
	{
		if(len==13)/*wep 128*/
		{
			return true;
		}
		else if(len==26)/*wep 128*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					return false;
				}
			}
		}
		else
		{
			alert("Invalid Key Value");
			return false;
		}
	}
	if(document.ConfigForm.isDot1XSupported.value==1)
	{
		if(WEPSelectIndex==6)
		{
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		else if(WEPSelectIndex==7)
		{
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("nvalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("nvalid Key Value");
				return false;
			}
		}
	}
	return true;
}

function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";

  if ( len == 0 )
  {
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
    return;
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
    return; 
  }
  else
  {
		alert("Invalid MAC Address");         	
		return true;
  }

  return false;

}

function checkBeacon(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 20 || value > 1000) {
    alert("Beacon value must be between 20 and 1000");    
    return true;  	
  }
  return false;
}

function checkRTS(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 1500 || value > 2347) {
    alert("RTS Threshold value must be between 1500 and 2347");    
    return true;  	
  }
  return false;
}

function checkFrag(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 256 || value > 2346) {
    alert("Fragmentation Threshold value must be between 256 and 2346");    
    return true;  	
  }
  if (value % 2) {
    alert("Fragmentation Threshold value must be an even number");    
    return true;  	
  }
  return false;
}

function checkDTIM(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 1 || value > 255) {
    alert("DTIM value must be between 1 and 255");		
    return true;
	}	
	return false;
}


function checkStationNum(value, limit) 
{
	if (!isNumeric(value) || parseInt(value,10) < 0 || parseInt(value,10) > parseInt(limit,10)){
    alert("Station Number value must be between 0 and " + limit);
		return true;
	}	
	return false;
}


function checkRekeyinteral(value, flag) 
{
	if (!isNumeric(value)) {
		if(flag == 1){
			alert("WPA Group Rekey Interval : Non-integer value given"); 
		}else{
			alert("Key Renewal Interval : Non-integer value given");
		}
		return true;
	}
	if (value < 10 || value > 4194303) {
		if(flag == 1){
			alert("WPA Group Rekey Interval must be between 10 and 4194303");
		}else{
			alert("Key Renewal Interval must be between 10 and 4194303");
		}	
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
		alert('Invalid IP address' + Address);
		return true;
	}

	digits = address[0].split(".");
	for(i=0; i < 4; i++)
	{
		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
		{ 
			alert('Invalid IP address' + Address);
			return true;
		}
	}
	if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false))
	{
		alert('Invalid IP address' + Address);
		return true;
	}
	return false;
}

function ValidateChecksum(PIN)
{
	var accum = 0;
	accum += 3 * (((PIN - PIN % 10000000) / 10000000) % 10);
	accum += 1 * (((PIN - PIN % 1000000) / 1000000) % 10);
	accum += 3 * (((PIN - PIN % 100000) / 100000) % 10);
	accum += 1 * (((PIN - PIN % 10000) / 10000) % 10);
	accum += 3 * (((PIN - PIN % 1000) / 1000) % 10);
	accum += 1 * (((PIN - PIN % 100) / 100) % 10);
	accum += 3 * (((PIN - PIN % 10) / 10) % 10);
	accum += 1 * (((PIN - PIN % 1) / 1) % 10);
	if ((accum % 10) == 0)
		return true;
	else
		return false;
}




function doPINCodeCheck(object)
{
	var len= object.value.length;
	var ch;



	if (len > 0)
	{
		if(len < 8)
		{
			alert("WPS PIN code must be 8 digits!");
			return false;
		}
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert("WPS PIN code must be 8 digits!");
				return false;
			}
		}
		if (ValidateChecksum(Number(object.value)) == false)
		{
			alert("WPS PIN code checksum error!");
			return false;
		}
		return true;
	}
	
}
	

function MacfilterValidation()
{
        if(document.ConfigForm.WLAN_FltActive_Open.checked == true)
        {
                if((document.ConfigForm.WLANFLT_MAC1.value == "") && (document.ConfigForm.WLANFLT_MAC2.value == "") && (document.ConfigForm.WLANFLT_MAC3.value == "") && (document.ConfigForm.WLANFLT_MAC4.value == "") && (document.ConfigForm.WLANFLT_MAC5.value == "") && (document.ConfigForm.WLANFLT_MAC6.value == "") && (document.ConfigForm.WLANFLT_MAC7.value == "") && (document.ConfigForm.WLANFLT_MAC8.value == ""))
                {
                        alert("Mac Address fields can't be empty, Provide atleast one Valid Entry.");
                        return false;
                }
        }
}


function setCheckBoxEnbleValue()
{
    if (document.ConfigForm.wlan_APenable.checked == true)
    {
        document.ConfigForm.wlan_APenable_flag.value = "1";
    }
    else
    {
        document.ConfigForm.wlan_APenable_flag.value = "0";
    }

    
    if (document.ConfigForm.ESSID_Enable_Selection.checked == true)
    {
        document.ConfigForm.ESSID_Enable_Selection_flag.value = "1";
    }
    else
    {
        document.ConfigForm.ESSID_Enable_Selection_flag.value = "0";
    }
    

    if (document.ConfigForm.ESSID_HIDE_Selection.checked == true)
    {
        document.ConfigForm.ESSID_HIDE_Selection_flag.value = "1";
    }
    else
    {
        document.ConfigForm.ESSID_HIDE_Selection_flag.value = "0";
    }

    if (document.ConfigForm.UseWPS_Selection.checked == true)
    {
        document.ConfigForm.UseWPS_Selection_flag.value = "1";
    }
    else
    {
        document.ConfigForm.UseWPS_Selection_flag.value = "0";
    }

	var temp = getSelectVal("WPSMode_Selection");
	if(temp == 'ap-pin')
	{
		setText('WPSMode_Selection_flag', 0);
	}
	else
	{
		setText('WPSMode_Selection_flag', 1);
	}
}

function doSave(){

	if(document.ConfigForm.SSID_INDEX.value==0)
    {

        var temp = getSelectVal("WPSMode_Selection");
	    if(temp == 'ap-pin')
        {
                var pincode = document.ConfigForm.WPSEnrolleePINCode;
                if((doPINCodeCheck(pincode) == false))
                {
                  return false;
                }
         }
	}


	if( MacfilterValidation() == false )
        {
                return false;
        }


	if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
		checkRTS(document.ConfigForm.RTSThreshold.value) ||
		checkFrag(document.ConfigForm.FragmentThreshold.value) ||
		checkDTIM(document.ConfigForm.DTIM.value)

		|| checkStationNum(document.ConfigForm.StationNum.value, document.ConfigForm.maxStaNum.value)

	){
		return false;
	}
		

		if(document.ConfigForm.WEP_Selection.value == "WPA3PSK")
		{
				document.ConfigForm.hRekeyMethod.value = "TIME";
				if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA3)){
					return false;
				}
		}
		if(document.ConfigForm.WEP_Selection.value == "WPA2PSKWPA3PSK")
		{
				document.ConfigForm.hRekeyMethod.value = "TIME";
				if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA2WPA3)){
					return false;
				}
		}

	if(WEPSelectIndex == 3){ 
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey2)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey2, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval2.value, 0)){
			return false;
		}  			
	}

	if(WEPSelectIndex == 4){
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey1)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey1, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval1.value, 0)){
			return false;
		}  			
	}

	if(WEPSelectIndex == 5){
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey3)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey3, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval3.value, 0)){
			return false;
		}  			
	}
      	
	if(WEPSelectIndex == 1){ 
		document.ConfigForm.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.ConfigForm.WEP_Key13))||
		(!doKEYcheck(document.ConfigForm.WEP_Key23))||
		(!doKEYcheck(document.ConfigForm.WEP_Key33))||
		(!doKEYcheck(document.ConfigForm.WEP_Key43))){
			return false;
		}
	}
	
	if(WEPSelectIndex == 2){ 
		document.ConfigForm.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.ConfigForm.WEP_Key14))||
		(!doKEYcheck(document.ConfigForm.WEP_Key24))||
		(!doKEYcheck(document.ConfigForm.WEP_Key34))||
		(!doKEYcheck(document.ConfigForm.WEP_Key44))){
			return false;
		}
	}
	
	if(document.ConfigForm.isDot1XSupported.value==1)
	{	
		if(WEPSelectIndex == 6) 
		{
			if((!doKEYcheck(document.ConfigForm.WEP_Key11))||
			(!doKEYcheck(document.ConfigForm.WEP_Key21))||
			(!doKEYcheck(document.ConfigForm.WEP_Key31))||
			(!doKEYcheck(document.ConfigForm.WEP_Key41)))
			{
				return false;
			}
		}

		if(WEPSelectIndex == 7) 
		{
			if((!doKEYcheck(document.ConfigForm.WEP_Key12))||
			(!doKEYcheck(document.ConfigForm.WEP_Key22))||
			(!doKEYcheck(document.ConfigForm.WEP_Key32))||
			(!doKEYcheck(document.ConfigForm.WEP_Key42)))
			{
				return false;
			}
		}

		var vAuthMode = document.ConfigForm.WEP_Selection.selectedIndex;

		if((WEPSelectIndex == 6) || (WEPSelectIndex == 7) || (WEPSelectIndex == 8) || (WEPSelectIndex == 9)
		|| (WEPSelectIndex == 10)

		|| (WEPSelectIndex == 13) || (WEPSelectIndex == 14)

		)
		{
			if(document.ConfigForm.isDot1XEnhanceSupported.value == 0)
			{
				if(vAuthMode == 6){
					radiusip = document.ConfigForm.radiusSVR_IP1.value;
				}
				else if(vAuthMode == 7){
					radiusip = document.ConfigForm.radiusSVR_IP2.value;
				}
				else if(vAuthMode == 8){
					radiusip = document.ConfigForm.radiusSVR_IP3.value;
				}
				else if(vAuthMode == 9){
					radiusip = document.ConfigForm.radiusSVR_IP4.value;
				}
				else if(vAuthMode == 10){
					radiusip = document.ConfigForm.radiusSVR_IP5.value;
				}								

				else if (vAuthMode == 13){
					radiusip = document.ConfigForm.WPA3_radiusSVR_IP.value;
				}
				else if (vAuthMode == 14){
					radiusip = document.ConfigForm.WPA3_192Bit_radiusSVR_IP.value;
				}
						
				
			 if(inValidIPAddr(radiusip))
			 {
				return false;
			 }
			}
			//serverport
			if(vAuthMode == 6){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port1.value);
				radiuskey = document.ConfigForm.radiusSVR_Key1.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter1.value;
			}
			else if(vAuthMode == 7){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port2.value);
				radiuskey = document.ConfigForm.radiusSVR_Key2.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter2.value;
			}
			else if(vAuthMode == 8){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port3.value);
				radiuskey = document.ConfigForm.radiusSVR_Key3.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter3.value;
			}
			else if(vAuthMode == 9){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port4.value);
				radiuskey = document.ConfigForm.radiusSVR_Key4.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter4.value;
			}
			else if(vAuthMode == 10){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port5.value);
				radiuskey = document.ConfigForm.radiusSVR_Key5.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter5.value;
			}

			else if (vAuthMode == 13){
				radiusport = document.ConfigForm.WPA3_radiusSVR_Port.value;
				radiuskey = document.ConfigForm.WPA3_radiusSVR_Key.value;
				session_timeout_interval = document.ConfigForm.WPA3_radiusSVR_ReAuthInter.value;
			}
			else if (vAuthMode == 14){
				radiusport = document.ConfigForm.WPA3_192Bit_radiusSVR_Port.value;
				radiuskey = document.ConfigForm.WPA3_192Bit_radiusSVR_Key.value;
				session_timeout_interval = document.ConfigForm.WPA3_192Bit_radiusSVR_ReAuthInter.value;
			}

			if(isNaN(radiusport) || radiusport < 0 || radiusport > 65535)
			{	
				alert("Radius Server Port number's range: 0 ~ 65535.");
				return false;
			}
			
				if (radiuskey.length == 0)
				{
					alert("Radius Share secret can not be empty.");
  					return false; 
				}

			if (isNaN(session_timeout_interval) ||session_timeout_interval.length == 0)
			{
					alert("Re-auth Interval is invalid or empty.");
  					return false; 
				}
			}

		if((WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10)

		|| (WEPSelectIndex == 13) || (WEPSelectIndex == 14)

		)
		{
			if(vAuthMode == 8){
				WPARekeyInter = document.ConfigForm.WPARekeyInter3.value;
			}
			else if(vAuthMode == 9){
				WPARekeyInter = document.ConfigForm.WPARekeyInter4.value;
			}
			else if(vAuthMode == 10){
				WPARekeyInter = document.ConfigForm.WPARekeyInter5.value;
			}

			else if (vAuthMode == 13){
				WPARekeyInter = document.ConfigForm.WPA3_WPARekeyInter.value;
			}
			else if (vAuthMode == 14){
				WPARekeyInter = document.ConfigForm.WPA3_192Bit_WPARekeyInter.value;
			}

			
			if(checkRekeyinteral(WPARekeyInter, 1)){
				return false;	
			}
   	}
	}
	
	//if wds support meantime AuthMode of MAIN SSID is wpa2psk,wpapsk WPAPSKWPA2PSK , then check wds key 
	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
		{
			if(document.ConfigForm.isDot1XSupported.value==1)
			{
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5)
				|| (WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10))
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
			else
			{
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5))
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
	}


	if(quotationCheck(document.ConfigForm.ESSID, 193)||strESSIDCheck(document.ConfigForm.ESSID)){
		return;	   
	}
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
	document.ConfigForm.wlanWEPFlag.value = 3;
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=2){
			document.ConfigForm.Is11acMode.value=1;
		}else{
			document.ConfigForm.Is11acMode.value=0;
		}
	
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}

/*
	if(!checkSelectedKEY()){
		return false;
	}
*/
    setCheckBoxEnbleValue();
    var t = new Date();
    var year = t.getFullYear();
    var month = t.getMonth() + 1;
    var day = t.getDate();
    var hour = t.getHours();
    var minute = t.getMinutes();
    var second = t.getSeconds();
    var curTime = "" + year + ((month<10)?"0":"") + month + ((day<10)?"0":"") + day + ((hour<10)?"0":"") + hour + ((minute<10)?"0":"") + minute + ((second<10)?"0":"") + second;
    document.ConfigForm.currentTime.value = curTime;

	if( true == setEBooValueCookie(document.ConfigForm) )
		document.ConfigForm.submit();
}

function checkSelectedKEY(){
	var group;
	var curCBX;
	var vAuthMode = document.ConfigForm.WEP_Selection.value;
	if(vAuthMode == "Radius-WEP64"){
		group = document.ConfigForm.DefWEPKey1;
	}
	else if(vAuthMode == "Radius-WEP128"){
		group = document.ConfigForm.DefWEPKey2;
	}
	else if(vAuthMode == "WEP-64Bits"){
		group = document.ConfigForm.DefWEPKey3;
	}
	else if(vAuthMode == "WEP-128Bits"){
		group = document.ConfigForm.DefWEPKey4;
	}else{
		return true;
	}

	for (var i=0; i<group.length; i++){
		if (group[i].checked)
		break;
	}
	
	if(vAuthMode == "Radius-WEP64"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key11;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key21;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key31;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key41;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "Radius-WEP128"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key12;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key22;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key32;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key42;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-64Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key13;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key23;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key33;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key43;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-128Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key14;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key24;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key34;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key44;
			break;
		default:
		  ;
		}
	}
	
	len=curCBX.value.length;
	index = curCBX.value.indexOf("0x");

	if(WEPSelectIndex==1)/*wep 64*/
	{
		if(len==5)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==10)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==12)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
	else if(WEPSelectIndex==2)/*wep 128*/
	{
		if(len==13)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==26)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==28)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
	return true;
}

function checkFocus(value){
	if(WEPSelectIndex == 0){
		document.ConfigForm.WEP_Selection.focus();
	}
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

function InsExtChOpt(CurrCh)
{
	var ExtChann = document.ConfigForm.ExtChannFlag;
	if ((1*CurrCh >= 36) && (1*CurrCh <= 64))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 9;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 100) && (1*CurrCh <= 136))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 17;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 149) && (1*CurrCh <= 161))
	{
			CurrCh = 1*CurrCh;
			CurrCh -= 1;
			CurrCh /= 4;
			CurrCh -= 19;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else
	{
			ExtChann.value = 0;
	}
	return ExtChann.value;
}

function doloadSSID2()
{
	if(document.ConfigForm.SSID_INDEX.selectedIndex == 1)
	{
		var j;
		var frm = document.ConfigForm;
		for(j = 0; j < frm.elements.length; j++)
		{	
			if(frm.elements[j].type != "hidden")		
				frm.elements[j].disabled = true;
		}
	}
	document.ConfigForm.SSID_INDEX.disabled = false;
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

function SelectValue(o,v){
	for(var i=0; i<o.options.length; i++)
		if(o.options[i].value == v){
		o.options[i].selected=true;
		break;
	}
}



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
							var pwd = document.getElementById("PreSharedKey3");

                    if (pwd.type == "password") {
                        pwd.type = "text";
                            eye.className='fa fa-eye-slash'
                    }else {
                        pwd.type = "password";
                        eye.className='fa fa-eye'
                    }
            }

			function WPA3PSKshowhide(){
				var eye = document.getElementById("WPA3PSKeye");
							var pwd = document.getElementById("PreSharedKey_WPA3");

                    if (pwd.type == "password") {
                        pwd.type = "text";
                            eye.className='fa fa-eye-slash'
                    }else {
                        pwd.type = "password";
                        eye.className='fa fa-eye'
                    }
            }
			
			function WPA2WPA3showhide(){
				var eye = document.getElementById("WPA2WPA3eye");
							var pwd = document.getElementById("PreSharedKey_WPA2WPA3");

                    if (pwd.type == "password") {
                        pwd.type = "text";
                            eye.className='fa fa-eye-slash'
                    }else {
                        pwd.type = "password";
                        eye.className='fa fa-eye'
                    }
            }

			function WPA2PSKshowhide(){
				var eye = document.getElementById("WPA2PSKeye");
							var pwd = document.getElementById("PreSharedKey1");

                    if (pwd.type == "password") {
                        pwd.type = "text";
                            eye.className='fa fa-eye-slash'
                    }else {
                        pwd.type = "password";
                        eye.className='fa fa-eye'
                    }
            }

function PreSharedKey2showhide(){
	var eye = document.getElementById("PreSharedKey2Keye");
				var pwd = document.getElementById("PreSharedKey2");

		if (pwd.type == "password") {
			pwd.type = "text";
				eye.className='fa fa-eye-slash'
		}else {
			pwd.type = "password";
			eye.className='fa fa-eye'
		}
}
</SCRIPT>  -->
<SCRIPT language=JavaScript type=text/javascript >
	HT5GExtCh = new Array(22);
	HT5GExtCh[0] = 1;
	HT5GExtCh[1] = 0;
	HT5GExtCh[2] = 1;
	HT5GExtCh[3] = 0;
	HT5GExtCh[4] = 1;
	HT5GExtCh[5] = 0;
	HT5GExtCh[6] = 1;
	HT5GExtCh[7] = 0;
	HT5GExtCh[8] = 1;
	HT5GExtCh[9] = 0;
	HT5GExtCh[10] = 1;
	HT5GExtCh[11] = 0;
	HT5GExtCh[12] = 1;
	HT5GExtCh[13] = 0;
	HT5GExtCh[14] = 1;
	HT5GExtCh[15] = 0;
	HT5GExtCh[16] = 1;
	HT5GExtCh[17] = 0;
	HT5GExtCh[18] = 1;
	HT5GExtCh[19] = 0;
	HT5GExtCh[20] = 1;
	HT5GExtCh[21] = 0;
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	var wpsenable;
	<% end if %>
	var wepidx;
	var WEPSelectIndex;
	
	function SetCtlValue()
	{	
	<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
			var Wlan11acMuOfdmaDl = getCheckVal('Wlan11acMuOfdmaDlEnable');
			if(Wlan11acMuOfdmaDl == 1)
			{
				setText('Wlan11acMuOfdmaDlEnable_flag', 1);
				setText('Wlan11acMuOfdmaUlEnable_flag', 1);
			}
			else
			{
				setText('Wlan11acMuOfdmaDlEnable_flag', 0);
				setText('Wlan11acMuOfdmaUlEnable_flag', 0);
			}
			var Wlan11acMuMimoDl = getCheckVal('Wlan11acMuMimoDlEnable');
			if(Wlan11acMuMimoDl == 1)
			{
				setText('Wlan11acMuMimoDlEnable_flag', 1);
				setText('Wlan11acMuMimoUlEnable_flag', 1);
			}
			else
			{
				setText('Wlan11acMuMimoDlEnable_flag', 0);
				setText('Wlan11acMuMimoUlEnable_flag', 0);
			}
			var wlan11acSR = getCheckVal('wlan11acSREnable');
			if(wlan11acSR == 1)
			{
				setText('Wlan11acSREnable_flag', 1);
			}
			else
			{
				setText('Wlan11acSREnable_flag', 0);
			}
	<% end if %>
	}
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	var isMeshBssCfg = 0;
	var isBackHaul = 0;
	var isFrontHaul = 0;
	<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "0" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "1" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "2" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "3" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "4" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "5" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "6" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","FrontHaul","s") %>";
	<% elseif tcWebApi_get("WebCurSet_Entry","wlan_ac_id", "h") = "7" then %>
	isBackHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","BackHaul","s") %>";
	isFrontHaul = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","FrontHaul","s") %>";
	<% end if %>
	
	function mesh_save_check()
	{
			if(isMeshBssCfg)
			{
				var wlwpa_check = 0;
				if(1 != isBackHaul && 1 != isFrontHaul && (document.forms[0].WEP_Selection.value != 'OPEN') && (document.forms[0].WEP_Selection.value != 'WPA2PSK') && (document.forms[0].WEP_Selection.value != 'WPAPSK') && (document.forms[0].WEP_Selection.value != 'WPAPSKWPA2PSK') && (document.forms[0].WEP_Selection.value != 'WPA3PSK') && (document.forms[0].WEP_Selection.value != 'WPA2PSKWPA3PSK') )
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText4","s")%>");
					return 0;
				}
				else if(1 == isBackHaul && 1 != isFrontHaul && (document.forms[0].WEP_Selection.value != 'OPEN') && (document.forms[0].WEP_Selection.value != 'WPA2PSK') && (document.forms[0].WEP_Selection.value != 'WPA3PSK') && (document.forms[0].WEP_Selection.value != 'WPA2PSKWPA3PSK') )
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>");
					return 0;
				}
				else if( 1 == isFrontHaul && (document.forms[0].WEP_Selection.value != 'OPEN') && (document.forms[0].WEP_Selection.value != 'WPA2PSK') && (document.forms[0].WEP_Selection.value != 'WPA2PSKWPA3PSK') )
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText8","s")%>");
					return 0;
				}
				
				var TKIP_Selection_div1 = document.getElementById('WPA_div');
				var TKIP_Selection_val;
				if (TKIP_Selection_div1)
				{
						if (TKIP_Selection_div1.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection1.value;
						}
				}
				var TKIP_Selection_div2 = document.getElementById('WPA2_div');
				if (TKIP_Selection_div2)
				{
						if (TKIP_Selection_div2.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection2.value;
						}
				}
				var TKIP_Selection_div3 = document.getElementById('WPA1WPA2_div');
				if (TKIP_Selection_div3)
				{
						if (TKIP_Selection_div3.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection3.value;
						}
				}
				var TKIP_Selection_div4 = document.getElementById('WPA2PSK_div');
				if (TKIP_Selection_div4)
				{
						if (TKIP_Selection_div4.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection4.value;
						}
				}
				var TKIP_Selection_div5 = document.getElementById('WPAPSK_div');
				if (TKIP_Selection_div5)
				{
						if (TKIP_Selection_div5.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection5.value;
						}
				}
				var TKIP_Selection_div6 = document.getElementById('WPAPSKWPA2PSK_div');
				if (TKIP_Selection_div6)
				{
						if (TKIP_Selection_div6.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection6.value;
						}
				}
				var TKIP_Selection_div7 = document.getElementById('WPA2PSKWPA3PSK_div');
				if (TKIP_Selection_div7)
				{
						if (TKIP_Selection_div7.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection_WPA2WPA3.value;
						}
				}
				var TKIP_Selection_div8 = document.getElementById('WPA3PSK_div');
				if (TKIP_Selection_div8)
				{
						if (TKIP_Selection_div8.style.display != "none")
						{
								TKIP_Selection_val = document.forms[0].TKIP_Selection_WPA3.value;
						}
				}
				
				if(1 != isBackHaul && 1 != isFrontHaul && ((TKIP_Selection_val == "NONE") || (TKIP_Selection_val == "AES") || (TKIP_Selection_val == "TKIP") || (TKIP_Selection_val == "TKIPAES")))
				{
						wlwpa_check = 1;
				}
				else if( (1 == isBackHaul || 1 == isFrontHaul) && ((TKIP_Selection_val == "NONE") || (TKIP_Selection_val == "AES")))
				{
						wlwpa_check = 1;
				}
				
				if(1 != isBackHaul && 1 != isFrontHaul && (0 == wlwpa_check) && (document.forms[0].WEP_Selection.value != 'OPEN'))
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText5","s")%>");
					return 0;
				}
				else if( (1 == isBackHaul || 1 == isFrontHaul) && ((0 == wlwpa_check) || ((document.forms[0].WEP_Selection.value != 'OPEN') && (document.forms[0].WEP_Selection.value != 'WPA2PSK')&& (document.forms[0].WEP_Selection.value != 'WPAPSKWPA2PSK') && (document.forms[0].WEP_Selection.value != 'WPA3PSK')&& (document.forms[0].WEP_Selection.value != 'WPA2PSKWPA3PSK'))) )
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>");
					return 0;
				}
			}
			return 1;
	}
	
	function easymesh_checkAuthMode(wlAuthMode)
	{
		if(wlAuthMode)
		{
			for (var idx=0; idx < wlAuthMode.length; idx++) 
			{
				var tmpAuthMode = wlAuthMode.options[idx].value;
				tmpAuthMode = tmpAuthMode.toUpperCase();
				if((1 != isBackHaul) && (tmpAuthMode != 'OPEN') && (tmpAuthMode != 'WPA2PSK')&& (tmpAuthMode != 'WPAPSK')&& (tmpAuthMode != 'WPAPSKWPA2PSK') && (tmpAuthMode != 'WPA3PSK') && (tmpAuthMode != 'WPA2PSKWPA3PSK')  )
				{
					wlAuthMode.options[idx].disabled = true;
				}
				else if(( 1 == isBackHaul && 1 != isFrontHaul ) && (tmpAuthMode != 'OPEN') && (tmpAuthMode != 'WPA2PSK') && (tmpAuthMode != 'WPA3PSK') && (tmpAuthMode != 'WPA2PSKWPA3PSK') )
				{
					wlAuthMode.options[idx].disabled = true;
				}
				else if(( 1 == isFrontHaul) && (tmpAuthMode != 'OPEN') && (tmpAuthMode != 'WPA2PSK') && (tmpAuthMode != 'WPA2PSKWPA3PSK') )
				{
					wlAuthMode.options[idx].disabled = true;
				}
				else
				{
					wlAuthMode.options[idx].disabled = false;
				}
			}
		}
	}
	
	function easymesh_checkEncrType(wlEncrType)
	{
		if(wlEncrType)
		{
			for (var idx=0; idx < wlEncrType.length; idx++) 
			{
				var tmpEncrType = wlEncrType.options[idx].value;
				tmpEncrType = tmpEncrType.toUpperCase();
				if((1 != isBackHaul && 1 != isFrontHaul ) && tmpEncrType != "AES" && tmpEncrType != "TKIPAES" && tmpEncrType != "TKIP")
				{
					wlEncrType.options[idx].disabled = true;
				}
				else if((1 == isBackHaul || 1 == isFrontHaul ) && tmpEncrType != "AES")
				{
					wlEncrType.options[idx].disabled = true;
				}
				else
				{
					wlEncrType.options[idx].disabled = false;
				}
			}
		}
	}
	
	function easymesh_onload()
	{
		var wl_authMode="", wl_encrypType = "";
		var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
		var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
		var bss_gl_al_mac = "";
		var bss_gl_fh_support = 0, bss_gl_bh_support = 0;
		var SSID1_Enabel = "<% tcWebApi_get("Wlan11ac_Entry0","EnableSSID","s") %>";
		
	<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "1" then %>
		var node_idx = document.ConfigForm.SSID_INDEX.value;
	<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "2" then %>
		var node_idx = document.ConfigForm.SSID_INDEX1.value;
	<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "3" then %>
		var node_idx = document.ConfigForm.SSID_INDEX2.value;
	<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "4" then %>
		var node_idx = document.ConfigForm.SSID_INDEX3.value;
	<% else %>
		<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "5" then %>
		var node_idx = document.ConfigForm.SSID_INDEX4.value;
		<% end if %>
		<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "6" then %>
		var node_idx = document.ConfigForm.SSID_INDEX5.value;
		<% end if %>
		<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "7" then %>
		var node_idx = document.ConfigForm.SSID_INDEX6.value;
		<% end if %>
		<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "8" then %>
		var node_idx = document.ConfigForm.SSID_INDEX7.value;
		<% end if %>
	<% end if %>
		node_idx = parseInt(node_idx) + 1;
		isMeshBssCfg = 0;
		document.getElementById('div_mesh_check_msg').style.display = 'none';
	
		if(mapDevRole != 1 && mapDevRole != 2)
		{
				console.log("EasyMesh Device Role is neither Controller nor Agent!");
				return;
		}
		bss_gl_al_mac = "<% tcWebApi_get("Mesh_radio5glbssinfo","AL-MAC","s") %>";
		
		switch(node_idx)
		{
				case 1:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 2:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 3:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 4:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 5:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 6:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 7:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 8:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 9:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry8","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry8","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 10:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry9","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry9","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 11:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry10","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry10","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 12:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry11","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry11","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 13:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry12","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry12","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 14:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry13","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry13","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 15:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry14","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry14","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				case 16	:
					bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry15","FrontHaul","s") %>";
					bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry15","BackHaul","s") %>";
					wl_authMode = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";
					wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
					break;
				default:
					bss_gl_al_mac = "";
					bss_gl_fh_support = 0;
					bss_gl_bh_support = 0;
					wl_authMode = "";
					wl_encrypType = "";
					break;
		}
		al_mac = al_mac.toUpperCase();
		bss_gl_al_mac = bss_gl_al_mac.toUpperCase();
		if((al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
		|| (bss_gl_al_mac == null) || (bss_gl_al_mac == "N/A") || (bss_gl_al_mac == "") || (bss_gl_al_mac == "00:00:00:00:00:00"))
		{
				return;
		}
		
		if( ((bss_gl_al_mac == al_mac) || (bss_gl_al_mac == "FF:FF:FF:FF:FF:FF")) 
				&& ((1 == bss_gl_fh_support) || (1 == bss_gl_bh_support)) && ((SSID1_Enabel == "1") || (node_idx != "1")) )
		{
				easymesh_checkAuthMode(document.forms[0].WEP_Selection);
				
				easymesh_checkEncrType(document.forms[0].TKIP_Selection1);
				easymesh_checkEncrType(document.forms[0].TKIP_Selection2);
				easymesh_checkEncrType(document.forms[0].TKIP_Selection3);
				easymesh_checkEncrType(document.forms[0].TKIP_Selection4);
				easymesh_checkEncrType(document.forms[0].TKIP_Selection5);
				easymesh_checkEncrType(document.forms[0].TKIP_Selection6);
				
				if( (1 == bss_gl_fh_support)&& (wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK") && (wl_authMode.toUpperCase() != "WPA2PSKWPA3PSK") )
				{
						alert("When EasyMesh Enable, AutoMode must be \"OPEN\" or \"WPA2PSK\" or \"WPA2PSKWPA3PSK\" !");
				} 
				if( (1 == bss_gl_bh_support)&& (1 != bss_gl_fh_support)&& (wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK")&& (wl_authMode.toUpperCase() != "WPA3PSK") && (wl_authMode.toUpperCase() != "WPA2PSKWPA3PSK") )
				{
						alert("When EasyMesh Enable, AutoMode must be \"OPEN\" or \"WPA2PSK\" or \"WPA3PSK\" or \"WPA2PSKWPA3PSK\"!");
				} 
				if(wl_authMode.toUpperCase() != "OPEN")
				{
						if((wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
						{
							alert("When EasyMesh Enable, Encryption Type must be \"NONE\" or \"AES\"!");
						}
				}
		}
		
		isMeshBssCfg = 1;
		document.getElementById('div_mesh_check_msg').style.display = '';
		return;
	}
	<% end if %>
	
	
	<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
			var oldwpsTimerRunningData = "<% tcWebApi_getbywifiid("Info_WLan11ac","wlanWPStimerRunning_","wlan_ac_id") %>";
			var oldwlanWPSStatus = "<% tcWebApi_getbywifiid("Info_WLan11ac", "wlanWPSStatus_", "wlan_ac_id") %>";		
	<% end if %>
	
	
	function CongigureClass()
	{
		this.WPSConfStatus = '<% tcWebApi_get("WLan11ac_Entry","WPSConfStatus","s")%>';
	}
	var Configure = new CongigureClass();
	
	function doCheckWepSelectIndex()
	{
	<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex + 1;
	<% else %>
			WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex;
	<% end if %>
		return true;	
	}
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	function doStartWPS(){
		if((document.ConfigForm.WPSMode_Selection[0].checked)&&(document.ConfigForm.isInWPSing.value==0))
		{
			var pincode = document.ConfigForm.WPSEnrolleePINCode;
			var len = pincode.value.length;
			if(doPINCodeCheck(pincode) == false)
			{
				return ;
			}
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") <> "1"  then %>
	<% if tcWebApi_get("WLan11ac_Entry", "WPSConfStatus", "h") = "2" then %>
			if(len <= 0)
			{
			  alert("WPS PIN code couldn't be null!");
				return;
			}
	<% end if %>
	<% end if %>
		}
		if(document.ConfigForm.isInWPSing.value==0){
			alert("Please Start WPS peer within 2 minutes.");
		}
		document.ConfigForm.WpsStart.value = 1;
		if( true == setEBooValueCookie(document.ConfigForm) )
	<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
		top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
	<% end if %>
			document.ConfigForm.submit();
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
	
	function doGenerate(){
		document.ConfigForm.WpsGenerate.value = "1";
		if( true == setEBooValueCookie(document.ConfigForm) )
			document.ConfigForm.submit();
	}
	<% end if %>
	
	function strESSIDCheck(str) {
		if(str.value.match(/[^\x00-\xff]/g)){
			alert("Invalid SSID Input!");
			return true;
		}
		if(document.ConfigForm.ESSID.value.length <= 0){
			alert("SSID is empty");
			return true;
		}
	
		return false;
	}	
	
	function LoadSsidIdxList()
	{
		var ssidNum = 0;
		<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
		var WlanIndex = "<% tcWebApi_get("WebCurSet_Entry", "wlan_ac_id", "s") %>";
		var ssidselsectFlag = 0;
		var ssidindex = 1;
		var ssid1 = "<% tcWebApi_get("WLan11ac_Entry0", "EnableSSID", "s") %>";
		var ssid2 = "<% tcWebApi_get("WLan11ac_Entry1", "EnableSSID", "s") %>";
		var ssid3 = "<% tcWebApi_get("WLan11ac_Entry2", "EnableSSID", "s") %>";
		var ssid4 = "<% tcWebApi_get("WLan11ac_Entry3", "EnableSSID", "s") %>";
		<% if tcwebApi_get("WebCustom_Entry", "isMultiUserITFSupported", "h") = "Yes" then %>
		var ssid5 = "<% tcWebApi_get("WLan11ac_Entry4", "EnableSSID", "s") %>";
		var ssid6 = "<% tcWebApi_get("WLan11ac_Entry5", "EnableSSID", "s") %>";
		var ssid7 = "<% tcWebApi_get("WLan11ac_Entry6", "EnableSSID", "s") %>";
		var ssid8 = "<% tcWebApi_get("WLan11ac_Entry7", "EnableSSID", "s") %>";
		<% end if %>
		<% end if %>
		
		ssidNum = <% tcWebApi_get("WLan11ac_Common", "BssidNum", "s") %>;
		<% if tcwebApi_get("WebCustom_Entry", "isCTPONCZNXSupported", "h") = "Yes" then %>
		<% if tcwebApi_get("WebCurSet_Entry", "CurrentAccess", "h") <> "0" then %>
		if ( (ssidNum > "1") && (ssidNum <= "8") )
		{
			ssidNum = '1';//only can edit and query 0 index of ssid for second user.
		}
		<% end if %>
		<% end if %>
		document.ConfigForm.SSID_INDEX.options.length = 0;
		document.ConfigForm.SSID_INDEX[0] = new Option("SSID1", "0");
		<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
		if ( ssidNum > "1" )
		{
			if ( (ssid2 == "0") || (ssid2 == "1") )
			{
				document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID2", "1");
				ssidindex++;
			}
			<% if tcwebApi_get("WebCustom_Entry", "isCTPONOnlyTwoSSIDSupported", "h") <> "Yes" then %>
			if ( (ssid3 == "0") || (ssid3 == "1") )
			{
				if ( ssidNum > "2" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID3", "2");
					ssidindex++;
				}
			}
			if ( (ssid4 == "0") || (ssid4 == "1") )
			{
				if ( ssidNum > "3" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID4", "3");
					ssidindex++;
				}
			}
			<% if tcwebApi_get("WebCustom_Entry", "isMultiUserITFSupported", "h") = "Yes" then %>
			if ( (ssid5 == "0") || (ssid5 == "1") )
			{
				if ( ssidNum > "4" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID5", "4");
					ssidindex++;
				}
			}
			if ( (ssid6 == "0") || (ssid6 == "1") )
			{
				if ( ssidNum > "5" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID6", "5");
					ssidindex++;
				}
			}
			if ( (ssid7 == "0") || (ssid7 == "1") )
			{
				if ( ssidNum > "6" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID7", "6");
					ssidindex++;
				}
			}
			if ( (ssid8 == "0") || (ssid8 == "1") )
			{
				if ( ssidNum > "7" )
				{
					document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID8", "7");
					ssidindex++;
				}
			}
			<% end if %>
			<% end if %>
		}
		<% else %>
		for ( var i = 1; i < ssidNum; i++ )
		{
			var ssidName = (i + 1).toString();
			document.ConfigForm.SSID_INDEX[i] = new Option(ssidName, i.toString());
		}
		<% end if %>
		<% if tcwebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
		for ( var i = 0; i < document.ConfigForm.SSID_INDEX.options.length; i++ ) 
		{
			if ( document.ConfigForm.SSID_INDEX.options[i].value == WlanIndex )
			{
				setSelect('SSID_INDEX', WlanIndex);
				ssidselsectFlag = 1;
				break;
			}
		}
		if(ssidselsectFlag != 1)
		{
			setSelect('SSID_INDEX',0);
			doSSIDChange();
		}
		<% else %>
		setSelect('SSID_INDEX', <% tcWebApi_get("WebCurSet_Entry", "wlan_ac_id", "s") %>);
		<% end if %>	
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
					wpsTimerRunningData = data.wpsTimerRunningData_5G;
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
					wlanWPSStatus = data.wlanWPSStatus_5G;
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
					document.ConfigForm.StartWPS.value = 'waiting......';				
					document.getElementById("WPSProcess").innerHTML = oldwlanWPSStatus;
					document.ConfigForm.StartWPS.disabled = "disabled";
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
							document.ConfigForm.StartWPS.value = 'Stop WPS';
							break;
						default:
							document.ConfigForm.StartWPS.value = 'Start WPS';
							break;
					}
					document.ConfigForm.StartWPS.disabled = "";
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
						document.ConfigForm.StartWPS.value = 'Stop WPS';
						break;
					default:
						document.ConfigForm.StartWPS.value = 'Start WPS';
						break;
				}			
				document.ConfigForm.StartWPS.disabled = "";
			}
		}
	}
	<% end if %>
	
	function LoadFrame()
	{
	<% if tcWebApi_get("WebCustom_Entry", "isShowNumOfSsid","h") = "Yes" then %>
		LoadSsidIdxList();
	<% end if %>
		doCheckSSID();
		doCheckWepSelectIndex();	
		RefreshChannPage();
	<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
		initWLan11ac2ndFrequencySel();	
		VHTBandwidthRefreshPage();
		if(initFlag == true)
		{
			initWLan11acTxBeamFormingSel();
			initFlag = false;
		}
	<% end if %>
		if(document.ConfigForm.isDot1XSupported.value==1)
		{
			if(document.ConfigForm.isAuthenTypeSupported.value==1)
			{
				document.getElementById("WEP_Selection_div").style.display="none";
				document.getElementById("WEP_Selection_show_div").style.display="";
				doWEPChange2();
			}
			else
			{
				document.getElementById("WEP_Selection_div").style.display="";
				document.getElementById("WEP_Selection_show_div").style.display="none";
			}
		}	
		if(document.ConfigForm.WirelessMode.selectedIndex>=1){
			document.ConfigForm.Is11nMode.value=1;
			if(document.ConfigForm.WirelessMode.selectedIndex>=2){
				document.ConfigForm.Is11acMode.value=1;
			}else{
				document.ConfigForm.Is11acMode.value=0;
			}
	<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
			if((document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1)||(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2)){
	<% else %>
			if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
	<% end if %>
				if(InsExtChOpt(document.ConfigForm.Channel_ID.value) == 1)
					document.ConfigForm.WLANExtensionChannel.selectedIndex = 1;
					else
					document.ConfigForm.WLANExtensionChannel.selectedIndex = 0;
					document.ConfigForm.WLANExtensionChannel.disabled = true;	
			}
		}else{
			document.ConfigForm.Is11nMode.value=0;
			document.ConfigForm.Is11acMode.value=0;
		}
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
		if(document.ConfigForm.isInWPSing.value==1){
			/*document.ConfigForm.ResetOOB.disabled = true;
			document.ConfigForm.BUTTON.disabled = true;
			document.ConfigForm.CancelBtn.disabled = true;*/
		}
		if(document.ConfigForm.wlan_VC.value==0){
			wpsenable = document.ConfigForm.enableWps.checked;
		}
	<% end if %>
		wepidx = WEPSelectIndex;
	
		if(document.ConfigForm.isWDSSupported.value==1)
		{
			if(document.ConfigForm.WLAN_WDS_Active[0].checked == true){	//if wds enable
				autoWLAN_WDS_Active();
			}else if(document.ConfigForm.WLAN_WDS_Active[1].checked == true){	//if wds disable
				autoWLAN_WDS_Deactive();
			}
		}
	<% if tcwebApi_get("WebCustom_Entry","isEasyMeshSupport","h") <> "Yes" then %>
		if(document.ConfigForm.WLAN_FltActive[0].checked == true){	
			autoWLAN_Flt_Active();
		}else if(document.ConfigForm.WLAN_FltActive[1].checked == true){	
			autoWLAN_Flt_Deactive();
		}
	<% end if %>	
		if(document.ConfigForm.bharti_ssid2.value==1)
			doloadSSID2();		
	<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>		
			McsRefreshPage();
	<% end if %>
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		easymesh_onload();
	<% end if %>
	<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
		getWPStimerRunning();
	<% end if %>
	<% if tcWebApi_get("WebCustom_Entry","isUBUSSupported","h") = "Yes"  then %>
			var node_index = parseInt(<% tcWebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>)  + 8 ;
			var hgwsleep = <% tcWebApi_get("Timer_Common","HGWSleep","s") %>
			var wifienablemask = <% tcWebApi_get("Timer_Common","WifiEnableMask","s") %>	
			
			if( hgwsleep == "0"  || 0 == ((wifienablemask)>>(node_index) & 1))
			{
					document.getElementById("ESSID_Enable_Selection_close").checked = true;
					document.getElementById("ESSID_Enable_Selection_open").checked= false;
			}
	<% end if %>
	}
	
	function doCheckSSID()
	{	
		var ssid_val = document.ConfigForm.wlan_VC.value;	
		var ssid_optval = document.ConfigForm.SSID_INDEX.value;	
		if(ssid_val != ssid_optval)	
		{		
			document.ConfigForm.wlanWEPFlag.value = 2;	
			if( true == setEBooValueCookie(document.ConfigForm) )	
				document.ConfigForm.submit();	
		}
	}	
	
	function doRegionCheck(){
		var vCountryName = document.ConfigForm.Countries_Channels.value;
		var ctlCountryRegionABand = document.ConfigForm.hCountryRegionABand;
		var ctlCountryRegionABand0 = document.ConfigForm.CountryRegionABand0;
		var ctlCountryRegionABand1 = document.ConfigForm.CountryRegionABand1;
		var ctlCountryRegionABand2 = document.ConfigForm.CountryRegionABand2;
		var ctlCountryRegionABand3 = document.ConfigForm.CountryRegionABand3;
		var ctlCountryRegionABand4 = document.ConfigForm.CountryRegionABand4;
		var ctlCountryRegionABand5 = document.ConfigForm.CountryRegionABand5;
		var ctlCountryRegionABand6 = document.ConfigForm.CountryRegionABand6;
		var ctlCountryRegionABand7 = document.ConfigForm.CountryRegionABand7;
		var ctlCountryRegionABand8 = document.ConfigForm.CountryRegionABand8;
		var ctlCountryRegionABand9 = document.ConfigForm.CountryRegionABand9;
		var ctlCountryRegionABand10 = document.ConfigForm.CountryRegionABand10;
		var ctlCountryRegionABand11 = document.ConfigForm.CountryRegionABand11;
		if(vCountryName == "ARGENTINA")
			ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
		else if (vCountryName == "ARMENIA")
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "AUSTRIA")
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "AZERBAIJAN")
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "BELGIUM")
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "BELIZE")
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "BOLIVIA")
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "BRAZIL")
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "BRUNEI DARUSSALAM")
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "BULGARIA")
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "CROATIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
		else if (vCountryName == "CYPRUS")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;		
		else if (vCountryName == "CZECH REPUBLIC")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
		else if (vCountryName == "DENMARK")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;	
		else if (vCountryName == "EGYPT")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "ESTONIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "FINLAND")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "FRANCE")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "GEORGIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "GERMANY")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "GREECE")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "HUNGARY")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "ICELAND")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "INDONESIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "IRAN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "IRELAND")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "ITALY")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "JAPAN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
		else if (vCountryName == "KOREA DEMOCRATIC")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
		else if (vCountryName == "KOREA REPUBLIC")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
		else if (vCountryName == "LATVIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "LITHUANIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "LUXEMBOURG")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "MONACO")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "NETHERLANDS")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "PERU")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "PHILIPPINES")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
		else if (vCountryName == "POLAND")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "PORTUGAL")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SLOVAKIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SLOVENIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SOUTH AFRICA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SPAIN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SWEDEN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "SWITZERLAND")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "TAIWAN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
		else if (vCountryName == "TRINIDAD AND TOBAGO")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "TUNISIA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "TURKEY")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
		else if (vCountryName == "UNITED KINGDOM")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "URUGUAY")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
		else if (vCountryName == "UZBEKISTAN")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
		else if (vCountryName == "VENEZUELA")			             
			ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
		else
			ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	
		RefreshChannPage();
		if(document.ConfigForm.RTDEVICE.value == "7615")
		{
			initWLan11ac2ndFrequencySel();
			VHTBandwidthRefreshPage();
		}
		document.ConfigForm.CountryChange.value = 1; 
	}
	
	var bInit = 1;
	function RefreshChannPage(){
		var index = 0;
		var ctlChannel_ID = document.ConfigForm.Channel_ID;
		var vChannel = ctlChannel_ID.value;
		var vCountryRegionABand = document.ConfigForm.hCountryRegionABand.value;
		if(bInit == 1){
			vChannel = "<% tcWebApi_get("WLan11ac_Common","Channel","s") %>";
			bInit = 0;
		}
		ctlChannel_ID.length = 0;
		if(vCountryRegionABand == 0){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
			ctlChannel_ID.options[index++] = new Option("165", "165");
		}else if(vCountryRegionABand == 1){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("100", "100");
			ctlChannel_ID.options[index++] = new Option("104", "104");
			ctlChannel_ID.options[index++] = new Option("108", "108");
			ctlChannel_ID.options[index++] = new Option("112", "112");
			ctlChannel_ID.options[index++] = new Option("116", "116");
			ctlChannel_ID.options[index++] = new Option("120", "120");
			ctlChannel_ID.options[index++] = new Option("124", "124");
			ctlChannel_ID.options[index++] = new Option("128", "128");
			ctlChannel_ID.options[index++] = new Option("132", "132");
			ctlChannel_ID.options[index++] = new Option("136", "136");
			ctlChannel_ID.options[index++] = new Option("140", "140");
		}else if(vCountryRegionABand == 2){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
		}else if(vCountryRegionABand == 3){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
		}else if(vCountryRegionABand == 4){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
			ctlChannel_ID.options[index++] = new Option("165", "165");
		}else if(vCountryRegionABand == 5){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
		}else if(vCountryRegionABand == 6){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
		}else if(vCountryRegionABand == 8){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
		}else if(vCountryRegionABand == 9){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("100", "100");
			ctlChannel_ID.options[index++] = new Option("104", "104");
			ctlChannel_ID.options[index++] = new Option("108", "108");
			ctlChannel_ID.options[index++] = new Option("112", "112");
			ctlChannel_ID.options[index++] = new Option("116", "116");
			ctlChannel_ID.options[index++] = new Option("132", "132");
			ctlChannel_ID.options[index++] = new Option("136", "136");
			ctlChannel_ID.options[index++] = new Option("140", "140");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
			ctlChannel_ID.options[index++] = new Option("165", "165");
		}else if(vCountryRegionABand == 10){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
			ctlChannel_ID.options[index++] = new Option("165", "165");
		}else if(vCountryRegionABand == 11){
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("100", "100");
			ctlChannel_ID.options[index++] = new Option("104", "104");
			ctlChannel_ID.options[index++] = new Option("108", "108");
			ctlChannel_ID.options[index++] = new Option("112", "112");
			ctlChannel_ID.options[index++] = new Option("116", "116");
			ctlChannel_ID.options[index++] = new Option("120", "120");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
		}else{
			ctlChannel_ID.options[index++] = new Option("AUTO", "0");
			ctlChannel_ID.options[index++] = new Option("36", "36");
			ctlChannel_ID.options[index++] = new Option("40", "40");
			ctlChannel_ID.options[index++] = new Option("44", "44");
			ctlChannel_ID.options[index++] = new Option("48", "48");
			ctlChannel_ID.options[index++] = new Option("52", "52");
			ctlChannel_ID.options[index++] = new Option("56", "56");
			ctlChannel_ID.options[index++] = new Option("60", "60");
			ctlChannel_ID.options[index++] = new Option("64", "64");
			ctlChannel_ID.options[index++] = new Option("100", "100");
			ctlChannel_ID.options[index++] = new Option("104", "104");
			ctlChannel_ID.options[index++] = new Option("108", "108");
			ctlChannel_ID.options[index++] = new Option("112", "112");
			ctlChannel_ID.options[index++] = new Option("116", "116");
			ctlChannel_ID.options[index++] = new Option("120", "120");
			ctlChannel_ID.options[index++] = new Option("124", "124");
			ctlChannel_ID.options[index++] = new Option("128", "128");
			ctlChannel_ID.options[index++] = new Option("132", "132");
			ctlChannel_ID.options[index++] = new Option("136", "136");
			ctlChannel_ID.options[index++] = new Option("140", "140");
			ctlChannel_ID.options[index++] = new Option("149", "149");
			ctlChannel_ID.options[index++] = new Option("153", "153");
			ctlChannel_ID.options[index++] = new Option("157", "157");
			ctlChannel_ID.options[index++] = new Option("161", "161");
			ctlChannel_ID.options[index++] = new Option("165", "165");
		}
		ctlChannel_ID.options[0].selected=true;
		SelectValue(ctlChannel_ID, vChannel);
	
		if(document.ConfigForm.Is11nMode.value == "1"){
			document.getElementById("11nMode_0_div").style.display="none";
			document.getElementById("11nMode_1_div").style.display="";
		}else{
			document.getElementById("11nMode_0_div").style.display="";
			document.getElementById("11nMode_1_div").style.display="none";
		}
	<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.ConfigForm.WLANChannelBandwidth.value == 1 ) || (document.ConfigForm.WLANChannelBandwidth.value == 2 ))
	<% else %>
		if(document.ConfigForm.WLANChannelBandwidth.value == "1")
	<% end if %>
		{
			document.getElementById("HT_BW_1_div").style.display="";
			if(document.ConfigForm.Is11acMode.value == "1"){
				document.getElementById("11acMode_1_div").style.display="";
			}else{
				document.getElementById("11acMode_1_div").style.display="none";
			}
		}else{
			document.getElementById("HT_BW_1_div").style.display="none";
			document.getElementById("11acMode_1_div").style.display="none";
		}	
		if(document.ConfigForm.isWPSSupported.value == "1")
		{
				if(document.ConfigForm.enableWps.checked == true)
					document.getElementById("WPSConfMode_1_div").style.display="";
				else
					document.getElementById("WPSConfMode_1_div").style.display="none";
		}
		var vAuthMode = document.ConfigForm.WEP_Selection.value;
		if(document.getElementById("Radius-WEP64_div") != null) 
			document.getElementById("Radius-WEP64_div").style.display="none";
		if(document.getElementById("Radius-WEP128_div") != null)
			document.getElementById("Radius-WEP128_div").style.display="none";
		if(document.getElementById("WPA_div") != null)
			document.getElementById("WPA_div").style.display="none";
		if(document.getElementById("WPA2_div") != null)
			document.getElementById("WPA2_div").style.display="none";
		if(document.getElementById("WPA1WPA2_div") != null)
			document.getElementById("WPA1WPA2_div").style.display="none";
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
		if(document.getElementById("WPA3_div") != null)
			document.getElementById("WPA3_div").style.display="none";
		if(document.getElementById("WPA3_192Bit_div") != null)
			document.getElementById("WPA3_192Bit_div").style.display="none";
	<% end if %>
	<% end if %>
			
		if(vAuthMode == "Radius-WEP64"){
			if(document.getElementById("Radius-WEP64_div") != null) 
				document.getElementById("Radius-WEP64_div").style.display="";
		}
		if(vAuthMode == "Radius-WEP128"){
			if(document.getElementById("Radius-WEP128_div") != null)
				document.getElementById("Radius-WEP128_div").style.display="";
		}
		if(vAuthMode == "WPA"){
			if(document.getElementById("WPA_div") != null)
				document.getElementById("WPA_div").style.display="";
		}
		if(vAuthMode == "WPA2"){
			if(document.getElementById("WPA2_div") != null)
				document.getElementById("WPA2_div").style.display="";
		}
		if(vAuthMode == "WPA1WPA2"){
			if(document.getElementById("WPA1WPA2_div") != null)
				document.getElementById("WPA1WPA2_div").style.display="";
		}
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
		if(vAuthMode == "WPA3"){
			if(document.getElementById("WPA3_div") != null)
				document.getElementById("WPA3_div").style.display="";
		}
		if(vAuthMode == "WPA3-192Bit"){
			if(document.getElementById("WPA3_192Bit_div") != null)
				document.getElementById("WPA3_192Bit_div").style.display="";
		}
	<% end if %>
	<% end if %>
		if(document.getElementById("WEP-64Bits_div") != null)
			document.getElementById("WEP-64Bits_div").style.display="none";
		if(document.getElementById("WEP-128Bits_div") != null)
			document.getElementById("WEP-128Bits_div").style.display="none";
		if(document.getElementById("WEP_div") != null)
			document.getElementById("WEP_div").style.display="none";
		if(document.getElementById("WPA2PSK_div") != null)
			document.getElementById("WPA2PSK_div").style.display="none";
		if(document.getElementById("WPAPSK_div") != null)
			document.getElementById("WPAPSK_div").style.display="none";
		if(document.getElementById("WPAPSKWPA2PSK_div") != null)
			document.getElementById("WPAPSKWPA2PSK_div").style.display="none";
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
			document.getElementById("WPA2PSKWPA3PSK_div").style.display="none";	
		if(document.getElementById("WPA3PSK_div") != null)
			document.getElementById("WPA3PSK_div").style.display="none";
	<% end if %>	
		if(vAuthMode == "Basic"){
			if(document.getElementById("WEP_div") != null){
				document.getElementById("WEP_div").style.display="";
				wlKeyBitChange();
			}
		}else if(vAuthMode == "WEP-64Bits"){
			if(document.getElementById("WEP-64Bits_div") != null){
				document.getElementById("WEP-64Bits_div").style.display="";
				getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter1Text","s")%>";
			}
		}else if(vAuthMode == "WEP-128Bits"){
			if(document.getElementById("WEP-128Bits_div") != null){
				document.getElementById("WEP-128Bits_div").style.display="";
				getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter2Text","s")%>";
			}
		}else if(vAuthMode == "WPA2PSK"){
			if(document.getElementById("WPA2PSK_div") != null)
				document.getElementById("WPA2PSK_div").style.display="";
		}else if(vAuthMode == "WPAPSK"){
			if(document.getElementById("WPAPSK_div") != null)
				document.getElementById("WPAPSK_div").style.display="";
		}else if(vAuthMode == "WPAPSKWPA2PSK"){
			if(document.getElementById("WPAPSKWPA2PSK_div") != null)
				document.getElementById("WPAPSKWPA2PSK_div").style.display="";	
		}
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if(vAuthMode == "WPA2PSKWPA3PSK"){
			if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
				document.getElementById("WPA2PSKWPA3PSK_div").style.display="";	
		}else if(vAuthMode == "WPA3PSK"){
			if(document.getElementById("WPA3PSK_div") != null)
				document.getElementById("WPA3PSK_div").style.display="";	
		}
	<% end if %>
		
		if(document.getElementById("else_div") != null)
			document.getElementById("else_div").style.display="none";
		if(vAuthMode == "OPEN")
			;
		else if(vAuthMode == "Basic")
			document.getElementById("else_div").style.display="none";
		else if(vAuthMode == "Radius-WEP64")
			;
		else if(vAuthMode == "Radius-WEP128")
			;
		else if(document.getElementById("else_div") != null)
			document.getElementById("else_div").style.display="";
	}
	<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
	var MCSInit = 1;
	function McsRefreshPage(){
		var rt_device = "<%tcWebApi_get("WLan11ac_Common","rt_device","s")%>";
		var index = 0;
		var WLANMCS_ID = document.ConfigForm.WLANMCS;
		var vWLANMCS = WLANMCS_ID.value;
		var ls11acmode = document.ConfigForm.Is11acMode.value;
		if(MCSInit == 1){
			vWLANMCS = "<%tcWebApi_get("WLan11ac_Entry","HT_MCS","s")%>";
			MCSInit = 0;
		}
		WLANMCS_ID.length = 0;
		WLANMCS_ID.options[index++] = new Option("0", "0");
		WLANMCS_ID.options[index++] = new Option("1", "1");
		WLANMCS_ID.options[index++] = new Option("2", "2");
		WLANMCS_ID.options[index++] = new Option("3", "3");
		WLANMCS_ID.options[index++] = new Option("4", "4");
		WLANMCS_ID.options[index++] = new Option("5", "5");
		WLANMCS_ID.options[index++] = new Option("6", "6");
		WLANMCS_ID.options[index++] = new Option("7", "7");
		if(ls11acmode == "1"){
			WLANMCS_ID.options[index++] = new Option("8", "8");
			if (document.ConfigForm.WLANChannelBandwidth.selectedIndex != 0)
			WLANMCS_ID.options[index++] = new Option("9", "9");
		}
		else if (rt_device == "7612" || rt_device == "7613" || rt_device == "7615") {
			WLANMCS_ID.options[index++] = new Option("8", "8");
			WLANMCS_ID.options[index++] = new Option("9", "9");
			WLANMCS_ID.options[index++] = new Option("10", "10");
			WLANMCS_ID.options[index++] = new Option("11", "11");
			WLANMCS_ID.options[index++] = new Option("12", "12");
			WLANMCS_ID.options[index++] = new Option("13", "13");
			WLANMCS_ID.options[index++] = new Option("14", "14");
			WLANMCS_ID.options[index++] = new Option("15", "15");
		}
		WLANMCS_ID.options[index++] = new Option("AUTO", "33");
		
		WLANMCS_ID.options[0].selected=true;
		SelectValue(WLANMCS_ID, vWLANMCS);
	}
	<% end if %>
	<% If tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" Then %>
	var VHTSec80Channel = "<% tcWebApi_get("WLan11ac_Common","VHT_Sec80_Channel","s") %>";
	var initFlag = true;
	
	function initWLan11acTxBeamFormingSel()			//init TxBeamforming sel
	{
		var ITxBfEn = "<%tcWebApi_get("WLan11ac_Common","ITxBfEn","s")%>";
		var ETxBfEnCond = "<%tcWebApi_get("WLan11ac_Common","ETxBfEnCond","s")%>";
		var ETxBfIncapable = "<%tcWebApi_get("WLan11ac_Common","ETxBfIncapable","s")%>";
		if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Both
		{
			document.ConfigForm.WLan11acTxBeamForming[0].selected = true;
		}
		else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Explicit
		{
			document.ConfigForm.WLan11acTxBeamForming[1].selected = true;
		}
		else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Implicit
		{
			document.ConfigForm.WLan11acTxBeamForming[2].selected = true;
		}
		else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Disable
		{
			document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
		}
		else
		{
			document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
		}
	}
	
	function doVHTTxBeamFormingChange()
	{
		if(document.ConfigForm.WLan11acTxBeamForming[0].selected == true)			//Both
		{
			document.ConfigForm.WLan11acITxBfEn.value = "1";
			document.ConfigForm.WLan11acETxBfEnCond.value = "1";
			document.ConfigForm.WLan11acETxBfIncapable.value = "0";
		}
		else if(document.ConfigForm.WLan11acTxBeamForming[1].selected == true)		//Explicit
		{
			document.ConfigForm.WLan11acITxBfEn.value = "0";
			document.ConfigForm.WLan11acETxBfEnCond.value = "1";
			document.ConfigForm.WLan11acETxBfIncapable.value = "0";
		}
		else if(document.ConfigForm.WLan11acTxBeamForming[2].selected == true)		//Implicit
		{
			document.ConfigForm.WLan11acITxBfEn.value = "1";
			document.ConfigForm.WLan11acETxBfEnCond.value = "0";
			document.ConfigForm.WLan11acETxBfIncapable.value = "1";
		}
		else if(document.ConfigForm.WLan11acTxBeamForming[3].selected == true)		//Disable
		{
			document.ConfigForm.WLan11acITxBfEn.value = "0";
			document.ConfigForm.WLan11acETxBfEnCond.value = "0";
			document.ConfigForm.WLan11acETxBfIncapable.value = "1";
		}
		else
		{
			document.ConfigForm.WLan11acITxBfEn.value = "0";
			document.ConfigForm.WLan11acETxBfEnCond.value = "0";
			document.ConfigForm.WLan11acETxBfIncapable.value = "1";
		}
	}
	
	function setVHTbwChannel()
	{
		document.ConfigForm.VHTSec80Channel.value = VHTSec80Channel;					
	}
	
	function initWLan11ac2ndFrequencySel()		//init 2ndFrequencyChannel sel options
	{
		document.ConfigForm.WLan11ac2ndFrequency.length = 0;
		var opts = document.ConfigForm.Channel_ID.options;
		var selindex = document.ConfigForm.Channel_ID.selectedIndex;
		var optsval = opts[selindex].value;
		var oindex = 0;
		var fcount = new Array(5);
		fcount[0] = "36~48";
		fcount[1] = "52~64";
		fcount[2] = "100~112";
		fcount[3] = "116~128";
		fcount[4] = "149~161";
		if(optsval >= 36 && optsval <= 48)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
			if(VHTSec80Channel == "52")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "100")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "116")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "149")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}		
		}
		else if(optsval >= 52 && optsval <= 64)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
			if(VHTSec80Channel == "36")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "100")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "116")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "149")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}	
		}	
		else if(optsval >= 100 && optsval <= 112)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
			if(VHTSec80Channel == "36")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "52")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "116")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "149")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}		
		}
		else if(optsval >= 116 && optsval <= 128)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
			if(VHTSec80Channel == "36")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "52")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "100")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "149")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}	
		}
		else if(optsval >= 149 && optsval <= 161)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
			if(VHTSec80Channel == "36")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "52")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "100")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "116")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}		
		}
		else if(selindex != 0)
		{
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
			document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],4);
			if(VHTSec80Channel == "36")
			{
				document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
			}
			else if(VHTSec80Channel == "52")
			{
				document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
			}
			else if(VHTSec80Channel == "100")
			{
				document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
			}
			else if(VHTSec80Channel == "116")
			{
				document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
			}
			else if(VHTSec80Channel == "149")
			{
				document.ConfigForm.WLan11ac2ndFrequency[4].selected = true;
			}	
		}
		onVHTbwChannelChange();		
	}
	
	function onVHTbwChannelChange()
	{
		var opts = document.ConfigForm.Channel_ID.options;
		var selindex = document.ConfigForm.Channel_ID.selectedIndex;
		var optsval = opts[selindex].value;
		var j = document.ConfigForm.WLan11ac2ndFrequency.selectedIndex;
		if(optsval >= 36 && optsval <= 48)
		{
			switch(j)
			{
				case 0:
					VHTSec80Channel = "52";
					break;
				case 1:
					VHTSec80Channel = "100";
					break;
				case 2:
					VHTSec80Channel = "116";
					break;
				case 3:
					VHTSec80Channel = "149";
					break;
			}
		}
		else if(optsval >= 52 && optsval <= 64)
		{
			switch(j)
			{
				case 0:
					VHTSec80Channel = "36";
					break;
				case 1:
					VHTSec80Channel = "100";
					break;
				case 2:
					VHTSec80Channel = "116";
					break;
				case 3:
					VHTSec80Channel = "149";
					break;
			}
		}		
		else if(optsval >= 100 && optsval <= 112)
		{
			switch(j)
			{
				case 0:
					VHTSec80Channel = "36";
					break;
				case 1:
					VHTSec80Channel = "52";
					break;
				case 2:
					VHTSec80Channel = "116";
					break;
				case 3:
					VHTSec80Channel = "149";
					break;
			}
		}	
		else if(optsval >= 116 && optsval <= 128)
		{				
			switch(j)
			{
				case 0:
					VHTSec80Channel = "36";
					break;
				case 1:
					VHTSec80Channel = "52";
					break;
				case 2:
					VHTSec80Channel = "100";
					break;
				case 3:
					VHTSec80Channel = "149";
					break;
			}
		}	
		else if(optsval >= 149 && optsval <= 161)
		{		
			switch(j)
			{
				case 0:
					VHTSec80Channel = "36";
					break;
				case 1:
					VHTSec80Channel = "52";
					break;
				case 2:
					VHTSec80Channel = "100";
					break;
				case 3:
					VHTSec80Channel = "116";
					break;
			}
		}
		else if(selindex != 0)
		{
			switch(j)
			{
				case 0:
					VHTSec80Channel = "36";
					break;
				case 1:
					VHTSec80Channel = "52";
					break;
				case 2:
					VHTSec80Channel = "100";
					break;
				case 3:
					VHTSec80Channel = "116";
					break;
				case 4:
					VHTSec80Channel = "149";
					break;
			}
		}	
	}	
	
	function VHTBandwidthRefreshPage()
	{
		if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 3) &&
			(document.ConfigForm.TxStream_Action.selectedIndex == 3) &&
			(document.ConfigForm.RxStream_Action.selectedIndex == 3))
		{
			if(document.ConfigForm.WLan11acVHTChannelBandwidth.options[3].selected == true && document.ConfigForm.Channel_ID.selectedIndex != 0)
			{
				document.getElementById("WLan11ac2ndFrequencyTable").style.display = "";
			}
			else
			{
				document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
			}
		}
		else
		{
			document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
		}
	}
	<% End If %>
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	function dowpscheck(){				//modified by fred to support WPS2.0
		var wlan=document.ConfigForm;
			if(wlan.enableWps.checked == true){
	<% if tcWebApi_get("WebCustom_Entry", "isUBUSSupported", "h") = "Yes" then	%>
			var wpsswitchval =	"<% tcWebApi_get("WLan_Common", "wpsswitch", "s") %>";
			var wpsswitchval11ac =	"<% tcWebApi_get("WLan11ac_Common", "wpsswitch", "s") %>";
	
		if((wpsswitchval != 'on') && (wpsswitchval11ac != 'on'))
		{
			if(wpsenable){
						wlan.enableWps.checked = true;
			}else{
						wlan.enableWps.checked = false;
				}
			alert("<%tcWebApi_get("String_Entry","UbusWPSSwitchAlert","s")%>");
			return false ;
		}
	<% end if %>
				//check if WscV2Supported
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
				if (wlan.enableWps.checked == false){
					alert("SSID broadcast must be enabled if you want to use WPS, in other cases you need to disable WPS firstly!");
				  wlan.enableWps.checked = true;
				  return 0;
				}
				if (WEPSelectIndex != 0 && WEPSelectIndex != 2 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 7 && WEPSelectIndex != 8 && WEPSelectIndex != 9
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
						&& wlan.WEP_Selection.value != "WPA3PSK" && wlan.WEP_Selection.value != "WPA2PSKWPA3PSK"
	<% end if %>
				)
				{
					alert("The authentication type must be one of \"OPEN,WPA,WPA2,WPAPSK,WPA2PSK,WPAPSK/WPA2PSK\" if you want to use WPS, in other cases you need to disable WPS firstly!");
					wlan.WEP_Selection.selectedIndex = wepidx;	
					if(wpsenable)
					{
						wlan.enableWps.checked = true;
					}else{
						wlan.enableWps.checked = false;
					}
						return 0;
				}
				if(((WEPSelectIndex == 2) && (wlan.TKIP_Selection5.value== "TKIP"))||((WEPSelectIndex==3) && (wlan.TKIP_Selection4.value== "TKIP"))|| ((WEPSelectIndex==4) && (wlan.TKIP_Selection6.value== "TKIP")))
				{
					//WPAPSK ,WPA2PSK and WPAPSKWPA2PSK with TKIP	
					alert("Encryption type must not be TKIP if you want to use WPS, in other cases you need to disable WPS firstly!");
					wlan.enableWps.checked = false;
					return 0;
				}
				else if(((WEPSelectIndex == 7) && (wlan.TKIP_Selection1.value== "TKIP"))||((WEPSelectIndex==8) && (wlan.TKIP_Selection2.value== "TKIP"))|| ((WEPSelectIndex==9) && (wlan.TKIP_Selection3.value== "TKIP")))
				{	
					//WPA, WPA2 and WPAWPA2 with TKIP
					alert("Encryption type must not be TKIP if you want to use WPS, in other cases you need to disable WPS firstly!");
					wlan.enableWps.checked = false;
					return 0;
				}
		
				return 1;
	<% end if %>
			//do simple check if only WPS 1.0 supported, use original check code in 1.0
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") <> "1"  then %>
			if(wlan.WEP_Selection.value == "WEP-64Bits" || wlan.WEP_Selection.value == "WEP-128Bits"
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					|| wlan.WEP_Selection.value == "WPA3PSK"
	<% end if %>	
			){
				alert("We should not use WEP or wpa3 when WPS function turned on!");
				if(wpsenable){
					wlan.enableWps.checked = true;
				}else{
					wlan.enableWps.checked = false;
				}
				return 0;
			}else{
				return 1;
			}
	<% end if %>
			}
			else{
				return 1;
			}
	}
	<%  end if %>
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	function doBroadcastSSIDChange(){
		if(document.ConfigForm.wlHide.checked)
			document.ConfigForm.ESSID_HIDE_Selection.value = 1;
		else
			document.ConfigForm.ESSID_HIDE_Selection.value = 0;
		
		//check if WscV2Supported
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
		var wlan=document.ConfigForm;
		if((wlan.SSID_INDEX.value==0) && (wlan.enableWps.checked == true) && (wlan.ESSID_HIDE_Selection.value == 1))
		{
				var rv = confirm("WPS will be disabled!");
				if (rv == false)
				{
					wlan.wlHide.checked = false;
					wlan.ESSID_HIDE_Selection.value = 0;
				}
				else
				{
					wlan.wlHide.checked = true;
					wlan.ESSID_HIDE_Selection.value = 1;
					wlan.enableWps.checked = false;
				}
				if(wlan.enableWps.checked)
					document.ConfigForm.UseWPS_Selection.value = 1;
				else
					document.ConfigForm.UseWPS_Selection.value = 0;
		}
	  LoadFrame();
	<% end if %>
		
		return 1;	
	}
}
	
	function doEncryptionChange(object){
		//check if WscV2Supported
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
		var wlan=document.ConfigForm;	
		if((wlan.SSID_INDEX.value==0) && (wlan.enableWps.checked == true) && (object.value == "TKIP"))
		{
			var rv = confirm("WPS will be disabled!");
			if (rv == false)
			{
				object.value="AES";
			}
			else
			{
				object.value = "TKIP";
				wlan.enableWps.checked = false;
				document.ConfigForm.UseWPS_Selection.value = "0";
			}
		}
		LoadFrame();
	<% end if %>
	
		return 1;
	}
	<% end if %>
	
	function doWEPChange(){
		doCheckWepSelectIndex();
		var wlan=document.ConfigForm;	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
		if(document.ConfigForm.WEPSelectIndex == 1)
		{
			if(document.ConfigForm.wlKeyBit.value == '64')
				document.ConfigForm.WEP_Selection_val.value = 'WEP-64Bits';
			else
				document.ConfigForm.WEP_Selection_val.value = 'WEP-128Bits';
		}
		
		if((wlan.SSID_INDEX.value==0) && (wlan.enableWps.checked == true) && (WEPSelectIndex != 0 && WEPSelectIndex != 2 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 7 && WEPSelectIndex != 8 && WEPSelectIndex != 9
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
						&& wlan.WEP_Selection.value != "WPA3PSK" && wlan.WEP_Selection.value != "WPA2PSKWPA3PSK"
	<% end if %>
		))
		{
			var rv = confirm("WPS will be disabled!");
			if (rv == false)
			{
				wlan.WEP_Selection.selectedIndex = wepidx;
			}
			else
			{
				wlan.enableWps.checked = false;
				document.ConfigForm.UseWPS_Selection.value = "0";
			}			
		}
	<% end if %>
	
		//do simple check if only WPS 1.0 supported, use original check code in 1.0
	<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") <> "1"  then %>
		if (wlan.enableWps.checked == true){
			if(wlan.WEP_Selection.value == "WEP-64Bits" || wlan.WEP_Selection.value == "WEP-128Bits"
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					|| wlan.WEP_Selection.value == "WPA3PSK"
	<% end if %>	
			){
				alert("We should not use WEP or wpa3 when WPS function turned on!");
				wlan.WEP_Selection.selectedIndex = wepidx;
			}
		}
	<% end if %>
	<% end if %>	
		if(WEPSelectIndex == 0)
		{
			var rv = confirm("Your network will be set to OPEN without security setting, we strongly suggest you choose WPAPSK or WPA2PSK encryption!!");
			if (rv == false)
			{
				wlan.WEP_Selection.selectedIndex = wepidx;
			}
		}
		wlan.wlanWEPFlag.value = 1;
	
		document.ConfigForm.WEP_Selection_val.value = document.ConfigForm.WEP_Selection.value;
		if((1 == isBackHaul || 1 == isFrontHaul) && wlan.WEP_Selection.value != "OPEN")
		{
			document.ConfigForm.TKIP_Selection4.selectedIndex = 1;
		}
		LoadFrame();
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
	
	function doWEPChange2(){
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
		if(dowpscheck()){
	<% end if %>
			document.ConfigForm.wlanWEPFlag.value = 1;
			if(WEPSelectIndex != 8){
	<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
				document.ConfigForm.WEP_Selection.selectedIndex = 8;
	<% else %>
				document.ConfigForm.WEP_Selection.selectedIndex = 8;
	<% end if %>
				if( true == setEBooValueCookie(document.ConfigForm) )
					document.ConfigForm.submit();
			}
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
		}
	<% end if %>
	}
	
	function doWDSEncrypTypeChange(){
			document.ConfigForm.wlanWEPFlag.value = 4;
	}
	
	function doSSIDChange(){
		document.ConfigForm.wlanWEPFlag.value = 2;
		if( true == setEBooValueCookie(document.ConfigForm) )
			document.ConfigForm.submit();
	}
	
	function doExtChaLockChange() {
		if(document.ConfigForm.WirelessMode.selectedIndex >= 1){
			if(document.ConfigForm.RTDEVICE.value == "7615")
			{
				initWLan11ac2ndFrequencySel();
				VHTBandwidthRefreshPage();
			}
	<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
			if((document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1)||(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2)){
	<% else %>
			if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
	<% end if %>
				document.ConfigForm.wlanWEPFlag.value = 1;
				LoadFrame();
			}
		}
	}
	
	function doWirelessModeChange(){
		document.ConfigForm.wlanWEPFlag.value = 1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=1){
			document.ConfigForm.Is11nMode.value=1;
			if(document.ConfigForm.WirelessMode.selectedIndex>=2){
				document.ConfigForm.Is11acMode.value=1;
			}else{
				document.ConfigForm.Is11acMode.value=0;	
			}
		}else{
			document.ConfigForm.Is11nMode.value=0;
			document.ConfigForm.Is11acMode.value=0;
		}
		LoadFrame();
	}
	
	function doVHTBandwidthChange(){
		document.ConfigForm.wlanWEPFlag.value = 1;
		LoadFrame();
	}
	
	function doChannelBandwidthChange(){
		document.ConfigForm.wlanWEPFlag.value = 1;
		LoadFrame();
	}
	
	function doExtChannChange(){
		if(document.ConfigForm.WLANExtensionChannel.selectedIndex==0){
			document.ConfigForm.ExtChannFlag.value = 0;
		}else{
			document.ConfigForm.ExtChannFlag.value = 1;
		}
	}
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	function wpsvalueChange()
	{
		if(document.ConfigForm.enableWps.checked)
			document.ConfigForm.UseWPS_Selection.value = 1;
		else
			document.ConfigForm.UseWPS_Selection.value = 0;
	}
	
	function doWPSUseChange(){
		if(dowpscheck()){
			document.ConfigForm.wlanWEPFlag.value = 1;
			RefreshChannPage();
			LoadFrame();
		}
	}
	
	function doWPSModeChange(){
		document.ConfigForm.wlanWEPFlag.value = 1;
		if( true == setEBooValueCookie(document.ConfigForm) )
			document.ConfigForm.submit();
	}
	<% end if %>
	
	function wpapskCheck(object) {
		var keyvalue=object.value;
		var wpapsklen=object.value.length;
		 if(wpapsklen >= 8 && wpapsklen < 64){
		  if(keyvalue.match(/[^\x00-\xff]/g))
		   {
				alert("Pre-Shared Key should be between 8 and 63 ASCII characters or 64 Hex string.");
				return true;
		   }
		}else if(wpapsklen==64){
			for(i=0;i<64;i++){
				var c=keyvalue.charAt(i);
				if(doHexCheck(c)<0){
					alert("Pre-Shared Key Hex value error!");
					return true;
				}
			}
		}else {
		alert("Pre-Shared Key length error!");
			return true;
		}			
		return false;
	}
	
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
	
	function doWEPTypeChange(){
	
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
	
	function doNonSympolCheck(c)
	{
		if ((c >= "0")&&(c <= "9"))
		{
			return 1;
		}
		else if ((c >= "A")&&(c <= "Z"))
		{
			return 1;
		}
		else if ((c >= "a")&&(c <= "z"))
		{
			return 1;
		}
	
	  return -1;
	}
	
	function doKEYcheck(object)
	{
		var index = object.value.indexOf("0x");
		len=object.value.length;
		
		if(len == 0){
			return true;
		}
	
		if(WEPSelectIndex==1 && document.ConfigForm.wlKeyBit.value == '64')
		{
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
							return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		else if(WEPSelectIndex==1 && document.ConfigForm.wlKeyBit.value == '128')
		{
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		if(document.ConfigForm.isDot1XSupported.value==1)
		{
			if(WEPSelectIndex==5)
			{
				if(len==5)/*wep 64*/
				{
					return true;
				}
				else if(len==10)/*wep 64*/
				{
					for(i=0;i<len;i++)
					{
						var c = object.value.charAt(i);	
						if(doHexCheck(c)==-1)
						{
							alert("Invalid Key Value");
							return false;
						}
					}
				}
				else
				{
					alert("Invalid Key Value");
					return false;
				}
			}
			else if(WEPSelectIndex==6)
			{
				if(len==13)/*wep 128*/
				{
					return true;
				}
				else if(len==26)/*wep 128*/
				{
					for(i=0;i<len;i++)
					{
						var c = object.value.charAt(i);	
						if(doHexCheck(c)==-1)
						{
							alert("nvalid Key Value");
							return false;
						}
					}
				}
				else
				{
					alert("nvalid Key Value");
					return false;
				}
			}
		}
		return true;
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
	
	function checkBeacon(value) 
	{
	  if (!isNumeric(value)) {
		alert("Non-integer value given" + value);    
		return true;
	  }
	  if (value < 20 || value > 1000) {
		alert("Beacon value must be between 20 and 1000");    
		return true;  	
	  }
	  return false;
	}
	
	function checkRTS(value) 
	{
	  if (!isNumeric(value)) {
		alert("Non-integer value given" + value);    
		return true;
	  }
	  if (value < 1500 || value > 2347) {
		alert("RTS Threshold value must be between 1500 and 2347");    
		return true;  	
	  }
	  return false;
	}
	
	function checkFrag(value) 
	{
	  if (!isNumeric(value)) {
		alert("Non-integer value given" + value);    
		return true;
	  }
	  if (value < 256 || value > 2346) {
		alert("Fragmentation Threshold value must be between 256 and 2346");    
		return true;  	
	  }
	  if (value % 2) {
		alert("Fragmentation Threshold value must be an even number");    
		return true;  	
	  }
	  return false;
	}
	
	function checkDTIM(value) 
	{
	  if (!isNumeric(value)) {
		alert("Non-integer value given" + value);    
		return true;
	  }
	  if (value < 1 || value > 255) {
		alert("DTIM value must be between 1 and 255");		
		return true;
		}	
		return false;
	}
	
	<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
	function checkStationNum(value, limit) 
	{
		if (!isNumeric(value) || parseInt(value,10) < 0 || parseInt(value,10) > parseInt(limit,10)){
		alert("Station Number value must be between 0 and " + limit);
			return true;
		}	
		return false;
	}
	<% End If %>
	
	function checkRekeyinteral(value, flag) 
	{
		if (!isNumeric(value)) {
			if(flag == 1){
				alert("WPA Group Rekey Interval : Non-integer value given"); 
			}else{
				alert("Key Renewal Interval : Non-integer value given");
			}
			return true;
		}
		if (value < 10 || value > 4194303) {
			if(flag == 1){
				alert("WPA Group Rekey Interval must be between 10 and 4194303");
			}else{
				alert("Key Renewal Interval must be between 10 and 4194303");
			}	
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
	
	function ValidateChecksum(PIN)
	{
		var accum = 0;
		accum += 3 * (((PIN - PIN % 10000000) / 10000000) % 10);
		accum += 1 * (((PIN - PIN % 1000000) / 1000000) % 10);
		accum += 3 * (((PIN - PIN % 100000) / 100000) % 10);
		accum += 1 * (((PIN - PIN % 10000) / 10000) % 10);
		accum += 3 * (((PIN - PIN % 1000) / 1000) % 10);
		accum += 1 * (((PIN - PIN % 100) / 100) % 10);
		accum += 3 * (((PIN - PIN % 10) / 10) % 10);
		accum += 1 * (((PIN - PIN % 1) / 1) % 10);
		if ((accum % 10) == 0)
			return true;
		else
			return false;
	}
	
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
	//interface for future use
	function ValidateChecksum_4(PIN)
	{
		return true;
	}
	
	function ignoreSpaces(string) {
	   var temp = "";
	   string = '' + string;
	   splitstring = string.split(" ");
	   for(i = 0; i < splitstring.length; i++)
		   temp += splitstring[i];
	   return temp;
	}
	
	function ignoreDash(string) {
	   var temp = "";
	   string = '' + string;
	   splitstring = string.split("-");
	   for(i = 0; i < splitstring.length; i++)
		   temp += splitstring[i];
	   return temp;
	}
	<% end if %>
	
	function doPINCodeCheck(object)
	{
		var len= object.value.length;
		var ch;
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
		if(len==9)
		{
			acutal_value=0;
			ch_4= object.value.charAt(4);
			if( ch_4 != ' ' & ch_4  != '-')
			{
					alert("WPS PIN code format error!");
					return false;
			}
			object.value = ignoreSpaces(object.value);
			object.value = ignoreDash(object.value);
			
			if (ValidateChecksum(Number(object.value)) == false)
			{
				alert("WPS PIN code checksum error!");
				return false;
			}
			return true;
		}
	
		if(len==8)
		{
			for( i=0; i < len; i++)
			{
				ch= object.value.charAt(i);
				if( ch > '9' || ch < '0')
				{
					alert("WPS PIN code must be 8 digits!");
					return false;
				}
			}
			if (ValidateChecksum(Number(object.value)) == false){
				alert("WPS PIN code checksum error!");
				return false;		
			}
			return true;
		}
	
		if(len==4)
		{
			for( i=0; i < len; i++)
			{
				ch= object.value.charAt(i);
				if( ch > '9' || ch < '0')
				{
					alert("WPS PIN code must be 8 digits!");
					return false;
				}
			}
			if (ValidateChecksum_4(Number(object.value)) == false)
			{
				alert("WPS PIN code checksum error!>");
				return false;
			}
			return true;
		}
	
		if(len==0)
		{
			return true;
		}
	
		alert("WPS PIN code format error!");
		return false;
	<% end if %>
	
	<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") <> "1"  then %>
		if (len > 0)
		{
			if(len < 8)
			{
				alert("WPS PIN code must be 8 digits!");
				return false;
			}
			for( i=0; i < len; i++)
			{
				ch= object.value.charAt(i);
				if( ch > '9' || ch < '0')
				{
					alert("WPS PIN code must be 8 digits!");
					return false;
				}
			}
			if (ValidateChecksum(Number(object.value)) == false)
			{
				alert("WPS PIN code checksum error!");
				return false;
			}
			return true;
		}
	<% end if %>	
	}
	<% end if %>	
	
	function doSave(){
		SetCtlValue();
	<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
		if(document.ConfigForm.SSID_INDEX.value==0){
		if(document.ConfigForm.WPSMode_Selection[0].checked)
		{
				var pincode = document.ConfigForm.WPSEnrolleePINCode;
				if((doPINCodeCheck(pincode) == false))
				{
				  return false;
				}
		 }
		}
	<% end if %>
	<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then %>
		if(0 == WEPSelectIndex)	
		{
			return false;
		}
	<% end if %>
		if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
			checkRTS(document.ConfigForm.RTSThreshold.value) ||
			checkFrag(document.ConfigForm.FragmentThreshold.value) ||
			checkDTIM(document.ConfigForm.DTIM.value)
	<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
			|| checkStationNum(document.ConfigForm.StationNum.value, document.ConfigForm.maxStaNum.value)
	<% End If %>
		){
			return false;
		}
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		if(0 == mesh_save_check())
		{
			return false;
		}
	<% end if %>
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
			if(document.ConfigForm.WEP_Selection.value == "WPA3PSK")
			{
					document.ConfigForm.hRekeyMethod.value = "TIME";
					if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA3)){
						return false;
					}
			}
			if(document.ConfigForm.WEP_Selection.value == "WPA2PSKWPA3PSK")
			{
					document.ConfigForm.hRekeyMethod.value = "TIME";
					if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA2WPA3)){
						return false;
					}
			}
	<% end if %>
		if(WEPSelectIndex == 3){ 
			document.ConfigForm.hRekeyMethod.value = "TIME";
			if (wpapskCheck(document.ConfigForm.PreSharedKey2)){
				return false;
			}
			
			if(quotationCheck(document.ConfigForm.PreSharedKey2, 385) ){
				return false;	 
			}
			if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval2.value, 0)){
				return false;
			}  			
		}
	
		if(WEPSelectIndex == 4){
			document.ConfigForm.hRekeyMethod.value = "TIME";
			if (wpapskCheck(document.ConfigForm.PreSharedKey1)){
				return false;
			}
			
			if(quotationCheck(document.ConfigForm.PreSharedKey1, 385) ){
				return false;	 
			}
			if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval1.value, 0)){
				return false;
			}  			
		}
	
		if(WEPSelectIndex == 5){
			document.ConfigForm.hRekeyMethod.value = "TIME";
			if (wpapskCheck(document.ConfigForm.PreSharedKey3)){
				return false;
			}
			
			if(quotationCheck(document.ConfigForm.PreSharedKey3, 385) ){
				return false;	 
			}
			if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval3.value, 0)){
				return false;
			}  			
		}
	/* 
		if(WEPSelectIndex == 1){ 
			document.ConfigForm.hRekeyMethod.value = "DISABLE";
			if((!doKEYcheck(document.ConfigForm.WEP_Key13))||
			(!doKEYcheck(document.ConfigForm.WEP_Key23))||
			(!doKEYcheck(document.ConfigForm.WEP_Key33))||
			(!doKEYcheck(document.ConfigForm.WEP_Key43))){
				return false;
			}
			
				
			if(document.ConfigForm.WEP_Selection.value == 'Basic')
			{
				if(document.ConfigForm.wlKeyBit.value == '128')
					document.ConfigForm.WEP_Selection_val.value = 'WEP-128Bits';
				else
					document.ConfigForm.WEP_Selection_val.value = 'WEP-64Bits';
			}
		}
		
	*/
		/*
		if(WEPSelectIndex == 2){ 
			document.ConfigForm.hRekeyMethod.value = "DISABLE";
			if((!doKEYcheck(document.ConfigForm.WEP_Key14))||
			(!doKEYcheck(document.ConfigForm.WEP_Key24))||
			(!doKEYcheck(document.ConfigForm.WEP_Key34))||
			(!doKEYcheck(document.ConfigForm.WEP_Key44))){
				return false;
			}
		}
		*/
		
		if(document.ConfigForm.isDot1XSupported.value==1)
		{	
	<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			var vAuthMode = document.ConfigForm.WEP_Selection.selectedIndex + 1;
	<% else %>
			var vAuthMode = document.ConfigForm.WEP_Selection.selectedIndex;
	<% end if %>
			if((WEPSelectIndex == 5) || (WEPSelectIndex == 6) || (WEPSelectIndex == 7) || (WEPSelectIndex == 8)
			|| (WEPSelectIndex == 9)
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
			|| (WEPSelectIndex == 13) || (WEPSelectIndex == 14)
	<% end if %>
			)
			{
				if(document.ConfigForm.isDot1XEnhanceSupported.value == 0)
				{
					if(vAuthMode == 5){
						radiusip = document.ConfigForm.radiusSVR_IP1.value;
					}
					else if(vAuthMode == 6){
						radiusip = document.ConfigForm.radiusSVR_IP2.value;
					}
					else if(vAuthMode == 7){
						radiusip = document.ConfigForm.radiusSVR_IP3.value;
					}
					else if(vAuthMode == 8){
						radiusip = document.ConfigForm.radiusSVR_IP4.value;
					}
					else if(vAuthMode == 9){
						radiusip = document.ConfigForm.radiusSVR_IP5.value;
					}								
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					else if (vAuthMode == 13){
						radiusip = document.ConfigForm.WPA3_radiusSVR_IP.value;
					}
					else if (vAuthMode == 14){
						radiusip = document.ConfigForm.WPA3_192Bit_radiusSVR_IP.value;
					}
	<% end if %>						
					
				 if(inValidIPAddr(radiusip))
				 {
					return false;
				 }
				}
				//serverport
				if(vAuthMode == 5){
					radiusport = parseInt(document.ConfigForm.radiusSVR_Port1.value);
					radiuskey = document.ConfigForm.radiusSVR_Key1.value;
					session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter1.value;
				}
				else if(vAuthMode == 6){
					radiusport = parseInt(document.ConfigForm.radiusSVR_Port2.value);
					radiuskey = document.ConfigForm.radiusSVR_Key2.value;
					session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter2.value;
				}
				else if(vAuthMode == 7){
					radiusport = parseInt(document.ConfigForm.radiusSVR_Port3.value);
					radiuskey = document.ConfigForm.radiusSVR_Key3.value;
					session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter3.value;
				}
				else if(vAuthMode == 8){
					radiusport = parseInt(document.ConfigForm.radiusSVR_Port4.value);
					radiuskey = document.ConfigForm.radiusSVR_Key4.value;
					session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter4.value;
				}
				else if(vAuthMode == 9){
					radiusport = parseInt(document.ConfigForm.radiusSVR_Port5.value);
					radiuskey = document.ConfigForm.radiusSVR_Key5.value;
					session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter5.value;
				}
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
				else if (vAuthMode == 13){
					radiusport = document.ConfigForm.WPA3_radiusSVR_Port.value;
					radiuskey = document.ConfigForm.WPA3_radiusSVR_Key.value;
					session_timeout_interval = document.ConfigForm.WPA3_radiusSVR_ReAuthInter.value;
				}
				else if (vAuthMode == 14){
					radiusport = document.ConfigForm.WPA3_192Bit_radiusSVR_Port.value;
					radiuskey = document.ConfigForm.WPA3_192Bit_radiusSVR_Key.value;
					session_timeout_interval = document.ConfigForm.WPA3_192Bit_radiusSVR_ReAuthInter.value;
				}
	<% end if %>
				if(isNaN(radiusport) || radiusport < 0 || radiusport > 65535)
				{	
					alert("<%tcWebApi_get("String_Entry","RadiusServerPortTipsText","s")%>");
					return false;
				}
				
					if (radiuskey.length == 0)
					{
						alert("<%tcWebApi_get("String_Entry","RadiusShareSecretTipsText","s")%>");
						  return false; 
					}
	
				if (isNaN(session_timeout_interval) ||session_timeout_interval.length == 0)
				{
						alert("<%tcWebApi_get("String_Entry","RadiusReauthIntervalTipsText","s")%>");
						  return false; 
					}
				}
	
			if((WEPSelectIndex == 7) || (WEPSelectIndex == 8) || (WEPSelectIndex == 9)
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
			|| (WEPSelectIndex == 13) || (WEPSelectIndex == 14)
	<% end if %>
			)
			{
				if(vAuthMode == 7){
					WPARekeyInter = document.ConfigForm.WPARekeyInter3.value;
				}
				else if(vAuthMode == 8){
					WPARekeyInter = document.ConfigForm.WPARekeyInter4.value;
				}
				else if(vAuthMode == 9){
					WPARekeyInter = document.ConfigForm.WPARekeyInter5.value;
				}
	<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
				else if (vAuthMode == 13){
					WPARekeyInter = document.ConfigForm.WPA3_WPARekeyInter.value;
				}
				else if (vAuthMode == 14){
					WPARekeyInter = document.ConfigForm.WPA3_192Bit_WPARekeyInter.value;
				}
	<% end if %>
				
				if(checkRekeyinteral(WPARekeyInter, 1)){
					return false;	
				}
		   }
		}
		
		//if wds support meantime AuthMode of MAIN SSID is wpa2psk,wpapsk WPAPSKWPA2PSK , then check wds key 
		if(document.ConfigForm.isWDSSupported.value==1)
		{
			if(document.ConfigForm.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
			{
				if(document.ConfigForm.isDot1XSupported.value==1)
				{
					if((WEPSelectIndex == 2) || (WEPSelectIndex == 3) || (WEPSelectIndex == 4)
					|| (WEPSelectIndex == 7) || (WEPSelectIndex == 8) || (WEPSelectIndex == 9))
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
				else
				{
					if((WEPSelectIndex == 2) || (WEPSelectIndex == 3) || (WEPSelectIndex == 4))
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
		}
	
	
		if(quotationCheck(document.ConfigForm.ESSID, 193)||strESSIDCheck(document.ConfigForm.ESSID)){
			return;	   
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
		document.ConfigForm.wlanWEPFlag.value = 3;
		if(document.ConfigForm.WirelessMode.selectedIndex>=1){
			document.ConfigForm.Is11nMode.value=1;
			if(document.ConfigForm.WirelessMode.selectedIndex>=2){
				document.ConfigForm.Is11acMode.value=1;
			}else{
				document.ConfigForm.Is11acMode.value=0;
			}
	<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
			if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
				document.ConfigForm.Wlan_HTBW40M.value = 1;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
			}
			else if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2){
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
			}
			else{
				document.ConfigForm.WLANChannelBandwidth.value = 0;
			}
	<% end if %>	
		}else{
			document.ConfigForm.Is11nMode.value=0;
			document.ConfigForm.Is11acMode.value=0;
		}
	<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
		doVHTTxBeamFormingChange();
		if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 3) && (document.ConfigForm.WLan11acVHTChannelBandwidth.options[3].selected == true) && (document.ConfigForm.Channel_ID.selectedIndex != 0))
		{
			setVHTbwChannel();
		}
	<% end if %>
	/*
		if(!checkSelectedKEY()){
			return false;
		}
	*/
		if(!checkWepKey())
		{
			return false;
		}
		
	<% if tcWebApi_get("WebCustom_Entry", "isUBUSSupported", "h") = "Yes" then	%>
			var wifiswitchval =	"<% tcWebApi_get("WLan_Common", "wifiswitch", "s") %>";
			var wifiswitchval11ac =	"<% tcWebApi_get("WLan11ac_Common", "wifiswitch", "s") %>";
	
		if((wifiswitchval != 'on') && (wifiswitchval11ac != 'on'))
		{
			document.ConfigForm.wlan_APenable[1].checked = true;
			alert("<%tcWebApi_get("String_Entry","UbusWifiSwitchAlert","s")%>");
			return false;
		}
	<% end if %>
		if( true == setEBooValueCookie(document.ConfigForm) )
			document.ConfigForm.submit();
	}
	
	function checkKeyValue(object, button, type)
	{
		var index = object.value.indexOf("0x");
		var len = object.value.length;
		var i = 0;
		var state = button.checked;
		
		if (state && len == 0)
		{
			alert("Invalid Key Value");
			return false;
		}
		else if(len == 0)
		{
			return true;
		}
	
		if (type == 64)
		{
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
							return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		else if(type == 128)
		{
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		return true;
	}
	function checkWepKey()
	{
		var vAuthMode = document.ConfigForm.WEP_Selection.value;
		
		if (vAuthMode == "WEP-64Bits")
		{
			if (!checkKeyValue(document.ConfigForm.WEP_Key132, document.ConfigForm.DefWEPKey3_Key1, 64)
			|| !checkKeyValue(document.ConfigForm.WEP_Key232, document.ConfigForm.DefWEPKey3_Key2, 64)
			|| !checkKeyValue(document.ConfigForm.WEP_Key332, document.ConfigForm.DefWEPKey3_Key3, 64)
			|| !checkKeyValue(document.ConfigForm.WEP_Key432, document.ConfigForm.DefWEPKey3_Key4, 64))
			{
				return false;
			}		
		}
		else if (vAuthMode == "WEP-128Bits")
		{
			if (!checkKeyValue(document.ConfigForm.WEP_Key14, document.ConfigForm.DefWEPKey4_Key1, 128)
			|| !checkKeyValue(document.ConfigForm.WEP_Key24, document.ConfigForm.DefWEPKey4_Key2, 128)
			|| !checkKeyValue(document.ConfigForm.WEP_Key34, document.ConfigForm.DefWEPKey4_Key3, 128)
			|| !checkKeyValue(document.ConfigForm.WEP_Key44, document.ConfigForm.DefWEPKey4_Key4, 128))
			{
				return false;
			}	
		}
		return true;
	}
	
	function checkSelectedKEY(){
		var group;
		var curCBX;
		var i;
		var vAuthMode = document.ConfigForm.WEP_Selection.value;
		/*
		if(vAuthMode == "Radius-WEP64"){
			group = document.ConfigForm.DefWEPKey1;
		}
		else if(vAuthMode == "Radius-WEP128"){
			group = document.ConfigForm.DefWEPKey2;
		}
		*/
		if(vAuthMode == "Basic"){
			i = document.ConfigForm.wlKeyIndex.value;
			/*group = document.ConfigForm.DefWEPKey4;*/
		}
		/*
		else if(vAuthMode == "WEP-128Bits"){
			group = document.ConfigForm.DefWEPKey4;
		}*/else{
			return true;
		}
	
	/*
		for (var i=0; i<group.length; i++){
			if (group[i].checked)
			break;
		}
	*/
		/*
		if(vAuthMode == "Radius-WEP64"){
			switch (i)
			{
			case 0:
				curCBX = document.ConfigForm.WEP_Key11;
				break;
			case 1:
				curCBX = document.ConfigForm.WEP_Key21;
				break;
			case 2:
				curCBX = document.ConfigForm.WEP_Key31;
				break;
			case 3:
				curCBX = document.ConfigForm.WEP_Key41;
				break;
			default:
			  ;
			}
		}
		else if(vAuthMode == "Radius-WEP128"){
			switch (i)
			{
			case 0:
				curCBX = document.ConfigForm.WEP_Key12;
				break;
			case 1:
				curCBX = document.ConfigForm.WEP_Key22;
				break;
			case 2:
				curCBX = document.ConfigForm.WEP_Key32;
				break;
			case 3:
				curCBX = document.ConfigForm.WEP_Key42;
				break;
			default:
			  ;
			}
		}
		*/
		if(vAuthMode == "Basic"){
			switch (Number(i-1))
			{
			case 0:
				curCBX = document.ConfigForm.WEP_Key13;
				break;
			case 1:
				curCBX = document.ConfigForm.WEP_Key23;
				break;
			case 2:
				curCBX = document.ConfigForm.WEP_Key33;
				break;
			case 3:
				curCBX = document.ConfigForm.WEP_Key43;
				break;
			default:
			  ;
			}
		}
		/*
		else if(vAuthMode == "WEP-128Bits"){
			switch (i)
			{
			case 0:
				curCBX = document.ConfigForm.WEP_Key14;
				break;
			case 1:
				curCBX = document.ConfigForm.WEP_Key24;
				break;
			case 2:
				curCBX = document.ConfigForm.WEP_Key34;
				break;
			case 3:
				curCBX = document.ConfigForm.WEP_Key44;
				break;
			default:
			  ;
			}
		}
		*/
		
		len=curCBX.value.length;
		index = curCBX.value.indexOf("0x");
	
		if(WEPSelectIndex==1 && document.ConfigForm.wlKeyBit.value == '64')/*wep 64*/
		{
			if(len==5)
			{
				for(i=0;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doNonSympolCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else if(len==10)
			{
				for(i=0;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else if(len==12)
			{
				if(index==0)
				{
					for(i=2;i<len;i++)
					{
						var c = curCBX.value.charAt(i);	
						if(doHexCheck(c)==-1)
						{
							alert("Invalid Key Value");
							curCBX.focus();
							return false;
						}
					}
				}
				else
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else if(WEPSelectIndex==1 && document.ConfigForm.wlKeyBit.value == '128')/*wep 128*/
		{
			if(len==13)
			{
				for(i=0;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doNonSympolCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else if(len==26)
			{
				for(i=0;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else if(len==28)
			{
				if(index==0)
				{
					for(i=2;i<len;i++)
					{
						var c = curCBX.value.charAt(i);	
						if(doHexCheck(c)==-1)
						{
							alert("Invalid Key Value");
							curCBX.focus();
							return false;
						}
					}
				}
				else
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		return true;
	}
	
	function checkFocus(value){
		if(WEPSelectIndex == 0){
			document.ConfigForm.WEP_Selection.focus();
		}
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
	
	function InsExtChOpt(CurrCh)
	{
		var ExtChann = document.ConfigForm.ExtChannFlag;
		if ((1*CurrCh >= 36) && (1*CurrCh <= 64))
		{
				CurrCh = 1*CurrCh;
				CurrCh /= 4;
				CurrCh -= 9;
	
				ExtChann.value = HT5GExtCh[CurrCh];
		}
		else if ((1*CurrCh >= 100) && (1*CurrCh <= 136))
		{
				CurrCh = 1*CurrCh;
				CurrCh /= 4;
				CurrCh -= 17;
	
				ExtChann.value = HT5GExtCh[CurrCh];
		}
		else if ((1*CurrCh >= 149) && (1*CurrCh <= 161))
		{
				CurrCh = 1*CurrCh;
				CurrCh -= 1;
				CurrCh /= 4;
				CurrCh -= 19;
	
				ExtChann.value = HT5GExtCh[CurrCh];
		}
		else
		{
				ExtChann.value = 0;
		}
		return ExtChann.value;
	}
	
	function doloadSSID2()
	{
		if(document.ConfigForm.SSID_INDEX.selectedIndex == 1)
		{
			var j;
			var frm = document.ConfigForm;
			for(j = 0; j < frm.elements.length; j++)
			{	
				if(frm.elements[j].type != "hidden")		
					frm.elements[j].disabled = true;
			}
		}
		document.ConfigForm.SSID_INDEX.disabled = false;
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
	
	function SelectValue(o,v){
		for(var i=0; i<o.options.length; i++)
			if(o.options[i].value == v){
			o.options[i].selected=true;
			break;
		}
	}
	<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
	function doWirelessTxStreamChange(){
		var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
		var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;
	
		for(var i=0; i<length; i++)
			document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);
	
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("0/40 MHz", "0");
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
		if(document.ConfigForm.TxStream_Action.selectedIndex == 3)
		{
				document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
				document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
		}
		if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
		else
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
		VHTBandwidthRefreshPage();		
	}
	
	function doWirelessRxStreamChange(){
		var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
		var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;
	
		for(var i=0; i<length; i++)
			document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);
	
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("20/40 MHz", "0");
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
		if(document.ConfigForm.RxStream_Action.selectedIndex == 3)
		{
				document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
				document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
		}
		if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
		else
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
		VHTBandwidthRefreshPage();		
	}
	<%end if%>
	function clickAPDisable(obj){
	  var mapEnable= <% tcWebApi_get("mesh_dat","MapEnable","s") %>;
		if(mapEnable){
			alert("Please keep wifi is enable when mesh is enable.");
			document.ConfigForm.wlan_APenable[0].checked = true;
		}
	}

	</SCRIPT>

</head>
<body onload="FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload="DoUnload()">
<INPUT id=Selected_Menu type=hidden 
            value="Net->Binding"  name=Net_Bind> 
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
         <li class="scoop-hasmenu active" dropdown-icon="style1" subitem-icon="style6"><a href="sta-device.asp">
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
         <li class=" "><a href="net-wanset.asp" target="" id="net-wanset" name="net-wanset">WAN</a></li>
         <li class=" "><a href="net-binding.asp" target="" id="net-binding" name="net-binding">Binding</a></li>
         <li class=" "><a href="net-dhcp.asp" target="" id="net-dhcp" name="net-dhcp">LAN</a></li>
         <li class=" "><a href="net-wlan.asp" target="" id="net-wlan" name="net-wlan">WLAN</a></li>
         <li class=" "><a href="net-wlan11ac.asp" target="" id="net-wlan11ac" name="net-wlan11ac">WLAN5G</a></li>
         <li class=""><a href="app-VOIP.asp" target="" id="app-VoIP" name="app-VoIP">Voice Setup</a></li>
         <li class=" "><a href="net-tr069.asp" target="" id="net-tr069" name="net-tr069">CWMP</a></li>
         <li class=" "><a href="net-qos.asp" target="" id="net-qos" name="net-qos">QoS</a></li>
         <li class=" "><a href="net-time.asp" target="" id="net-time" name="net-time">Time</a></li>
         <li class=" "><a href="net-routeset.asp" target="" id="net-routeset" name="net-routeset">Route</a></li>
         <li class=" "><a href="net-bansteering.asp" target="" id="net-bandsteering" name="net-bandsteering">Bandsteering</a></li>
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
         <li class=" "><a href="sec-urlfilter.asp" target="" id="sec-urlfilter" name="sec-urlfilter">URL Filter</a></li>
         <li class=" "><a href="sec-firewall.asp" target="" id="sec-firewall" name="sec-firewall">Firewall</a></li>
         <li class=" "><a href="sec-macfilter.asp" target="" id="sec-macfilter" name="sec-macfilter">MAC Filter</a></li>
         <li class=" "><a href="sec-portfilter.asp" target="" id="sec-portfilter" name="sec-portfilter">Port Filter</a></li>
         <li class=" "><a href="sec-aclfilter.asp" target="" id="sec-aclfilter" name="sec-aclfilter">ACL Filter</a></li>
         <li class=" "><a href="sec-parental.asp" target="" id="sec-parental" name="sec-parental">Parental Control</a></li>
         </ul>
         </li> 
         <li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">
         <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> 
         <path id="Rectangle_4_copy_3" data-name="Rectangle 4 copy 3" class="cls-1" d="M36,38H2a2,2,0,0,1-2-2V2A2,2,0,0,1,2,0H36a2,2,0,0,1,2,2V36A2,2,0,0,1,36,38ZM16,3H5A2,2,0,0,0,3,5V33a2,2,0,0,0,2,2H16V3ZM35,5a2,2,0,0,0-2-2H18V18H28.586L24,13.414,25.414,12l6,6H32v0.586l0.457,0.457L32,19.5V20H31.5l-0.457.457L31,20.414l-6.043,6.043-1.414-1.414L28.586,20H18V35H33a2,2,0,0,0,2-2V5ZM12,8H6V6h6V8Zm0,6H6V12h6v2Zm0,6H6V18h6v2Zm0,6H6V24h6v2Z"></path></svg>
         <span class="scoop-mtext">APP</span></a>
         <ul class="scoop-submenu" id="APPMenu">
             <li class=" "><a href="app-ddns.asp" target="" id="app-ddns" name="app-ddns">DDNS</a></li>
             <li class=" "><a href="app-natset.asp" target="" id="app-natset" name="app-natset">Forward Rules</a></li>
             <li class=" "><a href="app-upnp.asp" target="" id="app-upnp" name="app-upnp">UPNP</a></li>
                <li class=" "><a href="app-igmpset.asp" target="" id="app-igmpset" name="app-igmpset">IGMP/MLD</a></li>
             <li class=" "><a href="app-daily.asp" target="" id="app-daily" name="app-daily">Daily APP</a></li>
             <li class=" "><a href="app-ipsecList.asp" target="" id="app-ipsecList" name="app-ipsecList">VPN</a></li>
         
             <li class=" "><a href="wifi_multi_ap_basic.asp" target="" id="wifi_multi_ap_basic" name="wifi_multi_ap_basic">EasyMesh</a></li>
         </ul>
         </li> 
         <li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">
         <svg xmlns="http://www.w3.org/2000/svg" height="512pt" viewBox="0 0 512 512" width="512pt">
             <path d="m256 271c-41.355469 0-75 33.644531-75 75s33.644531 75 75 75 75-33.644531 75-75-33.644531-75-75-75zm0 120c-24.8125 0-45-20.1875-45-45s20.1875-45 45-45 45 20.1875 45 45-20.1875 45-45 45zm0 0"></path>
             <path d="m202.285156 0h-202.285156v451h127.652344l43.496094 43.492188 26.675781-26.679688c4.292969 2.058594 8.691406 3.886719 13.175781 5.476562v38.710938h90v-38.710938c4.484375-1.589843 8.878906-3.417968 13.175781-5.476562l26.675781 26.679688 43.492188-43.492188h127.65625v-390h-249.714844zm138.566406 452.066406-21.546874-21.550781c-6.679688 3.5625-17.804688 12.191406-37.058594 17.164063l-11.246094 2.90625v31.414062h-30v-31.414062l-11.246094-2.90625c-19.238281-4.96875-30.152344-13.480469-37.058594-17.164063l-21.546874 21.550781-21.214844-21.214844 21.550781-21.546874c-3.683594-6.902344-12.191406-17.808594-17.164063-37.058594l-2.90625-11.246094h-30.414062v-30h30.414062l2.90625-11.246094c4.96875-19.238281 13.480469-30.152344 17.164063-37.058594l-21.550781-21.546874 21.214844-21.214844 21.546874 21.550781c6.679688-3.5625 17.804688-12.191406 37.058594-17.164063l11.246094-2.90625v-30.414062h30v30.414062l11.246094 2.90625c19.238281 4.96875 30.191406 13.5 37.058594 17.164063l21.546874-21.550781 21.214844 21.214844-21.550781 21.550781c3.695313 6.921875 12.195313 17.804687 17.164063 37.054687l2.90625 11.246094h30.414062v30h-30.414062l-2.90625 11.25c-4.964844 19.234375-13.476563 30.148438-17.164063 37.054688l21.550781 21.550781zm53.789063-31.066406-16.828125-16.824219c2.058594-4.296875 3.886719-8.691406 5.472656-13.175781h37.714844v-90h-37.714844c-1.585937-4.480469-3.414062-8.878906-5.472656-13.175781l26.679688-26.675781-63.640626-63.640626-26.679687 26.679688c-4.292969-2.058594-8.6875-3.886719-13.171875-5.476562v-37.710938h-90v37.710938c-4.484375 1.589843-8.882812 3.417968-13.175781 5.476562l-26.679688-26.679688-63.636719 63.640626 26.675782 26.675781c-2.054688 4.292969-3.882813 8.691406-5.472656 13.175781h-37.710938v90h37.710938c1.589843 4.480469 3.417968 8.878906 5.476562 13.175781l-16.828125 16.824219h-87.359375v-270h452v270zm87.359375-300h-452v-91h159.714844l60 61h232.285156zm0 0">
                
             </path>
         </svg><span class="scoop-mtext">Manage</span></a>
         <ul class="scoop-submenu" id="ManageMenu">
             <li class=" "><a href="mag-account.asp" target="" id="mag-account" name="mag-account">User Management</a></li>
             <li class=" "><a href="mag-reset.asp" target="" id="mag-reset" name="mag-reset">Device Management</a></li>
             <li class=" "><a href="mag-syslogmanage.asp" target="" id="mag-syslogmanage" name="mag-syslogmanage">Log Management</a></li>
             <li class=" "><a href="upgrade.asp" target="" id="upgrade" name="upgrade">Upgrade</a>
             </li>
         </ul>
         </li> 
         <li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="javascript:void(0)">
         
             <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> <path id="Forma_1" data-name="Forma 1" class="cls-1" d="M8.609,18.488A11.056,11.056,0,0,1,11.653,10.8a1.6,1.6,0,0,0,0-2.2,1.438,1.438,0,0,0-2.1,0,14.436,14.436,0,0,0,0,19.765,1.439,1.439,0,0,0,2.1,0,1.6,1.6,0,0,0,0-2.2A11.056,11.056,0,0,1,8.609,18.488Zm-5.641,0a17.059,17.059,0,0,1,4.7-11.859,1.6,1.6,0,0,0,0-2.2,1.439,1.439,0,0,0-2.1,0A20.219,20.219,0,0,0,0,18.488,20.218,20.218,0,0,0,5.565,32.544a1.439,1.439,0,0,0,2.1,0,1.6,1.6,0,0,0,0-2.2A17.059,17.059,0,0,1,2.969,18.488ZM19,10.413a7.912,7.912,0,0,0-7.719,8.075A7.912,7.912,0,0,0,19,26.563a7.912,7.912,0,0,0,7.719-8.075A7.912,7.912,0,0,0,19,10.413Zm0,13.044a4.869,4.869,0,0,1-4.75-4.969A4.869,4.869,0,0,1,19,13.519a4.869,4.869,0,0,1,4.75,4.969A4.869,4.869,0,0,1,19,23.458ZM32.435,4.433a1.438,1.438,0,0,0-2.1,0,1.6,1.6,0,0,0,0,2.2,17.059,17.059,0,0,1,4.7,11.859,17.06,17.06,0,0,1-4.7,11.859,1.6,1.6,0,0,0,0,2.2,1.438,1.438,0,0,0,2.1,0A20.218,20.218,0,0,0,38,18.488,20.218,20.218,0,0,0,32.435,4.433ZM28.446,8.606a1.438,1.438,0,0,0-2.1,0,1.6,1.6,0,0,0,0,2.2,11.228,11.228,0,0,1,0,15.373,1.6,1.6,0,0,0,0,2.2,1.438,1.438,0,0,0,2.1,0A14.436,14.436,0,0,0,28.446,8.606Z"></path></svg>
             <span class="scoop-mtext">Diagnose</span></a><ul class="scoop-submenu" id="DiagnoseMenu">
                <li class=" "><a href="diag-quickdiagnose.asp" target="" id="diag-quickdiagnose" name="diag-quickdiagnose">Internet Diagnose</a></li>
                <li class=" "><a href="diag-speedtest.asp" target="" id="diag-speedtest" name="diag-speedtest">Speed Test</a></li>
             </ul>
         </li> 
             <li class="scoop-hasmenu" dropdown-icon="style1" subitem-icon="style6"><a href="help.asp">
         
                <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> 
                   <path id="Forma_1_copy" data-name="Forma 1 copy" class="cls-1" d="M18.746,0A19,19,0,1,0,38,18.744,19,19,0,0,0,18.746,0ZM18.69,30.565l-0.1,0a2.766,2.766,0,0,1,.065-5.531l0.094,0A2.766,2.766,0,1,1,18.69,30.565Zm6.8-13.49a12.558,12.558,0,0,1-2.268,2.031l-1.16.8a3.147,3.147,0,0,0-1.165,1.418,2.933,2.933,0,0,0-.18,1.19l0,0.186H16.286l0.013-.375c0.054-1.54.092-2.446,0.73-3.194a18.823,18.823,0,0,1,3.3-2.658,3.485,3.485,0,0,0,.782-0.8,2.816,2.816,0,0,0,.67-1.641,3.2,3.2,0,0,0-.608-1.89,2.531,2.531,0,0,0-2.19-.823,2.389,2.389,0,0,0-2.213,1.023,4.112,4.112,0,0,0-.67,2.21v0.189H11.539l0.008-.2c0.118-2.8,1.116-4.809,2.965-5.984a7.809,7.809,0,0,1,4.295-1.127,9.269,9.269,0,0,1,5.54,1.595A5.531,5.531,0,0,1,26.587,13.8,5.461,5.461,0,0,1,25.487,17.076Z"></path></svg>
                   <span class="scoop-mtext">Help</span></a>
                   <ul class="scoop-submenu" id="HelpMenu"></ul>
             </li> 
         </ul>
                             
         </div>							</div> 
                      </nav>

                     <div class="scoop-content">
                         <div id="Header"><header class="header_box scoop-header iscollapsed" header-theme="theme2" scoop-header-position="relative"> <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="icon-menu"></i></a></div><span class="gateway_box">Gateway Name:Home Gateway</span><span class="model_box">Gateway Type:NP1257G</span><a onclick="DoLogout()" href="/cgi-bin/logout.cgi" id="logOut" name="logOut" target="_top" class="Power_btn"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="25" viewBox="0 0 22 25"> <path id="power_icon" data-name="power_icon" class="cls-1" d="M15.405,3.524s-1.324-.6-1.324.8A3.166,3.166,0,0,0,15.41,6.65,8.495,8.495,0,0,1,11,22.253,8.495,8.495,0,0,1,6.59,6.65,3.167,3.167,0,0,0,7.919,4.322c0-1.4-1.324-.8-1.324-0.8A11.242,11.242,0,0,0,11,25,11.242,11.242,0,0,0,15.405,3.524ZM11.077,0A1.47,1.47,0,0,0,9.46,1.258V12.325a1.47,1.47,0,0,0,1.618,1.258,1.3,1.3,0,0,0,1.463-1.258V1.258A1.3,1.3,0,0,0,11.077,0Z"></path> </svg></a> </header><div class="breadcrum_box"> <ul><li><a href="#">Net</a></li><li>Binding</li><li class="welcom" valign="bottom" align="middle" width="120">Welcome!</li><li valign="bottom"><a href="N/A" target="_blank"> </a></li> </ul><div class="help_icon"> <a href="/cgi-bin/help_content.asp#UPNP Configuration" target="_blank"> <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"> <path id="help_Icon" data-name="help_Icon" class="cls-1" d="M18.746,0A19,19,0,1,0,38,18.744,19,19,0,0,0,18.746,0ZM18.69,30.565l-0.1,0a2.766,2.766,0,0,1,.065-5.531l0.094,0A2.766,2.766,0,1,1,18.69,30.565Zm6.8-13.49a12.558,12.558,0,0,1-2.268,2.031l-1.16.8a3.147,3.147,0,0,0-1.165,1.418,2.933,2.933,0,0,0-.18,1.19l0,0.186H16.286l0.013-.375c0.054-1.54.092-2.446,0.73-3.194a18.823,18.823,0,0,1,3.3-2.658,3.485,3.485,0,0,0,.782-0.8,2.816,2.816,0,0,0,.67-1.641,3.2,3.2,0,0,0-.608-1.89,2.531,2.531,0,0,0-2.19-.823,2.389,2.389,0,0,0-2.213,1.023,4.112,4.112,0,0,0-.67,2.21v0.189H11.539l0.008-.2c0.118-2.8,1.116-4.809,2.965-5.984a7.809,7.809,0,0,1,4.295-1.127,9.269,9.269,0,0,1,5.54,1.595A5.531,5.531,0,0,1,26.587,13.8,5.461,5.461,0,0,1,25.487,17.076Z"></path> </svg> </a> </div></div>
                              </div>
     
                              <div class="">
                        
                            
				    <div class="scoop-inner-content">
									  
								
							  <h1 class="heading_big bei pb-3">WLAN5G</h1>								 
								
                                <form name="ConfigForm" action="/cgi-bin/net-wlan11ac.asp" method="post">
                                <input type="HIDDEN" id="wlanWEPFlag" name="wlanWEPFlag" value="0">
<input type="HIDDEN" id="CountryChange" name="CountryChange" value="0">
<input type="HIDDEN" id="WDS_EncrypType_NONE" name="WDS_EncrypType_NONE" value="NONE">
<input type="HIDDEN" id="WDS_EncrypType_WEP" name="WDS_EncrypType_WEP" value="WEP">
<input type="HIDDEN" id="BasicRate_Value1" name="BasicRate_Value1" value="15">
<input type="HIDDEN" id="BasicRate_Value2" name="BasicRate_Value2" value="3">
<input type="HIDDEN" id="BasicRate_Value3" name="BasicRate_Value3" value="351">
<input type="HIDDEN" id="CountryRegionABand0" name="CountryRegionABand0" value="0">
<input type="HIDDEN" id="CountryRegionABand1" name="CountryRegionABand1" value="1">
<input type="HIDDEN" id="CountryRegionABand2" name="CountryRegionABand2" value="2">
<input type="HIDDEN" id="CountryRegionABand3" name="CountryRegionABand3" value="3">
<input type="HIDDEN" id="CountryRegionABand4" name="CountryRegionABand4" value="4">
<input type="HIDDEN" id="CountryRegionABand5" name="CountryRegionABand5" value="5">
<input type="HIDDEN" id="CountryRegionABand6" name="CountryRegionABand6" value="6">
<input type="HIDDEN" id="CountryRegionABand7" name="CountryRegionABand7" value="7">
<input type="HIDDEN" id="CountryRegionABand8" name="CountryRegionABand8" value="8">
<input type="HIDDEN" id="CountryRegionABand9" name="CountryRegionABand9" value="9">
<input type="HIDDEN" id="CountryRegionABand10" name="CountryRegionABand10" value="10">
<input type="HIDDEN" id="CountryRegionABand11" name="CountryRegionABand11" value="11">
<input type="HIDDEN" id="CountryRegionABand12" name="CountryRegionABand12" value="12">
<input type="HIDDEN" id="CountryRegionABand13" name="CountryRegionABand13" value="13">
<input type="HIDDEN" id="CountryRegionABand14" name="CountryRegionABand14" value="14">
<input type="HIDDEN" id="HTMCSAUTO" name="HTMCSAUTO" value="33">
<input type="HIDDEN" id="HTBW" name="HTBW" value="0">
<input type="HIDDEN" id="VHTBW" name="VHTBW" value="0">
<input type="HIDDEN" id="RTDEVICE" name="RTDEVICE" value="7663">



<input type="HIDDEN" id="Is11nMode" name="Is11nMode" value="1">
<input type="HIDDEN" id="Is11acMode" name="Is11acMode" value="1">														
<input type="HIDDEN" id="CountryName" name="CountryName" value="INDIA">
<input type="HIDDEN" id="ExtChannFlag" name="ExtChannFlag" value="0">
<input type="HIDDEN" id="BssidNum" name="BssidNum" value="3">
<input type="HIDDEN" id="hCountryRegionABand" name="hCountryRegionABand" value="0">

<input type="HIDDEN" id="WPSConfigured" name="WPSConfigured" value="2">
<input type="HIDDEN" id="WpsConfModeAll" name="WpsConfModeAll" value="7">
<input type="HIDDEN" id="WpsConfModeNone" name="WpsConfModeNone" value="0">
<input type="HIDDEN" id="WpsStart" name="WpsStart" value="0">
<input type="HIDDEN" id="WpsOOB" name="WpsOOB" value="0">
<input type="HIDDEN" id="WpsGenerate" name="WpsGenerate" value="0">
<input type="HIDDEN" id="isInWPSing" name="isInWPSing" value="0">

<input type="HIDDEN" id="maxStaNum" name="maxStaNum" value="35">
<input type="HIDDEN" id="isAuthenTypeSupported" name="isAuthenTypeSupported" value="0">
<input type="HIDDEN" id="isDot1XSupported" name="isDot1XSupported" value="1">
<input type="HIDDEN" id="isDot1XEnhanceSupported" name="isDot1XEnhanceSupported" value="0">
<input type="HIDDEN" id="isWDSSupported" name="isWDSSupported" value="1">
<input type="HIDDEN" id="bharti_ssid2" name="bharti_ssid2" value="0">
<input type="HIDDEN" id="wlan_VC" name="wlan_VC" value="0">
<input type="HIDDEN" id="isWPSSupported" name="isWPSSupported" value="1">
<input type="HIDDEN" id="isPerSSIDSupport" name="isPerSSIDSupport" value="1">
<input type="HIDDEN" id="WscV2Support" name="WscV2Support" value="0">
<input type="HIDDEN" id="hRekeyMethod" name="hRekeyMethod" value="DISABLE">
<input type="HIDDEN" id="wlan_APenable_flag" name="wlan_APenable_flag" value="1">
<input type="HIDDEN" id="ESSID_Enable_Selection_flag" name="ESSID_Enable_Selection_flag" value="1">
<input type="HIDDEN" id="ESSID_HIDE_Selection_flag" name="ESSID_HIDE_Selection_flag" value="0">
<input type="HIDDEN" id="UseWPS_Selection_flag" name="UseWPS_Selection_flag" value="7">
<input type="HIDDEN" id="WPSMode_Selection_flag" name="WPSMode_Selection_flag" value="1">
<input type="HIDDEN" id="currentTime" name="currentTime" value="">
								<div class="white_box p-3" style="background-color:#fff">
									<h1 class="heading_grey pb-3" style="color:#fd7e14"><img src="/img/wlan.png" width="45" height="40" class="img_sub" alt=""><span style="vertical-align:middle;">&nbsp;WLAN5G</span></h1>
									<div class="container-fluid">
									<hr class="margin_adjs">	
									<div class="row">
										<div class="col-md-12 form-group">
										    <div class="custom-control custom-checkbox">
                                                <input type="checkbox" id="wlan_APenable" name="wlan_APenable" class="custom-control-input" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %>>
												<label class="custom-control-label" for="wlan_APenable"><%tcWebApi_get("String_Entry","EnableWirelessText","s")%></label>
											</div>
										</div>

<script language="javascript">
    var countryarr = new Array(98);
    countryarr[0] = "ALBANIA";
    countryarr[1] = "ALGERIA";
    countryarr[2] = "ARGENTINA";
    countryarr[3] = "ARMENIA";
    countryarr[4] = "AUSTRALIA";
    countryarr[5] = "AUSTRIA";
    countryarr[6] = "AZERBAIJAN";
    countryarr[7] = "BAHRAIN";
    countryarr[8] = "BELARUS";
    countryarr[9] = "BELGIUM";
    countryarr[10] = "BELIZE";
    countryarr[11] = "BOLIVIA";
    countryarr[12] = "BRAZIL";
    countryarr[13] = "BRUNEI DARUSSALAM";
    countryarr[14] = "BULGARIA";
    countryarr[15] = "CANADA";
    countryarr[16] = "CHILE";
    countryarr[17] = "CHINA";
    countryarr[18] = "COLOMBIA";
    countryarr[19] = "COSTA RICA";
    countryarr[20] = "CROATIA";
    countryarr[21] = "CYPRUS";
    countryarr[22] = "CZECH REPUBLIC";
    countryarr[23] = "DENMARK";
    countryarr[24] = "DOMINICAN REPUBLIC";
    countryarr[25] = "ECUADOR";
    countryarr[26] = "EGYPT";
    countryarr[27] = "ELSALVADOR";
    countryarr[28] = "FINLAND";
    countryarr[29] = "FRANCE";
    countryarr[30] = "GEORGIA";
    countryarr[31] = "GERMANY";
    countryarr[32] = "GREECE";
    countryarr[33] = "GUATEMALA";
    countryarr[34] = "HONDURAS";
    countryarr[35] = "HONGKONG";
    countryarr[36] = "HUNGARY";
    countryarr[37] = "ICELAND";
    countryarr[38] = "INDIA";
    countryarr[39] = "INDONESIA";
    countryarr[40] = "IRAN";
    countryarr[41] = "IRELAND";
    countryarr[42] = "ISRAEL";
    countryarr[43] = "ITALY";
    countryarr[44] = "JAPAN";
    countryarr[45] = "KAZAKHSTAN";
    countryarr[46] = "KOREA DEMOCRATIC";
    countryarr[47] = "KOREA REPUBLIC";
    countryarr[48] = "LATVIA";
    countryarr[49] = "LEBANON";
    countryarr[50] = "LIECHTENSTEIN";
    countryarr[51] = "LITHUANIA";
    countryarr[52] = "LUXEMBOURG";
    countryarr[53] = "MACAU";
    countryarr[54] = "MACEDONIA";
    countryarr[55] = "MALAYSIA";
    countryarr[56] = "MEXICO";
    countryarr[57] = "MONACO";
    countryarr[58] = "MOROCCO";
    countryarr[59] = "NETHERLANDS";
    countryarr[60] = "NEW ZEALAND";
    countryarr[61] = "NORWAY";
    countryarr[62] = "OMAN";
    countryarr[63] = "PAKISTAN";
    countryarr[64] = "PANAMA";
    countryarr[65] = "PERU";
    countryarr[66] = "PHILIPPINES";
    countryarr[67] = "POLAND";
    countryarr[68] = "PORTUGAL";
    countryarr[69] = "PUERTO RICO";
    countryarr[70] = "QATAR";
    countryarr[71] = "ROMANIA";
    countryarr[72] = "RUSSIA";
    countryarr[73] = "SAUDI ARABIA";
    countryarr[74] = "SINGAPORE";
    countryarr[75] = "SLOVAKIA";
    countryarr[76] = "SLOVENIA";
    countryarr[77] = "SOUTH AFRICA";
    countryarr[78] = "SPAIN";
    countryarr[79] = "SWEDEN";
    countryarr[80] = "SWITZERLAND";
    countryarr[81] = "SYRIAN ARAB REPUBLIC";
    countryarr[82] = "TAIWAN";
    countryarr[83] = "THAILAND";
    countryarr[84] = "TRINIDAD AND TOBAGO";
    countryarr[85] = "TUNISIA";
    countryarr[86] = "TURKEY";
    countryarr[87] = "UKRAINE";
    countryarr[88] = "UNITED ARAB EMIRATES";
    countryarr[89] = "UNITED KINGDOM";
    countryarr[90] = "UNITED STATES";
    countryarr[91] = "URUGUAY";
    countryarr[92] = "UZBEKISTAN";
    countryarr[93] = "VENEZUELA";
    countryarr[94] = "VIETNAM";
    countryarr[95] = "YEMEN";
    countryarr[96] = "ZIMBABWE";
    countryarr[97] = "Undefined";

    for (i = 0; i < 98; i++) {
        if (document.ConfigForm.CountryName.value.match(countryarr[i]) != null) {
            document.ConfigForm.Countries_Channels[i] = new Option(countryarr[i], countryarr[i], false, true);
            document.ConfigForm.Countries_Channels[i].selected = true;
        }
        else {
            if (countryarr[i].match("TAIWAN") != null) {
                document.ConfigForm.Countries_Channels[i] = new Option(countryarr[i], countryarr[i], true, false);
            }
            else {
                document.ConfigForm.Countries_Channels[i] = new Option(countryarr[i], countryarr[i], false, false);
                document.ConfigForm.Countries_Channels[i].selected = false;
            }
        }
    }	
</script>
                                    <div class="col-md-12 row">
                                        <div class="col-md-3 form-group" style="display: none">
                                            <select id="Countries_Channels" name="Countries_Channels" size="1" maxlength="2" onchange="doRegionCheck()" class="custom-select" style="display: none">
                                            </select>
                                        </div>

										<!-- Select Mode -->
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","SelectModeText","s")%></label>
                                            <select id="WirelessMode" name="WirelessMode" size="1" onchange="doWirelessModeChange()" class="custom-select">
                                                <option value="2" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "2" then asp_Write("selected") end if %> >11a only</option>
                                                <option value="8" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "8" then asp_Write("selected") end if %> >11a/n mixed mode</option>
                                                <option value="14" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "14" then asp_Write("selected") end if %> >11vht AC/AN/A</option>
                                                <option value="15" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "15" then asp_Write("selected") end if %> <% If tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "N/A" then asp_Write("checked") end if%> >11vht AC/AN</option>
                                
                                            </select>
										</div>

										<!-- Transmitted Power -->
										<div class="col-md-3 form-group" id="wlPutOutPower">
											<label><%tcWebApi_get("String_Entry","NetWlanTransPowerText","s")%></label>
                                            <select class="custom-select" size="1" id="wlTxPwr" name="wlTxPwr">
                                                <option value="5" <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "9" then asp_Write("selected") end if %>>9%</option>
                                                <option value="4" <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "15" then asp_Write("selected") end if %>>15%</option>
                                                <option value="3"  <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "30" then asp_Write("selected") end if %>>30%</option>
                                                <option value="2" <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "60" then asp_Write("selected") end if %>>60%</option>
                                                <option value="1" <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "80" then asp_Write("selected") end if %>>80%</option>
                                                <option value="6" selected="" <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "100" then asp_Write("selected") end if %>>100%</option>
                                            </select>
										</div>

										<!-- TBeacon Interval -->
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","BeanconIntervalText","s")%></label>
											<div class="input-group">
                                                <input type="TEXT" id="BeaconInterval" name="BeaconInterval" class="form-control" maxlength="4" value="<% If tcWebApi_get("WLan11ac_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","BeaconPeriod","s") else asp_Write("100") end if %>">
												<div class="input-group-append">
													<span class="input-group-text">(<%tcWebApi_get("String_Entry","RangeText","s")%> 20~1000)</span>
												</div>
											</div>
										</div>

                                        <!-- Select Channel -->
                                        <div class="col-md-3 form-group">
                                            <label><%tcWebApi_get("String_Entry","SelectChannelText","s")%></label>
                                            <select id="Channel_ID" name="Channel_ID" size="1" maxlength="2" onchange="doExtChaLockChange()" class="custom-select"><option value="0">AUTO</option>
												<option value="36">36</option>
												<option value="40">40</option>
												<option value="44">44</option>
												<option value="48">48</option>
												<option value="52">52</option>
												<option value="56">56</option>
												<option value="60">60</option>
												<option value="64">64</option>
												<option value="149">149</option>
												<option value="153">153</option>
												<option value="157">157</option>
												<option value="161">161</option>
												<option value="165">165</option>
											</select>
                                        </div>

										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","CurrentChannelText","s")%></label>
											
				                        <input type="TEXT" id="CurrentChannel" name="CurrentChannel" class="form-control" maxlength="2" value="<% If tcWebApi_get("Info_WLan11ac","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","CurrentChannel","s") end if %>" disabled="" >
										
									</div>
										   <script language="JavaScript" type="text/javascript">
                                                var t = new Date();
                                                var year = t.getFullYear();
                                                var month = t.getMonth() + 1;
                                                var day = t.getDate();
                                                var hour = t.getHours();
                                                var minute = t.getMinutes();
                                                var second = t.getSeconds();
                                                var curTime = "" + year + ((month<10)?"0":"") + month + ((day<10)?"0":"") + day + ((hour<10)?"0":"") + hour + ((minute<10)?"0":"") + minute + ((second<10)?"0":"") + second;
                                                var lastTime = "N/A";
                                                //var interval = getTimeDifference(curTime, lastTime);
                                                interval = Math.abs(Number(curTime) - Number(lastTime));

                                                //show the real value after 20s
                                                if (isNaN(lastTime) || (interval >= 20) || (document.ConfigForm.Channel_ID.value == "0"))
                                                {
                                                    //use real value
                                                    document.ConfigForm.CurrentChannel.value = "56";
                                                }
                                                else
                                                {
                                                    //use select value
                                                    document.ConfigForm.CurrentChannel.value = "0";
                                                    if (document.ConfigForm.CurrentChannel.value == "0")
                                                    {
                                                        //use real value
                                                        document.ConfigForm.CurrentChannel.value = "56";
                                                    }
                                                }
                                            </script>
										

                                        <div class="col-md-3 form-group">
                                            <label>RTS/CTS<%tcWebApi_get("String_Entry","HresholdText","s")%></label>
                                            <div class="input-group">
                                                <input type="TEXT" id="RTSThreshold" name="RTSThreshold" class="form-control" maxlength="5" value="<% If tcWebApi_get("WLan11ac_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","RTSThreshold","s") else asp_Write("2347") end if %>">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">(<%tcWebApi_get("String_Entry","RangeText","s")%>1500~2347)</span>
                                                </div>
                                            </div>
                                        </div>

										<div class="col-md-3 form-group">
												<label><%tcWebApi_get("String_Entry","FragmentThresholdText","s")%></label>
												<div class="input-group">
                                                <input type="TEXT" id="FragmentThreshold" name="FragmentThreshold" class="form-control" maxlength="5" value="<% If tcWebApi_get("WLan11ac_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","FragThreshold","s") else asp_Write("2346") end if %>"">
												  <div class="input-group-append">
													<span class="input-group-text">(<%tcWebApi_get("String_Entry","RangeText","s")%><%tcWebApi_get("String_Entry","FragmentRangeTipText","s")%>)</span>
												  </div>
													</div>
												</div>
												

                                    <div class="col-md-3 form-group">
                                        <label>SSID:</label>
                                        <input type="TEXT" id="ESSID" name="ESSID" class="form-control" maxlength="32" value="SDMC_5G">
                                    </div>

                                    <div class="col-md-3 form-group">
                                        <label>DTIM<%tcWebApi_get("String_Entry","IntervalText","s")%></label>
                                        <div class="input-group">
                                            <input type="TEXT" id="DTIM" name="DTIM" class="form-control" maxlength="5" value="<% If tcWebApi_get("WLan11ac_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","DtimPeriod","s") else asp_Write("1") end if %>">
												  <div class="input-group-append">
													<span class="input-group-text">(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~255)</span>
												  </div>
													</div>
										</div>


</div>
<div class="row col-md-12" id="11nMode_1_div">
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","ChannelBandwidthText","s")%></label>
                                            <select id="WLANChannelBandwidth" name="WLANChannelBandwidth" style="WIDTH:105" size="1" onchange="doChannelBandwidthChange();" class="custom-select">
  				<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "0" then asp_Write("selected") end if %>>20 MHz</option>
				
				<option value="1" >20/40 MHz</option>

				</select>
										</div>
										<div class="col-md-3 form-group" id="HT_BW_1_div">
											<label><%tcWebApi_get("String_Entry","ExtenedChannelText","s")%></label>
                                            <select id="WLANExtensionChannel" name="WLANExtensionChannel" size="1" onchange="doExtChannChange();" class="custom-select" disabled="">
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %> ><%tcWebApi_get("String_Entry","DownExtenedChannelText","s")%></option>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %> ><%tcWebApi_get("String_Entry","UpExtenedChannelText","s")%></option>
				</select>
										</div>

										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","ProtectedIntervalText","s")%></label>
                                            <select id="WLANGuardInterval" name="WLANGuardInterval" class="custom-select" size="1">
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "0" then asp_Write("selected") end if %> >800 nsec</option>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "N/A" then asp_Write("selected") end if %> >AUTO</option>
                                            </select>
										</div>

                                         </div>
                               <div class="row col-md-12" id="11acMode_1_div">
										<div class="col-md-3 form-group">
											<label>VHT <%tcWebApi_get("String_Entry","BandwidthText","s")%>:</label>
                                            <select id="WLan11acVHTChannelBandwidth" name="WLan11acVHTChannelBandwidth" size="1" onchange="doVHTBandwidthChange();" class="custom-select">
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "0" then asp_Write("selected") end if %> >20/40 MHz</option>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "N/A" then asp_Write("selected") end if %> >20/40/80 MHz</option>

				</select>
										</div>


										<div class="col-md-3 form-group">
											<label>VHT <%tcWebApi_get("String_Entry","ProtectedIntervalText","s")%></label>
                                            <select id="WLan11acVHTGuardInterval" name="WLan11acVHTGuardInterval" class="custom-select" size="1">
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "0" then asp_Write("selected") end if %>>800 nsec</option>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "N/A" then asp_Write("selected") end if %>>AUTO</option>
				</select>
										</div>



										<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>			
			<div class="col-md-3 form-group">
			<label>MCS:</label>
			<select id="WLANMCS" name="WLANMCS" class="custom-select" size="1"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="33">AUTO</option></select>
			</div>
			<% end if %>
</div>
                                        <!-- Enable SSID -->
									
										<div class="col-md-12 form-group">
										    <div class="custom-control custom-checkbox">
                                                <input type="checkbox" id="ESSID_Enable_Selection" name="ESSID_Enable_Selection" class="custom-control-input" <% If tcWebApi_get("WLan11ac_Entry","EnableSSID","h") = "1" then asp_Write("checked") end if %>>
                                                <label class="custom-control-label" for="ESSID_Enable_Selection"><%tcWebApi_get("String_Entry","EnableSSIDText","s")%></label>
                                            </div>
										</div>
                                        


                                        
										<div class="col-md-3 form-group">
												<label>Station Num:</label>
												<div class="input-group">
                                                <input id="StationNum" name="StationNum" type="text" class="form-control" value="<% if tcWebApi_get("WLan11ac_Entry","MaxStaNum","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","MaxStaNum","s") else asp_Write("0") end if %>" maxlength="2">
												  <div class="input-group-append">
													<span class="input-group-text"><font color="#000000">(<%tcWebApi_get("String_Entry","RangeText","s")%> 0~</font><% tcWebApi_get("Info_WLan11ac","maxStaNumSupported","s") %></font>35<font color="#000000">, 0represents no restriction)</font></span>
												  </div>
													</div>
												</div>
                                                

										<!-- Cancel Broadcast -->
										<div class="col-md-3 form-group align-self-center">
										    <label> </label>
											<div class="custom-control custom-checkbox">
                                            <input type="checkbox" onclick="doBroadcastSSIDChange(this)" value="ON" id="ESSID_HIDE_Selection" name="ESSID_HIDE_Selection" class="custom-control-input" <% If tcWebApi_get("WLan11ac_Entry","HideSSID","h") = "1" then asp_Write("checked") end if %>>
											  <label class="custom-control-label" for="ESSID_HIDE_Selection"><%tcWebApi_get("String_Entry","CancelBroadcastText","s")%></label>
											</div>
										</div>



                                        

								        <div class="col-md-4 form-group" id="11nMode_0_div" style="display: none;">
										    <label>WMM<%tcWebApi_get("String_Entry","EnableText","s")%></label>
											<div class="custom-control custom-radio custom-control-inline">
                                            <input type="RADIO" id="WMM_Selection_Open" name="WMM_Selection" class="custom-control-input" value="1" <% If tcWebApi_get("WLan11ac_Entry","WMM","h") = "1" then asp_Write("checked") end if %> >
												  <label class="custom-control-label" for="WMM_Selection_Open"><%tcWebApi_get("String_Entry","OpenText","s")%></label>
												</div>
												<div class="custom-control custom-radio custom-control-inline">
                                                	<input type="RADIO" id="WMM_Selection_Close" name="WMM_Selection" class="custom-control-input" value="<% If tcWebApi_get("WLan11ac_Entry","WMM","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("WLan11ac_Entry","WMM","h") = "N/A" then asp_Write("checked") end if %>" checked="">
												  <label class="custom-control-label" for="WMM_Selection_Close"><%tcWebApi_get("String_Entry","CloseText","s")%></label>
												</div>
										</div>

                                        <!-- WPS Enable -->
										<div class="col-md-12 form-group" id="WpsEnableData">
											<div class="custom-control custom-checkbox">
	<input class="custom-control-input" onClick="doWPSUseChange();" type="checkbox" id="UseWPS_Selection" name="UseWPS_Selection" <% If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if %>/>
												<label class="custom-control-label" for="UseWPS_Selection">WPS <%tcWebApi_get("String_Entry","EnableText","s")%></label>
											</div>
									</div>

                                       
                                    <div id="WPSConfMode_1_div" style="">

                                        <div class="col-md-12 form-group">
											<label>WPS<%tcWebApi_get("String_Entry","ModeText","s")%></label>
                                              <select id="WPSMode_Selection" class="custom-select" onchange="doWPSModeChange()" size="1" name="WPSMode_Selection">
                      <option value="ap-pbc <%if tcWebApi_get("WLan11ac_Entry","WPSMode","h") = "1" then asp_Write("selected") end if%></option>" selected="">PBC</option>
                      <option value="ap-pin <%if tcWebApi_get("WLan11ac_Entry","WPSMode","h") = "0" then asp_Write("selected") end if%></option>">PIN</option>
                      </select>
										</div>

                                        <div class="col-md-12 form-group">
                                        <input id="StartWPS" class="btn btn-orang-1 btn-lg" name="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
                                        </div>

                                        <div class="col-md-12 form-group" id="pinGenerate" style="display:none">
                                        <label><strong>AP self PIN code</strong></label>
                                        <% tcWebApi_get("Info_WLan11ac", "wlanSelfPinCode", "s") %>
                                        <input type="button" id="pin_generate" name="pin_generate" value="Generate" onclick="doGenerate()" class="btn orange_border_btn">
                                        </div>

                                        <div class="col-md-12 form-group" id="pinval" style="display:none">
                                        <label>enrollee PIN code</label>
                                        <input id="WPSEnrolleePINCode" name="WPSEnrolleePINCode" class="form-control" size="9" maxlength="9" value="<% If tcWebApi_get("WLan11ac_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("WLan11ac_Entry","enrolleePinCode","s") end if %>" type="text">
                                        </div>

                                        <div class="col-auto">
                                        <label>WPS <%tcWebApi_get("String_Entry","StatusText","s")%></label>
                                        <span>

					<label>
						
					<strong>
					
					Idle

					</strong>
					
					</label>

                    </span></div>

                    <div class="col-md-12 form-group">
                    <input id="ResetOOB" name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" class="btn btn-orang-1 btn-lg">
                    </div>
</div>
										 <div class="row col-md-12" id="Radius-WEP64_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","RadiusServiceIPText","s")%></label>
                                            <input id="radiusSVR_IP1" class="form-control" name="radiusSVR_IP1" type="text" value="<% if tcWebApi_get("WLan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15">
										</div>
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","RadiusServicePortText","s")%></label>
                                           <input id="radiusSVR_Port1" class="form-control" name="radiusSVR_Port1" type="text" value="<% if tcWebApi_get("WLan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5">
										</div>
                                        <div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","RadiusSharedSecretText","s")%></label>
                                          <input id="radiusSVR_Key1" class="form-control" name="radiusSVR_Key1" type="text" value="<% if tcWebApi_get("WLan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63">
										</div>
                                         

										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","ReAuthIntervalText","s")%></label>
											<div class="input-group">
                                            <input type="text" id="radiusSVR_ReAuthInter1" class="form-control" name="radiusSVR_ReAuthInter1" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
										</div>
										<div class="col-md-12 form-group">
										<h2 class="sub_heading">WEP-64Bits</h2>
											<p class="light_grey_text"><%tcWebApi_get("String_Entry","KeyEnterCharacters1Text","s")%>0~9, a, b, c, d, e, f.</p>
										</div>
										<div class="col-md-12 form-group">
										<h2 class="sub_heading">WEP-128Bits</h2>
											<p class="light_grey_text"><%tcWebApi_get("String_Entry","KeyEnterCharacters2Text","s")%>0~9, a, b, c, d, e, f.</p>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs"><div class="custom-control custom-radio custom-control-inline">
                                                    <input type="RADIO" id="DefWEPKey1" name="DefWEPKey1" value="1" <% If tcWebApi_get("WLan11ac_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("WLan11ac_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if %>>
												 <!-- <label class="custom-control-label" for="DefWEPKey1">Key#1</label>-->Key#1
												</div></span>
												  </div>
                                               <input type="TEXT" class="form-control" id="WEP_Key11" name="WEP_Key11" size="30" maxlength="28" value="">								  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="RADIO" id="DefWEPKey1" name="DefWEPKey1" value="2" <% If tcWebApi_get("WLan11ac_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if %>>
												<!--  <label class="custom-control-label" for="customRadioInline14">Key#2</label>-->Key#2
												</div></span>
												  </div>
                                                 <input type="TEXT" id="WEP_Key21" class="form-control" name="WEP_Key21" size="30" maxlength="28" value="">
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												<input type="RADIO" id="DefWEPKey1" name="DefWEPKey1" value="3">
				 Key#3
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key31" name="WEP_Key31" size="30" maxlength="28" value=""> 
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												  <input type="RADIO" id="RADIO1" name="DefWEPKey1" value="4" <% If tcWebApi_get("WLan11ac_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if %>> Key#4
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key41" name="WEP_Key41" size="30" maxlength="28" value="">											  
											</div>
										</div>
										</div>
										
                                         <div class="row col-md-12" id="Radius-WEP128_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label>Radius Server IP:</label>
                                            <input class="form-control" id="radiusSVR_IP2" name="radiusSVR_IP2" type="text" value="192.168.7.203" size="20" maxlength="15">
										</div>
										<div class="col-md-3 form-group">
											<label>Radius Server Port:</label>
                                            <input class="form-control" id="radiusSVR_Port2" name="radiusSVR_Port2" type="text" value="1812" size="8" maxlength="5">
										</div>
										<div class="col-md-3 form-group">
											<label>Radius Share Secret:</label>
                                            <input class="form-control" id="radiusSVR_Key2" name="radiusSVR_Key2" type="text" value="12345678" size="48" maxlength="63">
										</div>
                                        	
										<div class="col-md-3 form-group">
											<label>Re-auth Interval:</label>
											<div class="input-group">
                                                <input type="text" class="form-control" id="radiusSVR_ReAuthInter2" name="radiusSVR_ReAuthInter2" value="100" size="48" maxlength="63">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
										</div>
										<div class="col-md-12 form-group">
										<h2 class="sub_heading">WEP-64Bits</h2>
											<p class="light_grey_text">Every key enters 5 characters or 10 characters, from 0~9, a, b, c, d, e, f.</p>
										</div>
										<div class="col-md-12 form-group">
										<h2 class="sub_heading">WEP-128Bits</h2>
											<p class="light_grey_text">Every key enters 5 characters or 10 characters, from 0~9, a, b, c, d, e, f.</p>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												<!--  <input type="radio" id="customRadioInline17" name="key2" class="custom-control-input">
												  <label class="custom-control-label" for="customRadioInline17">Key#1</label>-->
                                                  <input type="RADIO" id="DefWEPKey2" name="DefWEPKey2" value="1" checked="">
				Key#1:
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key12" name="WEP_Key12" size="30" maxlength="28" value="">										  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												  <!--<input type="radio" id="customRadioInline18" name="key2" class="custom-control-input">
												  <label class="custom-control-label" for="customRadioInline18">Key#2</label>-->
                                                  <input type="RADIO" id="DefWEPKey2" name="DefWEPKey2" value="2">
				Key#2
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key22" name="WEP_Key22" size="30" maxlength="28" value="">											  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												 <!-- <input type="radio" id="customRadioInline19" name="key2" class="custom-control-input">
												  <label class="custom-control-label" for="customRadioInline19">Key#3</label>-->
                                                  <input type="RADIO" id="DefWEPKey2" name="DefWEPKey2" value="3">
				Key#3
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key32" name="WEP_Key32" size="30" maxlength="28" value=""> 										  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
												<!--  <input type="radio" id="customRadioInline20" name="key2" class="custom-control-input">
												  <label class="custom-control-label" for="customRadioInline20">Key#4</label>-->
                                                  <input type="RADIO" id="DefWEPKey2" name="DefWEPKey2" value="4">
				Key#4
												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key42" name="WEP_Key42" size="30" maxlength="28" value="">											  
											</div>
										</div>
                                        </div>
									
                                   

										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","EncryptionTypeText","s")%></label>
											<select id="TKIP_Selection1" name="TKIP_Selection1" onchange="doEncryptionChange(this)" size="1" class="custom-select">
				<option value="TKIP" <% If tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if %>>TKIP</option>
				<option value="AES" <% if tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</option>
				<option value="TKIPAES" <% if tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP+AES</option>
				</select>
										</div>
									<div class="col-md-3 form-group">
											<label>WPA<%tcWebApi_get("String_Entry","GroupKeyText","s")%>:</label>
											<div class="input-group">
                                          <input type="text" class="form-control" id="WPARekeyInter3" name="WPARekeyInter3" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
	var rekeystr = "3600";
	if("N/A" == rekeystr || "" == rekeystr)
		document.getElementById('WPARekeyInter3').value = "3600";
	else
		document.getElementById('WPARekeyInter3').value = rekeystr;
</script>
										</div>
                                        </div>

										<div class="col-md-3 form-group ms-2">
											<label><%tcWebApi_get("String_Entry","WPAGroupKeyUpdateIntervalText","s")%></label>
											<div class="input-group">
                                                 <input class="form-control" type="text" id="WPARekeyInter4" name="WPARekeyInter4" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
	var rekeystr = "3600";
	if("N/A" == rekeystr || "" == rekeystr)
		document.getElementById('WPARekeyInter4').value = "3600";
	else
		document.getElementById('WPARekeyInter4').value = rekeystr;
</script>
										</div>
                                        </div>

										<div class="col-md-12"></div>
                                          <div class="row col-md-12" id="WPA1WPA2_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label>Radius Server IP:</label>
                                            <input class="form-control" id="radiusSVR_IP5" name="radiusSVR_IP5" type="text" value="192.168.7.203" size="20" maxlength="15">
										</div>
										<div class="col-md-3 form-group">
											<label>Radius Server Port:</label>
                                            <input class="form-control" id="radiusSVR_Port5" name="radiusSVR_Port5" type="text" value="1812" size="8" maxlength="5">
										</div>
										<div class="col-md-3 form-group">
											<label>Radius Share Secret:</label>
                                            <input class="form-control" id="radiusSVR_Key5" name="radiusSVR_Key5" type="text" value="12345678" size="48" maxlength="63">
										</div>
                                         		

										<div class="col-md-3 form-group">
											<label>Re-auth Interval:</label>
											<div class="input-group">
                                                  <input class="form-control" type="text" id="radiusSVR_ReAuthInter5" name="radiusSVR_ReAuthInter5" value="100" size="48" maxlength="63">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
										</div>
										
										<div class="col-md-3 form-group">
											<label>Encryption Type:</label>
											<select id="TKIP_Selection3" name="TKIP_Selection3" onchange="doEncryptionChange(this)" size="1" class="custom-select">
				<option value="TKIP">TKIP</option>
				<option value="AES" selected="">AES</option>
				<option value="TKIPAES">TKIP+AES</option>
			</select>
										</div>
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","WPAGroupKeyUpdateIntervalText","s")%></label>
											<div class="input-group">
                                                <input type="text" class="form-control" id="WPARekeyInter5" name="WPARekeyInter5" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">seconds</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
														var rekeystr = "<% tcWebApi_get("WLan11ac_Entry","RekeyInterval","s") %>";
														if("N/A" == rekeystr || "" == rekeystr)
															document.getElementById('WPA3_WPARekeyInter').value = "3600";
														else
															document.getElementById('WPA3_WPARekeyInter').value = rekeystr;
													</script>
										</div>
                                        </div>
									 		
                                    
                                    <div class="col-md-12"></div>
                                     <div class="row col-md-12" id="WEP-64Bits_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label>WEP AuthType</label>
                                            <select class="custom-select" id="WEP_TypeSelection1" name="WEP_TypeSelection1" size="1" onchange="doWEPTypeChange()">
												<option value="OpenSystem" <% if tcWebApi_get("WLan11ac_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("selected") elseif tcWebApi_get("WLan11ac_Entry","WEPAuthType","h") = "N/A" then asp_Write("selected") end if %>>OPENWEP</OPTION>
				<option value="SharedKey" <% if tcWebApi_get("WLan11ac_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("selected") end if %>>SHAREDWEP</OPTION>
				<option value="WEPAuto" <% if tcWebApi_get("WLan11ac_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("selected") end if %>>Both</OPTION>
																
				</select>
										</div>
										
										<div class="col-md-12 form-group">
										<h2>WEP-64Bits</h2>
											<p class="light_grey_text"><%tcWebApi_get("String_Entry","KeyEnterCharacters1Text","s")%>0~9, a, b, c, d, e, f.</p>
										</div>
										
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                  	<input type="RADIO" class="custom-control-input" id="DefWEPKey3_Key1" name="DefWEPKey3" value="1" checked="">
			 <label class="custom-control-label" for="DefWEPKey3_Key1">Key#1</label>

												</div></span>
												  </div>
                                                  <input type="TEXT" class="form-control" id="WEP_Key13" name="WEP_Key13" size="30" maxlength="28" value="">												  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                  <input type="RADIO" class="custom-control-input" id="DefWEPKey3_Key2" name="DefWEPKey3" value="2">
                                                   <label class="custom-control-label" for="DefWEPKey3_Key2">Key#2</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key23" name="WEP_Key23" size="30" maxlength="28" value="">											  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="RADIO" class="custom-control-input" id="DefWEPKey3_Key3" name="DefWEPKey3" value="3">
												  <label class="custom-control-label" for="DefWEPKey3_Key3">Key#3</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key33" name="WEP_Key33" size="30" maxlength="28" value=""> 											  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input class="custom-control-input" type="RADIO" id="DefWEPKey3_Key4" name="DefWEPKey3" value="4">
												  <label class="custom-control-label" for="DefWEPKey3_Key4">Key#4</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key43" name="WEP_Key43" size="30" maxlength="28" value="">									  
											</div>
										</div>
										</div>

                                        <div class="row col-md-12" id="WEP-128Bits_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label>WEP AuthType</label>
                                            <select id="WEP_TypeSelection2" name="WEP_TypeSelection2" size="1" onchange="doWEPTypeChange()" class="custom-select">
				<option value="OpenSystem">OPENWEP</option>
				<option value="SharedKey">SHAREDWEP</option>
				<option value="WEPAuto" selected="">Both</option>
				</select>
										</div>
										
										<div class="col-md-12 form-group">
										<h2 class="sub_heading">WEP-128Bits</h2>
											<p class="light_grey_text"><%tcWebApi_get("String_Entry","KeyEnterCharacters2Text","s")%>0~9, a, b, c, d, e, f.</p>
										</div>
										
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input class="custom-control-input" type="RADIO" id="DefWEPKey4_Key1" name="DefWEPKey4" value="1" checked="">

												  <label class="custom-control-label" for="DefWEPKey4_Key1">Key#1</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key14" name="WEP_Key14" size="30" maxlength="28" value="">												  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <inputclass="custom-control-input" type="RADIO" id="DefWEPKey4_Key2" name="DefWEPKey4" value="2">
												  <label class="custom-control-label" for="DefWEPKey4_Key2">Key#2</label>
												</inputclass="custom-control-input"></div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key24" name="WEP_Key24" size="30" maxlength="28" value="">											  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input class="custom-control-input" type="RADIO" id="DefWEPKey4_Key3" name="DefWEPKey4" value="3">
												  <label class="custom-control-label" for="DefWEPKey4_Key3">Key#3</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key34" name="WEP_Key34" size="30" maxlength="28" value="">											  
											</div>
										</div>
										<div class="col-md-3 form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text padding_adjs">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                    <input class="custom-control-input" type="RADIO" id="DefWEPKey4_Key4" name="DefWEPKey4" value="4">
												  <label class="custom-control-label" for="DefWEPKey4_Key4">Key#4</label>
												</div></span>
												  </div>
                                                  <input class="form-control" type="TEXT" id="WEP_Key44" name="WEP_Key44" size="30" maxlength="28" value="">											  
											</div>
										</div>
                                        </div>




<div class="col-md-3 from-group" id="WEP_Selection_div">
                <label><%tcWebApi_get("String_Entry","SecurityConfigurationText","s")%></label>
				<input type="HIDDEN" id="WEP_Selection_val" name="WEP_Selection_val" value="WPA2PSK">
<select id="WEP_Selection" name="WEP_Selection" size="1" onchange="doWEPChange()" class="custom-select">
	<% if tcWebApi_get("Info_WLan11ac","isbharti","h") <> "Yes" then %>
	<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>	
	<% else %>
				<option value="OPEN" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>>OPEN</option>
				<% end if %>	
				<% end if %>
				<option style="display:none" value="WEP-64Bits" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WEP-64Bits" then asp_Write("selected") end if %>>WEP-64Bits</option>
				<option style="display:none" value="WEP-128Bits" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WEP-128Bits" then asp_Write("selected") end if %>>WEP-128Bits</option>
				<option value="WPAPSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>>WPA-PSK</option>
				<option value="WPA2PSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %> selected="">WPA2-PSK</option>
				<option value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %>>WPA-PSK/WPA2-PSK</option>
				<option style="display:none" value="Radius-WEP64">Radius-WEP64</option>
				<option style="display:none" value="Radius-WEP128">Radius-WEP128</option>
				<option style="display:none" value="WPA">WPA</option>
				<option style="display:none" value="WPA2">WPA2</option>
				<option style="display:none" value="WPA1WPA2">WPA1WPA2</option>

				<option value="WPA3PSK">WPA3-PSK</option>
				<option value="WPA2PSKWPA3PSK">WPA2-PSK/WPA3-PSK</option>


				</select>
</div>

<div class="col-md-3 form-group" id="WEP_Selection_show_div" style="display: none;">
<select id="WEP_Selection_show" name="WEP_Selection_show" size="1" class="custom-select">
				<option selected="">WPA2</option>
				</select>
</div>


                                        <div class="row col-md-12" id="WPA2PSK_div" style="">
                                        <div class="col-md-3 form-group">

											<label>Encryption Type:</label>
                                            <select id="TKIP_Selection4" name="TKIP_Selection4" onchange="doEncryptionChange(this)" size="1" class="custom-select">
				<option value="TKIP">TKIP</option>
				<option value="AES" selected="">AES</option>
				<option value="TKIPAES">TKIP+AES</option>
				</select>

                                        </div>
										<div class="col-md-3 form-group">
											<label>PreShared Key:</label>
											<div class="input-group">
                                            <input class="form-control" type="password" id="PreSharedKey1" name="PreSharedKey1" size="48" maxlength="64" value="12345678">
												</div>
												<div class="input-group-append">
												  <span class="input-group-text">(8~63characters or 64 hexadecimal string)&nbsp;&nbsp;<i class="fa fa-eye" onclick="WPA2PSKshowhide()" id="WPA2PSKeye"></i></span>
												</div>
										</div>
										<div class="col-md-3 form-group">
											<label>Key Renewal Interval1:</label>
											<div class="input-group">
                                            	<input class="form-control" type="TEXT" id="keyRenewalInterval1" name="keyRenewalInterval1" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">seconds(0 ~ 4194303)</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
	var rekeystr = "3600";
	if("N/A" == rekeystr || "" == rekeystr)
		document.getElementById('keyRenewalInterval1').value = "3600";
	else
		document.getElementById('keyRenewalInterval1').value = rekeystr;
</script>
										</div>
										</div>


                                         <div class="row col-md-12" id="WPAPSK_div" style="display: none;">
										<div class="col-md-3 form-group">
											<label>Encryption Type:</label>
                                            <select id="TKIP_Selection5" name="TKIP_Selection5" onchange="doEncryptionChange(this)" size="1" class="custom-select">
				<option value="TKIP">TKIP</option>
				<option value="AES" selected="">AES</option>
				<option value="TKIPAES">TKIP+AES</option>
				</select>
										</div>
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","PresharedKeyText","s")%></label>
											<div class="input-group">
                                            <input class="form-control" type="password" id="PreSharedKey2" name="PreSharedKey2" style="WIDTH:140" size="48" maxlength="64" value="<% If tcWebApi_get("WLan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPAPSK","s") end if %>">
												</div>
												<div class="input-group-append">
												  <span class="input-group-text">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)&nbsp;&nbsp;<i class="fa fa-eye" onclick="PreSharedKey2showhide()" id="PreSharedKey2Keye"></i></span>
												</div>
										</div>
										<div class="col-md-3 form-group">
											<label><%tcWebApi_get("String_Entry","KeyRenwalText","s")%></label>
											<div class="input-group">
                                                  <input class="form-control" type="TEXT" id="keyRenewalInterval2" name="keyRenewalInterval2" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">"String_Entry","SecondsText","s")%>(0 ~ 4194303)</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
														var rekeystr = "<% tcWebApi_get("WLan11ac_Entry","RekeyInterval","s") %>";
														if("N/A" == rekeystr || "" == rekeystr)
															document.getElementById('keyRenewalInterval1').value = "3600";
														else
															document.getElementById('keyRenewalInterval1').value = rekeystr;
													</script>
										</div>
                                        </div>

                                         <div class="row col-md-12" id="WPAPSKWPA2PSK_div" style="display: none;">
                                       
										<div class="col-md-3 form-group">
											<label>Encryption Type:</label>
                                            <select id="TKIP_Selection6" name="TKIP_Selection6" onchange="doEncryptionChange(this)" size="1" class="custom-select">
				<option value="TKIP">TKIP</option>
				<option value="AES" selected="">AES</option>
				<option value="TKIPAES">TKIP+AES</option>
				</select>
										</div>
										<div class="col-md-3 form-group">
											<label>PreShared Key:</label>
											<div class="input-group">
                                            <span id="inpsw"><input class="form-control" type="password" id="PreSharedKey3" name="PreSharedKey3" style="WIDTH:140" size="48" maxlength="64" value="12345678">
												  </span></div>
												  <div class="input-group-append">
													<span class="input-group-text">(8~63characters or 64 hexadecimal string)&nbsp;&nbsp;<i class="fa fa-eye" onclick="inpsShowhide()" id="inpswEye"></i></span>
												  </div>

										</div>
										<div class="col-md-3 form-group">
											<label>Key Renewal Interval1:</label>
											<div class="input-group">
                                            <input class="form-control" type="TEXT" id="keyRenewalInterval3" name="keyRenewalInterval3" size="7" maxlength="7">
												  <div class="input-group-append">
													<span class="input-group-text">seconds(0 ~ 4194303)</span>
												  </div>
													</div>
                                                    <script language="JavaScript" type="text/JavaScript">
	var rekeystr = "3600";
	if("N/A" == rekeystr || "" == rekeystr)
		document.getElementById('keyRenewalInterval3').value = "3600";
	else
		document.getElementById('keyRenewalInterval3').value = rekeystr;
</script>
										</div>
  </div>
<div id="WPA2PSKWPA3PSK_div" class="row col-md-12" style="display: none;">
	<div class="col-md-3 form-group">
											<label>Encryption Type:</label>
											<select name="TKIP_Selection_WPA2WPA3" onchange="doEncryptionChange(this)" size="1" class="custom-select">
												<option value="AES" selected="selected">AES</option>
												<option value="TKIP" disabled="true">TKIP</option>
												<option value="TKIPAES" disabled="true">TKIP+AES</option>
											</select>
							</div>
							<div class="col-md-4 form-group">
								<label>PreShared Key:</label>
								<div class="input-group">
										<input class="form-control" type="password" id="PreSharedKey_WPA2WPA3" name="PreSharedKey_WPA2WPA3" style="WIDTH:140" size="48" maxlength="64" value="12345678" onblur="wpapskCheck(this)">	
										</div>
										<div class="input-group-append">
											<span class="input-group-text">(8~63characters or 64 hexadecimal string)&nbsp;&nbsp;<i class="fa fa-eye" onclick="WPA2WPA3showhide()" id="WPA2WPA3eye"></i>	</span>
											</div>
								</div>
								<div class="col-md-3 form-group hide" style="display: none">
								<label>Key Renewal Interval1:</label>
									<input class="form-control" type="TEXT" id="keyRenewalInterval_WPA2WPA3" name="keyRenewalInterval_WPA2WPA3" size="7" maxlength="7" onblur="checkRekeyinteral(this.value, 0)">??? (0 ~ 4194303)
												<script language="JavaScript" type="text/JavaScript">
													var rekeystr = "3600";
													if("N/A" == rekeystr || "" == rekeystr)
														document.getElementById('keyRenewalInterval_WPA2WPA3').value = "3600";
													else
														document.getElementById('keyRenewalInterval_WPA2WPA3').value = rekeystr;
												</script>
								</div>
							
							</div>
							<div id="WPA3PSK_div" class="row col-md-12" style="display: none;">
								<div class="col-md-3 form-group">
											<label>Encryption Type:</label>
											<select name="TKIP_Selection_WPA3" onchange="doEncryptionChange(this)" size="1" class="custom-select">
												<option value="AES" selected="selected" )="">AES</option>
												<option value="TKIP" disabled="true">TKIP</option>
												<option value="TKIPAES" disabled="true">TKIP+AES</option>
											</select>
							</div>
							<div class="col-md-4 form-group">
								<label>PreShared Key:</label>
								<div class="input-group">
									<input class="form-control" type="password" id="PreSharedKey_WPA3" name="PreSharedKey_WPA3" style="WIDTH:140" size="48" maxlength="64" value="12345678" onblur="wpapskCheck(this)">
										
										</div>
										<div class="input-group-append">
											<span class="input-group-text">(8~63characters or 64 hexadecimal string)&nbsp;&nbsp;<i class="fa fa-eye" onclick="WPA3PSKshowhide()" id="WPA3PSKeye"></i>	</span>
											</div>
								</div>
								<div class="col-md-3 form-group hide" style="display: none">
								<label>Key Renewal Interval1:</label>
								<input class="form-control" type="TEXT" id="keyRenewalInterval_WPA3" name="keyRenewalInterval_WPA3" size="7" maxlength="7" onblur="checkRekeyinteral(this.value, 0)">seconds(0 ~ 4194303)
											<script language="JavaScript" type="text/JavaScript">
												var rekeystr = "3600";
												if("N/A" == rekeystr || "" == rekeystr)
													document.getElementById('keyRenewalInterval_WPA3').value = "3600";
												else
													document.getElementById('keyRenewalInterval_WPA3').value = rekeystr;
											</script>
								</div>
						</div>




  
										<div class="col-md-12 form-group">
										<h2 class="sub_heading" style="color:#fd7e14">WDS Enable</h2>
											<div class="custom-control custom-radio custom-control-inline">
                                            <input class="custom-control-input" type="RADIO" id="WLAN_WDS_Active_Open" name="WLAN_WDS_Active" value="1" onclick="autoWLAN_WDS_Active()">
												  <label class="custom-control-label" for="WLAN_WDS_Active_Open">Open</label>
												</div>
												<div class="custom-control custom-radio custom-control-inline">
												  <input type="RADIO" class="custom-control-input" id="WLAN_WDS_Active_Close" name="WLAN_WDS_Active" value="0" onclick="autoWLAN_WDS_Deactive()" checked="">
												  <label class="custom-control-label" for="WLAN_WDS_Active_Close">Close</label>
												</div>
										</div>
                                        <div class="row col-md-12" id="else_div" style="">
										<div class="col-md-3 form-group">
											<label>WDS<%tcWebApi_get("String_Entry","EncryptionTypeText","s")%></label>
                                            <select class="custom-select" id="WDS_EncrypType_Selection" name="WDS_EncrypType_Selection" size="1" onchange="doWDSEncrypTypeChange()" disabled="">
				<option value="TKIP" <% If tcWebApi_get("WLan11ac_WDS","WdsEncrypType","h") = "TKIP" then asp_Write("selected") end if %>>TKIP</option>
				<option value="AES" <% if tcWebApi_get("WLan11ac_WDS","WdsEncrypType","h") = "AES" then asp_Write("selected") end if %>>TKIPAES</option>
				</select>
										</div>
										<div class="col-md-3 form-group">
											<label>WDS<%tcWebApi_get("String_Entry","KeyText","s")%></label>
											<div class="input-group">
                                            <input class="form-control" type="password" id="WDS_Key" name="WDS_Key" size="48" maxlength="64" value="<% If tcWebApi_get("WLan11ac_WDS","WdsKey","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","WdsKey","s") end if %>" disabled="">
												</div>
												<div class="input-group-append">
													<span class="input-group-text">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)&nbsp;&nbsp;<i class="fa fa-eye" onclick="WDSshowhide()" id="WDSeye"></i>	</span>
													</div>
													</div>
													
										</div>

							
										<div class="col-md-12 form-group row">
											
										<div class="col-md-3 form-group">
                                        <label>WDS Peer MAC #1</label>
                                            <input type="TEXT" id="WLANWDS_PEER_MAC1" class="form-control" name="WLANWDS_PEER_MAC1" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC0","s") end if %>" disabled="">
										</div>
										<div class="col-md-3 form-group">
											<label>WDS Peer MAC #2</label>
                                            <input class="form-control" type="TEXT" id="WLANWDS_PEER_MAC2" name="WLANWDS_PEER_MAC2" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC1","s") end if %>" disabled="">
										</div>
										<div class="col-md-3 form-group">
											<label>WDS Peer MAC #3</label>
                                            <input class="form-control" type="TEXT" id="WLANWDS_PEER_MAC3" name="WLANWDS_PEER_MAC3" style="WIDTH:140" size="20" maxlength="20" value="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC2","s") end if %>" disabled="">
										</div>
										<div class="col-md-3 form-group">
											<label>WDS Peer MAC #4</label>
                                            <input class="form-control" type="TEXT" id="WLANWDS_PEER_MAC4" name="WLANWDS_PEER_MAC4" style="WIDTH:140" size="20" maxlength="20" value="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC3","s") end if %>" disabled="">
										</div>
									</div>
                                         	
										<div class="col-md-12 form-group">
										<h2 class="sub_heading" style="color:#fd7e14">MAC Filter</h2>
											<div class="custom-control custom-radio custom-control-inline">
                                            <input class="custom-control-input" type="RADIO" id="WLAN_FltActive_Open" name="WLAN_FltActive" value="1" onclick="autoWLAN_Flt_Active()" <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") <> "0" then asp_Write("checked") end if %>>
												  <label class="custom-control-label" for="WLAN_FltActive_Open"><%tcWebApi_get("String_Entry","OpenText","s")%></label>
												</div>
												<div class="custom-control custom-radio custom-control-inline">
                                                <input class="custom-control-input" type="RADIO" id="WLAN_FltActive_Close" name="WLAN_FltActive" value="0" onclick="autoWLAN_Flt_Deactive()" <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "N/A" then asp_Write("checked") end if %> checked="">
												  <label class="custom-control-label" for="WLAN_FltActive_Close"><%tcWebApi_get("String_Entry","CloseText","s")%></label>
												</div>
										</div>
										<div class="col-md-3 form-group">
											<label>Action</label>
                                            <select id="WLAN_FltAction" name="WLAN_FltAction" size="1" class="custom-select">
				<option value="1" <% if tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "1" then asp_Write("selected") end if %>>Allow</option>
				<option value="2" <% if tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "2" then asp_Write("selected") end if %>>Deny</option>
				</select>
										</div>
										<div class="col-md-12 form-group row">
											
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#1</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC1" name="WLANFLT_MAC1" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC0","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC0","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#2</label>
                                            <input type="TEXT" class="form-control" id="WLANFLT_MAC2" name="WLANFLT_MAC2" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC1","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC1","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#3</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC3" name="WLANFLT_MAC3" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC2","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC2","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#4</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC4" name="WLANFLT_MAC4" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC3","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC3","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#5</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC5" name="WLANFLT_MAC5" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC4","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC4","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#6</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC6" name="WLANFLT_MAC6" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC5","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC5","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#7</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC7" name="WLANFLT_MAC7" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC6","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC6","s") end if %>">
										</div>
										<div class="col-md-3 form-group">
											<label>Mac<%tcWebApi_get("String_Entry","AddressText","s")%>#8</label>
                                            <input class="form-control" type="TEXT" id="WLANFLT_MAC8" name="WLANFLT_MAC8" style="WIDTH:140" size="20" maxlength="20" value="<% if tcWebApi_get("WLan11ac_Entry","WLan_MAC7","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WLan_MAC7","s") end if %>">
										</div>
									</div>
                                           <div class="col-md-12 row">
</div>
										<hr class="margin_adjs">

										<div class="form-footer text-right">
										<button class="btn btn-orang btn-lg" type="button" onclick="doSave()">Apply</button>
										<button class="btn btn-secondary btn-lg " type="button" onclick="RefreshPage()">Cancel</button>
										</div>
								</div>
                                
							</div></form>
                        
						</div>
                    </div>
                </div>
            </div>
        <div class="text-center p-3"  style="background-color: rgb(235 234 234 / 20%);">
    &COPY; 2023 Copyright :
    <a class="text-white" style="color:#fd7e14 !important;" href="#">Syrotech Networks Pvt. Ltd.</a>
  </div>
</div>    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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