import QtQuick 2.0

/* Examle

    TextInput {
        x:10; y:20; width: 200; height: 50
        fontSize: 20
        readOnly:true
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

    // Number maximum lengt in input.
    property int maxLength: 20

    // Set normal or passwordMode
    property bool  passwordMode: false

    // Set property read only.
    property alias readOnly: input.readOnly


    // Margin size.
    property int leftMargin: 10
    property int topMargin: 10
    property int rightMargin: 10
    property int bottomMargin:10

    // if press 'enter' key.
    signal pressedReturn(string stringInput)

    source: "qrc:/qml/components/images/image-" + imageColor + ".png"; clip: true
    border { left: 10; top: 10; right: 10; bottom: 10 }

    TextInput {
            id: input
            color: colorText
            text: textInputString
            maximumLength: maxLength
            font.pixelSize: fontSize
            focus: true
            anchors.horizontalCenter: centerText ? textInput.horizontalCenter : textInput.Left
            anchors.verticalCenter: textInput.verticalCenter
            echoMode: passwordMode ? TextInput.Password : TextInput.Normal
            anchors.leftMargin: leftMargin; anchors.topMargin: topMargin
            anchors.rightMargin: rightMargin; anchors.bottomMargin: bottomMargin

            Keys.onPressed: {
                if (event.key == Qt.Key_Return)
                   textInput.pressedReturn(input.text)
            }
        }

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            onClicked:
            {
                // Change focus.
                input.forceActiveFocus()
            }
        }
}
