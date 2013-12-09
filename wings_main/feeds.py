from django.contrib.syndication.views import Feed
from wardenclyffe.main.models import Series
from django.shortcuts import get_object_or_404
from django.utils.feedgenerator import Rss201rev2Feed, rfc3339_date


class CCNMTLRssFeed(Rss201rev2Feed):

    """
    http://ccnmtl.columbia.edu/broadcast/test/fedora_feed_test/test.xml

    Also to be added:

    Per Series (Channel):

    itunes:author -- should inherit from dc:creator
    itunes:explicit -- should always be "Do Not Mark"
    itunes:subtitle -- empty for now
    itunes:summary -- should inherit dc:description
    itunes:keywords-- empty for now

    Per Video (Item):

    itunes:author -- should inherit dc:contributor
    itunes:explicit -- should always be "Do Not Mark"
    itunes:subtitle -- empty for now
    itunes:summary -- should inherit dc:description
    itunes:keywords-- empty for now
    """

    def root_attributes(self):
        attrs = super(CCNMTLRssFeed, self).root_attributes()
        attrs['xmlns:itunes'] = 'http://www.itunes.com/dtds/podcast-1.0.dtd'
        return attrs

    def add_root_elements(self, handler):
        super(CCNMTLRssFeed, self).add_root_elements(handler)
        handler.addQuickElement('itunes:explicit', 'no')
        handler.addQuickElement('itunes:author', self.feed['author_name'])
        handler.addQuickElement('itunes:subtitle', '')
        handler.addQuickElement('itunes:keywords', '')

    def item_attributes(self, item):
        return super(CCNMTLRssFeed, self).item_attributes(item)

    def add_item_elements(self, handler, item):
        """<itunes:duration>00:48:26</itunes:duration>
        <itunes:author>CCNMTL</itunes:author>
        <itunes:explicit>no</itunes:explicit>
        <itunes:keywords />
        <dc:title>Kenneth Jackson discusses the Colored Orphan Asylum
        </dc:title>
        <dc:description>Columbia University History
        Professor Kenneth Jackson describes the infamous
        Draft Riots and the burning of the
        Colored Orphan Asylum.</dc:description>
        <dc:creator>CCNMTL</dc:creator>
        <dc:contributor>Kenneth Jackson</dc:contributor>
        <dc:relation>http://maap.columbia.edu/welcome</dc:relation>
        <dc:date>2008-01-24T00:01:00Z</dc:date>
        <dc:identifier>ccnmtl:302.001</dc:identifier>
        <dc:language>English</dc:language> """
        super(CCNMTLRssFeed, self).add_item_elements(handler, item)
        handler.addQuickElement('itunes:author', item['author_name'])
        handler.addQuickElement('itunes:explicit', 'no')
        handler.addQuickElement('itunes:subtitle', '')
        handler.addQuickElement('itunes:keywords', '')
        handler.addQuickElement('itunes:summary', item['description'])
        handler.addQuickElement('dc:language', item['item'].language)
        handler.addQuickElement('dc:title', item['title'])
        handler.addQuickElement('dc:description', item['description'])
        handler.addQuickElement('dc:date', rfc3339_date(item['item'].created))


class SeriesFeed(Feed):
    feed_type = CCNMTLRssFeed

    def get_object(self, request, id):
        return get_object_or_404(Series, pk=id)

    def title(self, obj):
        return "Wardenclyffe: videos for series %s" % obj.title

    def link(self, obj):
        return obj.get_absolute_url()

    def feed_guid(self, obj):
        return obj.get_absolute_url()

    def description(self, obj):
        return obj.description

    def author_name(self, obj):
        return obj.creator

    def feed_copyright(self, obj):
        return obj.license

    def items(self, obj):
        return obj.video_set.all().order_by('-created')[:30]

    def item_enclosure_url(self, item):
        return item.enclosure_url()

    def item_link(self, item):
        return item.get_absolute_url()

    def item_author_name(self, item):
        return item.creator

    def item_copyright(self, item):
        "copyright called"
        return item.license

    def item_title(self, item):
        return item.title

    def item_language(self, item):
        return item.language

    def item_pubdate(self, item):
        return item.created

    def item_extra_kwargs(self, item):
        # why, django syndication framework, do you not just make the
        # item available in here by default so it can be accessed from
        # add_item_elements()?
        # why did you make me trace through the Feed code to figure out
        # that i can use this undocumented API to get it in?
        # why do you make me do something that will probably break in a
        # future version of django?
        return {'item': item}
