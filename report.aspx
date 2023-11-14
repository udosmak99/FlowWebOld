<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report.aspx.vb" Inherits="Report"
        MasterPageFile="~/template1.master" %>

<asp:Content ContentPlaceHolderID="cssPlaceHeader" ID="cssPlaceHeaderContent" runat="server">
        <link rel="stylesheet" media="all" type="text/css" href="css/jquery-ui-timepicker-addon.css" />
        <link rel="stylesheet" media="all" type="text/css" href="css/jquery-ui.css" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <%--        <meta http-equiv="X-UA-Compatible" content="IE=8" />--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="jsPlaceHeader" ID="jsPlaceHeaderContent" runat="server">
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
        <script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceMenu4" ID="contentPlaceMenu4" runat="server">
        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnablePageMethods="true">
        </asp:ScriptManager>
        <div style="width: 985px; background: url(images/bg_head_report.png)  repeat-x; height: 95px;">
                <table cellpadding="3" cellspacing="0">
                        <tr>
                                <td style="width: 185px; background: url(images/bg_search_tab.png)no-repeat; height: 95px;
                                        padding: 30px 0 0 15px;" valign="top" rowspan="2">
                                        <img src="images/search_icon.png" align="absmiddle" hspace="10" />
                                        <span class="flow_menu">เงื่อนไขการค้นหา</span>
                                </td>
                                <td style="padding-top: 18px;" align="right" valign="top" width="100">
                                        <span class="flow_menu">เลือกรายชื่อสถานี </span>
                                </td>
                                <td style="padding: 15px 0 0 5px;" valign="top">
                                        <select style="width: 180px;" id="selStation" runat="server" datatextfield="stn_name"
                                                datavaluefield="stn_id">
                                        </select>
                                </td>
                                <td style="padding-top: 18px;" align="right" valign="top" width="130">
                                        <span class="flow_menu" id="lbStartDate">วันที่ - เวลา เริ่มต้น </span>
                                </td>
                                <td style="padding: 13px 0 0 5px;" valign="top">
                                        <asp:HiddenField ID="txtDate" runat="server" />
                                        <input type="text" size="17" id="time_start" name="time_start" class="calendar" onchange="document.getElementById('<%= txtDate.ClientID%>').value= this.value ;" />
                                        <%--<select id =selStartMonth  >
                                                <option value=0  selected=selected ><--------เลื่อกเดือน-----></option>
                                        </select>--%>
                                </td>
                                <td rowspan="2" valign="top" style="padding: 25px 0 0 25px;">
                                        <div>
                                                <input type="button" class="flow_menu" style="background: url('images/send_bt.png') no-repeat;
                                                        border: 0px; width: 106px; height: 39px; cursor: hand; cursor: pointer;"
                                                        value="แสดงข้อมูล" id="btnReport" onclick="ViewToReport(1,1)" /></div>
                                </td>
                        </tr>
                        <tr>
                                <td style="padding-top: 13px;" align="right" valign="top">
                                        <span class="flow_menu">ประเภทรายงาน</span>
                                </td>
                                <td style="padding: 10px 0 0 5px;" valign="top">
                                        <select style="width: 180px;" id="selReport" runat="server" datatextfield="Rpt_Name"
                                                datavaluefield="Rpt_ID" onchange="GetOptionReport(this.value)">
                                        </select>
                                </td>
                                <td style="padding-top: 13px;" align="right" valign="top">
                                        <span class="flow_menu" id="lbEndDate">วันที่ - เวลา สิ้นสุด</span>
                                </td>
                                <td style="padding: 10px 0 0 5px;" valign="top">
                                        <asp:HiddenField ID="txtToDate" runat="server" />
                                        <input type="text" size="17" name="time_end" id="time_end" class="calendar" onchange="document.getElementById('<%= txtToDate.ClientID%>').value= this.value ;" />
                                </td>
                        </tr>
                </table>
        </div>
        <div style="height: 105px; background: url(images/bg_tab_report.png) repeat-x;">
                <table cellpadding="0" cellspacing="0">
                        <tr>
                                <td>
                                        <div style="padding: 13px 8px 0 5px;">
                                                <ul id="tabs">
                                                        <li><a name="datas" onclick=" ViewToReport(1,1)">
                                                                <img src="images/data_list.png" align="absmiddle" hspace="5" /><span class="head_td">ข้อมูล</span></a></li>
                                                        <li><a name="graphs" onclick="ViewToReport(2,1)">
                                                                <img src="images/chart_line.png" align="absmiddle" hspace="5" /><span class="head_td">กราฟ</span></a></li>
                                                </ul>
                                        </div>
                                </td>
                                <td class="sect_dotted">
                                        <select style="width: 100px; margin-right: 5px;" id="SelPrint" runat="server">
                                                <option value="3">ข้อมูล และ กราฟ</option>
                                                <option value="1">ข้อมูล</option>
                                                <option value="2">กราฟ</option>
                                        </select>
                                </td>
                                <td>
                                        <input type="button" class="flow_menu bt_blue" value="พิมพ์รายงาน" onclick="ViewToReport(3,3)" />
                                </td>
                                <td class="sect_dotted">
                                        <input type="button" class="flow_menu bt_green" value="บันทึกข้อมูล" onclick="ViewToReport(3,2)" />
                                </td>
                                <td class="sect_dotted">
                                        << <a id="btnPrevious" style="cursor:pointer" onclick="PreviousPage()">ก่อนหน้า</a> &nbsp; รายงานหน้า
                                        <input type="text" id="txtPage" class="" style="width: 20px; text-align: center;"
                                                name="index" value="1" onkeypress="if ((event.which &amp;&amp; event.which == 13) || (event.keyCode &amp;&amp; event.keyCode == 13)) { GotoPage(this.value);}" />
                                        / <span id="lbTotalPage">+ </span>&nbsp; หน้า &nbsp; <a id="btnNext"   style="cursor:pointer" onclick="NextPage()">ถัดไป</a> >>
                                </td>
                                <td class="sect_dotted">
                                        ย่อ/ขยาย
                                        <select style="width: 55px; margin-left: 2px;" id =selZoom onchange="SetZoom(this.value)">
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="75">75</option>
                                                <option selected="selected" value="100">100</option>
                                                <option value="125">125</option>
                                                <option value="150">150</option>
                                                <option value="200">200</option>
                                                <option value="300">300</option>
                                                <option value="400">400</option>
                                        </select>
                                        &#37;
                                </td>
                        </tr>
                </table>
        </div>
        </form>
        </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceHolder" ID="contentPlaceHolderContent"
        runat="server">
        <div style="margin-top: 140px; padding: 8px 0 85px 0;">
                <div id="content">
                        <%--style="overflow: hidden;"--%>
                        <div id="datas" class="tab_data">
                                <div class="dotted-bottom" style="padding: 15px 4px 8px 4px;">
                                        <%--ใส่ข้อมูล--%>
                                        <iframe id="ifrReport" width="100%" style="border-width: 0px; border-color: #C0C0C0"
                                                scrolling="no" height="100%" src="ViewReport.aspx"></iframe>
                                </div>
                                <div style="width: 985px; background: url(images/bg_head_report.png)  repeat-x; height: 25px;">
                                </div>
                        </div>
                        <div id="graphs" class="tab_data" style="display: none;">
                                <div class="dotted-bottom" id="graphs1" style="padding: 20px 4px 8px 4px;">
                                        <%--ใส่กราฟ--%>
                                </div>
                                <div style="width: 985px; background: url(images/bg_head_report.png)  repeat-x; height: 25px;">
                                </div>
                        </div>
                </div>
        </div>

        <script type="text/javascript">
                function ToString2(V) {
                        return (V < 10 ? "0" : "") + V.toString();
                }
                var D = new Date();

                document.getElementById('time_end').value = ToString2(D.getDate()) + "/" + ToString2(D.getMonth() + 1) + "/" + D.getFullYear().toString() + " " + ToString2(D.getHours()) + ":" + ToString2(D.getMinutes());

                //document.getElementById('time_end').value = D.getDate().toString() + "/" + (D.getMonth() + 1).toString() + "/" + D.getFullYear().toString() + " " + D.getHours().toString() + ":" + D.getMinutes().toString();
                D = new Date(D.getFullYear(), D.getMonth(), D.getDate()-1, D.getHours(), D.getMinutes());

                document.getElementById('time_start').value = ToString2(D.getDate()) + "/" + ToString2(D.getMonth() + 1) + "/" + D.getFullYear().toString() + " " + ToString2(D.getHours()) + ":" + ToString2(D.getMinutes());
                document.getElementById("<%=selReport.ClientID %>").selectedIndex = 1;
                document.getElementById("<%=selStation.ClientID %>").selectedIndex = 3;
                ViewToReport(1, 1);
                $(function () {

                        var startDateTextBox = $('#time_start');
                        var endDateTextBox = $('#time_end');

                        startDateTextBox.datetimepicker({
                                dateFormat: 'dd/mm/yy',
                                timeFormat: 'hh:mm',
                                onClose: function (dateText, inst) {
                                        if (endDateTextBox.val() != '') {
                                                var testStartDate = startDateTextBox.datetimepicker('getDate');
                                                var testEndDate = endDateTextBox.datetimepicker('getDate');
                                                if (testStartDate > testEndDate)
                                                        endDateTextBox.datetimepicker('setDate', testStartDate);
                                        }
                                        else {
                                                endDateTextBox.val(dateText);
                                        }
                                },
                                onSelect: function (selectedDateTime) {
                                        endDateTextBox.datetimepicker('option', 'minDate', startDateTextBox.datetimepicker('getDate'));
                                }
                        });
                        endDateTextBox.datetimepicker({
                                dateFormat: 'dd/mm/yy',
                                timeFormat: 'hh:mm',
                                onClose: function (dateText, inst) {
                                        if (startDateTextBox.val() != '') {
                                                var testStartDate = startDateTextBox.datetimepicker('getDate');
                                                var testEndDate = endDateTextBox.datetimepicker('getDate');
                                                if (testStartDate > testEndDate)
                                                        startDateTextBox.datetimepicker('setDate', testEndDate);
                                        }
                                        else {
                                                startDateTextBox.val(dateText);
                                        }
                                },
                                onSelect: function (selectedDateTime) {
                                        startDateTextBox.datetimepicker('option', 'maxDate', endDateTextBox.datetimepicker('getDate'));
                                }
                        }).each(function (i) {
                                eval($(this).text());
                        });
                });

                $.session.set("data_pos", 110);
                $.session.set("data_name", "datas");
                $.session.set("data_index", 1);



                function GetOptionReport(Rpt_Id) {
                        var time_end = document.getElementById("time_end");
                        PageMethods.GetReport(Rpt_Id, function (RptItem) {
                                switch (RptItem.Rpt_ID) {
                                        case 1:
                                                lbStartDate.innerText = "วันที่ - เวลา เริ่มต้น";
                                                lbEndDate.innerText = "วันที่ - เวลา สิ้นสุด";
//                                                lbEndDate.disabled = "";
                                                //                                                time_end.disabled = "";
                                                lbEndDate.style.display = "block";
                                                time_end.style.display = "block";

                                                break;
                                        case 2:
                                                lbStartDate.innerText = "วันที่ - เวลา";
                                                lbEndDate.innerText = "วันที่ - เวลา สิ้นสุด";
                                                //lbEndDate.disabled = "disabled";
                                                //time_end.disabled = "disabled";
                                                lbEndDate.style.display = "none";
                                                time_end.style.display = "none";
                                                break;
                                        case 3:
                                        case 4:
                                                lbStartDate.innerText = "เดือน - เริ่มต้น";
                                                lbEndDate.innerText = "เดือน - เวลา สิ้นสุด";
//                                                lbEndDate.disabled = "";
                                                //                                                time_end.disabled = "";
                                                lbEndDate.style.display = "block";
                                                time_end.style.display = "block";
                                                break;
                                }

                                //alert(RptItem);
                        });

                }
                function printCrystal() {
                        var printContent = document.getElementById('divReport');
                        var windowUrl = 'about:blank';
                        var uniqueName = new Date();
                        var windowName = 'Print' + uniqueName.getTime();
                        var printWindow = window.open();
                        printWindow.document.write('<HTML><HEAD></HEAD><BODY>' + printContent.innerHTML + '</BODY></HTML>');
                        printWindow.focus();
                        printWindow.print();
                        printWindow.close();
                }

                function ViewToReport(ShowData, Format) {
                        // Format=1 Report ,2 = Excel,3 Pdf
                        var RptID = parseInt(document.getElementById("<%=selReport.ClientID %>").value);
                        var Code = document.getElementById("<%=selStation.ClientID %>").value;
                        var DateFrom = document.getElementById("time_start").value;
                        var DateTo = document.getElementById("time_end").value;
                        var SelPrint = document.getElementById("<%=SelPrint.ClientID %>").value;
                        document.getElementById("txtPage").value = "1";
                        document.getElementById("lbTotalPage").value = "+";
                        document.getElementById("selZoom").selectedIndex =3;
                        
                        switch (RptID) {
                                case 1:
                                        document.getElementById("ifrReport").src = "ViewReport.aspx?RptID=" + RptID.toString() + "&Code=" + Code.toString() + "&DateFrom=" + DateFrom.toString() + "&DateTo=" + DateTo.toString() + "&ShowData=" + ShowData.toString() + "&Format=" + Format.toString();
                                        break;
                                case 2:
                                        document.getElementById("ifrReport").src = "ViewReport.aspx?RptID=" + RptID.toString() + "&Code=" + Code.toString() + "&DateFrom=" + DateFrom.toString() + "&ShowData=" + ShowData.toString() + "&Format=" + Format.toString();
                                        break;
                                case 3:
                                        document.getElementById("ifrReport").src = "ViewReport.aspx?RptID=" + RptID.toString() + "&Code=" + Code.toString() + "&MonthFrom=" + DateFrom.toString() + "&MonthTo=" + DateTo.toString() + "&ShowData=" + ShowData.toString() + "&Format=" + Format.toString();
                                        break;
                        }
                }
                function SetSizeReport(H,Pages) {
                        document.getElementById("lbTotalPage").valu = "+";
                        document.getElementById('ifrReport').style.height = H.toString() + "px";
                        var lbTotalPage = document.getElementById("lbTotalPage");
                        lbTotalPage.innerText = Pages;
                }
                function PreviousPage() {
                        var page = parseInt( document.getElementById("txtPage").value );
                        if (page > 1) {
                                page--;
                                document.getElementById("txtPage").value = page.toString();
                                GotoPage(page);
                        }
                }
                function NextPage() {
                        var page = parseInt(document.getElementById("txtPage").value);
                       var pages = parseInt(document.getElementById("lbTotalPage").innerText);

                        if (page < pages) {
                                page++;
                                document.getElementById("txtPage").value = page.toString();
                                GotoPage(page);
                        }
                }
                function GotoPage(Page) {
                        var el = document.getElementById('ifrReport');
                        if (el != null) {
                                el = getIframeWindow(el);
                                if (el.GoPage != undefined) {
                                        el.GoPage(Page);
                                }
                        }
                }
                function SetZoom(Z) {
                        var el = document.getElementById('ifrReport');
                        if (el != null) {
                                el = getIframeWindow(el);
                                if (el.Zoom  != undefined) {
                                        el.Zoom(Z);
                                }
                        }
                }
                function getIframeWindow(iframe_object) {
                        var doc;
                        if (iframe_object.contentWindow) {
                                return iframe_object.contentWindow;
                        }
                        if (iframe_object.window) {
                                return iframe_object.window;
                        }
                        if (!doc && iframe_object.contentDocument) {
                                doc = iframe_object.contentDocument;
                        }
                        if (!doc && iframe_object.document) {
                                doc = iframe_object.document;
                        }
                        if (doc && doc.defaultView) {
                                return doc.defaultView;
                        }
                        if (doc && doc.parentWindow) {
                                return doc.parentWindow;
                        }
                        return null;
                }

        </script>
</asp:Content>
