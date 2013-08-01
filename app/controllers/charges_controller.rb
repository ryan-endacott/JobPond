class ChargesController < ApplicationController
  before_filter :employer_only!

  def create
    # Amount in cents
    @amount = 5000

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => current_user.company_name,
      :currency    => 'usd'
    )

    purchase = ContactPurchase.new(charge_id: charge.id)
    purchase.employer = current_user
    purchase.employee_id = params[:employee_id].to_i
    purchase.save!

    employee = Employee.find(params[:employee_id].to_i)

    flash[:success] = "Access to contact #{employee.name} purchased!"
    redirect_to employers_potential_hires_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to employers_potential_hires_path
  end

end
