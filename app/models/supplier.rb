class Supplier < ApplicationRecord
    has_many :products

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :email, presence: true
    validates :email, uniqueness: true

    validates :phone, presence: true
    validates :phone, uniqueness: true
end
