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
  end
end