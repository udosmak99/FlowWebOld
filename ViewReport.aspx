<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewReport.aspx.vb" Inherits="ViewReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
        Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
        <%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
        Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%--<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
        Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <title></title>
        <meta http-equiv="Cache-Control" content="no-cache" />
        
        <%--                <meta http-equiv="X-UA-Compatible" content="IE=8" />--%>
</head>
<body topmargin="20">
        <form id="form1" runat="server">
        <div align="center" style=" width: 980px;">
                <CR:CrystalReportViewer ID="CryReport" runat="server" AutoDataBind="false" ForeColor="Black"  CssClass="report"
                        Style="opacity: 1; background-color:White ;" Width="975px" ToolPanelView="None" BackColor="#ffffcc" EnableParameterPrompt=false 
                        HasCrystalLogo="False" HasViewList="False" DisplayToolbar="true" DisplayGroupTree="False"></CR:CrystalReportViewer>
        </div>
        </form>
</body>
<script language="javascript">
        if (document.getElementById("CryReport") != null) {
                document.getElementById("CryReport").rows[0].cells[0].childNodes[1].childNodes[2].style.display = "none";
                var tb = document.getElementById("CryReport").rows[0].cells[0].childNodes[1].childNodes[2];
                var S = tb.children[0].rows[0].cells[15].children[0].innerText.split('/');
                if (window.parent != null) {
                        if (window.parent.SetSizeReport  != undefined) {
                                window.parent.SetSizeReport(document.getElementById("CryReport").offsetHeight, S[1]);
                        }
                }
           
        }
        function SetRpt() {
              
        }
        function GoPage(Page) {
                if (document.getElementById("CryReport") != null) {
                        document.getElementsByName('CryReport$ctl02$ctl09')[0].value = Page;
                        document.getElementById('CryReport_ctl02_ctl10').click();
                }
        }
        function Zoom(ZoomValue) {
                if (document.getElementById("CryReport") != null) {


                        document.getElementsByName('CryReport$ctl02$ctl15')[0].value = ZoomValue;
                        setTimeout('__doPostBack(\'CryReport$ctl02$ctl15\',\'\')', 0);
                        //document.getElementById('CryReport_ctl02_ctl10').click();
                }
        }
</script>
</html>
