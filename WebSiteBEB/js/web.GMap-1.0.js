var map;
var lat;
var lng;
var loc;
var tTip;
function initialize() {
    //function initialize() {
    //var latlng = new google.maps.LatLng(-34.397, 150.644);
    var latlng = new google.maps.LatLng(lat, lng);
    var myOptions = {
        zoom: 15,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    //alert(document.getElementById("divMap").innerHtml);
    map = new google.maps.Map(document.getElementById("divMap"), myOptions);
    //alert(map);
    var marker = new google.maps.Marker
        (
            {
                //position: new google.maps.LatLng(-34.397, 150.644),
                position: new google.maps.LatLng(lat, lng),
                map: map,
                title: tTip
            }
        );
    var infowindow = new google.maps.InfoWindow({
        content: loc
    });
    google.maps.event.addListener(marker, 'click', function () {
        // Calling the open method of the infoWindow 
        infowindow.open(map, marker);
    });
}

function LoadGMap(latitude, longitude, toolTip, location) {
    lat = latitude;
    lng = longitude;
    loc = location;
    tTip = toolTip;
    //alert(lat);
    setTimeout(function () { initialize(); }, 300); 
}

//window.onload = initialize(-34.397, 150.644, '');