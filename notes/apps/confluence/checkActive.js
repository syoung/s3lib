var checkActive = function () {

var categoryMenu = document.getElementById('category_menu_dynamic');
console.log("categoryMenu: " + categoryMenu);
if ( categoryMenu == null )    return;

for ( var i = 0; i < categoryMenu.childNodes.length; i++ )
{
    if ( categoryMenu.childNodes[i].id == "active" )
    {
        console.log("childNodes[" + i + "].id: " + childNodes[i].id);
        return;
    }
}

var activeNode = categoryMenu.childNodes[3];
console.log("categoryMenu.childNodes.length: " + categoryMenu.childNodes.length);
console.log("activeNode: " + activeNode);
console.dir({activeNode: activeNode});
//activeNode.setAttribute("id","active");
activeNode.id = "active";
console.log("activeNode.id: " + activeNode.id);


};

checkActive();
