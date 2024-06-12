<%
tcWebApi_constSet("WebCurSet_Entry", "isLOIDLocked", "No")
if tcWebApi_get("WebCustom_Entry", "isCTPONYN1PortSupported", "h") = "Yes"  then
        tcWebApi_constSet("WebCurSet_Entry", "isLOIDLocked", "Yes")
elseif tcWebApi_get("WebCustom_Entry", "isCTPONJSSupported", "h") = "Yes"  then
        if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then
                tcWebApi_constSet("WebCurSet_Entry", "isLOIDLocked", "Yes")
        end if
elseif tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then
        if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then
                tcWebApi_constSet("WebCurSet_Entry", "isLOIDLocked", "Yes")
        end if
elseif tcWebApi_get("WebCustom_Entry", "isCTPONCZNXSupported", "h") = "Yes"  then
        if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then
                tcWebApi_constSet("WebCurSet_Entry", "isLOIDLocked", "Yes")
        end if
end if

if Request_Form("SaveFlag") = "1" then

        TCWebApi_set("Cwmp_Entry","Active","ActiveCwmpFlag")
        if Request_Form("isMidwareSupported") = "1" then
                TCWebApi_set("Cwmp_Entry","Tr069Enable","EnTr069Flag")
                if Request_Form("EnTr069Flag") <> "1" then
                        TCWebApi_set("Cwmp_Entry","MWMgtUrl","MiddlewareAddress" )
                        TCWebApi_set("Cwmp_Entry","MWMgtPort","MiddlewarePort" )
                end if
        end if

        TCWebApi_set("Cwmp_Entry","periodActive","PeriodicInformEnable")
                TCWebApi_set("Cwmp_Entry","periodInterval","PeriodicInformInterval" )
                TCWebApi_set("Cwmp_Entry","prdInformTime","PeriodicInformTime" )
                TCWebApi_set("Cwmp_Entry","acsUrl","URL" )
                TCWebApi_set("Cwmp_Entry","conReqPort","ConnReqPort" )
                TCWebApi_set("Cwmp_Entry","acsUserName","Username" )
                TCWebApi_set("Cwmp_Entry","acsPassword","Password" )
                TCWebApi_set("Cwmp_Entry","conReqUserName","ConnectionRequestUsername" )
                TCWebApi_set("Cwmp_Entry","conReqPassword","ConnectionRequestPassword" )
                TCWebApi_set("Cwmp_Entry","EnableCert","X_ATP_SSLCertEnable")
                if tcwebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" then
                        TCWebApi_set("Cwmp_Entry","sslAuthMode","sslAuthMode")
                end if
        TCWebApi_commit("Cwmp_Entry")
        TCWebApi_save()
elseif Request_Form("SaveSTUNFlag") ="1" then
        TCWebApi_set("Stun_Entry","Enable","StunEnable")
        TCWebApi_set("Stun_Entry","ServerAddr","StunServerAddr")
        TCWebApi_set("Stun_Entry","ServerPort","StunServerPort")
        TCWebApi_set("Stun_Entry","IFIP1","WanIP1")
    TCWebApi_set("Stun_Entry","IFIP2","WanIP2")
    TCWebApi_set("Stun_Entry","IFIP3","WanIP3")
        TCWebApi_set("Stun_Entry","Port","StunClientPort")
        TCWebApi_set("Stun_Entry","AutoPortEnable","AutoStunPortEnableFlag")
        TCWebApi_set("Stun_Entry","Max","StunKeepAliveMaxTime")
        TCWebApi_set("Stun_Entry","Min","StunKeepAliveMinTime")
        TCWebApi_commit("Stun_Entry")
        TCWebApi_save()
elseif Request_Form("postflag") = "1" then
        if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then
                if tcwebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" then
                        TCWebApi_set("Cwmp_Entry","UpgradeCAFlag","fileIndex")
                        TCWebApi_commit("Cwmp_Entry")
                else
                TCWebApi_set("SslCA_Flag","UpgradeFlag","fileIndex")
                TCWebApi_commit("SslCA")
                end if
        'tcWebApi_set("System_Entry","upgrade_fw","fileIndex")
        'tcWebApi_Commit("System_Entry")
        end if
elseif Request_Form("SubmitFlag") = "1" then
if Request_Form("PasswordFlag") = "1" then
        TCWebApi_set("GPON_ONU","PasswordFlag","PasswordFlag")
        TCWebApi_set("GPON_ONU","HexFlag","HexFlag")
        TCWebApi_set("GPON_ONU","Password","PasswordPwd")
        if Request_Form("PasswordSN") <> "" then
            TCWebApi_set("GPON_ONU","SerialNumber","PasswordSN")
        end if
        TCWebApi_commit("GPON_ONU")
        TCWebApi_save()
else
if tcWebApi_get("WebCurSet_Entry", "isLOIDLocked", "h") <> "Yes"  then
if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") = "Yes" then
                TCWebApi_set("GPON_ONU","Password","LoidPassword")
else
                TCWebApi_set("EPON_LOIDAuth","LOID0","LoidUsername")
                TCWebApi_set("EPON_LOIDAuth","Password0","LoidPassword")
                TCWebApi_set("GPON_LOIDAuth","LOID","LoidUsername")
                TCWebApi_set("GPON_LOIDAuth","Password","LoidPassword")
end if
                TCWebApi_save()
if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") = "Yes" then
        TCWebApi_commit("GPON_ONU")
else
                TCWebApi_commit("EPON_LOIDAuth")
                TCWebApi_commit("GPON_LOIDAuth")
end if
end if
end if
        TCWebApi_set("GPON_ONU","PasswordFlag","PasswordFlag")
        TCWebApi_commit("GPON_ONU")
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
    <title>
        Binding</title>
    <link href="/css/scoop-vertical.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/simple-line-icons.css" rel="stylesheet">
    <link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <script language="javascript" src="/JS/menu.js"></script>
<script language="javascript" src="/JS/myscript.js"></script>


<script language="javascript" src="/JS/util.js"></script>
<script language="javascript" src="/JS/util.js"></script>
<!-- <script language="javascript" type="text/javascript">
function stCWMP(domain,InformEnb,Interval,URL,Username,Password,CntReqName,CntReqPwd,sslCertEnbl)
{
this.domain = domain;
this.InformEnb = InformEnb;
this.Interval = Interval;
this.URL = URL;
this.Username = Username;
this.Password = Password;
this.CntReqName = CntReqName;
this.CntReqPwd = CntReqPwd;
this.sslCertEnbl = sslCertEnbl;
}
var URLAccessAttr = 'Subscriber';
var UsrAccessAttr = 'Subscriber';
var PwdAccessAttr = 'Subscriber';
var conUsrAccessAttr = 'Subscriber';
var conPwdAccessAttr = 'Subscriber';
var temp = new Array(new stCWMP("InternetGatewayDevice.ManagementServer","1","20","http://122.193.99.166:80/comserver/node1/tr069","hgw","hgw","itms","itms","0"),null);
var cwmp = temp[0];
var msg = new Array(6);

var midLastRadioValue = "0";
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
msg[0] = "<%tcWebApi_get("String_Entry","UploadSuccessText","s")%>";
msg[1] = "<%tcWebApi_get("String_Entry","CertificateIllegalText","s")%>";
msg[2] = "<%tcWebApi_get("String_Entry","ProhibitedText","s")%>";
msg[3] = "<%tcWebApi_get("String_Entry","EnabledText","s")%>";
msg[4] = "<%tcWebApi_get("String_Entry","UploadFirstText","s")%>";
msg[5] = "<%tcWebApi_get("String_Entry","FailToUploadText","s")%>";
<% end if %>

<%if tcWebApi_get("WebCustom_Entry", "isCTPONCYSupported", "h") = "Yes"  then%>
function trimspace(str)
{
        var strTemp = new String(str);
        while (-1 != strTemp.search(" "))
        {
                strTemp = strTemp.replace(" ", "");
        }
        return strTemp;
}
<%end if%>


function isSafeStringSN(val)
{
if ( val == "" )
{
return false;
}
for ( var j = 0 ; j < val.length ; j++ )
{
if ( !isSafeCharSN(val.charAt(j)) )
{
return false;
}
}
return true;
}
function isSafeCharSN(val)
{
if (((val >= 'A')&&(val <= 'Z'))
||((val >= 'a')&&(val <= 'z'))
||((val >= '0')&&(val <= '9'))
||(val == ':')||(val == '/')
||(val == '-')||(val == '.')
||(val == '_'))
{
return true;
}
else
{
return false;
}
}

function isTimeFormat(str)
{
        if(str.length > 20 || str.length < 19)  //0001-01-01T00:00:00Z
                return false;

        if(str.substr(10, 1) != 'T' || str.substr(4, 1) != '-' || str.substr(7, 1) != '-' ||  str.substr(13, 1) != ':' || str.substr(16, 1) != ':' || (str.substr(19, 1) != 'Z' && str.length == 20))
                return false;

        if(str.substr(0, 4) < '0001' || str.substr(0, 4) > '9999')
                return false;

        if(str.substr(5, 2) < '01' || str.substr(5, 2) > '12')
                return false;

        if(str.substr(8, 2) < '01' || str.substr(8, 2) > '31')
                return false;

        if(str.substr(11, 2) < '00' || str.substr(11, 2) > '23')
                return false;

        if(str.substr(14, 2) < '00' || str.substr(14, 2) > '59')
                return false;

        if(str.substr(17, 2) < '00' || str.substr(17, 2) > '59')
                return false;

        return true;

}

function isSafeStringSN(val)
{
if (val == "")
{
return true;
}
for ( var j = 0 ; j < val.length ; j++ )
{
if ( !isSafeCharSN(val.charAt(j)) )
{
return false;
}
}
return true;
}
function AddSubmitParam(SubmitForm,type)
{
/*var MiddlewareURL;
SubmitForm.addForm('ConfigForm','x');
SubmitForm.addParameter('y.Tr069Enable', getRadioVal("Tr069Enable"));
if ((0 == getRadioVal("Tr069Enable")) || (2 == getRadioVal("Tr069Enable")))
{
MiddlewareURL = getValue("MiddlewareAddress") + ":" + getValue("MiddlewarePort");
SubmitForm.addParameter('y.MiddlewareURL', MiddlewareURL);
}
SubmitForm.setAction('setcfg.cgi?x=InternetGatewayDevice.ManagementServer&y=InternetGatewayDevice.DeviceInfo.X_CT-COM_MiddlewareMgt&'
+ 'RequestFile=html/network/tr069.asp');*/
}
function SubmitCert()
{
        var SslForm =document.SslForm;
        var string = SslForm.filename.value.search(/pem/);

                if(SslForm.filename.value=="")
                {
                        alert("<%tcWebApi_get("String_Entry","SelectFileUploadText","s")%>");
                }
                else
                {
                        SslForm.postflag.value = "1";
                        resetEBooValueCookie();
                        SslForm.submit();
                }

}



</script> -->
<!-- <script>
    
function applySave()

{
    if (document.STUNForm.UseAutoStunPortEnable.checked)
    {
        document.STUNForm.AutoStunPortEnableFlag.value = "1";
    }
    else
    {
        document.STUNForm.AutoStunPortEnableFlag.value = "0";
    }

    if(CheckSTUNForm() == false)
    {
        return;
    }

    document.STUNForm.SaveSTUNFlag.value = "1";
    if( true == setEBooValueCookie(document.STUNForm) )
    {
        document.STUNForm.submit();
    }
}

</script> -->
<SCRIPT language=JavaScript type=text/javascript>
    function stCWMP(domain,InformEnb,Interval,URL,Username,Password,CntReqName,CntReqPwd,sslCertEnbl)
    {
    this.domain = domain;
    this.InformEnb = InformEnb;
    this.Interval = Interval;
    this.URL = URL;
    this.Username = Username;
    this.Password = Password;
    this.CntReqName = CntReqName;
    this.CntReqPwd = CntReqPwd;
    this.sslCertEnbl = sslCertEnbl;
    }
    var URLAccessAttr = 'Subscriber';
    var UsrAccessAttr = 'Subscriber';
    var PwdAccessAttr = 'Subscriber';
    var conUsrAccessAttr = 'Subscriber';
    var conPwdAccessAttr = 'Subscriber';
    var temp = new Array(new stCWMP("InternetGatewayDevice.ManagementServer","1","20","http://122.193.99.166:80/comserver/node1/tr069","hgw","hgw","itms","itms","0"),null);
    var cwmp = temp[0];
    var msg = new Array(6);
    
    var midLastRadioValue = "0";
    <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
    msg[0] = "<%tcWebApi_get("String_Entry","UploadSuccessText","s")%>";
    msg[1] = "<%tcWebApi_get("String_Entry","CertificateIllegalText","s")%>";
    msg[2] = "<%tcWebApi_get("String_Entry","ProhibitedText","s")%>";
    msg[3] = "<%tcWebApi_get("String_Entry","EnabledText","s")%>";
    msg[4] = "<%tcWebApi_get("String_Entry","UploadFirstText","s")%>";
    msg[5] = "<%tcWebApi_get("String_Entry","FailToUploadText","s")%>";
    <% end if %>
    
    <%if tcWebApi_get("WebCustom_Entry", "isCTPONCYSupported", "h") = "Yes"  then%>
    function trimspace(str)
    {
            var strTemp = new String(str);
            while (-1 != strTemp.search(" "))
            {
                    strTemp = strTemp.replace(" ", "");
            }
            return strTemp;
    }
    <%end if%>
    
    
    function isSafeStringSN(val)
    {
    if ( val == "" )
    {
    return false;
    }
    for ( var j = 0 ; j < val.length ; j++ )
    {
    if ( !isSafeCharSN(val.charAt(j)) )
    {
    return false;
    }
    }
    return true;
    }
    function isSafeCharSN(val)
    {
    if (((val >= 'A')&&(val <= 'Z'))
    ||((val >= 'a')&&(val <= 'z'))
    ||((val >= '0')&&(val <= '9'))
    ||(val == ':')||(val == '/')
    ||(val == '-')||(val == '.')
    ||(val == '_'))
    {
    return true;
    }
    else
    {
    return false;
    }
    }
    
    function isTimeFormat(str)
    {
            if(str.length > 20 || str.length < 19)  //0001-01-01T00:00:00Z
                    return false;
    
            if(str.substr(10, 1) != 'T' || str.substr(4, 1) != '-' || str.substr(7, 1) != '-' ||¡¡str.substr(13, 1) != ':' || str.substr(16, 1) != ':' || (str.substr(19, 1) != 'Z' && str.length == 20))
                    return false;
    
            if(str.substr(0, 4) < '0001' || str.substr(0, 4) > '9999')
                    return false;
    
            if(str.substr(5, 2) < '01' || str.substr(5, 2) > '12')
                    return false;
    
            if(str.substr(8, 2) < '01' || str.substr(8, 2) > '31')
                    return false;
    
            if(str.substr(11, 2) < '00' || str.substr(11, 2) > '23')
                    return false;
    
            if(str.substr(14, 2) < '00' || str.substr(14, 2) > '59')
                    return false;
    
            if(str.substr(17, 2) < '00' || str.substr(17, 2) > '59')
                    return false;
    
            return true;
    
    }
    
    function isSafeStringSN(val)
    {
    if (val == "")
    {
    return true;
    }
    for ( var j = 0 ; j < val.length ; j++ )
    {
    if ( !isSafeCharSN(val.charAt(j)) )
    {
    return false;
    }
    }
    return true;
    }
    function AddSubmitParam(SubmitForm,type)
    {
    /*var MiddlewareURL;
    SubmitForm.addForm('ConfigForm','x');
    SubmitForm.addParameter('y.Tr069Enable', getRadioVal("Tr069Enable"));
    if ((0 == getRadioVal("Tr069Enable")) || (2 == getRadioVal("Tr069Enable")))
    {
    MiddlewareURL = getValue("MiddlewareAddress") + ":" + getValue("MiddlewarePort");
    SubmitForm.addParameter('y.MiddlewareURL', MiddlewareURL);
    }
    SubmitForm.setAction('setcfg.cgi?x=InternetGatewayDevice.ManagementServer&y=InternetGatewayDevice.DeviceInfo.X_CT-COM_MiddlewareMgt&'
    + 'RequestFile=html/network/tr069.asp');*/
    }
    function SubmitCert()
    {
            var SslForm =document.SslForm;
            var string = SslForm.filename.value.search(/pem/);
    
                    if(SslForm.filename.value=="")
                    {
                            alert("<%tcWebApi_get("String_Entry","SelectFileUploadText","s")%>");
                    }
                    else
                    {
                            SslForm.postflag.value = "1";
                            resetEBooValueCookie();
                            SslForm.submit();
                    }
    
    }
    
    function applySave()
    {
        if (document.STUNForm.UseAutoStunPortEnable.checked)
        {
            document.STUNForm.AutoStunPortEnableFlag.value = "1";
        }
        else
        {
            document.STUNForm.AutoStunPortEnableFlag.value = "0";
        }
    
        if(CheckSTUNForm() == false)
        {
            return;
        }
    
        document.STUNForm.SaveSTUNFlag.value = "1";
        if( true == setEBooValueCookie(document.STUNForm) )
        {
            document.STUNForm.submit();
        }
    }
    
    </SCRIPT>
<style>
.PasswordPwdEye{
                position: relative;
                float: right;
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
}    .white_box {
    background: #fff;
    border-radius: 4px;
    box-shadow: 0px 0px 6px rgba(0,0,0,0.1);
    padding: 15px;
    margin-bottom: 20px;
    }
    .heading_margin {
    margin-bottom: 15px;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;

}
</style>

    
</head>
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
                                        MakeHeader('<%tcWebApi_get("String_Entry","GatewayNameText","s")%>','<%tcWebApi_get("String_Entry","ModeText","s")%>','<%tcWebApi_get("String_Entry","ContentNetText","s")%>','<%tcWebApi_get("String_Entry","ContentCWMPText","s")%>','<%tcWebApi_get("String_Entry","WelcomeSettingText","s")%>','<%tcWebApi_get("String_Entry","logoHerf","s")%>');
                                        </SCRIPT>
                            </div>                  
                <div class="">
 
 
                         <div class="scoop-inner-content">


                                                          <h1 class="heading_big bei pb-3">CWMP</h1>

                                                                <div class="white_box" name="CwmpConfig">
                                                                        <h1 class="heading_grey heading_margin"><img src="../img/server.png" width="45" height="40" class="img_sub" alt=""/><span style="vertical-align:middle;"> CWMP <%tcWebApi_get("String_Entry","ServerText","s")%></h1>
                                                                        <div class="container-fluid">
                                                                        <div class="lighter_grey_bg">
                                                                                        <p><%tcWebApi_get("String_Entry","Protocol1Text","s")%></p>
                                            <p><%tcWebApi_get("String_Entry","Protocol2Text","s")%> </p>
                                            <p><%tcWebApi_get("String_Entry","Protocol3Text","s")%> </p>
                                                                                </div>
                                    <form  class="row" name="ConfigForm" action="/cgi-bin/net-tr069.asp" method="post">

                                                                                <div class="col-md-12 form-group" id="En069Info">
                                                                                        <h2 class="sub_heading"><%tcWebApi_get("String_Entry","MiddlewareModeText","s")%></h2>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                                  <input onclick="ntpEnbltr069()" type="radio" value="0" class="custom-control-input" id="customRadioInline5"
                        name="Tr069Enable" <%if TCWebApi_get("Cwmp_Entry","Tr069Enable","h") = "0" then asp_Write("checked") end if %>/>
                                                                                                  <label class="custom-control-label" for="customRadioInline5"><%tcWebApi_get("String_Entry","OpenMiddleware1Text","s")%></label>
                                                                                                </div>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input onclick="ntpEnbltr069()" type="radio" value="1"  class="custom-control-input" id="customRadioInline6"
                        name="Tr069Enable" <%if TCWebApi_get("Cwmp_Entry","Tr069Enable","h") = "1" then asp_Write("checked") end if %>/>
                        <%tcWebApi_get("String_Entry","CloseMiddlewareText","s")%>
                                                                                                  <label class="custom-control-label" for="customRadioInline6"> <%tcWebApi_get("String_Entry","CloseMiddlewareText","s")%></label>
                                                                                                </div>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                                  <input onclick=ntpEnbltr069() type=radio value="2"   class="custom-control-input" id="customRadioInline7"
                        name="Tr069Enable" <%if TCWebApi_get("Cwmp_Entry","Tr069Enable","h") = "2" then asp_Write("checked") end if %>/>
                                                                                                  <label class="custom-control-label" for="customRadioInline7"><%tcWebApi_get("String_Entry","OpenMiddleware2Text","s")%></label>
                                                                                                </div>
                                                                                </div>
                                        <div class="row">
                                        <input type="hidden" name="EnTr069Flag" value="<% tcWebApi_get("Cwmp_Entry","Tr069Enable","s") %>">
                          <input type="hidden" name="ActiveCwmpFlag" value="<% tcWebApi_get("Cwmp_Entry","Active","s") %>">
                                <INPUT TYPE="HIDDEN" NAME="isMidwareSupported" value="<% if tcWebApi_get("WebCustom_Entry","isMidwareSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
                          <!-- <script language="JavaScript" type="text/JavaScript">
function ntpEnbltr069()
{
with (getElById ("ConfigForm"))
{
        if(midLastRadioValue == "0" && Tr069Enable[2].checked == true || midLastRadioValue == "2" && Tr069Enable[0].checked == true)
        {
                alert("<%tcWebApi_get("String_Entry","OpenMiddleware3Text","s")%>");
                if(midLastRadioValue == "0")
                        Tr069Enable[0].checked = true;
                else
                        Tr069Enable[2].checked = true;
        }

        if(midLastRadioValue == "0" && Tr069Enable[1].checked == true || midLastRadioValue == "1" && Tr069Enable[0].checked == true)
                alert("<%tcWebApi_get("String_Entry","OpenMiddleware4Text","s")%>");

        if (Tr069Enable[1].checked == true)
        {
                setDisplay("midurl", 0);
                ActiveCwmpFlag.value = "Yes";
                EnTr069Flag.value = "1";
        }
        else
        {
                setDisplay("midurl", 1);
                if(Tr069Enable[0].checked == true)
                {
                        ActiveCwmpFlag.value = "Yes";
                        EnTr069Flag.value = "0";
                }
                else
                {
                        ActiveCwmpFlag.value = "Yes";
                        EnTr069Flag.value = "2";
                }
        }
}
}
if(document.ConfigForm.isMidwareSupported.value == 1)
        getElById("En069Info").style.display = "";
else
getElById("En069Info").style.display = "none";

</script> -->
<script language="JavaScript" type="text/JavaScript">
    function ntpEnbltr069()
    {
    with (getElById ("ConfigForm"))
    {
            if(midLastRadioValue == "0" && Tr069Enable[2].checked == true || midLastRadioValue == "2" && Tr069Enable[0].checked == true)
            {
                    alert("<%tcWebApi_get("String_Entry","OpenMiddleware3Text","s")%>");
                    if(midLastRadioValue == "0")
                            Tr069Enable[0].checked = true;
                    else
                            Tr069Enable[2].checked = true;
            }
    
            if(midLastRadioValue == "0" && Tr069Enable[1].checked == true || midLastRadioValue == "1" && Tr069Enable[0].checked == true)
                    alert("<%tcWebApi_get("String_Entry","OpenMiddleware4Text","s")%>");
    
            if (Tr069Enable[1].checked == true)
            {
                    setDisplay("midurl", 0);
                    ActiveCwmpFlag.value = "Yes";
                    EnTr069Flag.value = "1";
            }
            else
            {
                    setDisplay("midurl", 1);
                    if(Tr069Enable[0].checked == true)
                    {
                            ActiveCwmpFlag.value = "Yes";
                            EnTr069Flag.value = "0";
                    }
                    else
                    {
                            ActiveCwmpFlag.value = "Yes";
                            EnTr069Flag.value = "2";
                    }
            }
    }
    }
    if(document.ConfigForm.isMidwareSupported.value == 1)
            getElById("En069Info").style.display = "";
    else
    getElById("En069Info").style.display = "none";
    
    </script>
</div>
                                         <div class="row" id="midurl">
                                                                                <div class="col-md-12 form-group">
                                                                                        <h2 class="sub_heading"><%tcWebApi_get("String_Entry","MiddlewareServerText","s")%>URL</h2>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","AddressText","s")%></label>
                                            <input id=MiddlewareAddress maxLength=256 type="text" class="form-control"
                        name="MiddlewareAddress" value="<%if tcWebApi_get("Cwmp_Entry","MWMgtUrl","h") <> "N/A" then tcWebApi_get("Cwmp_Entry","MWMgtUrl","s") end if %>"/>
                                                                                </div>
                                                                                <div class="col-md-2 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","PortText","s")%></label>
                                            <INPUT id="MiddlewarePort" maxLength="256" type="text" class="form-control"
                        size=8 name="MiddlewarePort" value="<% if TCWebApi_get("Cwmp_Entry","MWMgtPort","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","MWMgtPort","s") end if %>">
                                                                                </div>
                                        </div>

                                                                                <div class="col-md-12 form-group custom-control">
                                                                                        <h2 class="sub_heading custom-control " style="color:#fd7e14;"><%tcWebApi_get("String_Entry","Periodic1Text","s")%></h2>
                                                                                        <div class="custom-control col-md-3">
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                                  <input class="custom-control-input" id="PeriodicInformEnable" type="radio" value="No" name="PeriodicInformEnable" <%if TCWebApi_get("Cwmp_Entry","periodActive","h") = "No" then asp_Write("checked") end if %>/>
                                                                                                  <label class="custom-control-label" for="PeriodicInformEnable"><%tcWebApi_get("String_Entry","DisableText","s")%></label>
                                                                                                </div>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                                  <input id="radio" type="radio" value="Yes" name="PeriodicInformEnable" class="custom-control-input" <%if TCWebApi_get("Cwmp_Entry","periodActive","h") = "Yes" then asp_Write("checked") elseif TCWebApi_get("Cwmp_Entry","periodActive","h") = "N/A" then asp_Write("checked") end if %>/>
                                                                                                  <label class="custom-control-label" for="radio"><%tcWebApi_get("String_Entry","EnableText","s")%></label>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","Periodic2Text","s")%></label>
                                            <input id="PeriodicInformInterval"  class="form-control" type="text" maxLength=10
                        name="PeriodicInformInterval" value="<% if TCWebApi_get("Cwmp_Entry","periodInterval","h" ) <> "N/A" then TCWebApi_get("Cwmp_Entry","periodInterval","s" ) end if %>"/>
                                                                                        <label>[0 - 2147483647]</label>
                                                                                </div>
                                        <div class="col-md-3 form-group" style='display:none'>
                                                                                        <label><%tcWebApi_get("String_Entry","Periodic3Text","s")%></label>
                                         <INPUT id="PeriodicInformTime" maxLength="20"
                        name="PeriodicInformTime" value="<% TCWebApi_get("Cwmp_Entry","prdInformTime","s" ) %>">
                                                                                        <label>[yyyy-mm-ddThh:dd:ss]</label>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","ServerDomainNameText","s")%></label>
                                            <input id="URL"  type="text" class="form-control" maxLength="256"
                        name="URL" value="<% if TCWebApi_get("Cwmp_Entry","acsUrl","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsUrl","s") end if %>"/>
                                                                                        <label>IP <%tcWebApi_get("String_Entry","AddressPortText","s")%></label>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label>Connection Request Port:</label>
                                            <input id="ConnReqPort" type="text" class="form-control" maxLength="256"
                        name="ConnReqPort" value="<% if TCWebApi_get("Cwmp_Entry","conReqPort","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqPort","s") end if %>"/>
                                                                                </div>
                                                                                <div class="w-100 d-none d-md-block"></div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","PlatformNameText","s")%></label>
                                            <input id="Username" type="text" class="form-control"
                        maxLength="256" name="Username" value="<% if TCWebApi_get("Cwmp_Entry","acsUserName","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsUserName","s") end if %>"/>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","PlatformPasswordText","s")%></label>
                                            <span id="inpsw"><input id="Password" class="form-control" type="password" maxLength=256 name="Password" value="<% if TCWebApi_get("Cwmp_Entry","acsPassword","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsPassword","s") end if %>"/></span>

                                            <%if TCWebApi_get("WebCurSet_Entry","IsSupportShowPSW","h" ) = "1" then%>
                                                                                        <div class="custom-control custom-checkbox">
                                            <INPUT id="cb_enablshowpsw" onclick="doshowpswChange()" type=checkbox name="cb_enablshowpsw" class="custom-control-input">
                                                                                          <label class="custom-control-label" for="cb_enablshowpsw"><%tcWebApi_get("String_Entry","ShowPassowrdText","s")%></label>
                                                                                        </div>
                                            <script language="JavaScript" type="text/JavaScript">

                                                function doshowpswChange() {
                                                    with (getElById('ConfigForm')) {
                                                        var tempvalue1 = Password.value;
                                                        if (cb_enablshowpsw.checked) {
                                                            inpsw.innerHTML = "<input id=\"Password\" class=\"form-control\" type=\"text\" maxLength=256 name=\"Password\" value=" + document.ConfigForm.Password.value + ">";
                                                        }
                                                        else {
                                                            inpsw.innerHTML = "<input id=\"Password\"  class=\"form-control\" type=\"password\" maxLength=256 name=\"Password\" value=" + document.ConfigForm.Password.value + ">";
                                                        }
                                                        Password.value = tempvalue1;
                                                    }

                                                }

                                                </script>
                                            <%end if%>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","TerminalNameText","s")%></label>
                                            <input name="ConnectionRequestUsername" id="ConnectionRequestUsername"
                       class="form-control" value="<% if TCWebApi_get("Cwmp_Entry","conReqUserName","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqUserName","s") end if %>" maxLength=256/>
                                                                                </div>
                                                                                <div class="col-md-3 form-group">
                                                                                        <label><%tcWebApi_get("String_Entry","TerminalPasswordText","s")%></label>
                                            <span id="inrapsw"><input class="form-control" name="ConnectionRequestPassword" type="password" id="ConnectionRequestPassword" value="<%if TCWebApi_get("Cwmp_Entry","conReqPassword","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqPassword","s") end if %>" maxLength="256"/></span>

                                            <%if TCWebApi_get("WebCurSet_Entry","IsSupportShowPSW","h" ) = "1" then%>
                                                                                        <div class="custom-control custom-checkbox">
                                            <INPUT id="cb_enablshowrapsw" onclick="doshowrapswChange()" type=checkbox name="cb_enablshowrapsw" class="custom-control-input" >
                                                                                          <label class="custom-control-label" for="cb_enablshowrapsw"><%tcWebApi_get("String_Entry","ShowPassowrdText","s")%></label>
                                                                                        </div>
                                            <script language="JavaScript" type="text/JavaScript">

                                                function doshowrapswChange() {
                                                    with (getElById('ConfigForm')) {
                                                        var tempvalue2 = ConnectionRequestPassword.value;
                                                        if (cb_enablshowrapsw.checked) {
                                                            inrapsw.innerHTML = "<input id=\"ConnectionRequestPassword\" class=\"form-control\"  type=\"text\" maxLength=256 name=\"ConnectionRequestPassword\" value=" + document.ConfigForm.ConnectionRequestPassword.value + ">";
                                                        }
                                                        else {
                                                            inrapsw.innerHTML = "<input id=\"ConnectionRequestPassword\"  class=\"form-control\" type=\"password\" maxLength=256 name=\"ConnectionRequestPassword\" value=" + document.ConfigForm.ConnectionRequestPassword.value + ">";
                                                        }
                                                        ConnectionRequestPassword.value = tempvalue2;
                                                    }

                                                }

                                                </script>
                                            <%end if%>
                                                                                </div>

                                        <div class="row col-md-6" <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") = "Yes" then %>style="display:none"<% end if %>>
                                        <% If tcWebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" Then %>
                                                                                <div class="col-md-6 form-group ">
                                                                                        <label><%tcWebApi_get("String_Entry","AuthenticationModeText","s")%></label>
                                            <SELECT id=sslAuthMode name="sslAuthMode" class="custom-select">
                              <OPTION value="1" <%if tcWebApi_get("Cwmp_Entry","sslAuthMode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","ClientAuthenticationText","s")%>
                              <OPTION value="2" <%if tcWebApi_get("Cwmp_Entry","sslAuthMode","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","ServerAuthenticationText","s")%>
                              <OPTION value="3" <%if tcWebApi_get("Cwmp_Entry","sslAuthMode","h") = "3" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","TwoWayAuthenticationText","s")%>
                              </SELECT>
                                                                                </div>
                                           <%end if%>
                                                                                <div class="col-md-12 form-group">
                                                                                        <h2 class="sub_heading"style="color:#fd7e14;"><%tcWebApi_get("String_Entry","EnableCertificateText","s")%></h2>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input class="custom-control-input"  id="customRadioInline3" onclick="SSLCertChange()" type="radio" value="0" name="X_ATP_SSLCertEnable" <%if tcWebApi_get("Cwmp_Entry","EnableCert","h") = "0" then asp_Write("checked") elseif tcWebApi_get("Cwmp_Entry","EnableCert","h") = "N/A" then asp_Write("checked") end if%>/>
                                                                                                  <label class="custom-control-label" for="customRadioInline3"><%tcWebApi_get("String_Entry","DisableText","s")%></label>
                                                                                                </div>
                                                                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input  id="customRadioInline4" class="custom-control-input" onclick="SSLCertChange()" type="radio" value="1" name="X_ATP_SSLCertEnable" <%if tcWebApi_get("Cwmp_Entry","EnableCert","h") = "1" then asp_Write("checked") end if%>/>
                                                                                                  <label class="custom-control-label" for="customRadioInline4"><%tcWebApi_get("String_Entry","EnableText","s")%></label>
                                                                                                </div>
                                                                                </div>
</div>

 <input type="hidden" name="SaveFlag" value="0">
                <SCRIPT language=JavaScript type=text/javascript>
                    if (document.ConfigForm.isMidwareSupported.value == 1)
                        getElById("midurl").style.display = "";
                    else
                        getElById("midurl").style.display = "none";

                </SCRIPT>
                          <!-- <script language="JavaScript" type="text/JavaScript">
function LoadOLTForm()
{
<% if tcwebApi_get("WebCustom_Entry","isCTPONC7Supported","h") = "Yes" then %>
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then %>
        document.OLTForm.LoidUsername.disabled = true;
        document.OLTForm.LoidPassword.disabled = true;
        document.OLTForm.btnSubmitID.style.display = "none";
        document.OLTForm.btnCancelID.style.display = "none";
<% end if %>
<% end if %>
    with (getElById('OLTForm'))
        {
            if(VerificationType[0].checked == true)
            {
                setDisplay('LoidUsernameDiv',1);
                setDisplay('LoidPasswordDiv',1);
                setDisplay('PasswordModeDiv',0);
                setDisplay('PasswordPwdDiv',0);
                setDisplay('PasswordSNDiv',0);
                document.OLTForm.PasswordFlag.value = "0";
            }
            else if(VerificationType[1].checked == true)
            {
                setDisplay('LoidUsernameDiv',0);
                setDisplay('LoidPasswordDiv',0);
                setDisplay('PasswordModeDiv',1);
                setDisplay('PasswordPwdDiv',1);
                setDisplay('PasswordSNDiv',1);
                document.OLTForm.PasswordFlag.value = "1";
            }

        }
}
function LoadFrame()
{
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        document.ConfigForm.SaveFlag.value = "0";
        document.SslForm.postflag.value = "0";
<% end if %>
        document.OLTForm.SubmitFlag.value = "0";
        <% if tcwebApi_get("Cwmp_Entry","EnableCert","h") = "1" then %>
        <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
        setDisplay('SslForm', 1);
        var obj = getElById('ResultText');
        var certStatus = parseInt("<% tcWebApi_get("Cwmp_Entry","CertCode","s") %>");

        if ((certStatus >= 0) && (certStatus <= 9))
        {
                obj.innerHTML = '<font color="#FF0000">' + msg[certStatus] + '</font>';
                setDisplay('ResultText',1);
        }
        else
        {
                setDisplay('ResultText', 0);
        }
        <% end if %>
        <% else %>
        setDisplay('SslForm', 0);
        <% end if %>
        midLastRadioValue = document.ConfigForm.EnTr069Flag.value;

        if(midLastRadioValue == "0")
        {
                document.ConfigForm.Tr069Enable[0].checked = true;
                setDisplay("midurl", 1);
        }
        else if(midLastRadioValue == "2")
        {
                document.ConfigForm.Tr069Enable[2].checked = true;
                setDisplay("midurl", 1);
        }
        else
        {
                document.ConfigForm.Tr069Enable[1].checked = true;
                setDisplay("midurl", 0);
        }

        document.STUNForm.SaveSTUNFlag.value = "0";
}
function SSLCertChange()
{
with (getElById('ConfigForm'))
{

        if (X_ATP_SSLCertEnable[1].checked == true)
        {
                <% if tcwebApi_get("Cwmp_Entry","EnableCert","h") = "1" then %>
                setDisplay('SslForm', 1);
                <% end if %>
        }else{
                setDisplay('SslForm', 0);
        }
}
}
function StringCheck(val)
{
    re = /^[^\s]+$/;
    if( re.test(val) )
        return true;
    else
        return false;
}

function CheckSTUNForm()
{
        with (getElById ("STUNForm")){
            if (StunEnable[1].checked == true)
            {
                if (StunServerAddr.value ==''){
                        alert("<%tcWebApi_get("String_Entry","ServerAddressText","s")%>");
                        return false;
                }
                if (StunServerPort.value == ''){
                        alert("<%tcWebApi_get("String_Entry","ConnSerPortText","s")%>");
                        return false;
                }
                if (!isValidPort(Number(StunServerPort.value))){
                        alert("<%tcWebApi_get("String_Entry","InvalidPortEnterAgainText","s")%>");
                        return false;
                }
                if (WanIP1.value ==''){
                        alert("<%tcWebApi_get("String_Entry","PrimaryWanIpEmptyText","s")%>");
                        return false;
                }
                if (!isValidIpAddress(WanIP1.value)){
                        alert("<%tcWebApi_get("String_Entry","PrimaryWanIpInvalidText","s")%>");
                        return false;
                }
                if ((WanIP2.value != '') && !isValidIpAddress(WanIP2.value)){
                        alert("<%tcWebApi_get("String_Entry","SecondaryWanIpInvalidText","s")%>");
                        return false;
                }
                if ((WanIP3.value != '') && !isValidIpAddress(WanIP3.value)){
                        alert("<%tcWebApi_get("String_Entry","TertiaryWanIpInvalidText","s")%>");
                        return false;
                }
                if ((!UseAutoStunPortEnable.checked) && (StunClientPort.value == '' || !isValidPort(Number(StunClientPort.value)))){
                        alert("<%tcWebApi_get("String_Entry","StunClientPortInvalidText","s")%>");
                        return false;
                }
                if ((StunKeepAliveMaxTime.value == '') || (Number(StunKeepAliveMaxTime.value) <= 0)){
                        alert("<%tcWebApi_get("String_Entry","InvalidStunMaxKeepAliveTimeText","s")%>");
                        return false;
                }
                if ((StunKeepAliveMinTime.value == '') || (Number(StunKeepAliveMinTime.value) <= 0)){
                        alert("<%tcWebApi_get("String_Entry","InvalidStunMinKeepAliveTimeText","s")%>");
                        return false;
                }
                if (Number(StunKeepAliveMinTime.value) < 30){
                        alert("<%tcWebApi_get("String_Entry","MinKeepAliveTimeText","s")%>");
                        return false;
                }
                if (Number(StunKeepAliveMaxTime.value) < Number(StunKeepAliveMinTime.value)){
                        alert("<%tcWebApi_get("String_Entry","InvalidKeepAliveTimeText","s")%>");
                        return false;
                }
            }
        }
        return true;
}
function isSafeStringForV6(val)
{
if ( val == "" )
{
return false;
}
for ( var j = 0 ; j < val.length ; j++ )
{
if ( !isSafeCharForV6(val.charAt(j)) )
{
return false;
}
}
return true;
}
function isSafeCharForV6(val)
{
if (((val >= 'A')&&(val <= 'Z'))
||((val >= 'a')&&(val <= 'z'))
||((val >= '0')&&(val <= '9'))
||(val == ':')||(val == '/')
||(val == '-')||(val == '.')
||(val == '_')||(val == '[')||
(val == ']'))
{
return true;
}
else
{
return false;
}
}
function stmid(domain,midurl, tr069enable)
{
this.domain = domain;
this.Url = midurl;
this.Tr069enable = tr069enable;
}
function CheckForm()
{
with (getElById ("ConfigForm"))
{
        var value1;
        var value2 = null;
        var url = /^https*:\/\/[\w\[]+/;
        var path = /^\/\w+/;
var midcom = new Array(new stmid("InternetGatewayDevice.DeviceInfo.X_CT-COM_MiddlewareMgt","0.0.0.0:0","1"),null);
var mid = midcom[0];
<%if tcwebApi_get("WebCustom_Entry","isIPv6CwmpSupported","h") = "Yes" then%>
        value1 = URL.value;
        if(value1 == "") {
                alert("ACS URL<%tcWebApi_get("String_Entry","NotEmptyText","s")%>");
                return false;
        }
        if( !isSafeStringForV6(value1)){
                alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                return false;
        }
        if(!StringCheck(value1)){
                alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                return false;
        }
        else{
                if(StringCheck(value1)){
                        value2 = value1.match(url);
                        if(value2 == null){
                                alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                                return false;
                        }
                }
        }
<%else%>
if (!isSafeStringSN(URL.value))
{
alert("ACS<%tcWebApi_get("String_Entry","LetterDigitCharacterText","s")%>\":, /, -, .\"");
return false;
}
<%end if%>
if(URL.value.indexOf("http://") !=0 && URL.value.indexOf("https://") !=0)
{
alert("ACS<%tcWebApi_get("String_Entry","BeginWithText","s")%>'http://'<%tcWebApi_get("String_Entry","OrText","s")%>'https://'<%tcWebApi_get("String_Entry","BeginText","s")%>");
return false;
}
if (PeriodicInformEnable[1].checked == true &&PeriodicInformInterval.value =='' )
{
alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
return false;
}
if ((PeriodicInformInterval.value == '') || (isPlusInteger(PeriodicInformInterval.value) == false))
{
alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
return false;
}
if (false)
{
if (PeriodicInformEnable[1].checked == true && PeriodicInformTime.value =='' )
{
alert("<%tcWebApi_get("String_Entry","TimeInvalid2Text","s")%>");
return false;
}
if ((PeriodicInformTime.value == '') || (isTimeFormat(PeriodicInformTime.value) == false) )
{
alert("<%tcWebApi_get("String_Entry","TimeInvalid2Text","s")%>");
return false;
}
}
var info = parseFloat(PeriodicInformInterval.value );
if (info < 0 || info > 2147483647)
{
alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
return false;
}
if (isValidString(Username.value) == false )
{
alert("ACS<%tcWebApi_get("String_Entry","NameInvalidText","s")%>");
return false;
}
if (isValidString(Password.value) == false )
{
alert("ACS<%tcWebApi_get("String_Entry","PasswordInvalidText","s")%>");
return false;
}
if (isValidString(ConnectionRequestUsername.value) == false )
{
alert("<%tcWebApi_get("String_Entry","ConnectNameInvalidText","s")%>");
return false;
}
if (isValidString(ConnectionRequestPassword.value) == false )
{
alert("<%tcWebApi_get("String_Entry","ConnectPasswordInvalidText","s")%>");
return false;
}
}
with (getElById ("ConfigForm"))
{
if (Tr069Enable[1].checked == true &&Tr069Enable.value =='' )
{
alert("<%tcWebApi_get("String_Entry","Tr069Enable1Text","s")%>");
return false;
}
if (mid.Tr069enable == '0' && Tr069Enable[2].checked == true)
{
alert("<%tcWebApi_get("String_Entry","Tr069Enable2Text","s")%>");
return false;
}
if (mid.Tr069enable == '2' && Tr069Enable[0].checked == true)
{
alert("<%tcWebApi_get("String_Entry","Tr069Enable3Text","s")%>");
return false;
}
if(Tr069Enable[0].checked == true || Tr069Enable[2].checked == true)
{
if (MiddlewareAddress.value == '')
{
alert("<%tcWebApi_get("String_Entry","EnterPlatformAddressText","s")%>");
return false;
}
if (!isValidIpAddress(MiddlewareAddress.value) && !isSafeStringSN(MiddlewareAddress.value))
{
alert("<%tcWebApi_get("String_Entry","InvalidAddressEnterRightText","s")%>");
return false;
}
if (MiddlewarePort.value == '')
{
alert("<%tcWebApi_get("String_Entry","EnterPlatformPortText","s")%>");
return false;
}
if (!isValidPort(MiddlewarePort.value))
{
alert("<%tcWebApi_get("String_Entry","InvalidPortEnterAgainText","s")%>");
return false;
}
}
}
return true;
}
                              function btnSave() {
                                  if (CheckForm() == false)
                                      return;
                                  var Form = document.ConfigForm;
                                  Form.SaveFlag.value = "1";
                                  if (true == setEBooValueCookie(Form))
                                      Form.submit();
                              }
</script> -->
<script language="JavaScript" type="text/JavaScript">
    function LoadOLTForm()
    {
    <% if tcwebApi_get("WebCustom_Entry","isCTPONC7Supported","h") = "Yes" then %>
    <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then %>
            document.OLTForm.LoidUsername.disabled = true;
            document.OLTForm.LoidPassword.disabled = true;
            document.OLTForm.btnSubmitID.style.display = "none";
            document.OLTForm.btnCancelID.style.display = "none";
    <% end if %>
    <% end if %>
        with (getElById('OLTForm'))
            {
                if(VerificationType[0].checked == true)
                {
                    setDisplay('LoidUsernameDiv',1);
                    setDisplay('LoidPasswordDiv',1);
                    setDisplay('PasswordModeDiv',0);
                    setDisplay('PasswordPwdDiv',0);
                    setDisplay('PasswordSNDiv',0);
                    document.OLTForm.PasswordFlag.value = "0";
                }
                else if(VerificationType[1].checked == true)
                {
                    setDisplay('LoidUsernameDiv',0);
                    setDisplay('LoidPasswordDiv',0);
                    setDisplay('PasswordModeDiv',1);
                    setDisplay('PasswordPwdDiv',1);
                    setDisplay('PasswordSNDiv',1);
                    document.OLTForm.PasswordFlag.value = "1";
                }
    
            }
    }
    function LoadFrame()
    {
    <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
            document.ConfigForm.SaveFlag.value = "0";
            document.SslForm.postflag.value = "0";
    <% end if %>
            document.OLTForm.SubmitFlag.value = "0";
            <% if tcwebApi_get("Cwmp_Entry","EnableCert","h") = "1" then %>
            <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
            setDisplay('SslForm', 1);
            var obj = getElById('ResultText');
            var certStatus = parseInt("<% tcWebApi_get("Cwmp_Entry","CertCode","s") %>");
    
            if ((certStatus >= 0) && (certStatus <= 9))
            {
                    obj.innerHTML = '<font color="#FF0000">' + msg[certStatus] + '</font>';
                    setDisplay('ResultText',1);
            }
            else
            {
                    setDisplay('ResultText', 0);
            }
            <% end if %>
            <% else %>
            setDisplay('SslForm', 0);
            <% end if %>
            midLastRadioValue = document.ConfigForm.EnTr069Flag.value;
    
            if(midLastRadioValue == "0")
            {
                    document.ConfigForm.Tr069Enable[0].checked = true;
                    setDisplay("midurl", 1);
            }
            else if(midLastRadioValue == "2")
            {
                    document.ConfigForm.Tr069Enable[2].checked = true;
                    setDisplay("midurl", 1);
            }
            else
            {
                    document.ConfigForm.Tr069Enable[1].checked = true;
                    setDisplay("midurl", 0);
            }
    
            document.STUNForm.SaveSTUNFlag.value = "0";
    }
    function SSLCertChange()
    {
    with (getElById('ConfigForm'))
    {
    
            if (X_ATP_SSLCertEnable[1].checked == true)
            {
                    <% if tcwebApi_get("Cwmp_Entry","EnableCert","h") = "1" then %>
                    setDisplay('SslForm', 1);
                    <% end if %>
            }else{
                    setDisplay('SslForm', 0);
            }
    }
    }
    function StringCheck(val)
    {
        re = /^[^\s]+$/;
        if( re.test(val) )
            return true;
        else
            return false;
    }
    
    function CheckSTUNForm()
    {
            with (getElById ("STUNForm")){
                if (StunEnable[1].checked == true)
                {
                    if (StunServerAddr.value ==''){
                            alert("<%tcWebApi_get("String_Entry","ServerAddressText","s")%>");
                            return false;
                    }
                    if (StunServerPort.value == ''){
                            alert("<%tcWebApi_get("String_Entry","ConnSerPortText","s")%>");
                            return false;
                    }
                    if (!isValidPort(Number(StunServerPort.value))){
                            alert("<%tcWebApi_get("String_Entry","InvalidPortEnterAgainText","s")%>");
                            return false;
                    }
                    if (WanIP1.value ==''){
                            alert("<%tcWebApi_get("String_Entry","PrimaryWanIpEmptyText","s")%>");
                            return false;
                    }
                    if (!isValidIpAddress(WanIP1.value)){
                            alert("<%tcWebApi_get("String_Entry","PrimaryWanIpInvalidText","s")%>");
                            return false;
                    }
                    if ((WanIP2.value != '') && !isValidIpAddress(WanIP2.value)){
                            alert("<%tcWebApi_get("String_Entry","SecondaryWanIpInvalidText","s")%>");
                            return false;
                    }
                    if ((WanIP3.value != '') && !isValidIpAddress(WanIP3.value)){
                            alert("<%tcWebApi_get("String_Entry","TertiaryWanIpInvalidText","s")%>");
                            return false;
                    }
                    if ((!UseAutoStunPortEnable.checked) && (StunClientPort.value == '' || !isValidPort(Number(StunClientPort.value)))){
                            alert("<%tcWebApi_get("String_Entry","StunClientPortInvalidText","s")%>");
                            return false;
                    }
                    if ((StunKeepAliveMaxTime.value == '') || (Number(StunKeepAliveMaxTime.value) <= 0)){
                            alert("<%tcWebApi_get("String_Entry","InvalidStunMaxKeepAliveTimeText","s")%>");
                            return false;
                    }
                    if ((StunKeepAliveMinTime.value == '') || (Number(StunKeepAliveMinTime.value) <= 0)){
                            alert("<%tcWebApi_get("String_Entry","InvalidStunMinKeepAliveTimeText","s")%>");
                            return false;
                    }
                    if (Number(StunKeepAliveMinTime.value) < 30){
                            alert("<%tcWebApi_get("String_Entry","MinKeepAliveTimeText","s")%>");
                            return false;
                    }
                    if (Number(StunKeepAliveMaxTime.value) < Number(StunKeepAliveMinTime.value)){
                            alert("<%tcWebApi_get("String_Entry","InvalidKeepAliveTimeText","s")%>");
                            return false;
                    }
                }
            }
            return true;
    }
    function isSafeStringForV6(val)
    {
    if ( val == "" )
    {
    return false;
    }
    for ( var j = 0 ; j < val.length ; j++ )
    {
    if ( !isSafeCharForV6(val.charAt(j)) )
    {
    return false;
    }
    }
    return true;
    }
    function isSafeCharForV6(val)
    {
    if (((val >= 'A')&&(val <= 'Z'))
    ||((val >= 'a')&&(val <= 'z'))
    ||((val >= '0')&&(val <= '9'))
    ||(val == ':')||(val == '/')
    ||(val == '-')||(val == '.')
    ||(val == '_')||(val == '[')||
    (val == ']'))
    {
    return true;
    }
    else
    {
    return false;
    }
    }
    function stmid(domain,midurl, tr069enable)
    {
    this.domain = domain;
    this.Url = midurl;
    this.Tr069enable = tr069enable;
    }
    function CheckForm()
    {
    with (getElById ("ConfigForm"))
    {
            var value1;
            var value2 = null;
            var url = /^https*:\/\/[\w\[]+/;
            var path = /^\/\w+/;
    var midcom = new Array(new stmid("InternetGatewayDevice.DeviceInfo.X_CT-COM_MiddlewareMgt","0.0.0.0:0","1"),null);
    var mid = midcom[0];
    <%if tcwebApi_get("WebCustom_Entry","isIPv6CwmpSupported","h") = "Yes" then%>
            value1 = URL.value;
            if(value1 == "") {
                    alert("ACS URL<%tcWebApi_get("String_Entry","NotEmptyText","s")%>");
                    return false;
            }
            if( !isSafeStringForV6(value1)){
                    alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                    return false;
            }
            if(!StringCheck(value1)){
                    alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                    return false;
            }
            else{
                    if(StringCheck(value1)){
                            value2 = value1.match(url);
                            if(value2 == null){
                                    alert("ACS URL<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
                                    return false;
                            }
                    }
            }
    <%else%>
    if (!isSafeStringSN(URL.value))
    {
    alert("ACS<%tcWebApi_get("String_Entry","LetterDigitCharacterText","s")%>\":, /, -, .\"");
    return false;
    }
    <%end if%>
    if(URL.value.indexOf("http://") !=0 && URL.value.indexOf("https://") !=0)
    {
    alert("ACS<%tcWebApi_get("String_Entry","BeginWithText","s")%>'http://'<%tcWebApi_get("String_Entry","OrText","s")%>'https://'<%tcWebApi_get("String_Entry","BeginText","s")%>");
    return false;
    }
    if (PeriodicInformEnable[1].checked == true &&PeriodicInformInterval.value =='' )
    {
    alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
    return false;
    }
    if ((PeriodicInformInterval.value == '') || (isPlusInteger(PeriodicInformInterval.value) == false))
    {
    alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
    return false;
    }
    if (false)
    {
    if (PeriodicInformEnable[1].checked == true && PeriodicInformTime.value =='' )
    {
    alert("<%tcWebApi_get("String_Entry","TimeInvalid2Text","s")%>");
    return false;
    }
    if ((PeriodicInformTime.value == '') || (isTimeFormat(PeriodicInformTime.value) == false) )
    {
    alert("<%tcWebApi_get("String_Entry","TimeInvalid2Text","s")%>");
    return false;
    }
    }
    var info = parseFloat(PeriodicInformInterval.value );
    if (info < 0 || info > 2147483647)
    {
    alert("<%tcWebApi_get("String_Entry","TimeInvalid1Text","s")%>");
    return false;
    }
    if (isValidString(Username.value) == false )
    {
    alert("ACS<%tcWebApi_get("String_Entry","NameInvalidText","s")%>");
    return false;
    }
    if (isValidString(Password.value) == false )
    {
    alert("ACS<%tcWebApi_get("String_Entry","PasswordInvalidText","s")%>");
    return false;
    }
    if (isValidString(ConnectionRequestUsername.value) == false )
    {
    alert("<%tcWebApi_get("String_Entry","ConnectNameInvalidText","s")%>");
    return false;
    }
    if (isValidString(ConnectionRequestPassword.value) == false )
    {
    alert("<%tcWebApi_get("String_Entry","ConnectPasswordInvalidText","s")%>");
    return false;
    }
    }
    with (getElById ("ConfigForm"))
    {
    if (Tr069Enable[1].checked == true &&Tr069Enable.value =='' )
    {
    alert("<%tcWebApi_get("String_Entry","Tr069Enable1Text","s")%>");
    return false;
    }
    if (mid.Tr069enable == '0' && Tr069Enable[2].checked == true)
    {
    alert("<%tcWebApi_get("String_Entry","Tr069Enable2Text","s")%>");
    return false;
    }
    if (mid.Tr069enable == '2' && Tr069Enable[0].checked == true)
    {
    alert("<%tcWebApi_get("String_Entry","Tr069Enable3Text","s")%>");
    return false;
    }
    if(Tr069Enable[0].checked == true || Tr069Enable[2].checked == true)
    {
    if (MiddlewareAddress.value == '')
    {
    alert("<%tcWebApi_get("String_Entry","EnterPlatformAddressText","s")%>");
    return false;
    }
    if (!isValidIpAddress(MiddlewareAddress.value) && !isSafeStringSN(MiddlewareAddress.value))
    {
    alert("<%tcWebApi_get("String_Entry","InvalidAddressEnterRightText","s")%>");
    return false;
    }
    if (MiddlewarePort.value == '')
    {
    alert("<%tcWebApi_get("String_Entry","EnterPlatformPortText","s")%>");
    return false;
    }
    if (!isValidPort(MiddlewarePort.value))
    {
    alert("<%tcWebApi_get("String_Entry","InvalidPortEnterAgainText","s")%>");
    return false;
    }
    }
    }
    return true;
    }
                                  function btnSave() {
                                      if (CheckForm() == false)
                                          return;
                                      var Form = document.ConfigForm;
                                      Form.SaveFlag.value = "1";
                                      if (true == setEBooValueCookie(Form))
                                          Form.submit();
                                  }
    </script>
   </form>


   <form class="row" id="SslForm" name="SslForm" method="post" enctype="multipart/form-data">

                                                                                <div class="col-md-12 form-group">
                                                                                        <h2 class="sub_heading" style="color:#fd7e14;">  <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
                  <!-- <SCRIPT language=javascript>
<% If tcWebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" Then %>
                                        var caExist = 1;
<% If tcWebApi_get("SslCA_Common","ca1Exist","h") <> "1" Then %>
<% If tcWebApi_get("SslCA_Common","ca2Exist","h") <> "1" Then %>
<% If tcWebApi_get("SslCA_Common","ca3Exist","h") <> "1" Then %>
                                        caExist = 0;
<% end if %>
<% end if %>
<% end if %>
                                        if(caExist == 1){
                                                document.write("(<%tcWebApi_get("String_Entry","GatewayFile1Text","s")%>)");
                                        }
                                        else
                                                document.write("(<%tcWebApi_get("String_Entry","GatewayFile2Text","s")%>)");
<% else %>
                                        var  cflag = "<% tcWebApi_get("SslCA_Entry0","FragNum","s") %>";//the certificate of index 1 is exist?
                                        if(cflag != "N/A"){
                                                document.write("(<%tcWebApi_get("String_Entry","GatewayFile1Text","s")%>)");
                                        }
                                        else
                                                document.write("(<%tcWebApi_get("String_Entry","GatewayFile2Text","s")%>)");
<% end if %>
                                  </SCRIPT> -->
                                  <SCRIPT language=javascript>
                                    <% If tcWebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" Then %>
                                                                            var caExist = 1;
                                    <% If tcWebApi_get("SslCA_Common","ca1Exist","h") <> "1" Then %>
                                    <% If tcWebApi_get("SslCA_Common","ca2Exist","h") <> "1" Then %>
                                    <% If tcWebApi_get("SslCA_Common","ca3Exist","h") <> "1" Then %>
                                                                            caExist = 0;
                                    <% end if %>
                                    <% end if %>
                                    <% end if %>
                                                                            if(caExist == 1){
                                                                                    document.write("(<%tcWebApi_get("String_Entry","GatewayFile1Text","s")%>)");
                                                                            }
                                                                            else
                                                                                    document.write("(<%tcWebApi_get("String_Entry","GatewayFile2Text","s")%>)");
                                    <% else %>
                                                                            var  cflag = "<% tcWebApi_get("SslCA_Entry0","FragNum","s") %>";//the certificate of index 1 is exist?
                                                                            if(cflag != "N/A"){
                                                                                    document.write("(<%tcWebApi_get("String_Entry","GatewayFile1Text","s")%>)");
                                                                            }
                                                                            else
                                                                                    document.write("(<%tcWebApi_get("String_Entry","GatewayFile2Text","s")%>)");
                                    <% end if %>
                                                                      </SCRIPT>
                                  <% end if %>
</h2>
 <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
                                                                                        <p class="normal_text"><%tcWebApi_get("String_Entry","FilePathText","s")%></p>
                                                                                        <div class="row">
                                                                                                <div class="col-md-4">
                                                                                                        <div class="custom-file">
                                                                                                          <input type=file disbaled name="filename" class="custom-file-input" id="customFile">
                                                                                                          <label class="custom-file-label" for="customFile">Choose file</label>
                                                                                                        </div>
                                                                                                </div>
                                                                                                <div class="col-md-4">
                                                 <input id="btnSubmit" class="btn btn-orang-1 btn-lg" onclick="SubmitCert()" type="button" value="<%tcWebApi_get("String_Entry","UploadText","s")%>" name="btnSubmit"/>
                                                </div>
                                                                                        </div>
                                            <p id="ResultText" name="ResultText" class="red_text"></p>
                                             <% end if %>
                                                                                </div>

                                         <input type="hidden" name="postflag" value="0"/>
                          <input type="hidden" name="fileIndex" value="1"/>
                                                                                </form>
                                        <hr class="margin_adjs" />
                                         </div>


                                                                                <div class="form-footer text-right">
                                        <input type="button" class="btn btn-orang btn-lg"  onclick="btnSave()" id="btnOK" name="btnOK " value="<%tcWebApi_get("String_Entry","DHCPSAVEBUTTON","s")%>"/>
                                                        <input type="button" onclick="RefreshPage()" class="btn btn-secondary btn-lg" id="Cancel" name="Cancel" value="<%tcWebApi_get("String_Entry","CancelText","s")%>"/>
                                                                                </div>
                                                                </div>
                                                                    <div class="white_box" name="OltConfig">
                                                                        <h1 class="heading_grey heading_margin"><img src="../img/certificate.png" width="45" height="40" class="img_sub" alt=""/>

                                    <% if tcwebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") = "Yes" then %>
                                           <span><%tcWebApi_get("String_Entry","BroadbandText","s")%> </span>
                                            <% else %>
                                                            <span>OLT<%tcWebApi_get("String_Entry","CertificationText","s")%></span>
                                            <% end if %>
</h1>
                                                                        <div class="container-fluid">
                                                                        <div class="lighter_grey_bg">
                                                                                        <p><% if tcWebApi_get("WebCurSet_Entry", "isLOIDLocked", "h") = "Yes"  then %>
                        <%tcWebApi_get("String_Entry","OnlyviewText","s")%>
                        <% elseif tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") = "Yes"  then  %>
                        <%tcWebApi_get("String_Entry","SetPassword1Text","s")%>
                        <% else %>
                        <%tcWebApi_get("String_Entry","SetPassword2Text","s")%>
                        <% end if %> </p>
                                                                                </div>



                                        <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                   if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
                              <form class="row" name="OLTForm" action="/cgi-bin/register.asp" method="post" target="_top" style="display:none">
                   <%else%>
                              <form class="row" name="OLTForm" action="/cgi-bin/net-tr069.asp" method="post">
                   <% end if
else%>
        <% if tcWebApi_get("WebCustom_Entry","isCTDeviceregSupported","h")="Yes" then %>
                      <form class="row" name="OLTForm" action="/cgi-bin/register.asp" method="post">
        <%else%>
           <form class="row" name="OLTForm" action="/cgi-bin/net-tr069.asp" method="post">
        <% end if %>
<% end if %>

<!-- <script language="JavaScript" type="text/javascript">
    function typeClick() {
        with (getElById('OLTForm'))
        {
            if(VerificationType[0].checked == true)
            {
                setDisplay('LoidUsernameDiv',1);
                setDisplay('LoidPasswordDiv',1);
                setDisplay('PasswordModeDiv',0);
                setDisplay('PasswordPwdDiv',0);
                setDisplay('PasswordSNDiv',0);
                document.OLTForm.PasswordFlag.value = "0";
            }
            else if(VerificationType[1].checked == true)
            {
                setDisplay('LoidUsernameDiv',0);
                setDisplay('LoidPasswordDiv',0);
                setDisplay('PasswordModeDiv',1);
                setDisplay('PasswordPwdDiv',1);
                setDisplay('PasswordSNDiv',1);
                document.OLTForm.PasswordFlag.value = "1";
            }

        }

    }
    function passwordModeChange() {
        with (getElById('OLTForm'))
        {
            if(PasswordMode.value == "ASCII")
            {
                document.OLTForm.HexFlag.value = "false";
                document.getElementById("PasswordPwd").maxLength = "10";
                document.getElementById("PasswordPwdText").innerHTML = "<%tcWebApi_get("String_Entry","NetCwmpPasswordText1","s")%>";
            }
            else if (PasswordMode.value == "HEX")
            {
                document.OLTForm.HexFlag.value = "true";
                document.getElementById("PasswordPwd").maxLength = "20";
                document.getElementById("PasswordPwdText").innerHTML = "<%tcWebApi_get("String_Entry","NetCwmpPasswordText2","s")%>";
            }
        }
    }

    function inpsShowhide(){
        var eye = document.getElementById("PasswordPwdEye");
        var pwd = document.getElementById("PasswordPwd");

        if (pwd.type == "password") {
            pwd.type = "text";
                eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
        function loidpsShowhide(){
        var eye = document.getElementById("LOIDEye");
        var pwd = document.getElementById("LoidPassword");

        if (pwd.type == "password") {
            pwd.type = "text";
                eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
</script> -->
<script language=JavaScript type=text/javascript>
    function typeClick() {
        with (getElById('OLTForm'))
        {
            if(VerificationType[0].checked == true)
            {
                setDisplay('LoidUsernameDiv',1);
                setDisplay('LoidPasswordDiv',1);
                setDisplay('PasswordModeDiv',0);
                setDisplay('PasswordPwdDiv',0);
                setDisplay('PasswordSNDiv',0);
                document.OLTForm.PasswordFlag.value = "0";
            }
            else if(VerificationType[1].checked == true)
            {
                setDisplay('LoidUsernameDiv',0);
                setDisplay('LoidPasswordDiv',0);
                setDisplay('PasswordModeDiv',1);
                setDisplay('PasswordPwdDiv',1);
                setDisplay('PasswordSNDiv',1);
                document.OLTForm.PasswordFlag.value = "1";
            }

        }

    }
    function passwordModeChange() {
        with (getElById('OLTForm'))
        {
            if(PasswordMode.value == "ASCII")
            {
                document.OLTForm.HexFlag.value = "false";
                document.getElementById("PasswordPwd").maxLength = "10";
                document.getElementById("PasswordPwdText").innerHTML = "<%tcWebApi_get("String_Entry","NetCwmpPasswordText1","s")%>";
            }
            else if (PasswordMode.value == "HEX")
            {
                document.OLTForm.HexFlag.value = "true";
                document.getElementById("PasswordPwd").maxLength = "20";
                document.getElementById("PasswordPwdText").innerHTML = "<%tcWebApi_get("String_Entry","NetCwmpPasswordText2","s")%>";
            }
        }
    }

    function inpsShowhide(){
        var eye = document.getElementById("PasswordPwdEye");
        var pwd = document.getElementById("PasswordPwd");

        if (pwd.type == "password") {
            pwd.type = "text";
                eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
        function loidpsShowhide(){
        var eye = document.getElementById("LOIDEye");
        var pwd = document.getElementById("LoidPassword");

        if (pwd.type == "password") {
            pwd.type = "text";
                eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
</script>
                                        <div class="col-md-12 form-group custom-control">
                                            <label class="custom-control">Verification Method:</label>

                                        <div class="col-md-3 form-group">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input class="custom-control-input" id="VerificationType0" onclick="typeClick()"  type="radio" value="LOID" name="VerificationType" <% if tcWebApi_get("GPON_ONU","PasswordFlag","h") <> "1" then asp_Write("checked") end if%>/>
                                                <label class="custom-control-label" for="VerificationType0">LOID</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input class="custom-control-input" id="VerificationType1" onclick="typeClick()"  type="radio" value="Password" name="VerificationType" <% if tcWebApi_get("GPON_ONU","PasswordFlag","h") = "1" then asp_Write("checked") end if%>/>
                                                <label class="custom-control-label" for="VerificationType1">Password</label>
                                            </div>
                                        </div>

                                        <div class="col-md-3 form-group" id="PasswordModeDiv" style="display:none">
                                            <label>Password Mode:</label>
                                            <select id="PasswordMode" name="PasswordMode" class="custom-select" onchange="passwordModeChange()">
                                                <option value="ASCII" <%if tcWebApi_get("GPON_ONU","HexFlag","h") <> "true" then asp_Write("selected") end if%>>ASCII</option>
                                                <option value="HEX" <%if tcWebApi_get("GPON_ONU","HexFlag","h") = "true" then asp_Write("selected") end if%>>HEX</option>
                                            </select>
                                        </div>

                                        <div class="col-md-3 form-group" id="PasswordPwdDiv" style="display:none">
                                            <label>Password:</label>
                                            <div class="input-group">
                                                <input type="password" id="PasswordPwd" class="form-control" type="password" <%if tcWebApi_get("GPON_ONU","HexFlag","h") = "true" then %>maxlength="20" <%else%> maxLength="10" <%end if %>name="PasswordPwd" value="<%if TCWebApi_get("GPON_ONU","Password","h") <> "N/A" then TCWebApi_get("GPON_ONU","Password","s") end if%>"/>
                                            </div>
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="PasswordPwdText">
                                                <%if tcWebApi_get("GPON_ONU","HexFlag","h") = "true" then
                                                    tcWebApi_get("String_Entry","NetCwmpPasswordText2","s")
                                                else tcWebApi_get("String_Entry","NetCwmpPasswordText1","s") end if %>
                                                &nbsp;&nbsp;<i class="fa fa-eye" onclick="inpsShowhide()" id="PasswordPwdEye"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 form-group" id="PasswordSNDiv" style="display:none">
                                            <label>SN:</label>
                                            <div class="input-group">
                                                <input type="text" id="PasswordSN" class="form-control" minlength="12" name="PasswordSN" value="<%if TCWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" then TCWebApi_get("GPON_ONU","SerialNumber","s") end if%>"/>
                                            </div>
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="PasswordSNText">
                                                <%tcWebApi_get("String_Entry","NetCwmpPasswordText3","s")%>
                                                </span>
                                            </div>
                                        </div>

                                        <%if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") <> "Yes"  then  %>
                                                                                <div class="col-md-3 form-group" id="LoidUsernameDiv">
                                                                                        <label>LOID</label>

                                               <input type="text" id="LoidUsername" class="form-control" <% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>maxLength=24<%else%>
                        maxLength="256" <%end if %> name="LoidUsername" <% if tcWebApi_get("WebCurSet_Entry", "isLOIDLocked", "h") = "Yes"  then %>disabled<%end if %>
value="<%
if TCWebApi_get("XPON_LinkCfg","LinkSta","h") = "2" then
 if TCWebApi_get("EPON_LOIDAuth","LOID0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","LOID0","s") end if
else
 if TCWebApi_get("GPON_LOIDAuth","LOID","h") <> "N/A" then TCWebApi_get("GPON_LOIDAuth","LOID","s") end if
end if %>"/>


                                                                                </div>
                                                <% end if %>
                                                                                <div class="col-md-3 form-group" id="LoidPasswordDiv">
                                                                                        <label>Password</label>
                                            <span id="inLoidpsw">
                                                                                <table width="108%">
                                                                                        <tr>
                                                                                                <td>
                                                                                                <input  class="form-control"  id="LoidPassword" type="password" <% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>maxLength=12<%else%> maxLength="256" <%end if%> name="LoidPassword" <% if tcWebApi_get("WebCurSet_Entry", "isLOIDLocked", "h") = "Yes"  then %>disabled<%end if %> value="<%
if TCWebApi_get("XPON_LinkCfg","LinkSta","h") = "2" then
 if TCWebApi_get("EPON_LOIDAuth","Password0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","Password0","s") end if
elseif TCWebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then
        if TCWebApi_get("GPON_ONU","Password","h") <> "N/A" then TCWebApi_get("GPON_ONU","Password","s") end if
else
         if TCWebApi_get("GPON_LOIDAuth","Password","h") <> "N/A" then TCWebApi_get("GPON_LOIDAuth","Password","s") end if
end if %>"/></span>
                                                                                                </td>
                                                                                                <td>
                                                                                                <div>
                                                                                                        <i class="fa fa-eye" onclick="loidpsShowhide()"  id="LOIDEye"></i>
                                                                                                </div>
                                                                                                </td>
                                                                                        </tr>
                                                                                </table>
<%if TCWebApi_get("WebCurSet_Entry","IsSupportShowPSW","h" ) = "1" then%>
                                                                                        <div class="custom-control custom-checkbox">
                                            <INPUT id="cb_enablshowpsw2" onclick="doshowLOIDpswChange2()" type="checkbox" name="cb_enablshowpsw"  class="custom-control-input " >
                                                                                          <label class="custom-control-label" for="cb_enablshowpsw2"><%tcWebApi_get("String_Entry","ShowPassowrdText","s")%></label>
                                                                                        </div>

                                            <!-- <script language="JavaScript" type="text/JavaScript">
                                                function doshowLOIDpswChange2() {
                                                    if ($('#cb_enablshowpsw2').prop("checked") == true) {
                                                        $('#LoidPassword').attr('type', 'text');
                                                    }
                                                    else {
                                                        $('#LoidPassword').attr('type', 'password');
                                                    }
                                                }

                                                function doshowLOIDpswChange() {
                                                    with (getElById('OLTForm')) {
                                                        var tempvalue1 = LoidPassword.value;
                                                        if (cb_enablshowpsw.checked) {
                                                            inLoidpsw.innerHTML = "<input id=\"LoidPassword\" class=\"form-control\" type=\"text\" maxLength=256 name=\"LoidPassword\" value=" + document.OLTForm.LoidPassword.value + ">";
                                                        }
                                                        else {
                                                            inLoidpsw.innerHTML = "<input id=\"LoidPassword\" class=\"form-control\" type=\"password\" maxLength=256 name=\"LoidPassword\" value=" + document.OLTForm.LoidPassword.value + ">";
                                                        }
                                                        LoidPassword.value = tempvalue1;
                                                    }

                                                }

                                                </script> -->
                                                <script language="JavaScript" type="text/JavaScript">
                                                    function doshowLOIDpswChange2() {
                                                        if ($('#cb_enablshowpsw2').prop("checked") == true) {
                                                            $('#LoidPassword').attr('type', 'text');
                                                        }
                                                        else {
                                                            $('#LoidPassword').attr('type', 'password');
                                                        }
                                                    }
    
                                                    function doshowLOIDpswChange() {
                                                        with (getElById('OLTForm')) {
                                                            var tempvalue1 = LoidPassword.value;
                                                            if (cb_enablshowpsw.checked) {
                                                                inLoidpsw.innerHTML = "<input id=\"LoidPassword\" class=\"form-control\" type=\"text\" maxLength=256 name=\"LoidPassword\" value=" + document.OLTForm.LoidPassword.value + ">";
                                                            }
                                                            else {
                                                                inLoidpsw.innerHTML = "<input id=\"LoidPassword\" class=\"form-control\" type=\"password\" maxLength=256 name=\"LoidPassword\" value=" + document.OLTForm.LoidPassword.value + ">";
                                                            }
                                                            LoidPassword.value = tempvalue1;
                                                        }
    
                                                    }
    
                                                    </script>
                                            <% end if %>
                                                                                </div>
                                                              </div>
                                                                </div>
                                                                <div class="col-md-12 form-group">
                                                                    <hr class="margin_adjs" />
                                                                </div>
                                                        <div class="form-footer text-right">
                                                        <% if tcWebApi_get("WebCurSet_Entry", "isLOIDLocked", "h") <> "Yes"  then %>
                                                        <input  class="btn btn-orang btn-lg" type="button" id="btnAuth" name="btnAuth"  onclick="doSubmit()" value="<%tcWebApi_get("String_Entry","CertificationText","s")%>"/>
        <input type="button"  class="btn btn-secondary btn-lg" id="btnCancel" name="btnCancel" onclick="RefreshPage()" value="<%tcWebApi_get("String_Entry","CancelText","s")%>"/>

                                           <% end if %>

                                           <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
   if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
   <input type="hidden" name="simOLTVerify" id="simOLTVerify" value="1">
                <input type="hidden" name="simUSERID" id="simUSERID" value="<%tcwebApi_get("WebCurSet_Entry","CurrentAccess","s")%>">
                 <INPUT "id=SerConfig"    class="btn btn-orang btn-lg" onclick="doSubmit()" type="button" value="<%tcWebApi_get("String_Entry","BusinessConfigurationText","s")%>" name="SerConfig">

    <% end if %>
     <% end if %>
                                        <input type="hidden" id="broadbandusername" name="broadbandusername" value="">
                        <input type="hidden" id="customer_ID" name="customer_ID" value="">
                        <input type="hidden" id="devReginfoFlag" name="devReginfoFlag" value="1">
                        <input type="hidden" id="newStatusFlag" name="newStatusFlag" value="0">
                        <input type="hidden" id="Register_CHANGE" name="Register_CHANGE" value="1">
                      <input type="hidden" name="SubmitFlag" value="0">
                      <input type="hidden" name="PasswordFlag" value="0">
                      <input type="hidden" name="HexFlag" <%if tcWebApi_get("GPON_ONU","HexFlag","h") = "true" then %>value="true" <%else%> value="false" <%end if %>>
                      <!-- <script language="JavaScript" type="text/JavaScript">
<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
   if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
function rmCookie(name)
{
        var exp = new Date();
        exp.setTime(exp.getTime() - 10000);
        document.cookie = name + "=del;expires=" + exp.toGMTString();
        document.cookie = name + "=del;expires=" + exp.toGMTString()+";path=/;";
}
<% end if
end if %>
                                                function doSubmit() {
                                                        var Form = document.OLTForm;
                                                        if(Form.VerificationType[1].checked == true)
                                                        {
                                var upperCase = /[G-Z]/;
                                var lowerCase = /[g-z]/;
                                var specificSymbol = /[-`=\[\];',.~!@#$%^&*()_+|{}:"?]/;
                                                            var PasswordPwd = Form.PasswordPwd.value;
                                                            var PasswordSN = Form.PasswordSN.value;

                                                            if(PasswordPwd == "")
                                {
                                    alert("Password<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                    Form.PasswordPwd.focus();
                                    return;
                                }

                                                            if(Form.HexFlag.value == "true")
                                {
                                    if(upperCase.test(PasswordPwd) || lowerCase.test(PasswordPwd) || specificSymbol.test(PasswordPwd))
                                    {
                                        alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText4","s")%>");
                                        Form.PasswordPwd.focus();
                                        return;
                                    }
                                }

                                                            if(PasswordSN != "" && PasswordSN.length != 12)
                                                            {
                                                                alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText3","s")%>");
                                                                Form.PasswordSN.focus();
                                                                return;
                                                            }
                                                            else
                                                            {
                                                                var tempSN= PasswordSN.substring(PasswordSN.length-8, PasswordSN.length);
                                                                if(upperCase.test(tempSN) || lowerCase.test(tempSN) || specificSymbol.test(tempSN))
                                    {
                                        alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText5","s")%>");
                                        Form.PasswordSN.focus();
                                        return;
                                    }
                                }
                                                        }

<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
   if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
                                                        rmCookie("UID");rmCookie("PSW");
                                                        document.cookie = "RegPageStatus=1";
                                                        document.cookie = "RegPagetimeoutcount=0";
                                                        document.cookie = "RegProgressPercent=-1";
                                                        document.cookie = "RegServiceFetch=0";
                                                        document.cookie = "RegServiceNameId=0";
                                                        document.cookie = "RegServiceIPTV=0";
                                                        document.cookie = "RegServiceINTERNET=0";
                                                        document.cookie = "RegServiceVOIP=0";
                                                        document.cookie = "RegServiceOther=0";
                                                        document.cookie = "HasRetryTimesSubmit=0";
   <%else%>
                                                        if(Form.LoidUsername.value == "" && Form.VerificationType[0].checked == true)
                                                        {
                                                                alert("LOID<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                                                Form.LoidUsername.focus();
                                                                return;
                                                        }
   <% end if
else%>
<%if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") <> "Yes" then%>
                                                        if(Form.LoidUsername.value == "" && Form.VerificationType[0].checked == true)
                                                        {
                                                                alert("LOID<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                                                Form.LoidUsername.focus();
                                                                return;
                                                        }
<%end if%>
<%end if%>
<%if tcWebApi_get("WebCustom_Entry", "isCTPONCYSupported", "h") = "Yes"  then%>
<%if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") <> "Yes" then%>
                                                        var loidchg = trimspace(Form.LoidUsername.value);
                                                        setText('LoidUsername',loidchg);
<%end if%>
<%end if%>
<% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
                                                        var reg = /^[a-zA-Z0-9][\x21-\x73]*[a-zA-Z0-9]$|^[a-zA-Z0-9]+$/;
                                                        var str = Form.LoidUsername.value;
                                                        if (reg.test(str) == false)
                                                        {
                                                        alert("LOID<%tcWebApi_get("String_Entry","StartAndEndText","s")%>");
                                                                return;
                                                        }
                                                         str = Form.LoidPassword.value;
                                                        if (str.length>0 && reg.test(str) == false)
                                                        {
                                                                alert("Password<%tcWebApi_get("String_Entry","StartAndEndText","s")%>");
                                                                return;
                                                        }
<%end if%>
                                                        Form.broadbandusername.value = Form.LoidUsername.value;
                                                        Form.customer_ID.value = Form.LoidPassword.value;
                                                        document.cookie = "RegPageStatus=1";
                                                        document.cookie = "RegPagetimeoutcount=0";
                                                        document.cookie = "RegPagetimeoutcount_2=0";
                                                        document.cookie = "RegProgressPercent=-1";
                                                        document.cookie = "RegServiceFetch=0";
                                                        document.cookie = "RegServiceNameId=0";
                                                        document.cookie = "RegServiceIPTV=0";
                                                        document.cookie = "RegServiceINTERNET=0";
                                                        document.cookie = "RegServiceVOIP=0";
                                                        document.cookie = "RegServiceOther=0";
                                                        document.cookie = "HasRetryTimesSubmit=0";
                                                <% if tcWebApi_get("WebCustom_Entry", "isCTPONCYCQSupported", "h") = "Yes" then%>
                                                        var dateT = new Date();
                                                        document.cookie = "RegStartTime="+dateT.getTime();
                                                <% end if%>
                                                <% if tcWebApi_get("WebCustom_Entry", "isCTPONBIND2WebSupported", "h") = "Yes" then%>
                                                        document.cookie = "RegServicBIND2ITMSTimeout=0";
                                                        document.cookie = "RegServicBIND2WebStartTime=0";
                                                <% end if%>

                                                        Form.SubmitFlag.value = "1";
                                                        if( true == setEBooValueCookie(Form) )
                                                                Form.submit();
                                                }

function useAutoStunPortChange()
{
    if (document.STUNForm.UseAutoStunPortEnable.checked)
    {
        document.STUNForm.StunClientPort.setAttribute("disabled", "disabled");
    }
    else
    {
        document.STUNForm.StunClientPort.removeAttribute("disabled");
    }
}
                                                </script> -->
                                                <script language="JavaScript" type="text/JavaScript">
                                                    <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                       if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
                                                    function rmCookie(name)
                                                    {
                                                            var exp = new Date();
                                                            exp.setTime(exp.getTime() - 10000);
                                                            document.cookie = name + "=del;expires=" + exp.toGMTString();
                                                            document.cookie = name + "=del;expires=" + exp.toGMTString()+";path=/;";
                                                    }
                                                    <% end if
                                                    end if %>
                                                                                                    function doSubmit() {
                                                                                                            var Form = document.OLTForm;
                                                                                                            if(Form.VerificationType[1].checked == true)
                                                                                                            {
                                                                                    var upperCase = /[G-Z]/;
                                                                                    var lowerCase = /[g-z]/;
                                                                                    var specificSymbol = /[-`=\[\];',.~!@#$%^&*()_+|{}:"?]/;
                                                                                                                var PasswordPwd = Form.PasswordPwd.value;
                                                                                                                var PasswordSN = Form.PasswordSN.value;
                                                    
                                                                                                                if(PasswordPwd == "")
                                                                                    {
                                                                                        alert("Password<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                                                                        Form.PasswordPwd.focus();
                                                                                        return;
                                                                                    }
                                                    
                                                                                                                if(Form.HexFlag.value == "true")
                                                                                    {
                                                                                        if(upperCase.test(PasswordPwd) || lowerCase.test(PasswordPwd) || specificSymbol.test(PasswordPwd))
                                                                                        {
                                                                                            alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText4","s")%>");
                                                                                            Form.PasswordPwd.focus();
                                                                                            return;
                                                                                        }
                                                                                    }
                                                    
                                                                                                                if(PasswordSN != "" && PasswordSN.length != 12)
                                                                                                                {
                                                                                                                    alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText3","s")%>");
                                                                                                                    Form.PasswordSN.focus();
                                                                                                                    return;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    var tempSN= PasswordSN.substring(PasswordSN.length-8, PasswordSN.length);
                                                                                                                    if(upperCase.test(tempSN) || lowerCase.test(tempSN) || specificSymbol.test(tempSN))
                                                                                        {
                                                                                            alert("<%tcWebApi_get("String_Entry","NetCwmpPasswordText5","s")%>");
                                                                                            Form.PasswordSN.focus();
                                                                                            return;
                                                                                        }
                                                                                    }
                                                                                                            }
                                                    
                                                    <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                       if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then %>
                                                                                                            rmCookie("UID");rmCookie("PSW");
                                                                                                            document.cookie = "RegPageStatus=1";
                                                                                                            document.cookie = "RegPagetimeoutcount=0";
                                                                                                            document.cookie = "RegProgressPercent=-1";
                                                                                                            document.cookie = "RegServiceFetch=0";
                                                                                                            document.cookie = "RegServiceNameId=0";
                                                                                                            document.cookie = "RegServiceIPTV=0";
                                                                                                            document.cookie = "RegServiceINTERNET=0";
                                                                                                            document.cookie = "RegServiceVOIP=0";
                                                                                                            document.cookie = "RegServiceOther=0";
                                                                                                            document.cookie = "HasRetryTimesSubmit=0";
                                                       <%else%>
                                                                                                            if(Form.LoidUsername.value == "" && Form.VerificationType[0].checked == true)
                                                                                                            {
                                                                                                                    alert("LOID<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                                                                                                    Form.LoidUsername.focus();
                                                                                                                    return;
                                                                                                            }
                                                       <% end if
                                                    else%>
                                                    <%if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") <> "Yes" then%>
                                                                                                            if(Form.LoidUsername.value == "" && Form.VerificationType[0].checked == true)
                                                                                                            {
                                                                                                                    alert("LOID<%tcWebApi_get("String_Entry","EmptyText","s")%>");
                                                                                                                    Form.LoidUsername.focus();
                                                                                                                    return;
                                                                                                            }
                                                    <%end if%>
                                                    <%end if%>
                                                    <%if tcWebApi_get("WebCustom_Entry", "isCTPONCYSupported", "h") = "Yes"  then%>
                                                    <%if tcWebApi_get("WebCustom_Entry", "isCMCCSupported", "h") <> "Yes" then%>
                                                                                                            var loidchg = trimspace(Form.LoidUsername.value);
                                                                                                            setText('LoidUsername',loidchg);
                                                    <%end if%>
                                                    <%end if%>
                                                    <% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
                                                                                                            var reg = /^[a-zA-Z0-9][\x21-\x73]*[a-zA-Z0-9]$|^[a-zA-Z0-9]+$/;
                                                                                                            var str = Form.LoidUsername.value;
                                                                                                            if (reg.test(str) == false)
                                                                                                            {
                                                                                                            alert("LOID<%tcWebApi_get("String_Entry","StartAndEndText","s")%>");
                                                                                                                    return;
                                                                                                            }
                                                                                                             str = Form.LoidPassword.value;
                                                                                                            if (str.length>0 && reg.test(str) == false)
                                                                                                            {
                                                                                                                    alert("Password<%tcWebApi_get("String_Entry","StartAndEndText","s")%>");
                                                                                                                    return;
                                                                                                            }
                                                    <%end if%>
                                                                                                            Form.broadbandusername.value = Form.LoidUsername.value;
                                                                                                            Form.customer_ID.value = Form.LoidPassword.value;
                                                                                                            document.cookie = "RegPageStatus=1";
                                                                                                            document.cookie = "RegPagetimeoutcount=0";
                                                                                                            document.cookie = "RegPagetimeoutcount_2=0";
                                                                                                            document.cookie = "RegProgressPercent=-1";
                                                                                                            document.cookie = "RegServiceFetch=0";
                                                                                                            document.cookie = "RegServiceNameId=0";
                                                                                                            document.cookie = "RegServiceIPTV=0";
                                                                                                            document.cookie = "RegServiceINTERNET=0";
                                                                                                            document.cookie = "RegServiceVOIP=0";
                                                                                                            document.cookie = "RegServiceOther=0";
                                                                                                            document.cookie = "HasRetryTimesSubmit=0";
                                                                                                    <% if tcWebApi_get("WebCustom_Entry", "isCTPONCYCQSupported", "h") = "Yes" then%>
                                                                                                            var dateT = new Date();
                                                                                                            document.cookie = "RegStartTime="+dateT.getTime();
                                                                                                    <% end if%>
                                                                                                    <% if tcWebApi_get("WebCustom_Entry", "isCTPONBIND2WebSupported", "h") = "Yes" then%>
                                                                                                            document.cookie = "RegServicBIND2ITMSTimeout=0";
                                                                                                            document.cookie = "RegServicBIND2WebStartTime=0";
                                                                                                    <% end if%>
                                                    
                                                                                                            Form.SubmitFlag.value = "1";
                                                                                                            if( true == setEBooValueCookie(Form) )
                                                                                                                    Form.submit();
                                                                                                    }
                                                    
                                                    function useAutoStunPortChange()
                                                    {
                                                        if (document.STUNForm.UseAutoStunPortEnable.checked)
                                                        {
                                                            document.STUNForm.StunClientPort.setAttribute("disabled", "disabled");
                                                        }
                                                        else
                                                        {
                                                            document.STUNForm.StunClientPort.removeAttribute("disabled");
                                                        }
                                                    }
                                                                                                    </script>
                                            </form>
                                                        </div>
                                                </div>
                        <!-- WebPageShowFlag??????,??TCSUPPORT_STUN??????????stun?????? -->

        <div class="white_box" name="StunConfig">
						    <h1 class="heading_grey heading_margin"><img src="/img/server.png" width="45" height="40" class="img_sub" alt=""><span style="vertical-align:middle;"> STUN</span></h1>
                            <div class="container-fluid">
						            <form class="row" name="STUNForm" id="STUNForm" action="/cgi-bin/net-tr069.asp" method="post">
                                        <input type="hidden" name="SaveSTUNFlag" value="0">
                                        <input type="hidden" id="AutoStunPortEnableFlag" name="AutoStunPortEnableFlag" value="1">
                                        <div class="col-md-12 row form-group custom-control">
                                            <div class="col-md-3 form-group">
						                    <label>STUN:</label>
                                            <input id="StunEnable" type="radio" value="0" name="StunEnable" checked=""> Disable&nbsp;&nbsp;&nbsp;
                                            <input id="radio" type="radio" value="1" name="StunEnable">Enable
                                        </div>
                                        <!-- stun server addr -->
				                        <div class="col-md-3 form-group">
				                            <label>STUN Server Address:</label>
                                            <input id="StunServerAddr" class="form-control" maxlength="256" name="StunServerAddr" value="">
				                        </div>
                                        <!-- stun server port -->
				                        <div class="col-md-3 form-group">
                                            <label>STUN Server Port:</label>
                                            <input id="StunServerPort" class="form-control" maxlength="256" name="StunServerPort" value="3478">
				                        </div>
                                        <!-- wan ip 1 -->
				                        <div class="col-md-3 form-group">
                                            <label>Primary wan ip:</label>
                                            <input id="WanIP1" class="form-control" maxlength="256" name="WanIP1" value="">
				                        </div>
                                        <!-- wan ip 2 -->
				                        <div class="col-md-3 form-group">
                                            <label>Secondary wan ip:</label>
                                            <input id="WanIP2" class="form-control" maxlength="256" name="WanIP2" value="">
				                        </div>
                                        <!-- wan ip 3 -->
				                        <div class="col-md-3 form-group">
                                            <label>Tertiary wan ip:</label>
                                            <input id="WanIP3" class="form-control" maxlength="256" name="WanIP3" value="">
				                        </div>
                                        <!-- stun client port -->
                                        <div class="col-md-12 form-group row">
				                            <div class="col-md-3 form-group">
                                                <label>Stun client port:</label>
                                                <input id="StunClientPort" class="form-control" maxlength="256" name="StunClientPort" value="" disabled="">
                                            </div>
                                            <div class="col-md-3 form-group">
                                                <div class="custom-control custom-checkbox" style="margin-top:35px">
                                                    <input class="custom-control-input" onclick="useAutoStunPortChange()" type="checkbox" id="UseAutoStunPortEnable" name="UseAutoStunPortEnable" checked="">
                                                    <label class="custom-control-label" for="UseAutoStunPortEnable"> Auto</label>
                                                </div>
                                            </div>
				                        </div>
                                        
                                        <!-- min keep alive time -->
                                        <div class="col-md-3 form-group">
                                            <label>Max keep alive time(seconds):</label>
                                            <input id="StunKeepAliveMinTime" class="form-control" maxlength="256" name="StunKeepAliveMinTime" value="30">
                                        </div>
                                        <!-- max keep alive time -->
                                        <div class="col-md-3 form-group">
                                            <label>Min keep alive time, should equal or greater than 30(seconds):</label>
                                            <input id="StunKeepAliveMaxTime" class="form-control" maxlength="256" name="StunKeepAliveMaxTime" value="30">
                                        </div>
                                    </div>
						        </form>
					    </div>

                        <div class="col-md-12 form-group">
                            <hr class="margin_adjs">
                        </div>
                        <div class="form-footer text-right">
                            <input type="button" class="btn btn-orang btn-lg" onclick="applySave()" id="applyOK" name="applyOK" value="Apply">
                            <input type="button" onclick="RefreshPage()" class="btn btn-secondary btn-lg" id="stCancel" name="stCancel" value="Cancel">
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
 <script type="application/javascript">
       $('input[type="file"]').change(function (e) {
           var fileName = e.target.files[0].name;
           $('.custom-file-label').html(fileName);
       });
</script>

<!-- <script language="JavaScript">
<% if tcWebApi_get("WebCustom_Entry", "isCTGDSupported", "h") = "Yes"  then %>
var PeriodicInformIntervalOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPeriodicInformInterval","s")%>";
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
var PeriodicInformIntervalOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPeriodicInformInterval","s")%>";
<% end if %>
var URLOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aURL","s")%>";
var UsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aUsername","s")%>";
var PasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPassword","s")%>";
var CRUsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aConnectionRequestUsername","s")%>";
var CRPasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aConnectionRequestPassword","s")%>";
<% if tcWebApi_get("WebCustom_Entry", "isCTGDSupported", "h") = "Yes"  then %>
if(PeriodicInformIntervalOpenFlag == "1" && getElById('PeriodicInformInterval'))
        getElById('PeriodicInformInterval').disabled = true;
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
if(PeriodicInformIntervalOpenFlag == "1" && getElById('PeriodicInformInterval'))
        getElById('PeriodicInformInterval').disabled = true;
<% end if %>

if(URLOpenFlag == "1" && getElById('URL') )
<% if tcWebApi_get("WebCustom_Entry", "isCTPONHLJSupported", "h") = "Yes"  then %>
        getElById('URL').disabled = false;
<%else%>
        getElById('URL').disabled = true;
<%end if%>
if(UsernameOpenFlag == "1" && getElById('Username'))
        getElById('Username').disabled = true;
if(PasswordOpenFlag == "1" && getElById('Password'))
        getElById('Password').disabled = true;
if(CRUsernameOpenFlag == "1" && getElById('ConnectionRequestUsername'))
        getElById('ConnectionRequestUsername').disabled = true;
if(CRPasswordOpenFlag == "1" && getElById('ConnectionRequestPassword'))
        getElById('ConnectionRequestPassword').disabled = true;
</script> -->
   
<script language="JavaScript">
    <% if tcWebApi_get("WebCustom_Entry", "isCTGDSupported", "h") = "Yes"  then %>
    var PeriodicInformIntervalOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPeriodicInformInterval","s")%>";
    <% end if %>
    <% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
    var PeriodicInformIntervalOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPeriodicInformInterval","s")%>";
    <% end if %>
    var URLOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aURL","s")%>";
    var UsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aUsername","s")%>";
    var PasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPassword","s")%>";
    var CRUsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aConnectionRequestUsername","s")%>";
    var CRPasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aConnectionRequestPassword","s")%>";
    <% if tcWebApi_get("WebCustom_Entry", "isCTGDSupported", "h") = "Yes"  then %>
    if(PeriodicInformIntervalOpenFlag == "1" && getElById('PeriodicInformInterval'))
            getElById('PeriodicInformInterval').disabled = true;
    <% end if %>
    <% if tcWebApi_get("WebCustom_Entry", "isCTPONCZGDSupported", "h") = "Yes"  then %>
    if(PeriodicInformIntervalOpenFlag == "1" && getElById('PeriodicInformInterval'))
            getElById('PeriodicInformInterval').disabled = true;
    <% end if %>
    
    if(URLOpenFlag == "1" && getElById('URL') )
    <% if tcWebApi_get("WebCustom_Entry", "isCTPONHLJSupported", "h") = "Yes"  then %>
            getElById('URL').disabled = false;
    <%else%>
            getElById('URL').disabled = true;
    <%end if%>
    if(UsernameOpenFlag == "1" && getElById('Username'))
            getElById('Username').disabled = true;
    if(PasswordOpenFlag == "1" && getElById('Password'))
            getElById('Password').disabled = true;
    if(CRUsernameOpenFlag == "1" && getElById('ConnectionRequestUsername'))
            getElById('ConnectionRequestUsername').disabled = true;
    if(CRPasswordOpenFlag == "1" && getElById('ConnectionRequestPassword'))
            getElById('ConnectionRequestPassword').disabled = true;
    </script>
</body>
</html>