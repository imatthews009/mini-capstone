class Product < ApplicationRecord
    belongs_to :supplier
    has_many :images
    has_many :category_products
    has_many :categories, through: :category_products
    has_many :carted_products

    validates :name, uniqueness: true, presence: true
    validates :description, presence: true, length: { maximum: 500}
    validates :price, presence: true, numericality: true


    # def sale_message
    #     if price.to_f <= 2
    #         return "Discount item"
    #     else
    #         return "Everyday value"
    #     end
    # end

    def tax
            rate = 0.09
            tax_amount = (price.to_f * rate)
            return tax_amount
    end

    def total
        total_price = price + tax
        return total_price
    end

    def self.find_all_johns
      Contact.where(first_name: "John")
    end

    def discounted? #? this will evaluate to true of false
        return (price.to_f <= 2)
    end
end
