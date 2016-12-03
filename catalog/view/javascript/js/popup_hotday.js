function addEvent(obj, eventName, func){
if (obj.attachEvent)
{
obj.attachEvent("on" + eventName, func);
}
else if(obj.addEventListener)
{
obj.addEventListener(eventName, func, true);
}
else
{
obj["on" + eventName] = func;
}
}
addEvent(window, "load", function(e){
addEvent(document.body, "click", function(e)
{
if(document.cookie.indexOf("hd=khuyenmaidshop") == -1)
{
params = 'width=' + screen.width;
params += ', height=' + screen.height;
params += ', top=0, left=0,scrollbars=yes';
params += ', fullscreen=yes';

var exdays=1;
var exdate=new Date();
exdate.setDate(exdate.getDate() + exdays);
var c_value=(exdays==null) ? "" : "; expires="+exdate.toGMTString();
document.cookie = "hd=khuyenmaidshop" + c_value;

window.open("http://khuyenmai.thoitrangdshop.vn").focus();
}
});
});