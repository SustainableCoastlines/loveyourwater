<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><% _t("TITLE","Email From Love Your Coast") %></title>
</head>

<body style="width:100%; background-color:#FFF9E9; padding-bottom:80px;">

<style>
html {
	font-size:1em;
	font-family:Arial, Helvetica, sans-serif;
	color:#263F71;
}
body {
	padding:0;
	margin:0 0 80px;
	background:none repeat scroll 0 0 #FFF9E8;
}
a img {
	border:0;
}
ul{ 
	color:#1066B2;
	font-size:16px;
	margin:0px;
	margin-bottom:20px;
	list-style:circle;
}
ul li ul{
	margin-top:5px;
	padding-left:14px;
	font-size:14px;
	}
</style>
<table width="100%" background="#FFF9E9" cellpadding="0" cellspacing="0">
	<table width="600px" cellpadding="0" vspace="0" hspace="0" align="center" cellspacing="0">
    	<tr>
        	<td>
            	<a href="http://www.loveyourcoast.org/" target="_blank"><img alt="Love Your Coast" src="http://www.loveyourcoast.org/email_images/header-joining.jpg"/></a>
            </td>
        </tr>
    </table>

	<table width="600px" cellpadding="0" vspace="0" hspace="0" align="center" cellspacing="0">
    	<tr>
        	<td style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal; margin-top:50px;">
                <h2 style="color:#1066B2; font-size:18px; font-weight:normal;">Hi,</h2>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;">This message was sent by $Contact.</p>
                <% if Signup %>
                <p>$Contact has organised a clean up event for Love Your Coast and has invited you to join in. Get involved now and we can Keep New Zealand more Beautiful than ever! If you are already a member of Love Your Coast <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="http://www.loveyourcoast.org/my-events/">you can login here.</a> If you wish to become a member and join the clean up event $Contact has invited you to <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="http://www.loveyourcoast.org/my-events/">register here.</a> You will can then find out more about the event <% control CleanUp %><a style="color:#E27E09; font-size:14px; text-decoration:none;" href="$Link">here</a> and join it.<% end_control %></p>
                <% else %>
                <p style="color:#263F71; font-size:14px;">$Contact has sent you a message, shown below regarding the Love Your Coast Event listed below.</p>
                <% end_if %>  
                <% if Phone %>
                    <p style="color:#263F71; font-size:14px;">To get in touch with $Contact and find out more you can call on $Phone.</p>
                <% end_if %>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;">$Contact's Message: </p>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;">$Message</p>
            <% control CleanUp %>
            	<img alt="Clean Up Event Details" src="http://www.loveyourcoast.org/email_images/event_h1.gif"/>
            	<h2 style="color:#1066B2; font-size:18px; font-weight:normal;">$Title Clean Up Event Message</h2>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;"><strong>Location:</strong> $LocationAddress</p>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;"><strong>Location Meeting Point Details:</strong> $LocationDetails</p>
                <p style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal;">To view more details online <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="$Link"> please click here.</a> If you are a member and you wish to contact the organiser of this event you can by going to your <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="http://www.loveyourcoast.org/my-events/">My Events</a> page and clicking the Email Event Coordinator link next to this event.</p>
            <% end_control %>
       		</td>
        </tr>        
    </table>
     <table width="600px" cellpadding="0" vspace="0" hspace="0" align="center" cellspacing="0">
            <tr>
                <td>
                <a href="http://www.loveyourcoast.org/" target="_blank"><img alt="Website LYCoast" src="http://www.loveyourcoast.org/email_images/footer-top.jpg" /></a>
                </td>
            </tr>
        </table>
        <table width="600px" cellpadding="0" vspace="0" hspace="0" align="center" cellspacing="0">
            <tr>
                <td width="600px">
                 <a href="mailto:help@loveyourcoast.org"><img alt="Email LYCoast" src="http://www.loveyourcoast.org/email_images/footer-bottom.jpg" /></a>
                </td>
            </tr>
        </table>  
    
</table>



</body>
</html>
