
Partial Class all_stations
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            initial()
            Binding()
        End If
    End Sub
    Private Function CreateSumVolumeText(ByVal value As Double) As String
        Try
            If value < 0 Then
                Return "ปริมาณน้ำไหลออกพื้นที่ กทม. " & Format(value, "#,###,##0") & " ลบ.ม."
            Else
                Return "ปริมาณน้ำไหลเข้าพื้นที่ กทม. " & Format(value, "#,###,##0") & " ลบ.ม."
            End If
        Catch ex As Exception
            Throw New Exception("CreateSumVolumeText Error : " & ex.Message)
        End Try

    End Function
    Private Sub initial()
        Application("stationMenu") = 2
        Application("Description") = ""
        Application("Keywords") = ""

        Dim sumzone1 As String = CreateSumVolumeText(StationModel.GetSumLastVolumeZone(1))
        Dim sumzone2 As String = CreateSumVolumeText(StationModel.GetSumLastVolumeZone(2))
        Dim sumzone3 As String = CreateSumVolumeText(StationModel.GetSumLastVolumeZone(3))


        Dim wZone(,) As Object = { _
           {"กลุ่มสถานีการระบายน้ำของฝั่งกรุงเทพฯ", sumzone1}, _
           {"กลุ่มสถานีการระบายน้ำของฝั่งธนบุรี", sumzone2}, _
           {"กลุ่มสถานีการระบายน้ำอื่นๆ", sumzone3} _
           }

        Session("wZone") = wZone
    End Sub
    Private Sub Binding()
        Try
            Dim Alldata As Generic.List(Of DataStation) = StationModel.GetAllLast


        Catch ex As Exception
            LogFile.WriteLog("Binding Allstation Error : " & ex.Message)
        End Try
    End Sub
End Class
