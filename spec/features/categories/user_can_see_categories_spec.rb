require 'rails_helper'

describe 'feature' do
  describe 'when user visits /categories' do
    it 'user can see all categories' do
      category_1 = Category.create(title: 'poop scoopery')
      category_2 = Category.create(title: 'medicine')

      visit categories_path

      expect(page).to have_content("#{category_1.title}")
      expect(page).to have_content("#{category_2.title}")
    end

    it 'user can create a new category' do
      visit categories_path

      click_on "Add New Category"

      expect(current_path).to eq(new_category_path)
    end

    it 'user can visit an edit category page' do
      category = Category.create!(title: 'Medicine')

      visit categories_path

      click_on 'Edit'

      expect(current_path).to eq(edit_category_path(category))
    end
  end
end