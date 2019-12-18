class Sale < ActiveRecord::Base

  def self.active
    @sale = Sale.where('starts_on < ? AND ends_on > ?', Date.current, Date.current)
  end

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
