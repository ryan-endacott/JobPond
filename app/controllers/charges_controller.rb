class ChargesController < ApplicationController

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:success] = 'Access purchased!' # TODO: Implement actual access
    redirect_to employers_potential_hires_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to employers_potential_hires_path
  end

end
