class HomeController < ApplicationController
  before_action :authenticate_user!, except: [ :index]

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

  def no_auth

  end
end