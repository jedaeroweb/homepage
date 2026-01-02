class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_controller_name, only: [:new, :create, :index, :show]

  # GET /orders
  # GET /orders.json
  def index
    condition={enable: true}

    if params[:product].present?
      condition[:id]=params[:product]
      @product = Product.where(condition).first
    else
    if params[:product_category].present?
      condition[:product_category_id]=params[:product_category]
      @products = Product.where(condition)
    else
      @product_categories = ProductCategory.where(condition)
    end
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # 주문 자체 파라미터 추출(클라이언트가 보낸 user_id는 사용하지 않음)
    order_attrs = order_params.to_h.deep_symbolize_keys.except(:user_id)
    product_ids = order_attrs.delete(:product_ids)

    ActiveRecord::Base.transaction do
      # 로그인한 경우: 폼의 name/email은 무시하고 현재 사용자에 연결
      if user_signed_in?
        user = current_user
      else
        # 비로그인: 폼에서 넘어온 고객 정보만 안전하게 추출
        customer_params = params.require(:order).permit(:name, :email)
        name  = customer_params[:name].to_s.strip
        email = customer_params[:email].to_s.strip.downcase

        if email.blank?
          @order = Order.new(order_attrs)
          @order.errors.add(:base, "이메일은 필수입니다.")
          return render :new, status: :unprocessable_entity
        end

        # 이메일 기준으로 사용자 찾거나 생성
        user = User.find_or_initialize_by(email: email)
        if user.new_record?
          user.name        = name
          user.password    = SecureRandom.base64(12)
          user.save!
        else
          user.update!(name: name) if user.name.blank? && name.present?
        end
      end

        # 4) 주문 생성 + user 연결
        @order = Order.new(order_attrs)
        @order.user = user

      count = Array(product_ids).size

      @order.title =
        if count <= 1
          @product.title
        else
          "#{@product.title} 외 #{count - 1}개 상품"
        end


      Array(product_ids).each do |pid|
        product = Product.find(pid)

        @order.orders_products.build(
          product: product,
          price: product.price
        )
        end

        if @order.save
          redirect_to @order, notice: '주문이 생성되었습니다.'
        else
          render :new, status: :unprocessable_entity
        end


  rescue ActiveRecord::RecordInvalid => e
    @order ||= Order.new(order_attrs)
    @order.errors.add(:base, e.record.errors.full_messages.to_sentence)
    render :new, status: :unprocessable_entity
  end
  end



  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    # 주의: user_id는 서버에서만 설정합니다(스푸핑 방지).
    params.require(:order).permit(
      :user_id, :transaction_date, :price, :discount, :payment, product_ids: []
    )
  end

  def set_product
    product_id =
      params[:product].presence ||
      Array(params.dig(:order, :product_ids)).first

    @product = Product.find(product_id)
  rescue ActiveRecord::RecordNotFound, ArgumentError
    redirect_to products_path, alert: "제품을 찾을 수 없습니다."
  end

  def set_controller_name
    @controller_name = t(:menu_order)
  end
end
