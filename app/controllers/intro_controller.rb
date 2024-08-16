class IntroController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/AboutPage'
    @title = t(:menu_intro)
  end

  def company
    @controller_name = t(:submenu_intro1)
    @title = t(:submenu_intro1)
  end

  def service
    @controller_name = t(:submenu_intro2)
    @title = t(:submenu_intro2)

    condition={enable: true}

    @product_categories = ProductCategory.where(condition)
  end

  def program
    @controller_name = t(:submenu_intro3)
    @title = t(:submenu_intro3)
  end
end
