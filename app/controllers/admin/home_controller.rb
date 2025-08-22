class Admin::HomeController < Admin::AdminController
  def index
    @payments = Payment.where(enable: true).limit(5)
    @orders = Order.where(enable: true).limit(5)
    @user_point_logs = UserPointLog.where(enable: true).limit(5)
  end
end
