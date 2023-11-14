<%@ Page Title="" Language="VB" MasterPageFile="~/template1.master" AutoEventWireup="false" CodeFile="all_stations.aspx.vb" Inherits="all_stations" %>
<asp:Content ContentPlaceHolderID="parameterHeader" ID="parametertPlaceHeader" runat="server">
<% 

%>
</asp:Content>
<asp:Content ContentPlaceHolderID="cssPlaceHeader" ID="cssPlaceHeaderContent" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="jsPlaceHeader" ID="jsPlaceHeaderContent" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceMenu2" ID="contentPlaceMenu2" runat="server">
 <div style="width:985px;background:url(images/bg_head_report.png)  repeat-x; height:55px;">
<table cellpadding="3" cellspacing="0" width="100%">
<tr>
<td style="width:185px;background:url(images/bg_search_tab.png)no-repeat; height:95px;padding:15px 0 0 15px;" valign="top" rowspan="2">
 
<span class="flow_menu">ข้อมูลทั้งหมด </span><span class="flow_menu"><% Response.Write(Session("wStation").GetUpperBound(0)+1) %> รายการ</span>
</td>
<td style="padding-top:18px;" valign="top" width="100">
<span class="flow_menu"></span>
</td>
<td style="padding:18px 25px 0 0;" align="right" valign="top" >
<%--<a href="javascript:data_back();"><img src="images/arrow-back-grey.png" align="absmiddle" hspace="10"/></a>
<span class="flow_menu-active"><li>1</li></span>

<% For row As Integer = 2 to 2 %>
<span class="flow_menu"><li><a href="javascript:data_page();"><% Response.Write(row) %></a></li></span>
<% Next %>
<!--...<span class="flow_menu"><li><a href="javascript:data_page();">2</a></li></span>-->
<a href="javascript:data_next();"><img src="images/arrow-next.png" align="absmiddle" hspace="10"/></a>--%>
</td>
</tr>
</table>
</div>

<div style="height:60px;background:url(images/bg_tab_report.png) repeat-x ;">
<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td  align="center" class="head_td" >รายชื่อสถานี</td>
<td class="sect_dotted1 head_td" width="120" align="center">วัน-เวลา</td>
<td class="sect_dotted1 head_td" width="80" align="center">สถานะระบบ</td>
<td class="sect_dotted1 head_td" width="130" align="center"><div>ความเร็วกระแสน้ำ</div><div>(ม./วินาที)</div></td>
<td class="sect_dotted1 head_td" width="135" align="center"><div>อัตราการไหล</div><div>(ลบ.ม./วินาที)</div></td>
<td class="sect_dotted1 head_td" width="85" align="center"><div>ระดับน้ำ</div><div>(ม.รทก.)</div></td>
<td class="sect_dotted1 head_td" width="85" align="center"><div>ปริมาณน้ำ</div><div>(ลบ.ม.)</div></td>
<td class="sect_dotted1 head_td" width="100" align="center">สถานการณ์น้ำ</td>
</tr>
</table>

</div>
</div>
</asp:Content>

<asp:Content ContentPlaceHolderID="contentPlaceHolder" ID="contentPlaceHolderContent" runat="server">

<div style="margin-top:105px;padding:0 0 55px 0;">
<%
For zone As Integer = 0 to Session("wZone").GetUpperBound(0)
        Dim zone_name As String = CStr(Session("wZone")(zone, 0))
        Dim zonesum As String = CStr(Session("wZone")(zone, 1))

%>
<div style="width:985px;background:url(images/bg_head_report2_1.png)repeat-x bottom; height:35px;" class="flow_menu">
<div style="padding:8px 0 0 20px;background:url(images/bg_head_report2_2.png) top left repeat-x;height:25px;float:left;"><% Response.Write(zone_name) %></div>
<div style="background:url(images/bg_head_report2_3.png) top left no-repeat;height:35px;width:80px;float:left;">&nbsp; </div>
</div>
 <table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td style="padding:0 15px 0 15px;" ></td>
<td  width="122"></td>
<td width="80"></td>
<td width="130"></td>
<td width="135"></td>
<td width="87"></td>
<td width="87"></td>
<td width="102" ></td>
</tr>
<%
For row As Integer = 0 to Session("wStation").GetUpperBound(0)
   Dim name as String = CStr(Session("wStation")(row,0))
   Dim connect as String = CStr(Session("cStatus")(CInt(Session("wStation")(row,4)),0))
        Dim status As String = CStr(Session("wStatus")(CInt(Session("wStation")(row, 2) - 1), 0))
        Dim MeanVelocity As String = CStr(Session("wStation")(row, 8))
        Dim flow As String = CStr(Session("wStation")(row, 9))
        Dim waterlevel As String = CStr(Session("wStation")(row, 3))
        Dim volume As String = CStr(Session("wStation")(row, 13))
        Dim dt As String = CStr(Session("wStation")(row, 12))
        
%>
<% 
If CStr(Session("wStation")(row,7))=zone+1 Then


%>
<tr class="list_m">
<td style="padding:0 15px 0 20px;"  ><% Response.Write(name) %><%
                                                                   'If row Mod 2 = 1 Then
                                                                   'Response.Write("2")
                                                                   'End If
%></td>
<td align="center" class="sect_dotted1"><div><% Response.Write(dt)%></div></td> 
<td align="center" class="sect_dotted1"><img src="images/<% Response.Write(connect) %>"/></td>
<td class="sect_dotted1 " align="center"><% Response.Write(MeanVelocity)%></td>
<td class="sect_dotted1 " align="center"><% Response.Write(flow)%></td>
<td class="sect_dotted1 " align="center"><% Response.Write(waterlevel)%></td>
<td class="sect_dotted1 " align="center"><% Response.Write(volume)%></td>
<td class="sect_dotted1" align="center"><img src="images/<% Response.Write(status) %>.gif"/></td>
</tr>
<%
End If 
%>
<%
Next
%>
<tr><td colspan="8" align="right" style="padding:10px 20px;background:#EFEFEF;"><img src="images/bullet-go-icon.png" hspace="5" /><% Response.Write(zonesum)%></td></tr>
</table>
<%
Next
%>

<div style="width:985px;background:url(images/bg_head_report.png)  repeat-x; height:25px;"></div>
<table cellpadding="10" cellspacing="0" width="100%">
<tr>
<td align="right" valign="top" width="403" style="padding-top:15px;">หมายเหตุ :</td>
<td align="left" valign="top" width="300">
<%
For row As Integer = 0 to Session("cStatus").GetUpperBound(0)
   Dim cName as String = CStr(Session("cStatus")(row,0))
   Dim cDesc as String = CStr(Session("cStatus")(row,1))
    
%>
<div style="padding:5px 0 5px 0px;"><img src="images/<% Response.Write(cName)%>" align="absmiddle"/> : <% Response.Write(cDesc)%></div>
<%
Next
%>
</td>
<td valign="top">
<%
For row As Integer = 0 to Session("wStatus").GetUpperBound(0)
   Dim statusIcon as String = CStr(Session("wStatus")(row,0))
   Dim statusName as String = CStr(Session("wStatus")(row,1))
   
%>
<div><img src="images/<% Response.Write(statusIcon)%>.gif" align="absmiddle"/> : <% Response.Write(statusName)%></div>
<%
Next
%>
 </td>

</tr>
</table>

</div>
</asp:Content>


