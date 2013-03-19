---
date: '2006-04-13 18:07:11'
layout: page
old_url: http://hans.gerwitz.com/projects/snipsnap-to-xwiki.html
slug: snipsnap-to-xwiki
title: SnipSnap to XWiki migration
---

My blog entries were identified not by SnipSnap's normal "magic names", but via custom labels with datestamps.  
XWiki-embedded Groovy script to import from attached snipsnap.xml file:

    
    
        import org.codehaus.groovy.sandbox.util.XmlSlurper;<br></br>    live = true<br></br>    spaceName = "SnipSnap"
        authorName = "XWiki.Hans"<br></br>    xmlFile = new String(doc.getAttachment("snipsnap.xml").content)<br></br>    def node = new XmlSlurper().parseText(xmlFile)
           
        assert node != null
        snips = node.snip
        println "~~Found ${snips.size()} snips~~\n\n"
        for (s in snips) {
          commentParent = s.commentSnip
          if (commentParent.text() == "") {
            newTitle = s.name.text()
            // need to zap a few gremlin characters...
            newTitle = newTitle.replaceAll("/","*")
            newTitle = newTitle.replaceAll("\\.","-")
            newTitle = newTitle.replaceAll(":","-")
            newTitle = newTitle.replaceAll("\\?","")
            newContent = s.content.text()
            createdTime = new Date(Long.parseLong(s.cTime.text()))
            modifiedTime = new Date(Long.parseLong(s.mTime.text()))<br></br>        // if I've got a label, we're assuming it's a DateLabel and updating our creation date
            labelArray = s.labels.text().split(":")
            if (labelArray.length > 2) {
              labelText = labelArray[2]
              labelLong = Long.parseLong(labelText.split(",")[0])
              createdTime = new Date(labelLong)
            }<br></br>        if (live) {
              newDoc = xwiki.getDocument(spaceName, newTitle)
              newDoc.doc.setContent(newContent)
              newDoc.doc.setAuthor(authorName)
              newDoc.doc.setCreationDate(createdTime)
              newDoc.doc.setDate(modifiedTime)
              newDoc.saveDocument()
              println("* saved [${newTitle}]\n")
            }
            else {
              println("* ${newTitle} created ${createdTime}\n")
            }
          }
          else { // commentParent.text() != ""
            parentTitle = commentParent.text()
            parentTitle = parentTitle.replaceAll("/","*")
            parentTitle = parentTitle.replaceAll("\\.","-")
            parentTitle = parentTitle.replaceAll(":",".")
            parentTitle = parentTitle.replaceAll("\\?","")
            newContent = s.content.text()
            createdTime = new Date(Long.parseLong(s.cTime.text()))<br></br>        if (live) {
              parent = xwiki.getDocument(spaceName, parentTitle)
              num = parent.doc.createNewObject("XWiki.XWikiComments", context.context)
              newObj = parent.doc.getObject("XWiki.XWikiComments", num)
              newObj.setStringValue("author", authorName)
              newObj.setDateValue("date", createdTime)
              newObj.setStringValue("comment", newContent)<br></br>          parent.saveDocument()
              println "* commented [${parentTitle}]\n"
            }
            else {
              println "* comment for ${parentTitle}\n"
            }
          }
        }
    

  
...and script for migrating imported docs.

    
    
    fromSpace = "SnipSnap";
    namePrefix = "Journal*";
    toSpace = "Main";
    toParent = "Main.Journal";
    toTags = "";<br></br>docSql = "doc.web = '${fromSpace}' and doc.name like '${namePrefix}%' ";
    list = xwiki.searchDocuments(docSql);<br></br>bigXWiki = xwiki.getXWiki();<br></br>for (item in list) {
    fromDoc = xwiki.getDocument(item);
    fromName = fromDoc.name;
    toName = fromName.replaceFirst("\\Q"+namePrefix+"\\E", ""); // ignore special characters<br></br>toDoc = xwiki.getDocument(toSpace, toName);
    toDoc.doc.setParent(toParent);
    toDoc.doc.setContent(fromDoc.content);
    toDoc.doc.setAuthor(fromDoc.author);
    toDoc.doc.setCreationDate(fromDoc.creationDate);<br></br>objNum = toDoc.doc.createNewObject("XWiki.TopicTags", context.context);
    tagObj = toDoc.doc.getObject("XWiki.TopicTags", objNum);
    tagObj.setStringValue("tags", toTags);<br></br>toDoc.saveDocument();<br></br>bigXWiki.deleteDocument(fromDoc.doc, context.context);
    println "* [${fromSpace}.${fromName}] -> [${toSpace}.${toName}]";
    }
    
