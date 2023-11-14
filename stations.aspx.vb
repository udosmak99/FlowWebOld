Imports System.Web.UI.DataVisualization.Charting
Imports System.Data
Imports System.Drawing
Partial Class stations
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            initial()
            Binding()
        
        End If
    End Sub
    Private Sub initial()
        Application("stationMenu") = 1
        Application("Description") = ""
        Application("Keywords") = ""
    End Sub
    Private Sub Binding()
        Try
            Dim stnid As Integer = Session("wStation")(Request.QueryString("stationdata") - 1, 10)
            Dim stn As DataStation = StationModel.GetLastData(stnid)
            If Not Request.QueryString("station") Is Nothing Then
                Select Case CStr(Session("wStation")(Request.QueryString("stationdata") - 1, 2))
                    Case 1
                        Application("HeightWater") = "80"
                    Case 2
                        Application("HeightWater") = "50"
                    Case 3
                        Application("HeightWater") = "15"
                    Case Else
                        Application("HeightWater") = "95"
                End Select
                Application("stationName") = CStr(stn.StationName)          'CStr(Session("wStation")(Request.QueryString("station") - 1, 0))
                Application("stationDesc") = CStr(Session("wStation")(Request.QueryString("station") - 1, 1))
                Application("status") = CStr(Session("wStatus")(Convert.ToInt32(CStr(Session("wStation")(Request.QueryString("station") - 1, 2))) - 1, 0))
                Application("wLevel") =NulltoBlank(stn.WaterLevel)              'CInt(Session("wStation")(Convert.ToInt32(Request.QueryString("station") - 1), 3))
                Application("sConnect") = CStr(Session("cStatus")(CInt(Session("wStation")(Convert.ToInt32(Request.QueryString("station") - 1), 4)), 1))
                Application("imgConnect") = CStr(Session("cStatus")(CInt(Session("wStation")(Convert.ToInt32(Request.QueryString("station") - 1), 4)), 0))
                Application("flow") = CStr(stn.Flow)                        'CStr(Session("wStation")(Request.QueryString("station") - 1, 9))    
                Application("situation") = CStr(stn.Situation)
                Application("left") = NulltoBlank(stn.LeftBank)
                Application("right") = NulltoBlank(stn.RightBank)
                Application("water") = NulltoBlank(stn.WaterLevel)
                Application("lastDate") = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.ServerTime, "d MMM yyyy"))
                Application("lastTime") = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.ServerTime, "'เวลา' H:mm 'น.'"))
                Application("meanvelocity") = NulltoBlank(stn.MeanVelocity)
                Application("area") = NulltoBlank(stn.Area)
                Application("volume") = NulltoBlank(stn.volume)
                Application("directionname") = NulltoBlank(stn.DirectionName)
                Application("flow") = NulltoBlank(stn.Flow)
                Application("flowmax") = NulltoBlank(stn.FlowMax)
                Dim Flowmaxtime As Object = NulltoBlank(stn.FlowMaxTime)
                If Flowmaxtime.ToString <> "-" Then
                    Application("Flowmaxtime") = GolbalFunc.ThaiDatetime.ThaiFormat(stn.FlowMaxTime, "'('d MMM yyyy 'เวลา' H:mm 'น.)'")
                Else
                    Application("Flowmaxtime") = "-"
                End If
                Application("flowavg") = NulltoBlank(stn.FlowAvg)
                Application("watermax") = NulltoBlank(stn.WaterLevelMax)
                Dim watermaxtime As Object = NulltoBlank(stn.WaterLevelMaxTime)
                If watermaxtime.ToString <> "-" Then
                    Application("watermaxtime") = GolbalFunc.ThaiDatetime.ThaiFormat(stn.WaterLevelMaxTime, "'('d MMM yyyy 'เวลา' H:mm 'น.)'")
                Else
                    Application("watermaxtime") = "-"
                End If
                ' Application("watermaxtime") = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.WaterLevelMaxTime, "'('d MMM yyyy 'เวลา' H:mm 'น.)'"))
                Application("wateravg") = NulltoBlank(stn.WaterLevelAvg)
                Application("crossSection") = stnid
                Application("SubStation") = stnid
                'PnlCrosssection.BackImageUrl = Server.MapPath("./images/CrossSection/" & stnid & ".png")
            End If

            '*****************กราฟ**********************

            'ChartControl("Flow")
            ChartControl(1)
        Catch ex As Exception
            LogFile.WriteLog("Binding Station Error : " & ex.Message)
        End Try
    End Sub
    ' Dim DataStn As DataStation = stn
    'If DataStn.Situation = 1 Then
    '    Image1.Visible = True
    '    Image2.Visible = False
    '    Image3.Visible = False
    'ElseIf DataStn.Situation = 2 Then
    '    Image1.Visible = False
    '    Image2.Visible = True
    '    Image3.Visible = False
    'ElseIf DataStn.Situation = 3 Then
    '    Image1.Visible = False
    '    Image2.Visible = False
    '    Image3.Visible = True
    'End If
    'lblLeft.Text = NulltoBlank(stn.LeftBank)
    'lblRight.Text = NulltoBlank(stn.RightBank)
    'lblwater.Text = NulltoBlank(stn.WaterLevel)
    'lblLastDate.Text = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.LastUpdate, "d MMM yyyy"))
    'lblLastTime.Text = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.LastUpdate, "'เวลา' H:mm 'น.'"))
    'lblMeanVelocity.Text = NulltoBlank(stn.MeanVelocity)
    'lblArea.Text = NulltoBlank(stn.Area)
    'lblVolume.Text = NulltoBlank(stn.volume)
    'lblDirection.Text = NulltoBlank(stn.Direction)
    'lblFlow.Text = NulltoBlank(stn.Flow)
    'lblFlowMax.Text = NulltoBlank(stn.FlowMax)
    'lblFlowMaxTime.Text = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.FlowMaxTime, "d MMM yyyy 'เวลา' H:mm 'น.'"))
    'lblFlowAvg.Text = NulltoBlank(stn.FlowAvg)
    'lblwaterlevel.Text = NulltoBlank(stn.WaterLevel)
    'lblwaterlevelMax.Text = NulltoBlank(stn.WaterLevelMax)
    'lblwaterlevelMaxTime.Text = NulltoBlank(GolbalFunc.ThaiDatetime.ThaiFormat(stn.WaterLevelMaxTime, "d MMM yyyy 'เวลา' H:mm 'น.'"))
    'lblwaterlevelAvg.Text = NulltoBlank(stn.WaterLevelAvg)
    Private Sub ChartControl(ByVal TypeData As Integer)
        Dim stnid As Integer = Request.QueryString("stationdata")
        Dim stn As DataTable = StationModel.GetLast24HrforChart(stnid)
        Dim setChart As New clsChart
        Dim dateStart As String = GolbalFunc.ENFormat(DateAdd(DateInterval.Hour, -24, Now), "dd/MM/yyyy HH:mm")
        Dim dateStop As String = GolbalFunc.ENFormat(Now, "dd/MM/yyyy HH:mm")
        Dim index As Integer
        Select Case TypeData
            Case 1 '"Flow"
                setChart.Title = "กราฟแสดงข้อมูลอัตราการไหลย้อนหลัง 24 ชม."
                setChart.SubTitle = "ข้อมูลวันที่ " & dateStart & " ถึง " & dateStop
                setChart.titleY = "ลบ.ม./วินาที"
                setChart.titleX = "วันที่-เวลา"
                setChart.myTable = stn
                setChart.columnY = "Flow"
                setChart.columnX = "server_datetime"
                index = 2
            Case 2 '"Water"
                setChart.Title = "กราฟแสดงข้อมูลระดับน้ำย้อนหลัง 24 ชม."
                setChart.SubTitle = "ข้อมูลวันที่ " & dateStart & " ถึง " & dateStop
                setChart.titleY = "ม.รทก."
                setChart.titleX = "วันที่-เวลา"
                setChart.myTable = stn
                setChart.columnY = "waterlevel"
                setChart.columnX = "server_datetime"
                index = 3
            Case 3 '"MeanVelocity"
                setChart.Title = "กราฟแสดงข้อมูลความเร็วกระแสน้ำย้อนหลัง 24 ชม."
                setChart.SubTitle = "ข้อมูลวันที่ " & dateStart & " ถึง " & dateStop
                setChart.titleY = "ม./วินาที"
                setChart.titleX = "วันที่-เวลา"
                setChart.myTable = stn
                setChart.columnY = "mean_velocity"
                setChart.columnX = "server_datetime"
                index = 4
            Case 4 '"Area"
                setChart.Title = "กราฟแสดงข้อมูลพื้นที่หน้าตัดลำน้ำย้อนหลัง 24 ชม."
                setChart.SubTitle = "ข้อมูลวันที่ " & dateStart & " ถึง " & dateStop
                setChart.titleY = "ตร.ม."
                setChart.titleX = "วันที่-เวลา"
                setChart.myTable = stn
                setChart.columnY = "area"
                setChart.columnX = "server_datetime"
                index = 5
            Case 5 '"Volume"
                setChart.Title = "กราฟแสดงข้อมูลปริมาณน้ำย้อนหลัง 24 ชม."
                setChart.SubTitle = "ข้อมูลวันที่ " & dateStart & " ถึง " & dateStop
                setChart.titleY = "ลบ.ม./5นาที"
                setChart.titleX = "วันที่-เวลา"
                setChart.myTable = stn
                setChart.columnY = "volume"
                setChart.columnX = "server_datetime"
                index = 6
        End Select
        bindingChart(setChart)
        If Not (stn Is Nothing) Then
            For Each row As DataRow In stn.Rows
                Dim status As String = row.Item("system_status_id").ToString
                Select Case status
                    Case 0
                        row.Item("ImageStatus") = "images/c-false.png"
                    Case 1
                        row.Item("ImageStatus") = "images/c-normal.png"
                    Case Else
                        row.Item("ImageStatus") = "images/c-false.png"
                End Select
            Next
        End If
        'Session("RowCount") = stn.Rows.Count
        'ViewState("sortDirection") = Nothing
        'gdvDataChart.DataSource = stn
        'ViewState("SortingGridView") = stn
        'ViewState("SortingOnly") = stn
        'gdvDataChart.DataBind()
        'gdvShowColumn(index)

    End Sub
  
    Public Function NulltoBlank(ByVal msg As Object) As Object
        If msg Is DBNull.Value Then
            Return "-"
        Else
            Return msg
        End If
    End Function

    Private Sub bindingChart(ByVal SetChart As clsChart)
        'กำหนดหัวตาราง
        Chart1.Titles.Add(SetChart.Title & "\n" & SetChart.SubTitle)
        Chart1.Titles(0).Font = New Font("Tahoma", 10, FontStyle.Bold)
        Chart1.Titles(0).ForeColor = Color.BlueViolet
        Chart1.Titles(0).Alignment = System.Drawing.ContentAlignment.MiddleCenter
        'กำหนดแกน Y
        Chart1.ChartAreas("ChartArea1").AxisY.TitleAlignment = System.Drawing.ContentAlignment.TopCenter
        Chart1.ChartAreas("ChartArea1").AxisY.Title = SetChart.titleY
        'Chart1.ChartAreas("ChartArea1").AxisY.Maximum = SetChart.MaxY
        'Chart1.ChartAreas("ChartArea1").AxisY.Minimum = SetChart.MinY
        Chart1.ChartAreas("ChartArea1").AxisY.TitleFont = New Font("Tahoma", 9, FontStyle.Bold)
        'Chart1.ChartAreas("ChartArea1").AxisY.TextOrientation = TextOrientation.Horizontal
        Chart1.ChartAreas("ChartArea1").AxisY.TitleAlignment = StringAlignment.Far
        Chart1.ChartAreas("ChartArea1").AxisY.LabelStyle.Font = New Font("Tahoma", 7, FontStyle.Bold)
        ' Chart1.ChartAreas("ChartArea1").AxisY.TextOrientation = TextOrientation
        'กำหนดแกน X
        Chart1.ChartAreas("ChartArea1").AxisX.TitleAlignment = System.Drawing.ContentAlignment.TopLeft
        Chart1.ChartAreas("ChartArea1").AxisX.Title = SetChart.titleX
        Chart1.ChartAreas("ChartArea1").AxisX.TitleFont = New Font("Tahoma", 9, FontStyle.Bold)
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Angle = -90

        'กำหนดชนิดกราฟ ขนาดกราฟ
        Chart1.Series("Series1").ChartType = SeriesChartType.Line
        Chart1.Series("Series1").Font = New Font("Tahoma", 7, FontStyle.Bold)


        'กำหนดความถี่
        Chart1.ChartAreas("ChartArea1").AxisX.Interval = 1
        Chart1.ChartAreas("ChartArea1").AxisX.IntervalType = DateTimeIntervalType.Hours
        'กำหนดรูปแบบการแสดงวันที่
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Format = "dd/MM/yyyy HH:mm"
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Font = New Font("Tahoma", 7, FontStyle.Bold)

        Chart1.DataSource = SetChart.myTable
        ' Set series members names for the X and Y values 
        Chart1.Series("Series1").YValueMembers = SetChart.columnY
        Chart1.Series("Series1").Font = New Font("Tahoma", 8, FontStyle.Bold)
        Chart1.Series("Series1").XValueMember = SetChart.columnX
        Chart1.DataBind()
    End Sub

    Protected Sub ddlChart_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlChart.SelectedIndexChanged
        ShowChart()
    End Sub
    Private Sub ShowChart()
        ChartControl(ddlChart.SelectedValue)
    End Sub
  
    Private Sub gdvShowColumn(ByVal index As Integer)
        For i As Integer = 2 To gdvDataChart.Columns.Count - 1
            gdvDataChart.Columns(i).Visible = False
        Next
        gdvDataChart.Columns(index).Visible = True
    End Sub
    Protected Sub gdvDataChart_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gdvDataChart.PageIndexChanging
        gdvDataChart.PageIndex = e.NewPageIndex
        Dim dt = TryCast(ViewState("SortingOnly"), Data.DataTable)
        If dt IsNot Nothing Then
            If Not (ViewState("forNextPage") Is Nothing) Then
                dt.DefaultView.Sort = ViewState("forNextPage")
                gdvDataChart.DataSource = ViewState("SortingOnly")
                gdvDataChart.DataBind()
                ShowChart()
            Else
                gdvDataChart.DataSource = dt
                gdvDataChart.DataBind()
                ShowChart()
            End If
        End If
    End Sub
    Protected Sub gdvDataChart_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gdvDataChart.RowCreated
        If e.Row.RowType = DataControlRowType.Pager Then
            Dim dt As Data.DataTable
            Dim record As Integer = 0
            If Not (ViewState("SortingGridView") Is Nothing) Then
                dt = ViewState("SortingGridView")
                record = dt.Rows.Count
            End If
            If Not (ViewState("DataRecord") Is Nothing) Then
                record = ViewState("DataRecord")
            Else
                ViewState("DataRecord") = record
            End If
            Dim oGrdModel As New GolbalFunc.GridViewModel(gdvDataChart)
            Dim oStn As New StationModel
            ' oGrdModel.Gridview_RowCreated(e, record)
            gridrowcreate(e, record)
        End If
    End Sub
    Public Sub gridrowcreate(ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs, ByVal Rowcount As Integer)
        Dim _oGridview As GridView = gdvDataChart

        If _oGridview.PageIndex < _oGridview.PageCount Then
            Dim PagerTable As Table
            PagerTable = DirectCast(e.Row.Cells(0).Controls(0), Table)
            Dim i As Integer
            For i = 0 To PagerTable.Rows(0).Cells.Count - 1
                If TypeOf (PagerTable.Rows(0).Cells(i).Controls(0)) Is Label Then
                    Dim PagerLabel As Label
                    PagerLabel = DirectCast(PagerTable.Rows(0).Cells(i).Controls(0), Label)
                    'PagerLabel.CssClass = "btn"
                    Exit For
                End If
            Next
        End If
        Dim tb As Table = TryCast(e.Row.Cells(0).Controls(0), Table)
        tb.Width = gdvDataChart.Width
        ' tb.Width = 927
        Dim cell As New TableCell()
        cell.Text = "ข้อมูล " & Rowcount & "&nbsp;รายการ "
        cell.HorizontalAlign = HorizontalAlign.Left
        cell.Width = System.Web.UI.WebControls.Unit.Percentage(40)
        'cell.ColumnSpan = 4
        tb.Rows(0).Cells.AddAt(0, cell)

        Dim cel2 As New TableCell()
        cel2.Text = "หน้า " & _oGridview.PageIndex + 1
        cel2.HorizontalAlign = HorizontalAlign.Right
        'cel2.ColumnSpan = 2
        cel2.Width = System.Web.UI.WebControls.Unit.Percentage(40)
        tb.Rows(0).Cells.AddAt(tb.Rows(0).Cells.Count, cel2)

        Dim cell1 As Integer
        For cell1 = 1 To tb.Rows(0).Cells.Count - 2
            tb.Rows(0).Cells(cell1).Width = 15
        Next
    End Sub
End Class
