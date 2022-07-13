import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.4

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("My Oven Machine")
    color: "#230f14"
    property real nhietdo:  0
    property real thoigian_phut: 0
    property real thoigian_gio: 0


    Rectangle{
        width: parent.width
        height: parent.height
        color: "#e4f184"

            Label {
                width: 200
                x:parent.width/2.3
                text: "FIFI Oven "
                font.pointSize: 25
                font.bold: true
                color: "#1b1b1b"

        }
        //cột số 1 - tầng nhiệt độ giúp tăng giảm nhiệt độ thủ công
        Column{
            id: cot_1_up
            width: parent.width/3.5
            anchors.left: parent.left
            leftPadding: parent.width/16
            topPadding: parent.height/10
            spacing: 20
            RoundButton{
                id:nut_tang_nhiet_do
                height: 40
                width:cot_1_up.width
                text: "^"
                font.bold: true
                font.pointSize: 20
                onClicked: {
                    if(nhietdo<1000&&nhietdo>=300){
                        nhietdo += 100
                        hien_thi_nhiet_do.text = nhietdo
                    }
                    else if (nhietdo<300)
                    {
                        nhietdo += 50
                        hien_thi_nhiet_do.text = nhietdo
                    }
                }

            }
            Item  {
                height: 30
                width: cot_1_up.width
                Text {
                    id: nhiet_do
                    anchors.centerIn:  parent
                    color: "#1b1b1b"
                    text: qsTr("TEMPERATURE")
                    font.bold: true
                    font.pointSize: 15

                }
            }
            RoundButton{
                id:nut_giam_nhiet_do
                height: 40
                width:cot_1_up.width
                text: "v"

                font.pointSize: 20
                onClicked: {
                    if(nhietdo>300){
                        nhietdo -= 100
                        hien_thi_nhiet_do.text = nhietdo
                    }
                    else if (nhietdo<=300&&nhietdo>0)
                    {
                        nhietdo -= 50
                        hien_thi_nhiet_do.text = nhietdo
                    }
                }

            }
        }
        // cột số 1 - tầng thời gian giúp tăng giảm thời gian thủ công
        Column
        {   id: cot_1_down
            width: parent.width/3.5
            anchors.left: parent.left
            leftPadding: parent.width/16
            topPadding: parent.height/1.7
            spacing: 20
            RoundButton{
                id:nut_tang_time
                height: 40
                width:cot_1_up.width
                text: "^"
                font.bold: true
                font.pointSize: 20
                onClicked: {
                    if(thoigian_phut<=45&&thoigian_gio<3){
                        thoigian_phut += 15
                        hien_thi_thoi_gian.text = thoigian_gio + ":"+thoigian_phut

                    }
                    if(thoigian_phut>45){
                        thoigian_phut=0
                        thoigian_gio ++
                        hien_thi_thoi_gian.text = thoigian_gio + ":"+thoigian_phut
                    }
                }
            }
            Item {
                height: 30
                width: cot_1_up.width
                Text {
                    id: time
                    anchors.centerIn:  parent
                    color: "#1b1b1b"
                    text: qsTr("TIMER")
                    font.bold: true
                    font.pointSize: 15

                }
            }
            RoundButton{
                id:nut_giam_time
                height: 40
                width:cot_1_up.width
                text: "v"
                font.pointSize: 20
                onClicked: {
                    if(thoigian_phut>0&&thoigian_phut<=45&&thoigian_gio>=0){
                        thoigian_phut -= 15
                        hien_thi_thoi_gian.text = thoigian_gio + ":"+thoigian_phut

                    }
                    if(thoigian_phut==0&&thoigian_gio>0){
                        thoigian_phut=45
                        thoigian_gio --
                        hien_thi_thoi_gian.text = thoigian_gio + ":"+thoigian_phut
                    }

                }

            }
        }
        //cột số 2 - hiển thị nhiệt độ và thời gian
        Column{
            id: cot_2
            width: parent.width/4
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: parent.height/6
            spacing: parent.height/2.6

            Rectangle{
                width: cot_2.width
                height: 70
                border.color: "#0a0909"
                border.width: 5
                color: "#8686d4"
                Text {
                    anchors.centerIn: parent
                    id: hien_thi_nhiet_do
                    text: nhietdo
                    visible: false
                    color: "#9c2c24"
                    font.bold: true
                    font.pointSize: 20
                }
            }

            Rectangle{
                width: cot_2.width
                height: 70
                border.color: "#0a0909"
                border.width: 5
                color: "#8686d4"
                Text {
                    anchors.centerIn: parent
                    id: hien_thi_thoi_gian
                    text: thoigian_gio+":"+thoigian_phut
                    visible: false
                    color: "#9c2c24"
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }
        // cột số 3 - gồm 3 chế độ mặc định và nút start
        Column{
            id: cot_3
            width:parent.width/3
            anchors.right: parent.right
            topPadding: parent.height/3.7
            spacing: parent.height/65

            Text {
                text: qsTr("MODE")
                color: "#1b1b1b"
                font.bold: true
                font.pointSize: 15
                x:25

            }
            Frame{
                background: Rectangle{
                    border.width: 5
                    border.color: "#3b7a28"
                }

                Column{
                    spacing: parent.height/5
                    RoundButton{
                        text: "HIGH"
                        font.bold: true
                        font.pointSize: 15
                        highlighted: true
                        anchors.horizontalCenter:  parent.horizontalCenter
                        onClicked: {
                            nhietdo= 700
                            hien_thi_nhiet_do.text = nhietdo
                            thoigian_phut = 0
                            thoigian_gio = 1
                            hien_thi_thoi_gian.text = thoigian_gio+":"+thoigian_phut

                        }
                    }
                    RoundButton{
                        text: "MIDDLE"
                        font.bold: true
                        font.pointSize: 15
                        highlighted: true
                        onClicked: {
                            nhietdo = 300
                            hien_thi_nhiet_do.text = nhietdo
                            thoigian_phut =45
                            thoigian_gio=0
                            hien_thi_thoi_gian.text = thoigian_gio+":"+thoigian_phut
                        }

                    }
                    RoundButton{
                        text: "LOW"
                        font.bold: true
                        font.pointSize: 15
                        highlighted: true
                        anchors.horizontalCenter:  parent.horizontalCenter
                        onClicked: {
                            nhietdo = 100
                            hien_thi_nhiet_do.text = nhietdo
                            thoigian_phut =30
                            thoigian_gio=0
                            hien_thi_thoi_gian.text = thoigian_gio+":"+thoigian_phut
                        }
                    }
                }
            }
            Item {
                height: parent.height/10
                width: cot_3.width
            }
            RoundButton{
                height: 100
                width: 100
                highlighted: true
                text:"START"
                font.bold: true
                font.pointSize: 10

            }
        }
        //cột số 4- gồm nút on và off
        Column{
            id: cot_4
            width: parent.width/3
            anchors.right: parent.right
            leftPadding: parent.width/6
            topPadding: parent.height/8
            spacing: parent.height/2
            RoundButton{
                height: 80
                width: 80
                text:"ON"
                highlighted: true
                font.bold: true
                font.pointSize: 10
                onClicked: {
                    hien_thi_nhiet_do.visible = true
                    nhietdo = 0
                    hien_thi_nhiet_do.text = nhietdo
                    hien_thi_thoi_gian.visible =true
                    thoigian_phut = 0
                    thoigian_gio =0
                    hien_thi_thoi_gian.text = thoigian_gio+ ":" +thoigian_phut
                }
            }
            RoundButton{
                height: 80
                width: 80
                text:"OFF\n/STOP"
                highlighted: true
                font.bold: true
                font.pointSize: 10
                onClicked:{
                    hien_thi_nhiet_do.visible = false
                    nhietdo = 0
                    hien_thi_thoi_gian.visible = false
                    thoigian_phut =0
                }
            }
        }

    }
}


