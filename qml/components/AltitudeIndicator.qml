//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.

//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.

//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//    (c) 2014 Author: Bill Bonney <billbonney@communistech.com>
//

import QtQuick 1.1

Rectangle {
    property real alt: 0

    anchors.verticalCenter: parent.verticalCenter

    width: 50
    height: parent.height*0.8
    z: 1
    clip: true
    smooth: true
    border.color: "black"
    color: Qt.rgba(0,0,0,0.25)
    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 45

        Repeater {
            model: ["200", "190", "180", "170", "160", "150", "140","130","120",
                    "110", "100", "90", "80", "70", "60", "50", "40", "30", "20", "10", "0",
                    "-10", "-20", "-30", "-40", "-50" , "-60", "-70", "-80", "-90" , "-100"]
            Rectangle { // Graticule Light
                id:graticuleLight
                width: 35
                height: 2
                color: "white"
                smooth: true
                Text {
                    anchors.verticalCenterOffset: -10
                    anchors.verticalCenter: parent.verticalCenter
                    smooth: true
                    text: modelData
                    color: "white"
                    opacity: 0.5
                }
            }
        }
        transform: Translate {
            y: (alt*4.5) - 45
        }
    }

    Rectangle { // Altitude Label
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 17
        color: "black"
        border.color: "white"
        Text {
            anchors.centerIn: parent
            text: alt.toFixed(1)
            color: "white"
        }
    }

    Rectangle { // Altitude Fine Line
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 2
        color: "red"
        opacity: 0.4
    }
}