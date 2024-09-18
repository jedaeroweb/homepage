class HomeController < ApplicationController
  before_action :authenticate_user!, except: [ :index]

  def index


  end

  def initialize(*params)
    super(*params)
    @title=t('default_title')
    @page_itemtype="http://schema.org/WebPage"
    @script='home/index'
  end

  def no_auth

  end
end