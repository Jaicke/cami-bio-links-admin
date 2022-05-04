class ToggleAnswered < Avo::BaseAction
  self.name = 'Marcar/Desmarcar como respondido'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      models.each do |model|
        if model.answered
          model.update answered: false
        else
          model.update answered: true
        end

        # Optionally you may send a notification with the message to that user from inside the action
        #  UserMailer.with(user: model).toggle_active(fields[:message]).deliver_later
      end

      succeed 'Ação executada com sucesso!'
    end
  end
end
