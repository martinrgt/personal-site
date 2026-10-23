---
date: '{{ .Date }}'
draft: true
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
summary: # Pour la vignette sur le site
description: # Pour le SEO
weight: 3
#cover:
#  image: "cover.jpg"
#  alt: "This is an image"
#  caption: "An image"
#  relative: true # To use relative path for cover image, used in hugo Page-bundles
---
