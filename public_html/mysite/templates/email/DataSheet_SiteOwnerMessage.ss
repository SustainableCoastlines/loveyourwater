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
            	<a href="http://www.loveyourcoast.org/" target="_blank"><img alt="Love Your Coast" src="http://www.loveyourcoast.org/email_images/header-sharing.jpg"/></a>
            </td>
        </tr>
    </table>
	
	<table width="600px" cellpadding="0" vspace="0" hspace="0" align="center" cellspacing="0">
    	<tr>
        	<td style="color:#1066B2; font-size:16px; line-height:140%; font-weight:normal; margin-top:50px;">
            	<h2 style="color:#1066B2; font-size:18px; font-weight:normal;">Hi,</h2>
                <p>$FullName has completed a Result Sheet for you to review</p>
        		<p>Please see the full <% control DataSheet %><a style="color:#E27E09; font-size:14px; text-decoration:none;" href="$Link"><% end_control %>results here</a></p>
                <h2>Results</h2>
                <p>Event Title: <% control Event %><a style="color:#E27E09; font-size:14px; text-decoration:none;" href="$Link">$Title</a><% end_control %></p>
                <p>Organisers Email: <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="mailto:$Email">$Email</a></p>
				<p>Participants: <strong>$Participants</strong></p>
                <p>Sacks: <strong>$Sacks</strong></p>
                <p>Distance: <strong>$Distance</strong></p>
                <p>Time: <strong>$Time</strong></p>
                <% if DataFile %><p>Result File attached or download here: <a style="color:#E27E09; font-size:14px; text-decoration:none;" href="$DataFile.URL">Results</a></p><% end_if %>
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

	

	
	
	