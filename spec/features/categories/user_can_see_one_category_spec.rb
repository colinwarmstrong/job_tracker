require 'rails_helper'

describe 'when user visits /categories/# they' do
  it 'can see a specific category' do
    category = Category.create!(title: 'poop scoopery')

    visit category_path(category)

    expect(page).to have_content(category.title)
  end

  it 'can see all jobs associated with category' do
    company = Company.create!(name: 'sanitation plus')
    category = Category.create!(title: 'poop scoopery')
    job_1 = company.jobs.create!(title: "sanitation expert", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "pro scooper", level_of_interest: 69, city: "San Diego", category_id: category.id)

    visit category_path(category)

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end

  it 'user can click on a job to go to a job show page' do
    company = Company.create!(name: 'sanitation plus')
    category = Category.create!(title: 'poop scoopery')
    job = company.jobs.create!(title: "sanitation expert", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit category_path(category)

    click_on job.title

    expect(current_path).to eq(job_path(job))
  end

  it 'user can go back to categories' do
    company = Company.create!(name: 'sanitation plus')
    category = Category.create!(title: 'poop scoopery')
    job = company.jobs.create!(title: "sanitation expert", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit category_path(category)

    click_on 'Back to Categories'

    expect(current_path).to eq(categories_path)
  end

  it 'user can delete a category' do
    category = Category.create!(title: 'poop scoopery')

    visit category_path(category)

    click_on 'Delete'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("#{category.title} was successfully deleted!")
  end

  it 'user can view an edit category page' do
    category = Category.create!(title: 'poop scoopery')

    visit category_path(category)

    click_on 'Edit'

    expect(current_path).to eq(edit_category_path(category))
  end
end
