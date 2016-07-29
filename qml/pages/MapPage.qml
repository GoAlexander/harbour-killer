import QtQuick 2.0
import Sailfish.Silica 1.0


Dialog {
    id: mapPage

    //TODO WebView from QT???
    SilicaWebView {
        id: mapView
        anchors.fill: parent

        url: "https://www.google.ru/maps"

        //onUrlChanged: checkUrl(url)
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
