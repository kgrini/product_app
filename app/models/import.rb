require 'csv'

class Import < ActiveRecord::Base

  validates :title, presence: true

end
