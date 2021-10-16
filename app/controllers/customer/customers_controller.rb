class Customer::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_path)
    redirect_to mypage_path
  end

  def delete
    @customer = current_customer
  end

  def deleted
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_path
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email )
  end
end
