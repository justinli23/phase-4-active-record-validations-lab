class Post < ApplicationRecord
    validates :title, presence: :true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_check

    def clickbait_check
        if title.present?
            unless title.include?("Won't Believe")
                errors.add(:title)
            end
        end
    end
end
