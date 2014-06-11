import QtQuick 2.0
import "components"

BorderImage {
    id: name
    source: "qrc:/qml/components/images/image-blue.png"
    width: 400; height: 400
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    Button {
        x:10; y:20; width: 100; height: 50
        fontSize: 20
        buttonString: "push me"
        onClicked: {
            console.log("press")
        }
    }
}
