class Avo::BioLinksController < Avo::BaseResourcesController
  before_action :authorize_user, except: :show
  before_action :parse_params, on: :update

  def index
    unless current_user.admin?
      return redirect_to resources_bio_link_path(current_user.bio_link.id) if current_user.bio_link

      redirect_to root_path, alert: 'Você ainda não possui um Link da Bio, por favor, fale com o administrador.'
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

  def parse_params
    params[:bio_link] ||= params[:biolink]
  end
end
