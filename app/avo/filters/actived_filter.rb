class ActivedFilter < Avo::Filters::SelectFilter
  self.name = 'Status'

  def apply(request, query, value)
    case value
    when 'active'
      query.where(active: true)
    when 'inactive'
      query.where(active: false)
    else
      query
    end
  end

  def options
    {
      active: "Ativado",
      inactive: "Desativado"
    }
  end
end
