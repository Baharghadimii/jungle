class Sale < ActiveRecord::Base

  def finished?
    ends_on < Date.current
  end
  def upcomming?
    starts_on > Date.current
  end
  def active?
    !finished? && !upcomming?
  end
end
