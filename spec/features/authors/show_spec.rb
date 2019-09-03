require 'rails_helper'

describe "author show page" do
    before :each do
        @dr_suess = Author.create(name: "Dr. Suess")
        @chuck = Author.create(name: "Chuck Palahkiuk")
        @cat = @dr_suess.books.create(title: "Cat in the Hat", pages: 20, year: "1990")
        @pop = @dr_suess.books.create(title: "Hop on Pop", pages: 30, year: "1995")
        @fight = @chuck.books.create(title: "Fight Club", pages: 200, year: "1999")
        @survivor = @chuck.books.create(title: "Survivor", pages: 240, year: "2005")
        @both = Book.create(title: "Two people wrote this", pages: 500, year: "2002", authors: [@dr_suess, @chuck])
    end
    it "should have all author content" do
        visit "/authors/#{@chuck.id}"

        expect(page).to have_content(@chuck.name)
        expect(page).to have_content(@fight.title)
        expect(page).to have_content(@survivor.title)
        expect(page).to have_content(@both.title)
        expect(page).to have_content(@chuck.avg_pages.round(2))
    end
end