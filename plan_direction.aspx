<%@ Page Title="" Language="VB" MasterPageFile="~/template1.master" AutoEventWireup="false" CodeFile="plan_direction.aspx.vb" Inherits="plan_direction" %>
<asp:Content ContentPlaceHolderID="parameterHeader" ID="parametertPlaceHeader" runat="server">
    <script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript" src="js/ddpowerzoomer.js">

    /***********************************************
    * Image Power Zoomer- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
    * This notice MUST stay intact for legal use
    * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
    ***********************************************/

</script>

<script type="text/javascript">

    jQuery(document).ready(function ($) { //fire on DOM ready

        /*
        EXAMPLE 1:
        $('#myimage').addpowerzoom()

        EXAMPLE 2:
 
        $('img.vacation').addpowerzoom({
        defaultpower: 8,
        powerrange: [2,10],
        largeimage: null,
        magnifiersize: [200,100] //<--no comma following last option!
        })
       
*/
    })

</script>
<script type="text/javascript">
    jQuery(document).ready(function ($) { //fire on DOM ready
        $('#maps_w').addpowerzoom()
    })
 </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="cssPlaceHeader" ID="cssPlaceHeaderContent" runat="server">
  
</asp:Content>
<asp:Content ContentPlaceHolderID="jsPlaceHeader" ID="jsPlaceHeaderContent" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceImgMenu" ID="contentPlaceImgMenu" runat="server">
    <!--station Img-->
   <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
 
<div style="padding:10px 15px;"><span class="flow_menu" style="width:120px;margin-left:10px;">เลือกประเภทข้อมูล </span>
    <asp:DropDownList ID="ddltype" runat="server" AutoPostBack="True">
        <asp:ListItem Value="0">อัตราการไหล</asp:ListItem>
        <asp:ListItem Value="1">ระดับน้ำ</asp:ListItem>
        <asp:ListItem Value="2">ความเร็วกระแสน้ำ</asp:ListItem>
        <asp:ListItem Value="3">พื้นที่หน้าตัด</asp:ListItem>
        <asp:ListItem Value="4">ปริมาณน้ำ</asp:ListItem>
    
    </asp:DropDownList>
<%--<select style="width:120px;margin-left:10px;" name="">
<%

For row As Integer = 0 to Session("graphData").GetUpperBound(0)
Dim name as String = CStr(Session("graphData")(row,0))
Dim graph as String = CStr(Session("graphData")(row,1))
   
%>
<option value="<% Response.Write(graph) %>"><% Response.Write(name) %></option>
<%
Next
%>

</select>--%>
 

</div>
<!--end station Img-->

 </form>
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceMaps" ID="contentPlaceMaps" runat="server">
    <%--
<div style="margin:35px 0 0 35px;">

 
<div  style="margin:0px;padding:0px;height:30px;"><img src="images/zoom-in.png" id="zoomIn" border="0" class="menu_f"/></div>
<div style="margin:0px;padding:0px;"><img src="images/zoom-out.png" id="zoomOut" border="0" class="menu_f"/></div>
 


</div>--%>

</asp:Content>

<asp:Content ContentPlaceHolderID="contentPlaceHolder" ID="contentPlaceHolderContent" runat="server">
 
    <div style="margin-top:0px;padding:0 0 0px 0;" id="dragContain">
   
  <style>
.container     {  overflow: hidden;width: 983px; height:800px; }

</style>

        
        
<div id="divimage"  class="container">
  
    <img id="maps_w" src="images/wattercreate.png" style="width:100%;" />
<%--<asp:Image runat="server"  id="maps_w2" width="100%" ImageUrl="~/images/wattercreate.png" Visible="false" />--%>

   <%-- <img src="images/water3.png" id="maps_w" width="100%" /> --%>
</div>

 
</div>


<!--end Contents-->
<script>

    $(document).ready(function () {




        $('#list_station').css('height', '400px');
        //จำ ตำแหน่ง scroll bar  //
        if ($.session.get("list_visible") == "true") {

            $('#right_menu').slideToggle();
            $('#right_menu').hide();
            list_station('list_station', 'img_st', 'txt_st');

        }

    });



</script>

</asp:Content>
