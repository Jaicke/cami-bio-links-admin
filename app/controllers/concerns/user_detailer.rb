module UserDetailer
  extend ActiveSupport::Concern

  included do
    before_action :set_user_details
  end

  def set_user_details
    Current.user = current_user
  end
end
