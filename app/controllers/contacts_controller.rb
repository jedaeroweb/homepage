class ContactsController < ApplicationController

  def initialize
    super
    @controller_name = t(:menu_contact)
  end
  def index
        @contact = Contact.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @contact }
        end
    end


    # POST /contanct
    # POST /contanct.json
  def create
    ActiveRecord::Base.transaction do
      # 로그인한 경우: 폼의 name/email은 무시하고 현재 사용자에 연결
      if user_signed_in?
        user = current_user
      else
        # 비로그인: 폼에서 넘어온 고객 정보만 안전하게 추출
        customer_params = params.require(:contact).permit(:name, :phone, :email)
        name  = customer_params[:name].to_s.strip
        phone  = customer_params[:phone].to_s.strip
        email = customer_params[:email].to_s.strip.downcase

        if email.blank?
          email=set_dummy_email
        end

        # 이메일 기준으로 사용자 찾거나 생성
        user = User.find_or_initialize_by(email: email)
        if user.new_record?
          user.name        = name
          user.email       = email
          user.phone       = phone
          user.password    = SecureRandom.base64(12)
          user.save!
        else
          user.update!(name: name) if user.name.blank? && name.present?
        end
      end

      @contact = Contact.new(contact_params)
      @contact.user = user

      if @contact.save
        redirect_to @contact, notice: '문의가 등록되었습니다.'
      else
        render :new, status: :unprocessable_content
      end

    rescue ActiveRecord::RecordInvalid => e
      @contact ||= Contact.new(contact_params)
      @contact.errors.add(:base, e.record.errors.full_messages.to_sentence)
      render :new, status: :unprocessable_content
    end
  end


    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
        l_params=params.require(:contact).permit(:name, :title, :email, :enable, contact_content_attributes: [:content])

        if user_signed_in?
          return l_params.merge(user_id: current_user.id)
        else
          return l_params
        end
    end
end
