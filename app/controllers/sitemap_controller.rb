class SitemapController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/Sitemap'
    @title = t(:sitemap)
  end

  def index
    @controller_name = t(:sitemap)
    @title = t(:sitemap)
  end
end
