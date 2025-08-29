class HomeController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :feed]

  def index
    @slide_count = Program.where(enable: true).where.not(program_pictures_count: 0).count
    @slides = Program.where(enable: true).where.not(program_pictures_count: 0).order('id desc')
  end

  def initialize(*params)
    super(*params)
    @title=t('default_title')
    @page_itemtype="http://schema.org/WebPage"
    @script='home/index'
  end

  def feed
    @programs = Program.where(:enable=>true).order(id: :desc).limit(50)
    @products = Product.where(:enable=>true).order(id: :desc).limit(50)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def no_auth

  end
end