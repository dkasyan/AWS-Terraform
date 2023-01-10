#!/bin/bash
sudo yum update -y
sudo yum install php httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo su

cat <<EOF> /var/www/html/index.html
<html>
   <body>
      <br/><br/><br/>
      <div style="text-align:center;">
         <img src="https://glacjoblogia.files.wordpress.com/2015/01/1280px-upsala_glacier_3.jpg" align="middle">
         <h1> Pierwszy serwer w chmurze!!! </h1>
      </div>
   </body>
</html>
EOF