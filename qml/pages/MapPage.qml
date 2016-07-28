import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: mapPage

    //HEADER!!!
    //TODO disable swipe!!!
    PageHeader {
        title: qsTr("Map")
        }
    DialogHeader {
        title: qsTr("Map")
    }

    //TODO WebView from QT???
    SilicaWebView {
        id: mapView
        anchors.fill: parent
        /*
        url: "https://oauth.vk.com/authorize?" +
             "client_id=4803503" +
             "&scope=messages,video,wall,audio,friends,photos,offline" +
             "&redirect_uri=https://oauth.vk.com/blank.html" +
             "&display=mobile" +
             "&response_type=token"
        */

        url: "https://www.google.ru/maps"

        onUrlChanged: checkUrl(url)
    }
}

/*
Component {
        id: wikipedia

        Page {
        allowedOrientations: page.allowedOrientations
            PageHeader {
                id: wikititle
                title: map.wiki_entry.title
            }
            SilicaWebView {
        id: webView
        anchors {
            top: wikititle.bottom
            bottom: parent.bottom
        }
        width: page.width
        opacity: 0
            onLoadingChanged: {
                    switch (loadRequest.status)
                    {
                        case WebView.LoadSucceededStatus:
                        opacity = 1
                        break
                    case WebView.LoadFailedStatus:
                        opacity = 0
                        viewPlaceHolder.errorString = loadRequest.errorString
                        break
                    default:
                        opacity = 0
                        break
                    }
                }
                FadeAnimation on opacity {}
        }
        ViewPlaceholder {
            id: viewPlaceHolder
            property string errorString
            enabled: webView.opacity == 0
            text: webView.loading ? "Loading" : "Web content load error: " + errorString
            hintText: map.wiki_entry.url
        }
        Component.onCompleted: {
            webView.url = map.wiki_entry.url
            }
        }
    }
*/
