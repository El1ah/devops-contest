#!/bin/sh
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <h1>${DEVOPS} sandbox 2021</h1>
</body>
</html>
EOF
