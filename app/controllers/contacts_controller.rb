class ContactsController < ApplicationController
    def index
        @contact = Contact.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @contact }
        end
    end

    def complete
        @controller_name = t(:menu_contact)
    end

    # POST /contanct
    # POST /contanct.json
  def create
    @contact = Contact.new(contact_params)

      if @contact.save
         redirect_to complete_contacts_path, notice: '문의가 등록되었습니다.'
      else
        render :index, status: :unprocessable_content
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
