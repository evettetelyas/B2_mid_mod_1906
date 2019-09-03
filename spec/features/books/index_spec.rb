require 'rails_helper'

describe "book index page" do
    before :each do
        @dr_suess = Author.create(name: "Dr. Suess")
        @chuck = Author.create(name: "Chuck Palahkiuk")
        @cat = @dr_suess.books.create(title: "Cat in the Hat", pages: 20, year: "1990")
        @pop = @dr_suess.books.create(title: "Hop on Pop", pages: 30, year: "1995")
        @fight = @chuck.books.create(title: "Fight Club", pages: 200, year: "1999")
        @survivor = @chuck.books.create(title: "Survivor", pages: 240, year: "2005")
        @both = Book.create(title: "Two people wrote this", pages: 500, year: "2002", authors: [@dr_suess, @chuck])
    end
    it "should show all book info" do
        visit "/books"

        expect(page).to have_content(@cat.title)
        expect(page).to have_content(@pop.title)
        expect(page).to have_content(@fight.title)
        expect(page).to have_content(@survivor.title)
        expect(page).to have_content(@both.title)
        expect(page).to have_content(@cat.pages)
        expect(page).to have_content(@pop.pages)
        expect(page).to have_content(@fight.pages)
        expect(page).to have_content(@survivor.pages)
        expect(page).to have_content(@both.pages)
        expect(page).to have_content(@cat.year)
        expect(page).to have_content(@pop.year)
        expect(page).to have_content(@fight.year)
        expect(page).to have_content(@survivor.year)
        expect(page).to have_content(@both.year)
        expect(page).to have_content(@dr_suess.name)
        expect(page).to have_content(@chuck.name)
    end

    it "it should have links to author show pages" do
        visit "/books"
        within "#books-#{@cat.id}" do
            click_link "Dr. Suess"

            expect(current_path).to eq("/authors/#{@dr_suess.id}")
        end
    end
end