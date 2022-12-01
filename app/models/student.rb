class Student < ApplicationRecord

    belongs_to :instructor

    validates :name, presence: true
    validate :age_validator

#do i need if age? 
    def age_validator
      if age
        unless(age > 17)
            errors.add(:age, "age must be greate than 18")
        end
        else
            errors.add(:age, "age must be greate than 18")
        end
    
    end


end
