Imports System.Drawing
Imports System.Drawing.Text
Imports System.Drawing.Image
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D

Partial Class plan_direction
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            initial()
            Binding()
        End If
    End Sub
    Private Sub initial()
       Application("stationMenu") =3  
        Application("Description") = ""
        Application("Keywords") = ""

        Dim type As String = Request.QueryString("tp")
        If type = Nothing Then
            Response.Redirect("plan_direction.aspx?tp=0")
        Else
            ddltype.SelectedIndex = type
        End If




    End Sub
    Private Sub CreateDirection(ByVal alldata As Generic.List(Of Direction))
        Try
            ' Response.Clear()
            Dim height As Integer = 1144
            Dim width As Integer = 1610
            Dim r As New Random
            Dim x As Integer = r.Next(75)

            Dim bmp As New Bitmap(width, height)

            Dim g As Graphics = Graphics.FromImage(bmp)            
            g.TextRenderingHint = TextRenderingHint.AntiAlias
            g.Clear(Color.White)
            g.DrawRectangle(Pens.White, 1, 1, width - 3, height - 3)
            g.DrawRectangle(Pens.Gray, 2, 2, width - 3, height - 3)
            g.DrawRectangle(Pens.Black, 0, 0, width, height)
           
            Dim img As Drawing.Image = Drawing.Image.FromFile(Server.MapPath("./images/water.png"))
            g.DrawImage(img, 0, 0)
            Dim typedata As Integer = ddltype.SelectedValue
            Dim plusX, plusY, plusXArrow, plusYArrow As Integer
            plusXArrow = 0
            plusYArrow = 0
            Select Case typedata
                Case Direction.TypeShowData.TypeFlow
                    plusX = 27
                    plusY = 17
                Case Direction.TypeShowData.TypeArea
                    plusX = 27
                    plusY = 17
                Case Direction.TypeShowData.TypeMeanVelocity
                    plusX = 19
                    plusY = 17
                Case Direction.TypeShowData.TypeVolume
                    plusX = 27
                    plusY = 17
                Case Direction.TypeShowData.TypeWaterlevel
                    plusX = 30
                    plusY = 17
                Case Else
                    plusX = 0
                    plusY = 0

            End Select
            Dim direc As Direction
            For Each direc In alldata
                Try
                    g.DrawImage(Drawing.Image.FromFile(Server.MapPath("./images/Direction/" & direc.ImageDirection)), direc.XPointArrow + plusXArrow, direc.YPointArrow + plusYArrow)
                    g.DrawString(direc.showValue(typedata), New Font("PSL-Text", 6, FontStyle.Regular), SystemBrushes.WindowText, New PointF(direc.XPoint + plusX, direc.YPoint + plusY))
                Catch ex As Exception
                    Throw New Exception("Draw image Error Station " & direc.StationID & " : " & ex.Message)
                End Try
              
            Next
            bmp.Save(Server.MapPath("./images/wattercreate.png"), System.Drawing.Imaging.ImageFormat.Png)
            'bmp.Save(Response.OutputStream, ImageFormat.Png)
            g.Dispose()
            bmp.Dispose()
            'Response.End()
        Catch ex As Exception
            Throw New Exception("CreateDirection Error : " & ex.Message)
        End Try
    End Sub
    Private Sub Binding()
        Try
            '  System.IO.File.Delete(Server.MapPath("./images/wattercreate.png"))
            Dim Alldata As Generic.List(Of Direction) = StationModel.GetAllDirection
            CreateDirection(Alldata)
            'maps_w.ImageUrl = Server.MapPath("./images/wattercreate.png")
            ' maps_w.DataBind()

        Catch ex As Exception

            Response.Write("Binding Plan Direction Error : " & ex.Message)
            LogFile.WriteLog("Binding Plan Direction Error : " & ex.Message)
            Throw New Exception("Binding Plan Direction Error : " & ex.Message)
        End Try
    End Sub

    Protected Sub ddltype_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddltype.SelectedIndexChanged
        Try
            Response.Redirect("plan_direction.aspx?tp=" & ddltype.SelectedValue)
            ' Binding()
        Catch ex As Exception
            LogFile.WriteLog("Change Type Data Error : " & ex.Message)
        End Try
    End Sub
End Class
