class Avo::UsersController < Avo::BaseResourcesController
  before_action :authorize_user

  private

  def authorize_user
    authorize current_user
  end
end
