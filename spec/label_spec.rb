require_relative '../app_helper'

describe Label do
    before :each do
        @label = Label.new("react","orange")
        @item = Item.new('20-3-2023')
    end
    describe "Initialize parameters" do
        it 'throws an argumentError when given less than 2 arguments' do
            expect { Label.new "react"}.to raise_error(ArgumentError)
        end
    end
    describe "#add_item" do
        it 'should have empty array' do
            expect(@label.items).to be_empty
        end

        it 'add item in items array' do
            @label.add_item = @item
            expect(@label.items).to include(@item)
        end
        it 'Does not add item twice' do
            @label.add_item = @item
            @label.add_item = @item
            expect(@label.items.count(@item)).to eq(1)
        end
    end
end 