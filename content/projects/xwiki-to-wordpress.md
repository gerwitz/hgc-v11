---
date: '2006-04-13 02:42:16'
layout: page
old_url: http://hans.gerwitz.com/projects/xwiki-to-wordpress.html
slug: xwiki-to-wordpress
title: XWiki to WordPress migration
---

[MTIF>http://www.sixapart.com/movabletype/docs/mtimport]  
http://svn.automattic.com/trunk/wp-admin/import/mt.php  
http://www.sixapart.com/movabletype/docs/mtimport  

    
    
    < %
    if (false) {<br></br>formatTime = "MM/dd/yyyy HH:mm:ss";
    spaceName = "Main";
    parentName = "Main.Blog";
    sql = "where doc.web='${spaceName}' and doc.parent='${parentName}' order by doc.creationDate";<br></br>for (item in xwiki.searchDocuments(sql, 0, 0)) {
     if (xwiki.hasAccessLevel("view", context.user, context.database + ":" + item)) {
      docItem = xwiki.getDocument(item);
      tag = docItem.getObject('XWiki.TopicTags');
      categories = "CATEGORY: Uncategorized\n";
      if (null != tag && (tag.get('tags') != '')) {
       categories = '';
       catlist = tag.get('tags');
       cats = catlist.split(' ');
       for (cat in cats) {
        categories += "CATEGORY: " + cat + "\n";
       }
      }
      print "TITLE: ${docItem.name}\n";
      print "AUTHOR: hans\n";
      print "DATE: ";
      print xwiki.formatDate(docItem.creationDate, formatTime);
      print "\n";
      print categories;
      print "STATUS: publish\n";
      print "-----\n";
      print "BODY:\n";
      print "${docItem.getRenderedContent()}";
      print "-----\n";
      print "--------\n";
     }
    }<br></br>} %>
    
