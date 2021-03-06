require 'rails_helper'

describe 'when visiting /companies/#' do
  it 'can create a contact for a company' do
    company = Company.create!(name: 'ESPN')

    visit company_path(company)

    fill_in :contact_name, with: 'Chris Bishop'
    fill_in :contact_position, with: 'Doctor'
    fill_in :contact_email, with: 'cbishop@doctor.com'
    click_on 'Create Contact'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Chris Bishop')
    expect(page).to have_content('Doctor')
    expect(page).to have_content('cbishop@doctor.com')
  end
end
