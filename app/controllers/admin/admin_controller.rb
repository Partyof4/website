class Admin::AdminController < Admin::AdminBaseController
  def index
    @parties = Party.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @parties.as_csv }
    end
  end
end
