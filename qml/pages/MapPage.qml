import QtQuick 2.0
import Sailfish.Silica 1.0


Dialog {
    id: mapPage
    property string killer_lat: "56.73"
    property string killer_lon: "44.55"
    property string victim_lat: "56.75"
    property string victim_lon: "44.56"
    //TODO WebView from QT???
    SilicaWebView {
        id: mapView
        anchors.fill: parent

        url: "../html/google_maps.html"

        //onUrlChanged: checkUrl(url)

        function addMarkers(){
            // Run "Add marker function from html page"
            evaluateJavaScript("addMarker("+ killer_lat + "," + killer_lon + ")")
            evaluateJavaScript("addMarker("+ victim_lat + "," + victim_lon + ")")
        }
    }
}
