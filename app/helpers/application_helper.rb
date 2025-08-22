module ApplicationHelper

  def format_number(num)
    sprintf('%0.0f', num / 10000)+'만'
  end
  def list_param(lparam)
    lparam[:controller] = nil
    lparam[:action] = nil
    lparam[:id] = nil

    return lparam
  end

  def show_param(lparam)
    return lparam
  end

  def link_to_home
    link_to('홈', root_path, :title => '홈으로')
  end

  def actionNameChange(action_name)
    case action_name
    when 'index'
      return t(:action_index)
    when 'complete'
      return t(:action_new)
    when 'edit'
      return t(:action_edit)
    when 'show'
      return t(:action_show)
    else
    end
  end

  def current_controller(aa)
    if aa.include?(params[:controller])
      return 'class="current"'
    end
  end

  def display_use_trans(use)
    if use
      return t(:use)
    else
      return t(:not_use)
    end
  end

  def manage_width(model)
    if can?(:delete, model) and can?(:update, model)
      return ' style=width:170px;'
    else
      return ' style=width:90px'
    end
  end

  def display_payment_method(accounts)
    payment_method = []

    accounts.each do |account|
      unless account.cash.zero?
        payment_method.push(t(:cash));
      end

      unless account.credit.zero?
        payment_method.push(t(:credit));
      end

      unless account.point.zero?
        payment_method.push(t(:point));
      end
    end

    return payment_method.uniq.join(',')
  end

  def get_dt_format(date)
    return I18n.l date.to_date
  end

  def user_search_type_check(type, default = false)
    if default
      match = true
    else
      match = false
    end

    if params[:search_field].present?
      if params[:search_field] == type
        match = true
      else
        match = false
      end
    end

    if match
      return 'checked="checked"'
    else
      return ''
    end
  end

  def display_user_photo(current_user)
    if current_user.user_picture.present?
      return image_tag(current_user.user_picture.picture.tiny_thumb.url, { height: 30,width: 30,class: 'rounded-circle d-none d-lg-inline-block'})
    else
      return raw('<i class="material-icons">person</i>');
    end
  end

  def display_company_photo(current_company)
    if current_company.company_pictures.present?
      return image_tag(current_company.company_pictures[0].picture.tiny_thumb.url, { height: 30,width: 30,class: 'rounded-circle d-none d-lg-inline-block'})
    else
      return raw('');
    end
  end


  def display_company_title(title,company_id)
    if session[:company_id].present?
      if company_id==session[:company_id]
        return title
      end
    end

    if user_signed_in?
      unless AcceptedBidding.includes(:ad).where('ad.user_id': current_user.id, company_id: company_id).where('biddings.updated_at>?',Time.now-3.days).count.zero?
        return title
      end
    end

    if title.length > 5
      return '**'+title[2..3]+'**';
    else
      return title[0..0]+'**';
    end
  end
end
