class ClickBaitValidator < ActiveModel::EachValidator
    @@words = ["Won't Believe", "Secret", "Top", "Guess"]
    def validate_each(record, attribute, value)
        if value
            if @@words.select{|word| record[attribute].include?(word)}.empty?
                record.errors.add(attribute, 'Invalid ClickBait')
            # binding.pry
            end
            # binding.pry
        end
    end
end



class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validates :title, click_bait: true

end
