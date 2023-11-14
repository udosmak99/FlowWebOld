<%@ Page Title="" Language="VB" MasterPageFile="~/template1.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<asp:Content ContentPlaceHolderID="parameterHeader" ID="parametertPlaceHeader" runat="server">
<% 
	
%>
</asp:Content>
<asp:Content ContentPlaceHolderID="jsPlaceHeader" ID="jsPlaceHeaderContent" runat="server">


</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceImgMenu" ID="contentPlaceImgMenu" runat="server">
<!--station Img-->
<li style="display:inline;list-style:none;" class="flow_menu" id="list_menus"><a href="javascript:$('#right_menu').slideToggle();list_station('list_station','img_st','txt_st');" id="txt_st">ซ่อนรายการชื่อสถานีทั้งหมด</a><img src="images/hide_icon.png" id="img_st" align="absmiddle" hspace="5" vspace="12"/></li>

<!--end station Img-->
 
</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceMaps" ID="contentPlaceMaps" runat="server">

</asp:Content>
<asp:Content ContentPlaceHolderID="contentPlaceHolder" ID="contentPlaceHolder" runat="server">
<!--Contents-->

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/infobox.js"></script>
<script type="text/javascript">

function initialize() {

	var json = [
	<%

  For row As Integer = 0 to Session("wStation").GetUpperBound(0)
   Dim name as String = CStr(Session("wStation")(row,0))
   Dim lat as String = CStr(Session("wStation")(row,5))
   Dim lng as String = CStr(Session("wStation")(row,6))
   Dim MeanVelocity as String = (Session("wStation")(row,8)).tostring
   Dim Flow as String = (Session("wStation")(row,9)).tostring
   Dim Waterlevel as String = (Session("wStation")(row,3)).tostring
   Dim stnID as String = (row+1).tostring
    Dim dt as String = (Session("wStation")(row,11)).tostring
	dim stnstatus as string = trim( (Session("wStation")(row,4)).tostring)
    Dim stnIDdata as string = (Session("wStation")(row,10)).tostring
    application("stnid" & row) = stnid
%>
	
  {
    "row": "<% Response.Write(row) %>",
    "title": "<% Response.Write(name) %>",
    "lat": <% Response.Write(lat) %>,
    "lng": <% Response.Write(lng) %>,
    "desc1": "<% Response.Write(MeanVelocity) %>",
    "desc2": "<% Response.Write(Flow) %>",
	"desc3": "<% Response.Write(Waterlevel) %>",
    "desc4": <% Response.Write(19) %>,
    "stnid": "<% Response.Write(stnID) %>",
	"stnstatus": "<% Response.Write(stnstatus) %>",
    "dtlast": "<% Response.Write(dt) %>",
    "stniddata": "<% Response.Write(stnIDdata) %>"
  }<% If row < Session("wStation").GetUpperBound(0) Then Response.Write(",") %>
  <%
Next
%>
]

    var loc, map, marker, infobox;
    loc =  new google.maps.LatLng(13.67768,100.639864);
    
    map = new google.maps.Map(document.getElementById("map_canvas"), {
         zoom: 11,
         center: loc,
            scrollwheel: false,
            disableDefaultUI: true,
            panControl: false,
            zoomControl: false,
            mapTypeControl:false, 
                    
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            
            
    });
    var paths = [
     new google.maps.LatLng(13.915406, 100.685921),
     new google.maps.LatLng(13.918072, 100.755272),
     new google.maps.LatLng(13.930735, 100.791321),
     new google.maps.LatLng(13.945396, 100.912857),

     new google.maps.LatLng(13.884412, 100.905647),
     new google.maps.LatLng(13.861081, 100.905304),
     new google.maps.LatLng(13.859081, 100.903244),
     new google.maps.LatLng(13.848747, 100.900841),

     new google.maps.LatLng(13.846080, 100.910797),
     new google.maps.LatLng(13.837747, 100.906334),
     new google.maps.LatLng(13.814077, 100.936890),
     new google.maps.LatLng(13.801408, 100.927277),

     new google.maps.LatLng(13.791405, 100.909081),
     new google.maps.LatLng(13.753392, 100.887451),
     new google.maps.LatLng(13.699362, 100.854149),
     new google.maps.LatLng(13.696360, 100.859642),

     new google.maps.LatLng(13.691023, 100.858612),
     new google.maps.LatLng(13.718040, 100.788574),
     new google.maps.LatLng(13.717373, 100.772095),
     new google.maps.LatLng(13.716039, 100.766945),

     new google.maps.LatLng(13.718040, 100.763855),
     new google.maps.LatLng(13.717707, 100.708923),
     new google.maps.LatLng(13.702697, 100.710983),
     new google.maps.LatLng(13.691690, 100.708923),

     new google.maps.LatLng(13.679681, 100.705147),
     new google.maps.LatLng(13.674010, 100.704117),
     new google.maps.LatLng(13.664002, 100.698624),
     new google.maps.LatLng(13.657664, 100.697594),

     new google.maps.LatLng(13.662668, 100.677681),
     new google.maps.LatLng(13.668005, 100.667381),
     new google.maps.LatLng(13.672676, 100.661201),
     new google.maps.LatLng(13.671341, 100.659142),

     new google.maps.LatLng(13.673677, 100.654678),
     new google.maps.LatLng(13.661333, 100.649872),
     new google.maps.LatLng(13.653327, 100.649185),
     new google.maps.LatLng(13.655996, 100.639915),

     new google.maps.LatLng(13.648656, 100.634079),
     new google.maps.LatLng(13.650324, 100.630646),
     new google.maps.LatLng(13.652659, 100.630989),
     new google.maps.LatLng(13.655996, 100.619659),

     new google.maps.LatLng(13.658331, 100.617256),
     new google.maps.LatLng(13.655328, 100.614853),
     new google.maps.LatLng(13.657664, 100.608330),
     new google.maps.LatLng(13.660333, 100.605583),

     new google.maps.LatLng(13.659332, 100.602837),
     new google.maps.LatLng(13.661333, 100.597343),
     new google.maps.LatLng(13.669340, 100.581207),
     new google.maps.LatLng(13.685018, 100.590477),

     new google.maps.LatLng(13.693358, 100.588417),
     new google.maps.LatLng(13.701030, 100.578461),
     new google.maps.LatLng(13.707367, 100.559578),
     new google.maps.LatLng(13.704365, 100.551682),

     new google.maps.LatLng(13.695693, 100.549622),
     new google.maps.LatLng(13.682683, 100.550995),
     new google.maps.LatLng(13.672342, 100.546532),
     new google.maps.LatLng(13.670007, 100.534515),

     new google.maps.LatLng(13.678680, 100.522842),
     new google.maps.LatLng(13.676012, 100.518379),
     new google.maps.LatLng(13.673677, 100.520782),
     new google.maps.LatLng(13.668673, 100.519066),

     new google.maps.LatLng(13.666671, 100.515976),
     new google.maps.LatLng(13.639314, 100.514603),
     new google.maps.LatLng(13.633642, 100.516663),
     new google.maps.LatLng(13.626969, 100.512886),

     new google.maps.LatLng(13.613622, 100.515633),
     new google.maps.LatLng(13.606281, 100.519753),
     new google.maps.LatLng(13.602944, 100.512543),
     new google.maps.LatLng(13.598273, 100.510483),

     new google.maps.LatLng(13.598940, 100.504303),
     new google.maps.LatLng(13.595603, 100.498123),
     new google.maps.LatLng(13.588262, 100.496063),
     new google.maps.LatLng(13.588262, 100.490570),

     new google.maps.LatLng(13.593601, 100.483017),
     new google.maps.LatLng(13.599607, 100.481300),
     new google.maps.LatLng(13.599941, 100.478210),
     new google.maps.LatLng(13.603278, 100.478210),

     new google.maps.LatLng(13.603278, 100.474777),
     new google.maps.LatLng(13.598940, 100.472031),
     new google.maps.LatLng(13.594602, 100.472717),
     new google.maps.LatLng(13.593100, 100.470139),

     new google.maps.LatLng(13.597605, 100.467400),
     new google.maps.LatLng(13.599607, 100.467735),
     new google.maps.LatLng(13.604947, 100.466537),
     new google.maps.LatLng(13.607616, 100.462761),

     new google.maps.LatLng(13.605280, 100.457611),
     new google.maps.LatLng(13.607616, 100.452805),
     new google.maps.LatLng(13.586927, 100.445938),
     new google.maps.LatLng(13.554220, 100.443535),

     new google.maps.LatLng(13.504485, 100.452118),
     new google.maps.LatLng(13.498810, 100.436325),
     new google.maps.LatLng(13.497808, 100.427742),
     new google.maps.LatLng(13.498810, 100.423622),

     new google.maps.LatLng(13.495805, 100.409889),
     new google.maps.LatLng(13.534528, 100.407486),
     new google.maps.LatLng(13.535529, 100.414696),
     new google.maps.LatLng(13.544541, 100.421562),

     new google.maps.LatLng(13.552552, 100.415726),
     new google.maps.LatLng(13.558225, 100.416069),
     new google.maps.LatLng(13.558225, 100.412292),
     new google.maps.LatLng(13.555555, 100.409546),

     new google.maps.LatLng(13.556223, 100.403023),
     new google.maps.LatLng(13.553887, 100.401306),
     new google.maps.LatLng(13.555222, 100.395813),
     new google.maps.LatLng(13.571575, 100.391006),

     new google.maps.LatLng(13.579251, 100.385513),
     new google.maps.LatLng(13.589930, 100.385513),
     new google.maps.LatLng(13.594936, 100.380020),
     new google.maps.LatLng(13.618961, 100.376930),

     new google.maps.LatLng(13.622298, 100.381393),
     new google.maps.LatLng(13.624967, 100.378990),
     new google.maps.LatLng(13.623299, 100.372124),
     new google.maps.LatLng(13.633976, 100.366287),

     new google.maps.LatLng(13.635978, 100.359077),
     new google.maps.LatLng(13.637980, 100.356331),
     new google.maps.LatLng(13.641983, 100.354271),
     new google.maps.LatLng(13.644652, 100.346718),

     new google.maps.LatLng(13.649323, 100.345345),
     new google.maps.LatLng(13.654995, 100.348091),
     new google.maps.LatLng(13.655996, 100.340881),
     new google.maps.LatLng(13.665337, 100.341568),

     new google.maps.LatLng(13.678347, 100.338135),
     new google.maps.LatLng(13.682350, 100.334702),
     new google.maps.LatLng(13.703364, 100.330925),
     new google.maps.LatLng(13.710702, 100.333672),

     new google.maps.LatLng(13.712370, 100.339508),
     new google.maps.LatLng(13.720708, 100.334358),
     new google.maps.LatLng(13.731381, 100.336761),
     new google.maps.LatLng(13.752725, 100.336075),

     new google.maps.LatLng(13.760395, 100.333328),
     new google.maps.LatLng(13.764730, 100.330582),
     new google.maps.LatLng(13.784403, 100.334358),
     new google.maps.LatLng(13.797407, 100.331955),

     new google.maps.LatLng(13.803075, 100.329552),
     new google.maps.LatLng(13.797407, 100.455551),
     new google.maps.LatLng(13.794406, 100.467567),
     new google.maps.LatLng(13.788071, 100.464478),

     new google.maps.LatLng(13.799741, 100.502243),
     new google.maps.LatLng(13.812743, 100.515976),
     new google.maps.LatLng(13.816744, 100.508423),
     new google.maps.LatLng(13.824412, 100.511169),

     new google.maps.LatLng(13.849414, 100.544128),
     new google.maps.LatLng(13.950061, 100.568848),
     new google.maps.LatLng(13.954060, 100.574341),
     new google.maps.LatLng(13.944064, 100.604553),

     new google.maps.LatLng(13.951394, 100.605927),
     new google.maps.LatLng(13.949395, 100.620346),
     new google.maps.LatLng(13.936733, 100.623779),
     new google.maps.LatLng(13.933401, 100.636826),

     new google.maps.LatLng(13.926736, 100.640945),
     new google.maps.LatLng(13.927403, 100.686951),
     new google.maps.LatLng(13.915406, 100.685921)

];
    var lineSymbol = {
        path: 'M 0,-0.5 0,0.5',
        strokeWeight: 2,
        strokeOpacity: 0.8,
        scale: 2
    };
    var poly = new google.maps.Polygon({
        paths: paths,
        strokeWeight: 10,
        strokeColor: '#eab175',
        strokeOpacity: 0.4,
        fillColor: '#eab175',
        fillOpacity: 0.2 
    });

    var line = new google.maps.Polyline({
        path: paths,
        strokeColor: "#eab175",
        strokeOpacity: 1,
        icons: [{
            icon: lineSymbol,
            offset: '100%',
            repeat: '8px'
        }],
        map: map
    });
    poly.setMap(map);
    
  //  var icon = new google.maps.MarkerImage("images/pin_final.png", null, null, new google.maps.Point(23,45));
  
    for (var i = 0, length = json.length; i < length; i++) {
  var data = json[i],
      latLng = new google.maps.LatLng(data.lat, data.lng); 
      
	   if (data.stnstatus != "Success"){      
       icon = new google.maps.MarkerImage("images/PIN_FAIL.gif", null, null, new google.maps.Point(23,45));          
      } else
      {      
       icon = new google.maps.MarkerImage("images/pin_final.png", null, null, new google.maps.Point(23,45));
      }    
  // Creating a marker and putting it on the map
   var marker = new google.maps.Marker({
    position: latLng,
    map: map,
    station: data.stnid,
    stationid:data.stniddata,
	optimized: false,
    icon:icon, 
     html: '<div id="infobox" style="padding:70px 0 0 0;background:url(images/cloud_bg3.png) no-repeat;width:440px;height:260px;cursor:hand;cursor:pointer; "><div style="color:#690;font-weight:bold;font-size:13px;padding:5px;text-align:center;">'+data.title+'</div><table cellpadding="5" cellspacing="5" style="margin-top:5px;" width="350" align="center"><tr style="color: #444; font-size: 12px; border-top: dotted 1px #ccc; margin-top: 5px; padding: 5px; background: #FFF;"><td>ความเร็วกระแสน้ำ</td><td align="right" width="20%">'+data.desc1+'</td><td align="left" width="30%">(ม./วินาที)</td></tr><tr style="color:#444;font-size:12px;border-top:dotted 1px #ccc;padding:5px;background: #EFEFEF;"><td>อัตราการไหล</td><td align="right" width="20%">'+data.desc2+'</td><td align="left" width="30%">(ลบ.ม./วินาที)</td></tr><tr style="color: #444; font-size: 12px; border-top: dotted 1px #ccc; margin-top: 5px; padding: 5px; background: #FFF;"><td>ระดับน้ำ</td><td align="right" width="20%">'+data.desc3+'</td><td align="left" width="30%">(ม.รทก.)</td></tr><tr style="color: #444; font-size: 12px;"><td colspan="3" align="center" style="padding-top:15px; border-top: dotted 1px #ccc;">'+data.dtlast+'</td></tr></table></div>'  });

  google.maps.event.addListener(marker,'click', function() {        
       location.href="stations.aspx?station="+ this.station; + "&stnid="+this.stniddata;} );

  google.maps.event.addListener(marker, 'mouseover', function() {
        //$("#infobox").html(this.html);
  infobox.setContent(this.html);      infobox.open(map, this);
        this.setOptions({zIndex:99999});  
        
    });
   google.maps.event.addListener(marker, 'mouseout', function() {
         //$("#infobox").html(this.html);
 infobox.setContent(this.html);       infobox.close(map, this);
        this.setOptions({zIndex:1}); 
        
    });

//    google.maps.event.addListener(marker, 'click', function() {        
//       location.href="stations.aspx?station="+data.stnid;                
//    });

}
infobox = new InfoBox({
         content: document.getElementById("infobox"),
         disableAutoPan: false,
         maxWidth: 280,
         pixelOffset: new google.maps.Size(-215, -360),
         zIndex: null,
         boxStyle: {
         
        },
        
        infoBoxClearance: new google.maps.Size(1, 1)
    });
    
    
/////

var styles = [
  {
    stylers: [
      { hue: "#00ffe6" },
      { saturation: -20 }
    ]
  },
  {
    "featureType": "water",
     elementType: "geometry",
    "stylers": [
      { "color": "#2691e3" },
      { "lightness": 12 },
      { visibility: "on" }
    ]
  },
  
  {
    featureType: "road",
    elementType: "geometry",
    stylers: [
      { "color": "#c4c4c4" },
      { visibility: "simplified" }
    ]
  },{
    featureType: "road",
    elementType: "labels",
    stylers: [
      { visibility: "on" }
    ]
  }
];

map.setOptions({styles: styles});


    
 //zoom in control click event
			google.maps.event.addDomListener(zoomIn, 'click', function() {
   			var currentZoomLevel = map.getZoom();
   			if(currentZoomLevel != 26){
     		map.setZoom(currentZoomLevel + 1);
     		//alert(currentZoomLevel);
    		}
 			});

			//zoom out control click event

			google.maps.event.addDomListener(zoomOut, 'click', function() {
  			 var currentZoomLevel = map.getZoom();
   			if(currentZoomLevel != 4){
    		 map.setZoom(currentZoomLevel - 1);
   			}
 			});
			 ////      
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div id="map_canvas" style="width:100%; height:850px;z-index:5;background:#FFF;"></div>
<div class="infobox-wrapper" >
    <div id="infobox" style="padding:70px 0 0 0;background:url(images/cloud_bg3.png) no-repeat;width:440px;height:260px;cursor:hand;cursor:pointer;">	 
</div>
</div>

<!--end Contents-->
<script>
    $(document).ready(function () {
        $('#list_station').css('height', '500px');
        //จำ ตำแหน่ง scroll bar  //
        if ($.session.get("list_visible") == "true") {

            $('#right_menu').slideToggle();
            $('#right_menu').hide();
            list_station('list_station', 'img_st', 'txt_st');

        }
    });

</script>
</asp:Content>
