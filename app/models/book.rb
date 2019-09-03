class Book < ApplicationRecord
    has_many :author_books
    has_many :authors, through: :author_books

    validates_presence_of :title, :year
    validates :pages, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end