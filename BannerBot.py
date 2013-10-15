# -*- coding: utf-8  -*-

# Set the Wikivoyage banner of a destination on Wikidata.

import pywikibot

page=u"Aachen"
banner=u"Aachen banner Winter Panorama.jpg"
 
print "Defining data source"
site = pywikibot.Site("en", "wikivoyage")
repo = site.data_repository()
page = pywikibot.Page(site, page)
item = pywikibot.ItemPage.fromPage(page)
 
#print "Test loading data"
#dictionary = item.get()

print "Setting Wikivoyage banner"
stringclaim = pywikibot.Claim(repo, u'P948')
image = pywikibot.page.ImagePage(site, banner)
stringclaim.setTarget(image)
item.addClaim(stringclaim)
print "Banner has been set"
