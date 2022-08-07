class Avo::LinksController < Avo::BaseResourcesController
  before_action :authorize_user

  private

  def authorize_user
    authorize :link
  end
end
