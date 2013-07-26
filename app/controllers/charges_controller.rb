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
    purchase.employee = params[:employee_id]
    purchase.save!

    flash[:success] = 'Access purchased!' # TODO: Implement actual access
    redirect_to employers_potential_hires_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to employers_potential_hires_path
  end

end
