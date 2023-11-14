<%@ Page Title="" Language="VB" MasterPageFile="~/template1.master" AutoEventWireup="false" CodeFile="stations.aspx.vb" Inherits="stations" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ContentPlaceHolderID="parameterHeader" ID="parametertPlaceHeader" runat="server">
   
</asp:Content>
<asp:Content ContentPlaceHolderID="cssPlaceHeader" ID="cssPlaceHeaderContent" runat="server">
    <link rel="stylesheet" media="all" type="text/css" href="css/jquery-ui.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="jsPlaceHeader" ID="jsPlaceHeaderContent" runat="server">
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script> 
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceImgMenu" ID="contentPlaceImgMenu" runat="server">
    <!--station Img-->
<li class="flow_menu" style="display:inline;list-style:none;"><a href="javascript:list_station2('img_station','img_st2','txt_st2');" id="txt_st2">ซ่อนรูปสถานี</a><img id="img_st2" src="images/hide_icon.png" align="absmiddle" hspace="5"/>
 <img src="images/sect_pink.png" align="absmiddle" hspace="5" /></li>&nbsp;<li style="display:inline;list-style:none;" class="flow_menu" id="list_menus"><a href="javascript:list_station('list_station','img_st','txt_st');" id="txt_st">ซ่อนรายการชื่อสถานีทั้งหมด</a>
<img src="images/hide_icon.png" id="img_st" align="absmiddle" hspace="5" vspace="12"/>
</li>&nbsp;&nbsp;
<!--end station Img-->
</asp:Content>

<asp:Content ContentPlaceHolderID="contentPlaceStatus" ID="contentPlaceStatus" runat="server">
    <!--station status-->
 
 
<div style="position:absolute;margin:40px 0 0 471px;width:200px;text-align:right;background:url(images/bg_head_status.png) top right no-repeat; height:65px;padding:10px 0 10px 10px;">
<span class="h_td">สถานการณ์น้ำ </span> <img src="images/<% Response.Write(Application("status").ToString) %>.gif" hspace="5"  align="absmiddle"/>
   <%-- <asp:Image ID="Image1" runat="server" ImageUrl="~/images/normal.gif" />  
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/warning.gif" />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/urgent.gif" />--%>
</div>
<!--end station status-->
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceHeadStation" ID="contentPlaceHeadStation" runat="server">
    <!--station head-->
<div style="text-align:left;width:650px;margin:0px 0 0 0px;background:url(images/bg_head_report.png) repeat-x;padding:5px 10px 5px 20px;">
 
<span class="h_station_txt"> <img src="images/pin_station1.png" align="absmiddle"/>
<% Response.Write(Application("stationName").ToString) %>
</span>
 
</div>
<div style="height:8px;background:#FFF;"></div>
<!--end station head-->
</asp:Content>

<asp:Content ContentPlaceHolderID="contentPlaceImg" ID="contentPlaceImg" runat="server">
    <!--station Img-->
<div  id="img_station"  class="img_station" style="padding:0px 10px 0px 0px;">
<div style="text-align:center; width:265px; height:225px; overflow:hidden;">
<img src="images/SubStation/<% Response.Write(Application("SubStation").ToString) %>.jpg"/>
</div>
</div>
<!--end station Img-->
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceImgDesc" ID="contentPlaceImgDesc" runat="server">
    <!--รายละเอียดสถานี-->
 <div class="img_desc">
 <% Response.Write(Application("stationDesc").ToString)%>
 </div>
 <!--end รายละเอียดสถานี-->
 </asp:Content>
 
<asp:Content ContentPlaceHolderID="contentPlaceHolder" ID="contentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <!--Contents-->
<div style="width:680px;border-right:1px dotted #CCC;padding:0 0 25px 0;">  <%-- CrossSection/" & Application("crossSection").ToString & ".png);--%><%--Application("crossSection") = "station_img"--%>
<%--<%  
    Dim strwrite As String = "<div style=""background-image:url(images/CrossSection/" & Application("crossSection").ToString & ".png); background-repeat: no-repeat;border-right:1px solid #CCC; height:450px;"">"
    Response.Write(strwrite)%>--%>
<%--<div style="background-image:url(images/CrossSection/1.png); background-repeat: no-repeat;border-right:1px solid #CCC; height:450px;">--%>
<div <% response.write("style=""background-image:url(images/CrossSection/" & Application("crossSection").ToString & ".png); background-repeat: no-repeat;border-right:1px solid #CCC; height:500px; margin-top: 65px;"" ") %>>
<!-- พื้นคลอง image-->
<%--<div style="position:absolute; margin:230px 0 0 0px; height:350px;width:680px; overflow:hidden;padding-top:5px;">
<img src="images/ground_sample.png" />
</div>--%>
<!--end พื้นคลอง image-->

<!--water All-->
<div style="width:680px;position:absolute;margin:310px 0 0 0px;">

<!--water level-->
<div style="position:absolute;margin:18px 0 0 50px;">
<div style="height:30px;width:30px;margin:0px 0 0  0px;background:url(images/level_fade.png) #F00 repeat-x bottom; "></div>
<div style="height:30px;width:30px;margin:0px 0 0  0px;background:url(images/level_fade.png) #F90 repeat-x bottom; "></div>
<div style="height:112px;width:30px;margin:0px 0 0  0px;background:url(images/level_fade.png) #690 repeat-x bottom; "></div>
<div style="height:1px;width:680px;margin:0px 0 0  0px;border-top:1px dotted #630;"></div>
</div>
<!--end water level-->
<!--water image-->		
			
<div style="position:absolute;margin:<% Response.Write(Application("HeightWater").ToString) %>px 0 0 0px; " id="show">
 	<li><img src="images/water_<% Response.Write(Application("status").ToString) %>1.png" /></li>
	<li><img src="images/water_<% Response.Write(Application("status").ToString) %>2.png" /></li>
	<li><img src="images/water_<% Response.Write(Application("status").ToString) %>3.png" /></li>
	<li><img src="images/water_<% Response.Write(Application("status").ToString) %>4.png" /></li>
</div>

<!--end water image-->
</div>

<div id="staion_deep" style="position:absolute;width:680px; z-index:789;">

<div  class="tooltip-down" style="margin:250px 0 0 10px;">
    
<div class="tooltip" >	  
	  <h2>▼ ระดับตลิ่งซ้าย</h2>
      <li><% Response.Write(Application("left").ToString)%><%--<asp:Label ID="lblLeft" runat="server"></asp:Label>--%> &nbsp;เมตร(รทก.)</li>
      
</div>
</div>	
<div  class="tooltip-down" style="margin:250px 0 0 550px;">
<div class="tooltip" >	  
	  <h2>▼ ระดับตลิ่งขวา</h2>
      <li><% Response.Write(Application("right").ToString)%><%--<asp:Label ID="lblRight" runat="server"></asp:Label>--%> &nbsp;เมตร(รทก.)</li>
       
</div>
</div>
		
<div style="margin:420px 0 0 0px;position:absolute;color:#333;text-align:center;width:680px; top: 0px; left: 0px;"> ระดับน้ำ 
    <% Response.Write(Application("water").ToString)%><%--<asp:Label ID="lblwater" runat="server" ></asp:Label>--%>&nbsp;เมตร(รทก.) </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</div>
<!--end water All-->
<!-- Write Div -->
</div><%--<%  Response.Write("</div>")%>--%>
<div style="margin-top:0px;width:680px;border-top:8px solid #963;">
<div >
<div style="padding:15px;position:absolute;background:url(images/bg_left_status.png) no-repeat;width:200px;">
<img src="images/<% Response.Write(Application("imgConnect").ToString) %>" align="absmiddle"/>&nbsp;<% Response.Write(Application("sConnect").ToString) %></div>
<div style="text-align:right;width:645px;padding:15px;"><span class="h_td" >ข้อมูลล่าสุดเมื่อ </span>: <img src="images/calendar_icon_bw.png" hspace="5" align="absmiddle"/> 
    <% Response.Write(Application("lastDate").ToString)%><%--<asp:Label ID="lblLastDate" runat="server"></asp:Label>--%> <img src="images/time_icon_bw.png" hspace="5" align="absmiddle"/> 
    <% Response.Write(Application("lastTime").ToString)%><%--<asp:Label ID="lblLastTime" runat="server" ></asp:Label> --%></div>
</div>
<table cellspacing="0" cellpading="0" width="650" align="center" class="dotted_td">
<tr >
<td class="bg-table-head" width="215"><span class="flow_menu" >ความเร็วกระแสน้ำ</span><br/><span class="flow_menu">เมตร/วินาที</span></td>
<td class="sect-purple" width="2"></td>
<td class="bg-table-head" ><span class="flow_menu" >พื้นที่หน้าตัด</span><br/><span class="flow_menu">ตารางเมตร</span></td>
<td class="sect-purple" width="2"></td>
<td class="bg-table-head"><span class="flow_menu" >ปริมาณน้ำ</span><br/><span class="flow_menu">ลูกบาศก์เมตร</span> </td>
<td class="sect-purple" width="2"></td>
<td class="bg-table-head"><span class="flow_menu" >ทิศทางการไหลของน้ำ</span><br/> </td>

 
</tr>
<tr>
<td class="dotted_td td-station" >
    <% Response.Write(Application("meanvelocity").ToString)%><%--<asp:Label ID="lblMeanVelocity" runat="server" ></asp:Label>--%>
    </td>
 
<td class="dotted_td td-station" colspan="2"><% Response.Write(Application("area").ToString)%><%--<asp:Label ID="lblArea" runat="server" ></asp:Label>--%></td>
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("volume").ToString)%><%--<asp:Label ID="lblVolume" runat="server"></asp:Label>--%>
    </td>
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("directionname").ToString)%><%--<asp:Label ID="lblDirection" runat="server" ></asp:Label>--%></td>

</tr>

</table>
 
<table cellspacing="0" cellpading="0" width="650" align="center" style="margin-top:15px;" class="dotted_td">
<tr >
<td class="bg-table-head" width="215"><span class="flow_menu" >ประเภท</span></td>
<td class="sect-purple" width="2"></td>
<td class="bg-table-head" ><span class="flow_menu" >อัตราการไหล</span><br/><span class="flow_menu">ลูกบาศก์เมตร/วินาที</span></td>
<td class="sect-purple" width="2"></td>
<td class="bg-table-head"><span class="flow_menu" >ระดับน้ำ</span><br/><span class="flow_menu">เมตร(รทก.)</span></td>
 
</tr>
<tr>
<td class="dotted_td td-station">ล่าสุด</td>
 
<td class="dotted_td td-station" colspan="2">
<% Response.Write(Application("Flow").ToString) %>
    <%--<asp:Label ID="lblFlow" runat="server"></asp:Label>--%>
    </td>
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("water").ToString)%><%--<asp:Label ID="lblwaterlevel" runat="server"></asp:Label>--%>
    </td>
</tr>
<tr bgcolor="#EFEFEF">
<td class="dotted_td td-station" >สูงสุด</td>
 
<td class="dotted_td td-station" colspan="2">
<%  Response.Write(Application("Flowmax").ToString)%>
    <%--<asp:Label ID="lblFlowMax" runat="server"></asp:Label>--%>
    <br/>

    <% Response.Write(Application("Flowmaxtime").ToString)%><%--<asp:Label ID="lblFlowMaxTime" runat="server"></asp:Label>--%>
    </td>
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("watermax").ToString)%><%--<asp:Label ID="lblwaterlevelMax" runat="server"></asp:Label>--%>
    <br/> 
    <% Response.Write(Application("watermaxtime").ToString)%><%--<asp:Label ID="lblwaterlevelMaxTime" runat="server"></asp:Label>)--%>
</td>
</tr>
<tr>
<td class="dotted_td td-station">ค่าเฉลี่ย</td> 
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("flowavg").ToString)%><%--<asp:Label ID="lblFlowAvg" runat="server"></asp:Label>--%>
    </td>
<td class="dotted_td td-station" colspan="2">
    <% Response.Write(Application("wateravg").ToString)%><%--<asp:Label ID="lblwaterlevelAvg" runat="server"></asp:Label>--%>
   </td>
</tr>
</table>
<div style="padding:15px 8px 8px 15px;" ><span class="h_td" >หมายเหตุ : </span>ค่าสูงสุดและ ค่าเฉลี่ย เริ่มคำนวณจากเวลา 7 โมงเช้าของทุกวัน</div>
</div>

</div>
<div style="text-align:left;100%;margin:0px 0 15px 0px;background:url(images/bg_head_report.png) repeat-x;height:15px;">
</div>
<div  style="padding:10px 0 50px 20px;" id="graphSelect">
<table cellspacing="0" cellpading="0" width="100%">
<tr>
<td  valign="top" width="100">เลือกดูข้อมูลกราฟ : </td>
<td  valign="top">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <asp:DropDownList ID="ddlChart" runat="server" AutoPostBack="True" 
        Width="165px">
        <asp:ListItem Value="1">อัตราการไหล</asp:ListItem>
        <asp:ListItem Value="2">ระดับน้ำ</asp:ListItem>
        <asp:ListItem Value="3">ความเร็วกระแสน้ำ</asp:ListItem>
        <asp:ListItem Value="4">พื้นที่หน้าตัด</asp:ListItem>
        <asp:ListItem Value="5">ปริมาณน้ำ</asp:ListItem>
    </asp:DropDownList>  
    </ContentTemplate>    
    </asp:UpdatePanel>
    </td>
</tr>
<tr>
<td colspan="2" valign="top" style="padding-top:15px;">
 <%--<img id ="gStation" src="images/<% Response.Write(CStr(Session("graphData")(0,1))) %>"/>--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
       <asp:Chart ID="Chart1" runat="server" Height="290px" Width="888px" 
        BorderlineWidth="3" >
        <Series>
            <asp:Series Name="Series1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlChart" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
 
    
</td>
</tr>
</table>
<br />
<table cellspacing="0" cellpading="0" align="center" width="100%"   >
<tr>
    <td align="center">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate> 
        <!--<div align ="center" style="width:80%;height:40px;background:url(images/bg_tab_report.png);">-->
       <asp:GridView ID="gdvDataChart" runat="server" AutoGenerateColumns="False" 
               PageSize="20" AllowPaging="True" width="100%" 
               BorderStyle="Dotted"  BorderWidth="1px">
      <Columns>
           <asp:TemplateField HeaderText="วัน - เวลา">
           <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >วัน - เวลา</div></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SERVER_DATETIME_STR") %>'></asp:Label>
                </ItemTemplate>               
               <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px" HorizontalAlign="Center" />
           </asp:TemplateField>
           <asp:TemplateField HeaderText="สถานะระบบ">
            <HeaderTemplate><div align=center style="width:150px; font-weight:bold;" >สถานะระบบ</div></HeaderTemplate>
                <ItemTemplate>                  
                    <asp:Image ID="imgStatus" runat="server" 
                        ImageUrl='<%# Bind("ImageStatus") %>' />                  
                </ItemTemplate>                
               <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="อัตราการไหล (ลบ.ม./วินาที)" visible="true">
            <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >อัตราการไหล (ลบ.ม./วินาที)</div></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("flow") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px"  HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ระดับน้ำ (ม.รทก.)" visible="false">
            <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >ระดับน้ำ (ม.รทก.)</div></HeaderTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("waterlevel") %>'></asp:Label>
                 </ItemTemplate>
                 <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px"  HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ความเร็วกระแสน้ำ (ม./วินาที)" visible="false"> 
            <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >ความเร็วกระแสน้ำ (ม./วินาที)</div></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mean_velocity") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px"  HorizontalAlign="Center"/>
            </asp:TemplateField>   
             <asp:TemplateField HeaderText="พื้นที่หน้าตัด (ตร.ม.)" visible="false">
             <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >พื้นที่หน้าตัด (ตร.ม.)</div></HeaderTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("area") %>'></asp:Label>
                 </ItemTemplate>
                 <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px"  HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ปริมาณน้ำ (ลบ.ม.)" visible="false">
            <HeaderTemplate><div align=center style="width:300px; font-weight:bold;" >ปริมาณน้ำ (ลบ.ม.)</div></HeaderTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label7" runat="server" Text='<%# Bind("volume") %>'></asp:Label>
                 </ItemTemplate>                
                 <HeaderStyle BorderStyle="Dotted" BorderWidth="1px" />
                <ItemStyle BorderStyle="Dotted" BorderWidth="1px"  HorizontalAlign="Center"/>
            </asp:TemplateField>          
        </Columns>
        <HeaderStyle Height="40px" HorizontalAlign="Center" ForeColor="#5C852D"/>
           <PagerStyle BorderStyle="Dotted"  BorderWidth="1"/>
        <RowStyle Height="30px" BorderStyle="Dotted"  BorderWidth="1"/>
        <FooterStyle Wrap="True" BorderStyle="Dotted" BorderWidth="1px" 
               HorizontalAlign="Center" />
    </asp:GridView>
        </div>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlChart" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>                
    </td>
</tr>
</table> 
</div>
<!--end Contents-->
<script>

var station_id = (40*<% Response.Write(Request.QueryString("station")) %>)-10;

 $(document).ready(function(){
 
 //ความสูงเมนูขวา //
 $('#list_station').css('height','480px');
 
  //จำ ตำแหน่ง scroll bar  //
  if($.session.get("img_visible")=="true"){
  
 list_hide('img_station','img_st2','txt_st2');
 
 }
 
  

 ///water animate///
 $('#show').innerFade({
				indexContainer: '#index',
				currentItemContainer: '.current',
				totalItemsContainer: '.total',
				timeout:300,
				pauseLink: '.pause',
				prevLink: '.prev',
				nextLink: '.next'                
});	
			
});

</script>
    </form>
</asp:Content>


