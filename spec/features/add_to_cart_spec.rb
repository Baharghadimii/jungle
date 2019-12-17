require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They can click on Add button and cart number changes" do
    visit root_path

    first("button.btn.btn-primary").click
    expect(page).to have_content("My Cart (1)")
    all("button.btn.btn-primary")[1].click
    expect(page).to have_content("My Cart (2)")

  end
end
