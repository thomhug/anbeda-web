---
title: "{{ replace .Name "-" " " | title }}"
description: "descr."
draft: true
date: {{ .Date }}
tags: ["balkonsolar","diy","pvbuddies"]
categories: ["Solar"]
cover:
    image: "img.jpg" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: true # when using page bundles set this to true
    hidden: true # only hide on current single page
---