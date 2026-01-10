class ApplicationController < ActionController::Base
  layout :layout
  before_action :set_locale
  before_action :set_og_title

  def initialize(*params)
    super(*params)
    before_init
  end

  def before_init
    @meta_robot='all, index, follow'
    @meta_description=t(:meta_description)
    @meta_keywords=t(:meta_keywords)
    @meta_image=t(:meta_image)
    @meta_url=t(:meta_url)

    @resource ||= User.new
  end

  def set_og_title
    if @title
      @og_title=@title
    else
      @og_title=t(:default_title)
    end
  end

    def set_locale
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end

    #  def default_url_options(options={})
    #    18n={ locale: I18n.locale }
    #
    #    return i18n
    #  end

    def layout
      if params[:no_layout]
        return false
      else
        return 'application'
      end
    end


  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  protected

  def verify_turnstile
    token = params["cf-turnstile-response"]
    return false if token.blank?

    uri = URI("https://challenges.cloudflare.com/turnstile/v0/siteverify")
    response = Net::HTTP.post_form(uri, {
      "secret" => ENV["TURNSTILE_SECRET_KEY"],
      "response" => token,
      "remoteip" => request.remote_ip
    })

    json = JSON.parse(response.body)
    json["success"] == true
  end
end
