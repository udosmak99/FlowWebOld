Imports System.IO
Imports CrystalDecisions.Shared
Imports System.Globalization

Partial Class ViewReport
        Inherits System.Web.UI.Page
        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
                If Not Me.IsPostBack Then
                        If Not Session("Rpt1") Is Nothing Then
                                Me.Session.Remove("Rpt1")
                        End If
                Else
                        If Not Session("Rpt1") Is Nothing Then
                                Dim Cs As csReport = Session("Rpt1")
                                'Cs.ReportDefinition.Sections(1).SectionFormat.EnableSuppress = False
                                'Cs.ReportDefinition.Sections(2).SectionFormat.EnableSuppress = True
                                'Cs.ReportDefinition.Sections(3).SectionFormat.EnableSuppress = True
                                'Cs.ReportDefinition.Sections(4).SectionFormat.EnableSuppress = True
                                CryReport.ReportSource = Cs
                                ''CryReport.RefreshReport()
                                CryReport.DataBind()
                        End If

                End If

        End Sub
        Private Sub CrystalReportViewer1_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles CryReport.Unload
                'CryReport.Close()
                'CryReport.Dispose()
                'GC.Collect()

        End Sub
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
                If Not IsPostBack Then
                        Dim CS As csReport
                        Dim RptID As Integer = Request.QueryString("RptID")
                        Dim RptName As String
                        Select Case RptID
                                Case 1
                                        CS = Me.Genreport1(Request.QueryString("ShowData"), RptID, Request.QueryString("Code"), Request.QueryString("DateFrom"), Request.QueryString("DateTo"))
                                        RptName = "รายงานข้อมูลรายสถานีย้อนหลัง"
                                Case 2
                                        RptName = "รายงานสรุปข้อมูลเครื่องวัดอัตราการไหลของน้ำตามความเวลาที่เลือก.rpt"
                                        CS = Me.Genreport2(Request.QueryString("ShowData"), RptID, Request.QueryString("Code"), Request.QueryString("DateFrom"))
                                Case 3
                                        CS = Me.Genreport1(Request.QueryString("ShowData"), RptID, Request.QueryString("Code"), Request.QueryString("MonthFrom"), Request.QueryString("MonthTo"))

                        End Select
                        If Not (CS Is Nothing) Then
                                'CS.ReuseParameterOnRefresh = False
                                'CS.Refresh()
                                'CS.VerifyDatabase()
                        End If

                        'If Not Session("Rpt1") Is Nothing Then
                        '        CS = Session("Rpt1")
                        'Else
                        '        cs = Me.Genreport(3, 1, 1, New Date(2012, 12, 1), Now)
                        'End If
                        ''// Format=1 Report ,2 = Excel,3 Pdf
                        Dim oStream As MemoryStream
                        Dim show As Integer = Val(Request.QueryString("ShowData"))
                        Select Case Val(Request.QueryString("Format"))
                                Case 1
                                  
                                        CryReport.ReportSource = CS
                                        CryReport.DataBind()
                                        'CryReport.RefreshReport()
                                        Me.Session.Remove("Rpt1")
                                        Me.Session.Add("Rpt1", CS)
                                Case 2
                                        CS.ExportToHttpResponse(ExportFormatType.Excel, Response, True, RptName)

                                        'oStream = CType(CS.ExportToStream(CrystalDecisions.Shared.ExportFormatType.Excel), MemoryStream)
                                        'Response.Clear()
                                        'Response.Buffer = True
                                        'Response.ContentType = "application/vnd.ms-excel"
                                        'Response.BinaryWrite(oStream.ToArray)
                                        'Response.End()
                                Case 3

                                        CS.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, RptName)
                                        
                                        'oStream = CType(CS.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat), MemoryStream)
                                        'Response.Clear()
                                        'Response.Buffer = True
                                        'Response.ContentType = "application/pdf"
                                        'Response.BinaryWrite(oStream.ToArray)

                                        Response.End()
                        End Select
                Else

                End If
        End Sub
        <System.Web.Services.WebMethod()>
        Public Shared Function GetReport(ByVal Rpt_ID As Integer) As ReportItem
                Return New GetReport().GetReport(Rpt_ID)(0)
        End Function
        Function Genreport1(ByVal Show As Integer, ByVal ReportID As Integer, ByVal selStation As Integer, ByVal txtDate As String, ByVal txtToDate As String) As csReport
                Dim rItem As ReportItem = New GetReport().GetReport(ReportID)(0)
                Dim Cs As csReport
                Dim sts As New Stations()
                Dim sItem As New stationItem()
                sItem.stn_id = selStation
                sts.Add(sItem)
                Dim ShowDetail As String, ShowGraph As String
                Select Case Show
                        Case 1
                                ShowDetail = "Y"
                                ShowGraph = "N"
                        Case 2
                                ShowDetail = "N"
                                ShowGraph = "Y"
                        Case Else
                                ShowDetail = "Y"
                                ShowGraph = "Y"
                End Select
                Dim C As New CultureInfo("th-TH")
                Dim dF As New DateTimeFormatInfo
                dF.ShortDatePattern = "dd/MM/yyyy"
                dF.ShortTimePattern = "HH:mm"
                Dim uie As New System.Globalization.CultureInfo("en-US")
                Dim fDate As DateTime = DateTime.Parse(txtDate, dF)
                Dim tDate As DateTime = DateTime.Parse(txtToDate, dF)
                Select Case Val(ReportID)
                        Case 1
                                Dim rptItem As ReportItem = New GetReport().GetReport(ReportID)(0)
                                Cs = New GetReport().Report1(ReportID, txtDate, txtToDate, sts, Server.MapPath(rItem.Rpt_Path))
                                Cs.SetParameterValue("ShowDetail", ShowDetail)
                                Cs.SetParameterValue("ShowGraph", ShowGraph)
                                Cs.SetParameterValue("ShowDate", " วันที่ " & fDate.ToString("dd/MM/yyyy HH:mm", C) & " ถึงวันที่ " & tDate.ToString("dd/MM/yyyy HH:mm", C))
                End Select
                Return Cs

        End Function
        Function Genreport2(ByVal Show As Integer, ByVal ReportID As Integer, ByVal selStation As Integer, ByVal txtDate As String) As csReport
                Dim rItem As ReportItem = New GetReport().GetReport(ReportID)(0)
                Dim Cs As csReport
                Dim sts As New Stations()
                Dim sItem As New stationItem()
                sItem.stn_id = selStation
                sts.Add(sItem)

                Dim ShowDetail As String, ShowGraph As String
                Select Case Show
                        Case 1
                                ShowDetail = "Y"
                                ShowGraph = "N"
                        Case 2
                                ShowDetail = "N"
                                ShowGraph = "Y"
                        Case Else
                                ShowDetail = "Y"
                                ShowGraph = "Y"
                End Select
                Dim rptItem As ReportItem = New GetReport().GetReport(ReportID)(0)
                Cs = New GetReport().Report2(ReportID, txtDate, sts, Server.MapPath(rItem.Rpt_Path))
                Dim C As New CultureInfo("th-TH")
                Dim dF As New DateTimeFormatInfo
                dF.ShortDatePattern = "dd/MM/yyyy"
                dF.ShortTimePattern = "HH:mm"
                Dim uie As New System.Globalization.CultureInfo("en-US")
                Dim fDate As DateTime = DateTime.Parse(txtDate, dF)
                Cs.SetParameterValue("ShowDetail", ShowDetail)
                Cs.SetParameterValue("ShowGraph", ShowGraph)
                Cs.SetParameterValue("ShowDate", " วันที่ " & fDate.ToString("dd/MM/yyyy HH:mm", C))

                Return Cs

        End Function

End Class