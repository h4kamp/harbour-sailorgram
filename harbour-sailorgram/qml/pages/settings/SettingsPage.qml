import QtQuick 2.1
import Sailfish.Silica 1.0
import "../../models"
import "../../js/Settings.js" as Settings

Dialog
{
    property Context context

    allowedOrientations: defaultAllowedOrientations
    acceptDestinationAction: PageStackAction.Pop

    onAccepted: {
        context.sendwithreturn = tssendwithreturn.checked;
        Settings.set("sendwithreturn", tssendwithreturn.checked);
    }

    SilicaFlickable
    {
        anchors.fill: parent

        Column
        {
            id: content
            width: parent.width

            DialogHeader
            {
                acceptText: qsTr("Save")
            }

            TextSwitch
            {
                id: tssendwithreturn
                anchors { left: parent.left; right: parent.right; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
                text: qsTr("Send Message by pressing Return Key")
                checked: context.sendwithreturn
            }
        }
    }
}