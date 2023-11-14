Imports System.IO

Partial Class Report
        Inherits System.Web.UI.Page
        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
                If Not Me.IsPostBack Then
                        'divReport.Style("Height") = "300px"
                Else
                        If Not Session("Rpt1") Is Nothing Then
                                'CryReport.ReportSource = Session("Rpt1")
                                'CryReport.RefreshReport()
                                'CryReport.DataBind()
                        End If

                End If

        End Sub
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
                If Not IsPostBack Then
                        Application("stationMenu") = 4
                        Application("Description") = ""
                        Application("Keywords") = ""
                        Me.selReport.DataSource = New GetReport().GetReport()
                        Me.selReport.DataBind()
                        Me.selStation.DataSource = New CStation().GetStation()
                        Me.selStation.DataBind()

                End If
        End Sub
        <System.Web.Services.WebMethod()>
        Public Shared Function GetReport(ByVal Rpt_ID As Integer) As ReportItem
                Return New GetReport().GetReport(Rpt_ID)(0)
        End Function
        'Function Validate() As Boolean

        'End Function
        'Function GenReport(ByVal Show As Integer) As csReport
        '        Dim rItem As ReportItem = New GetReport().GetReport(selReport.Value)(0)
        '        Dim Cs As csReport
        '        Dim sts As New Stations()
        '        Dim sItem As New stationItem()
        '        sItem.stn_id = selStation.Value
        '        sts.Add(sItem)
        '        Dim ShowDetail As String, ShowGraph As String
        '        Select Case Show
        '                Case 1
        '                        ShowDetail = "Y"
        '                        ShowGraph = "N"
        '                Case 2
        '                        ShowDetail = "N"
        '                        ShowGraph = "Y"
        '                Case Else
        '                        ShowDetail = "Y"
        '                        ShowGraph = "Y"
        '        End Select
        '        Select Case Val(selReport.Value)
        '                Case 1
        '                        Dim rptItem As ReportItem = New GetReport().GetReport(selReport.Value)(0)
        '                        Cs = New GetReport().Report1(Val(selReport.Value), txtDate.Value, txtToDate.Value, sts, Server.MapPath(rItem.Rpt_Path))
        '                        Cs.SetParameterValue("ShowDetail", ShowDetail)
        '                        Cs.SetParameterValue("ShowGraph", ShowGraph)
        '                        Cs.SetParameterValue("ShowDate", " วันที่ " & txtDate.Value & " ถึงวันที่ " & txtToDate.Value)
        '        End Select
        '        Return Cs
        'End Function
        'Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnReport.Click
        '        Dim Cs As csReport = Me.GenReport(SelPrint.Value)
        '        If Not (Cs Is Nothing) Then
        '                'Me.CryReport.ReportSource = Cs
        '                'CryReport.DataBind()
        '                Me.Session.Remove("Rpt1")
        '                Me.Session.Add("Rpt1", Cs)
        '        End If
        'End Sub
        'Protected Sub btnExcel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnExcel.Click
        '        Dim Cs As csReport = Me.GenReport(SelPrint.Value)
        '        If Not (Cs Is Nothing) Then
        '                Dim oStream As MemoryStream
        '                ' using System.IO
        '                oStream = CType(Cs.ExportToStream(CrystalDecisions.Shared.ExportFormatType.Excel), MemoryStream)
        '                Response.Clear()
        '                Response.Buffer = True
        '                Response.ContentType = "application/vnd.ms-excel"
        '                Response.BinaryWrite(oStream.ToArray)
        '                Response.End()
        '        End If
        'End Sub
        'Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPrint.Click
        '        Dim Cs As csReport = Me.GenReport(SelPrint.Value)
        '        If Not (Cs Is Nothing) Then
        '                Dim oStream As MemoryStream
        '                ' using System.IO
        '                oStream = CType(Cs.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat), MemoryStream)
        '                Response.Clear()
        '                Response.Buffer = True
        '                Response.ContentType = "application/pdf"
        '                Response.BinaryWrite(oStream.ToArray)
        '                Response.End()
        '        End If


        'End Sub

        'Protected Sub BtnGraph_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtnGraph.Click
        '        Dim Cs As csReport = Me.GenReport(2)

        '        If Not (Cs Is Nothing) Then

        '                Me.CryReport.ReportSource = Cs
        '                CryReport.DataBind()
        '                Me.Session.Remove("Rpt1")
        '                Me.Session.Add("Rpt1", Cs)
        '        End If
        'End Sub


        'Private Sub btnData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnData.Click

        '        Dim Cs As csReport = Me.GenReport(1)
        '        If Not (Cs Is Nothing) Then

        '                Me.CryReport.ReportSource = Cs
        '                CryReport.DataBind()
        '                Me.Session.Remove("Rpt1")
        '                Me.Session.Add("Rpt1", Cs)
        '        End If
        'End Sub


End Class