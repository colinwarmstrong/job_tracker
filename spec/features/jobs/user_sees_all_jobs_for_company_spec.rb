require 'rails_helper'

describe 'when user goes to /companies/#/jobs' do
  it 'can see all of the jobs for company' do
    company1 = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job1 = company1.jobs.create!(title: 'person', level_of_interest: 10, city: 'Denver', category_id: category.id)
    job2 = company1.jobs.create!(title: 'guy', level_of_interest: 10, city: 'Chicago', category_id: category.id)
    job3 = company1.jobs.create!(title: 'dude', level_of_interest: 10, city: 'Baltimore', category_id: category.id)

    visit company_jobs_path(company1)

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job1.city)
    expect(page).to have_content(job1.category.title)

    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.level_of_interest)
    expect(page).to have_content(job2.city)
    expect(page).to have_content(job2.category.title)

    expect(page).to have_content(job3.title)
    expect(page).to have_content(job3.level_of_interest)
    expect(page).to have_content(job3.city)
    expect(page).to have_content(job3.category.title)
  end
end
