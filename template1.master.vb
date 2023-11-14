
Option Explicit On
Option Strict On

Imports System
Imports System.Web
Imports System.Web.UI



Partial Public Class template1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            If Not IsPostBack Then
                initialData()
            End If
        Catch ex As Exception
            writelog("page load masterpage Error : " & ex.Message)
        End Try
    End Sub
    Private Sub initialData()
        Try
            Dim mMenu(,) As Object = { _
{"จุดติดตั้งทั้งหมด", "map_icon.png", "Default.aspx", 250}, _
{"ข้อมูลทุกสถานีเวลาปัจจุบัน", "station_icon.png", "all_stations.aspx", 345}, _
{"แผนผังทิศทางการไหลของน้ำ", "plan_icon.png", "plan_direction.aspx", 345}, _
{"ข้อมูลย้อนหลัง", "", "report.aspx", 0}
}

            Session("mMenu") = mMenu

            '---(image,waterStatus)---//

            Dim wStatus(,) As Object = { _
            {"normal", "Ê¶Ò¹¡ÒÃ³ì¹éÓ»¡µÔ"}, _
            {"warning", "Ê¶Ò¹¡ÒÃ³ì¹éÓà½éÒÃÐÇÑ§"}, _
            {"urgent", "Ê¶Ò¹¡ÒÃ³ì¹éÓÇÔ¡ÄµÔ"} _
            }

            Session("wStatus") = wStatus

           

            '---(image,connectStatus)---//
            Dim cStatus(,) As Object = { _
            {"c-normal.png", "Ê¶Ò¹ÐÃÐºº»¡µÔ"}, _
            {"c-false.png", "Ê¶Ò¹ÐÃÐºº¢Ñ´¢éÍ§"} _
            }

            Session("cStatus") = cStatus

            '--(NameStaion,Description,waterStatus,marginTop,connection)----//

            Dim Alldata As Generic.List(Of DataStation) = StationModel.GetAllLast
            Dim wStationData(Alldata.Count - 1, 13) As Object
            Dim i As Integer
            For i = 0 To Alldata.Count - 1

                wStationData(i, 0) = Alldata(i).StationName
                wStationData(i, 1) = ""
                wStationData(i, 2) = Alldata(i).Situation
                wStationData(i, 3) = Alldata(i).WaterLevel.ToString
                wStationData(i, 4) = Alldata(i).SystemStatus
                wStationData(i, 5) = Alldata(i).Latitude
                wStationData(i, 6) = Alldata(i).Longgitude
                wStationData(i, 7) = Alldata(i).ZoneID
                wStationData(i, 8) = Alldata(i).MeanVelocity.ToString
                wStationData(i, 9) = Alldata(i).Flow.ToString
                wStationData(i, 10) = Alldata(i).StationID
                wStationData(i, 11) = GolbalFunc.ThaiDatetime.ThaiFormat(Alldata(i).ServerTime, "¢éÍÁÙÅàÇÅÒ : dd MMM yyyy àÇÅÒ HH:mm ¹.")
                wStationData(i, 12) = GolbalFunc.ThaiDatetime.ThaiFormat(Alldata(i).ServerTime, "dd-MM-yyyy HH:mm")
                wStationData(i, 13) = Alldata(i).volume


            Next
            'Dim wStation(,) As Object = { _
            '{"»µÃ. ¤ÅÍ§¢Ø¹ÈÃÕºØÃÕÃÑ¡Éì", "", 1, 75, 1, "13.8024", "100.37059", 3}, _
            '{"»µÃ. ¤ÅÍ§¤ÇÒÂ", "", 2, 75, 1, "13.80199", "100.38202", 1}, _
            '{"»µÃ. ¤ÅÍ§«ÍÂ", "", 3, 75, 1, "13.802424", "100.348517", 1}, _
            '{"»µÃ. ¤ÅÍ§·ÇÕÇÑ²¹Ò", "", 1, 75, 1, "13.799959", "100.329685", 2}, _
            '{"»µÃ. ¤ÅÍ§ºÖ§¢ÇÒ§", "", 1, 75, 1, "13.79964", "100.74357", 1}, _
            '{"»µÃ. ¤ÅÍ§»ÃÐàÇÈºØÃÕÃÁÂì µÍ¹ÅÒ´¡ÃÐºÑ§", "", 1, 75, 1, "13.72402", "100.73816", 1}, _
            '{"»µÃ. ¤ÅÍ§¾ÃÐÂÒÊØàÃ¹·Ãì µÍ¹Ë¡ÇÒÊÒÂÅèÒ§", "", 1, 75, 1, "13.92166", "100.68731", 1}, _
            '{"»µÃ. ¤ÅÍ§ÅÓËÁéÍáµ¡", "", 1, 75, 0, "13.921297", "100.662003", 3}, _
            '{"»µÃ. ¤ÅÍ§ÊÍ§µÐÇÑ¹µ¡", "", 2, 75, 1, "13.86387", "100.72273", 2}, _
            '{"»µÃ. ¤ÅÍ§ÊÍ§ÊÒÂãµé", "", 2, 75, 0, "13.922188", "100.634285", 2}, _
            '{"»µÃ. ¤ÅÍ§ÊÒÁµÐÇÑ¹µ¡", "", 2, 75, 1, "13.87929", "100.72238", 1}, _
            '{"»µÃ. ¤ÅÍ§ÊÒÁÇÒ", "", 3, 75, 0, "13.85953", "100.72916", 1}, _
            '{"»µÃ. ¤ÅÍ§ÊÕèµÐÇÑ¹µ¡", "", 3, 75, 1, "13.89556", "100.72204", 1}, _
            '{"»µÃ. ¤ÅÍ§Ë¹Öè§", "", 1, 75, 0, "13.85044", "100.73243", 1}, _
            '{"Ê. áÊ¹áÊº-Ë¹Í§¨Í¡", "", 1, 75, 1, "13.82095", "100.746916", 1}, _
            '{"Ê. ¤ÅÍ§¢Ø¹ÃÒª¾Ô¹Ô¨ã¨", "", 2, 75, 1, "13.57199", "100.44561", 3}, _
            '{"Ê. ¤ÅÍ§ºÒ§à¢¹ãËÁè µÍ¹áÁè¹éÓà¨éÒ¾ÃÐÂÒ", "", 1, 75, 1, "13.817871", "100.510968", 1}, _
            '{"Ê. ¤ÅÍ§ºÒ§«×èÍ µÍ¹áÁè¹éÓà¨éÒ¾ÃÐÂÒ", "", 1, 75, 0, "13.800211", "100.519477", 1}, _
            '{"Ê. ¤ÅÍ§¾ÃÐÂÒÃÒªÁ¹µÃÕ", "", 1, 75, 0, "13.63208", "100.43825", 1}, _
            '{"Ê. ¤ÅÍ§ÊÒÁàÊ¹ µÍ¹áÁè¹éÓà¨éÒ¾ÃÐÂÒ", "", 1, 75, 0, "13.784075", "100.508835", 1}, _
            '{"¨Ø´ÇÑ´¤ÅÍ§¾ÃÐâ¢¹§ µÍ¹ÇÑ´¢¨ÃÈÔÃÔ", "", 1, 75, 1, "13.715226", "100.640768", 1}, _
            '{"»µÃ. «ÍÂÅÒ´¾ÃéÒÇ 56", "", 1, 75, 0, "13.793697", "100.58942", 1}, _
            '{"¨Ø´ÇÑ´¤ÅÍ§ºÒ§¡Í¡¹éÍÂ", "", 1, 75, 0, "13.762604", "100.47879", 2}, _
            '{"¨Ø´ÇÑ´¤ÅÍ§¾ÃÐâ¢¹§ºÃÔàÇ³ÇÑ´ÊÐ¾Ò¹", "", 1, 75, 1, "13.705288", "100.588551", 1}, _
            '{"áÁè¹éÓà¨éÒ¾ÃÐÂÒºÃÔàÇ³ÊÐ¾Ò¹¾ÃÐÃÒÁ 8", "", 1, 75, 1, "13.768841", "100.497265", 1}, _
            '{"»µÃ. ¤ÅÍ§áÊ¹áÊº µÍ¹¤ÅÍ§µÑ¹", "", 1, 75, 1, "13.741287", "100.596407", 1}, _
            '{"áÁè¹éÓà¨éÒ¾ÃÐÂÒºÃÔàÇ³»Ò¡¤ÅÍ§µÅÒ´", "", 1, 75, 1, "13.766947", "100.494542", 1}, _
            '{"Ê. ÊÙº¹éÓ¾ÃÐâ¢¹§", "", 1, 75, 1, "13.709457", "100.596684", 1} _
            '}
            'Session("wStation") = wStation
            Session("wStation") = wStationData

            '---(cystalImage, )---//

            Dim cReport(,) As Object = { _
            {"data_sample.jpg", "sample_graph1.jpg"}, _
            {"data_sample.jpg", "sample_graph2.jpg"}, _
            {"data_sample.jpg", "sample_graph3.jpg"}, _
            {"data_sample.jpg", "sample_graph4.jpg"}, _
            {"data_sample.jpg", "sample_graph5.jpg"} _
            }
            Session("cReport") = cReport

            '---(cystalGraph, )---//

            Dim graphData(,) As Object = { _
            {"ÍÑµÃÒ¡ÒÃäËÅ", "sample_graph2.jpg"}, _
            {"ÃÐ´Ñº¹éÓ", "sample_graph3.jpg"}, _
            {"¤ÇÒÁàÃçÇ¡ÃÐáÊ¹éÓ", "sample_graph1.jpg"}, _
            {"¾×é¹·ÕèË¹éÒµÑ´", "sample_graph4.jpg"}, _
            {"»ÃÔÁÒ³¹éÓ", "sample_graph5.jpg"} _
            }
            Session("graphData") = graphData



            '---(txt,xx)---//
            Dim typeData(,) As Object = { _
            {"ÃÒÂ§Ò¹¢éÍÁÙÅÃÒÂÊ¶Ò¹ÕÂéÍ¹ËÅÑ§", ""}, _
            {"ÃÒÂ§Ò¹¤ÇÒÁàÃçÇ¡ÃÐáÊ¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Óà´×Í¹", ""}, _
            {"ÃÒÂ§Ò¹¤ÇÒÁàÃçÇ¡ÃÐáÊ¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Ó»Õ", ""}, _
            {"ÃÒÂ§Ò¹»ÃÔÁÒ³¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Óà´×Í¹", ""}, _
            {"ÃÒÂ§Ò¹»ÃÔÁÒ³¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Ó»Õ", ""}, _
            {"ÃÒÂ§Ò¹ÃÐ´Ñº¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Óà´×Í¹", ""}, _
            {"ÃÒÂ§Ò¹ÃÐ´Ñº¹éÓÃÒÂÊ¶Ò¹Õ»ÃÐ¨Ó»Õ", ""}, _
            {"ÃÒÂ§Ò¹ÊÃØ»¢éÍÁÙÅà¤Ã×èÍ§ÇÑ´ÍÑµÃÒ¡ÒÃäËÅ¢Í§¹éÓµÒÁ¤ÇÒÁàÇÅÒ·ÕèàÅ×Í¡", ""}, _
            {"ÃÒÂ§Ò¹ÊÃØ»¢éÍÁÙÅà¤Ã×èÍ§ÇÑ´ÍÑµÃÒ¡ÒÃäËÅ¢Í§¹éÓ»ÃÐ¨Óà´×Í¹", ""}, _
            {"ÃÒÂ§Ò¹ÊÃØ»¢éÍÁÙÅà¤Ã×èÍ§ÇÑ´ÍÑµÃÒ¡ÒÃäËÅ¢Í§¹éÓ»ÃÐ¨Óà´×Í¹áººÅÐàÍÕÂ´", ""}, _
            {"ÃÒÂ§Ò¹ÊÃØ»¢éÍÁÙÅà¤Ã×èÍ§ÇÑ´ÍÑµÃÒ¡ÒÃäËÅ¢Í§¹éÓ»ÃÐ¨Óà´×Í¹áººÅÐàÍÕÂ´", ""}, _
            {"ÃÒÂ§Ò¹ÊÃØ»¢éÍÁÙÅà¤Ã×èÍ§ÇÑ´ÍÑµÃÒ¡ÒÃäËÅ¢Í§¹éÓ»ÃÐ¨Ó»ÕáººÅÐàÍÕÂ´", ""}, _
            {"ÃÒÂ§Ò¹ÍÑµÃÒ¡ÒÃäËÅÃÒÂÊ¶Ò¹Õ»ÃÐ¨Óà´×Í¹", ""}, _
            {"ÃÒÂ§Ò¹ÍÑµÃÒ¡ÒÃäËÅÃÒÂÊ¶Ò¹ÕÃÒÂ»Õ", ""} _
            }
            Session("typeData") = typeData

            '---(txt,xx)---//
            Dim printData(,) As Object = { _
            {"¾ÔÁ¾ì·Ñé§¢éÍÁÙÅáÅÐ¡ÃÒ¿", ""}, _
            {"¾ÔÁ¾ìà©¾ÒÐ¢éÍÁÙÅ", ""}, _
            {"¾ÔÁ¾ìà©¾ÒÐ¡ÃÒ¿", ""} _
            }
            Session("printData") = printData

            '---(percent)---//
            Dim zoomData(,) As Object = { _
            {50, ""}, _
            {75, ""}, _
            {100, ""}, _
            {150, ""}, _
            {200, ""}, _
            {300, ""}, _
            {400, ""} _
            }
            Session("zoomData") = zoomData

        Catch ex As Exception
            writelog("initial data fail : " & ex.Message)
        End Try
    End Sub
    Private Sub writelog(ByVal msg As String)
        Try
            LogFile.WriteLog(msg)
        Catch ex As Exception

        End Try
    End Sub
End Class

