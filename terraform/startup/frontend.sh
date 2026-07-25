#!/bin/bash

# Update system
apt-get update -y

# Install Nginx
apt-get install -y nginx

# Enable Nginx
systemctl enable nginx

# Start Nginx
systemctl start nginx

# Create a sample web page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>GCP Terraform Project</title>
    <style>
        body{
            font-family: Arial;
            background:#f5f5f5;
            text-align:center;
            margin-top:80px;
        }
        h1{
            color:#1a73e8;
        }
        .card{
            width:500px;
            margin:auto;
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0px 0px 15px rgba(0,0,0,.2);
        }
    </style>
</head>
<body>

<div class="card">

<h1>🚀 GCP Terraform Project</h1>

<h2>Frontend VM Successfully Created</h2>

<p>Infrastructure Created Using Terraform</p>

<p>Public VM is Running Successfully</p>

</div>

</body>
</html>
EOF
