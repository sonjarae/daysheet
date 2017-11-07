module ToursHelper
  
  def tours_for_select
    Tour.all.collect { |t| [t.name, t.id] }
  end
  
end
