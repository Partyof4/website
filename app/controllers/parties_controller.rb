class PartiesController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def new
    @party = Party.new
    render layout: 'layouts/logged_out'
  end

  def create
    @party = Party.create(party_params)
    if @party.persisted?
      NewPartyMailer.create_new_party_email(@party).deliver
      flash[:info] = "Thanks! We'll be in touch"

      redirect_to root_path
    else
      render :new, layout: 'layouts/logged_out'
    end
  end


  private

    def party_params
      params.require(:party).permit(:first_name, :last_name, :email, :phone, :location, :age, :arrival, :fives, :weekends, :dealbreakers)
    end
end
