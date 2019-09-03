require 'rails_helper'

describe Book do
    describe "relationships" do
        it { should have_many(:authors).through(:author_books) }
    end

    describe "validations" do
        it { should validate_presence_of :title }
        it { should validate_presence_of :year }
        it { should validate_numericality_of(:pages).only_integer }
    end
end