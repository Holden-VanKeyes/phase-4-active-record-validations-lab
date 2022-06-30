class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :click_bait
    
    # def click_bait
    #   allowed = ["Won't Believe", "Secret"]
    #  if title.match?(allowed)

    #  else
    #     errors.add(:title, 'not allowed')
    #  end
    # end

    def click_bait
      unless title.present? &&
        title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")

       
        errors.add(:title, 'not allowed')
     end 
    end
end
