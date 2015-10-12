
if (typeof(OA_zones) != 'undefined') {
var OA_zoneids = '';
for (var zonename in OA_zones) OA_zoneids += escape(zonename+'=' + OA_zones[zonename] + "|");
OA_zoneids += '&nz=1';
} else {
var OA_zoneids = escape('2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|43|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|44|45|46|47|48|49|54|51|52|53|55|56|57|58|59|60|61|62|63');
}
if (typeof(OA_source) == 'undefined') { OA_source = ''; }
var OA_p=location.protocol=='https:'?'https:':'http:';
var OA_r=Math.floor(Math.random()*99999999);
OA_output = new Array();

var OA_fo = '';
OA_fo += "<"+"script type=\'text/javascript\' src=\'http://d.genomeweb.com/fl.js\'><"+"/script>\n";
document.write(OA_fo);

var OA_spc="<"+"script type='text/javascript' ";
OA_spc+="src='"+OA_p+"//d.genomeweb.com/spc.php?zones="+OA_zoneids;
OA_spc+="&amp;source="+escape(OA_source)+"&amp;r="+OA_r;
    OA_spc+="&amp;tag=Sequencing";
OA_spc+=(document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));

if (window.location) OA_spc+="&amp;loc="+escape(window.location);
if (document.referrer) OA_spc+="&amp;referer="+escape(document.referrer);
OA_spc+="'><"+"/script>";
document.write(OA_spc);

function OA_show(name) {
if (typeof(OA_output[name]) == 'undefined') {
return;
} else {
document.write(OA_output[name]);
}
}
function OA_showpop(name) {
zones = window.OA_zones ? window.OA_zones : false;
var zoneid = name;
if (typeof(window.OA_zones) != 'undefined') {
if (typeof(zones[name]) == 'undefined') {
return;
}
zoneid = zones[name];
}
var OA_pop="<"+"script type='text/javascript' ";
OA_pop+="src='"+OA_p+"//d.genomeweb.com/apu.php?zoneid="+zoneid;
OA_pop+="&amp;source="+escape(OA_source)+"&amp;r="+OA_r;
        OA_spc+="&amp;tag=Sequencing";
if (window.location) OA_pop+="&amp;loc="+escape(window.location);
if (document.referrer) OA_pop+="&amp;referer="+escape(document.referrer);
OA_pop+="'><"+"/script>";
document.write(OA_pop);
}
