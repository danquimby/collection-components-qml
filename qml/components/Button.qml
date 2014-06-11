
import QtQuick 2.0

/* Example

    Button {
        x:10; y:20; width: 100; height: 50
        fontSize: 20
        buttonString: "push me"
        onClicked: {
            console.log("press")
        }
    }
*/

BorderImage {
    id: button

    // String to button.
    property string buttonString: ""

    // Background image.
    property string imageColor: "red"

    // Color for label.
    property string colorText: "white"

    // Color for <code>styleColor</code> property.
    property string styleColorText: "black"

    //Color after clicking to button.
    property string colorClicking: "black"

    // Font label.
    property int      fontSize: 30

    // If propery hover is present to states entered and exited serviced.
    property bool  hover: false

    // Action to click button.
    signal clicked

    source: "qrc:/qml/components/images/image-" + imageColor + ".png"; clip: true
    border { left: 10; top: 10; right: 10; bottom: 10 }

    Rectangle {
        id: shade
        anchors.fill: button; radius: 10; color: "black"; opacity: 0
    }

    Rectangle {
        id: normal
        anchors.fill: button; radius: 10; color: "transparent"; opacity: 0
    }

    Text {
        id: buttonText
        text: buttonString
        anchors.centerIn: parent; anchors.verticalCenterOffset: -1
        font.pixelSize: fontSize
        style: Text.Sunken; color: colorText; styleColor: styleColorText; smooth: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered:
        {
            if (hover)
                button.state =  "entered"
        }
        onExited:
        {
            if (hover)
                button.state =  "exited"
        }
        onClicked:
        {
            button.clicked()
        }
    }

        states: [
            State {
                name: "pressed"; when: mouseArea.pressed == true
                PropertyChanges { target: shade; opacity: .4 }
            },
            State {
                name: "entered";
                PropertyChanges { target: shade; opacity: .4 }
            },
            State {
                name: "exited";
                PropertyChanges { target: normal; opacity: .8 }
            }
        ]
}
