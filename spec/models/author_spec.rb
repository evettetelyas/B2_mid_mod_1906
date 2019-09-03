require 'rails_helper'

describe Author do
    describe "relationships" do
        it { should have_many(:books).through(:author_books) }
    end

    describe "validations" do
        it { should validate_presence_of :name }
    end

    describe "average number of pages" do
        dr_suess = Author.create(name: "Dr. Suess")
        chuck = Author.create(name: "Chuck Palahkiuk")
        cat = dr_suess.books.create(title: "Cat in the Hat", pages: 20, year: "1990")
        pop = dr_suess.books.create(title: "Hop on Pop", pages: 30, year: "1995")
        fight = chuck.books.create(title: "Fight Club", pages: 200, year: "1999")
        survivor = chuck.books.create(title: "Survivor", pages: 240, year: "2005")
        both = Book.create(title: "Two people wrote this", pages: 500, year: "2002", authors: [dr_suess, chuck])
        
        it {expect(chuck.avg_pages.round(2)).to eq(313.33)}
    end
end