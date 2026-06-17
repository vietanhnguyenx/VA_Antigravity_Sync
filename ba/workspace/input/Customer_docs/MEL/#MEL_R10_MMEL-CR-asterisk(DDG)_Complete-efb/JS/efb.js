// ===========================
// ELECTRONIC FLIGHT BAG (EFB)
// ===========================


function loadLinkByID(xmlFile) {
    try {//Internet Explorer
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    }
    catch (e) {
        try {//Firefox, Mozilla, Opera, etc.
            var xmlDoc = document.implementation.createDocument("", "", null);
        }
        catch (e) { alert(e.message) }
    }
    try {
        xmlDoc.validateOnParse = false;
        xmlDoc.async = false;
        xmlDoc.load(xmlFile);
        document.title = "content://" + xmlDoc.documentElement.childNodes(1).attributes.getNamedItem("id").value;
    }
    catch (e) { alert(e.message) }
}
