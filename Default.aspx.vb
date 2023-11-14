
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            initial()
            Binding()
        End If
    End Sub
    Private Sub initial()
        Application("stationMenu") = 1
        Application("mapMenu") = 1
        Application("Description") = ""
        Application("Keywords") = ""
    End Sub
    Private Sub Binding()
        Try

            
        Catch ex As Exception
            LogFile.WriteLog("Binding Map Error : " & ex.Message)
        End Try
    End Sub
End Class
