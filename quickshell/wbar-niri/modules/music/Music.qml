import Quickshell
import QtQuick

Item {
    id: musicWidgetRoot
    implicitWidth: musicWidgetText.paintedWidth
    height: musicWidgetText.height
    anchors.centerIn: parent

    Row {
        id: musicWidgetRow
        anchors.centerIn: parent
        anchors.right: parent.right
        spacing: 8

        Text {
            id: musicWidgetText
            font.family: "JetBrainsMono Nerd Font Propo"
            text: MC.mcMusicFormatted
            renderType: Text.NativeRendering
            font.hintingPreference: Font.PreferFullHinting
            font.pixelSize: 15
            font.weight: 900
            color: musicWidgetTextMouseArea.containsMouse ? "#959595" : "#000000"

            Behavior on color {
                ColorAnimation {
                    duration: 240
                }
            }

            MouseArea {
                id: musicWidgetTextMouseArea
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: Quickshell.execDetached(["sh", "-c", "$HOME/.config/quickshell/wbar-niri/scripts/musicplayer.sh --toggle"])

                onWheel: mouse => {
                    if (mouse.angleDelta.y > 0) {
                        Quickshell.execDetached(["sh", "-c", "$HOME/.config/quickshell/wbar-niri/scripts/musicplayer.sh --inc"]);
                    } else if (mouse.angleDelta.y < 0) {
                        Quickshell.execDetached(["sh", "-c", "$HOME/.config/quickshell/wbar-niri/scripts/musicplayer.sh --dec"]);
                    }
                }
            }
        }
    }
}
