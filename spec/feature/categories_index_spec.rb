require 'rails_helper'

RSpec.feature 'Category page' do
  feature 'Display all the categories' do
    background do
      visit new_user_session_path
      @first = User.create(name: 'Petro', email: 'petro@gmail.com', password: 'Petro1234')
      @category_one = Category.create(name: 'Grocerry', icon: 'Grocerry.png', user_id: @first.id)
      @budget_one = Budget.create(name: 'Tomatoes', amount: 80, user_id: @first.id)

      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password

      click_button 'Log in'

      visit categories_path
    end

    scenario 'shows each category' do
      expect(page).to have_content('Grocerry')
      expect(page).to have_content('Add Category')
    end
    scenario 'Shows some text in the categories page' do
      expect(page).to have_content('BUGETAAS')
      expect(page).to have_content('Category')
    end
  end
end