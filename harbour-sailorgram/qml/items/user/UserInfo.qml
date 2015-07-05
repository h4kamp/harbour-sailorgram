import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.sailorgram.TelegramQml 1.0
import "../../models"
import "../../components"
import "../../js/TelegramHelper.js" as TelegramHelper

Item
{
    property bool actionVisible: false
    property Settings settings
    property Telegram telegram
    property User user

    id: userinfo
    height: content.height

    Column
    {
        id: content
        width: parent.width

        SectionHeader { text: qsTr("Phone Number") }

        Label
        {
            x: Theme.paddingMedium
            width: parent.width - (x * 2)
            text: TelegramHelper.phoneNumber(user)
        }

        SectionHeader { text: qsTr("Actions"); visible: actionVisible }

        ClickableLabel
        {
            visible: actionVisible
            width: parent.width
            height: Theme.itemSizeSmall
            labelText: qsTr("Send Message")
            onActionRequested: pageStack.replace(Qt.resolvedUrl("../../pages/conversations/ConversationPage.qml"), { "settings": settings, "telegram": telegram,  "dialog": telegram.fakeDialogObject(user.id, false) } )
        }
    }
}