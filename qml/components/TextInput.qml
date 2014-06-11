import QtQuick 2.0

/* Examle

    TextInput {
        x:10; y:20; width: 200; height: 50
        fontSize: 20
        onPressedReturn: {
            console.log("press" + stringInput)
        }
    }
*/
BorderImage {
    id: textInput

    // Background image.
    property string imageColor: "red"

    // String to button.
    property string textInputString: "Default Text"

    // Color for label.
    property string colorText: "white"

    // Font label.
    property int      fontSize: 30

    // If property centerText<code>true</code> then text input is center.
    property bool   centerText: true

    // if press 'enter' key.
    signal pressedReturn(string stringInput)

    source: "qrc:/qml/components/images/image-" + imageColor + ".png"; clip: true
    border { left: 10; top: 10; right: 10; bottom: 10 }

    TextInput {
            id: input
            color: colorText
            text: textInputString
            font.pixelSize: fontSize
            anchors.horizontalCenter: centerText ? textInput.horizontalCenter : textInput.Left
            anchors.verticalCenter: textInput.verticalCenter
            focus: true
            Keys.onPressed: {
                if (event.key == Qt.Key_Return)
                   textInput.pressedReturn(text)
            }
        }
}
