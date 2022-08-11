class Post < ApplicationRecord
    validate :title_is_clickbait?, on: :create
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: { in: ["Fiction","Non-Fiction"]}
    # validates 

    TITLE = [/Won't Believe/i, /Secret/i, /Top\d/i, /Guess/i]

    def title_is_clickbait?
        # validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top [number]", "Guess"]}
        if TITLE.none? {|w| w.match title}
            errors.add(:title, "not clickbait")
        end
    end
end
