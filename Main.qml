import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        anchors.fill: parent
        color: "#dfdfdf"
        Text {
            anchors.topMargin: parent.height * 0.25
            anchors.leftMargin: parent.width * 0.25
            anchors.fill: parent
            id: message
            text: qsTr("Hello World !")
        }
    }
}
