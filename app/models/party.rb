require 'csv'

class Party < ActiveRecord::Base
  validates_presence_of :location, message: ": must complete 'Where do you live?' section"

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
