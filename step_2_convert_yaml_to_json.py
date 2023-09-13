#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import yaml
import os

source_dir = os.path.join("swagger_yaml", "atlassian")
target_dir = os.path.join("jekyll", "docs", "atlassian")

for item in os.listdir(source_dir):
    source_file = os.path.join(source_dir, item)
    target_file_name = item.replace(".yaml", ".json")
    target_file = os.path.join(target_dir, target_file_name)

    with open(source_file, "r", encoding="utf-8") as f:
        content = yaml.full_load(f.read())

    with open(target_file, "w", encoding="utf-8") as f:
        f.write(json.dumps(content))
