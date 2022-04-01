class Student < ApplicationRecord
    validates :name,:email,:age, presence: true
end
