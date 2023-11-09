#!/bin/bash
set -ex

export swagger_version="4.19.1"
wget https://github.com/swagger-api/swagger-ui/archive/refs/tags/v${swagger_version}.zip
unzip v${swagger_version}.zip
cd swagger-ui-${swagger_version}
mv dist/* ../
cd ..
rm -rf v${swagger_version}.zip
rm -rf swagger-ui-${swagger_version}

if [ $(uname) == "Darwin" ]; then
    sed -i '' "s#window.onload.*#window.onload = function() {\n  var custom_url = new URL(window.location.href);\n  var custom_path = custom_url.searchParams.get(\"path\");\n  document.getElementsByTagName(\"img\")[0].src = \"./logo.png\";\n#" swagger-initializer.js
    sed -i '' "s/url:.*/url: custom_path,/" swagger-initializer.js
    sed -i '' "s#<title>.*</title>#<title>TMAN Favorite API</title>#" index.html
else
    sed -i "s#window.onload.*#window.onload = function() {\n  var custom_url = new URL(window.location.href);\n  var custom_path = custom_url.searchParams.get(\"path\");\n  document.getElementsByTagName(\"img\")[0].src = \"./logo.png\";\n#" swagger-initializer.js
    sed -i "s/url:.*/url: custom_path,/" swagger-initializer.js
    sed -i "s#<title>.*</title>#<title>TMAN Favorite API</title>#" index.html
fi



