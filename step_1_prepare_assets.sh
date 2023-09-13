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
    sed -i '' "s#window.onload.*#window.onload = function() {\nvar custom_url = new URL(window.location.href);\nvar custom_path = custom_url.searchParams.get(\"path\");\n#" swagger-initializer.js
    sed -i '' "s/url:.*/url: custom_path,/" swagger-initializer.js
else
    sed -i "s#window.onload.*#window.onload = function() {\nvar custom_url = new URL(window.location.href);\nvar custom_path = custom_url.searchParams.get(\"path\");\n#" swagger-initializer.js
    sed -i "s/url:.*/url: custom_path,/" swagger-initializer.js
fi



