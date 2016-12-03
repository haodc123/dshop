function openwindow(win,strwindow, title, height, width) {
    if (win == null)
        win = window.open(strwindow, "test", 'left=20,top=20,width=' + width + ',height=' + height + ',toolbar=0,scrollbars=1,menubar=0,location=0,status=0,resizable=0');
    else {
        win.focus();
    }
}

var windowObjectReference = null; // global variable
var PreviousUrl; /* global variable which will store the
                    url currently in the secondary window */

function openRequestedSinglePopup(strUrl,top,left,height,width)
{
	  if(windowObjectReference == null || windowObjectReference.closed)
	  {
	      windowObjectReference = window.open(strUrl, "SingleSecondaryWindowName",
	         "left=" + left + ",top=" + top + ",resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,directorries=no,resizable=no,width=" + width + ",height=" + height);
	  }
	  else if(PreviousUrl != strUrl)
	  {
	   windowObjectReference = window.open(strUrl, "SingleSecondaryWindowName",
	      "left=300,top=0,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,directorries=no,resizable=no,width=750,height=620");
	    /* if the resource to load is different,
	       then we load it in the already opened secondary window and then
	       we bring such window back on top/in front of its parent window. */
	   windowObjectReference.focus();
	  }
	  else
	  {
	    windowObjectReference.focus();
	  };
	  PreviousUrl = strUrl;
	  /* explanation: we store the current url in order to compare url
	     in the event of another call of this function. */}