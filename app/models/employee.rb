class Employee < ApplicationRecord
    belongs_to :dog

    def to_s
        "#{self.first_name} #{self.last_name}" 
    end

    validates :alias, uniqueness: true
    validates :title, uniqueness: true

end

