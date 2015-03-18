class Admin::PartiesController < Admin::AdminBaseController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.all
    respond_with @parties
  end

  def show
    respond_with @party
  end

  def new
    @party = Party.new
    respond_with @party
  end

  def create
    @party = Party.create(party_params)
    respond_with @party, location: [:admin, @party]
  end

  def edit
    respond_with @party
  end

  def update
    @party.update(party_params)
    respond_with @party, location: [:admin, @party]
  end

  def destroy
    @party.destroy
    respond_with @party, location: admin_parties_url
  end

  private
    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:name, :key)
    end
end
