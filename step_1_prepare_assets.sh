#!/bin/bash
set -ex

export swagger_version="4.19.1"
wget https://github.com/swagger-api/swagger-ui/archive/refs/tags/v${swagger_version}.zip
unzip v${swagger_version}.zip
cd swagger-ui-${swagger_version}
mv dist/* ../jekyll/
cd ..
rm -rf v${swagger_version}.zip
rm -rf swagger-ui-${swagger_version}

if [ $(uname) == "Darwin" ]; then
    export SED="sed -i '' "
else
    export SED="sed -i "
fi

$SED "s#window.onload.*#window.onload = function() {\nvar custom_url = new URL(window.location.href);\nvar custom_path = custom_url.searchParams.get(\"path\");\n#" jekyll/swagger-initializer.js
$SED "s/url:.*/url: custom_path,/" jekyll/swagger-initializer.js
