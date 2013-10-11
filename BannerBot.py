# -*- coding: utf-8  -*-

# Set the Wikivoyage banner of a destination on Wikidata.

import pywikibot
 
print "Defining data source"
site = pywikibot.Site("en", "wikivoyage")
page = pywikibot.Page(site, u"Asahikawa")
data = pywikibot.DataPage(page)
 
print "Loading data"
dictionary = data.get()

print "Setting Wikivoyage banner"
data.editclaim(948, u"Kaguraoka Park (Asahikawa) banner.jpg")
print "Banner has been set"
