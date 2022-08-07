class Avo::BioLinksController < Avo::BaseResourcesController
  before_action :authorize_user, except: :show

  def index
    unless current_user.admin?
      redirect_to resources_bio_link_path(current_user.bio_link.id)
    end

    super
  end

  def show
    authorize BioLink.find(params[:id])

    super
  end

  private

  def authorize_user
    authorize :bio_link
  end
end
