class NetworkDatum < ActiveRecord::Base
  attr_accessible :day, :received, :sent
  validates :received, :sent, presence: true
  validates :received, :sent, numericality: { greater_than: 0 }
end
