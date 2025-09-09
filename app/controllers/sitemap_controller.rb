class SitemapController < ApplicationController
  def index
    @controller_name = t(:sitemap)
    @title = t(:sitemap)
  end
end
