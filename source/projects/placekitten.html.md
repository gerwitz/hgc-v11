---
date: '2011-03-01 01:27:36'
layout: page
old_url: http://hans.gerwitz.com/projects/placekitten.html
slug: placekitten
title: Lorum Kittens
---

[Placekitten][1] is an important addition to the prototyper's toolkit.  It's the new [Lorem Ipsum][2] for images.  
Considering that the latest [brain scan research][3] shows that kitten images stimulate the same brain regions as good typography, this service may also prove useful for increasing the readability of graphic-intensive pages.  To that end, I offer the following bookmarklets:

   [1]: http://placekitten.com/
   [2]: http://www.lipsum.com/
   [3]: http://www.scientificamerican.com/article.cfm?id=a-new-phrenology


	
  * [placekittens [grey]][4]

	
  * [placekittens [color]][4]
  
(These are very rudimentary and need some serious javascript refactoring, but sometimes it's important to get research started and follow up with refined studies later.)

   [4]: javascript:var%20notKitten=new%20Image();for%20(kittenCount=0;kittenCount%3Cdocument.images.length;kittenCount++){notKitten.src=document.images[kittenCount].src;document.images[kittenCount].src='http%3A//placekitten.com/'+notKitten.height+'/'+notKitten.width;}

