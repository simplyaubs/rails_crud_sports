require 'spec_helper'

feature 'CRUD sports' do
  scenario 'User can create a list of sports' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a sport'
    fill_in 'Name', with: 'Soccer'
    fill_in 'Equip', with: 'Shin guards'
    click_on 'Add sport'
    expect(page).to have_content 'Soccer'
    expect(page).to have_content 'Shin guards'
  end

  scenario 'User can update a sport from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a sport'
    fill_in 'Name', with: 'Soccer'
    fill_in 'Equip', with: 'Shin guards'
    click_on 'Add sport'
    expect(page).to have_content 'Soccer'
    expect(page).to have_content 'Shin guards'
    click_on 'Soccer'
    expect(page).to have_content 'Soccer'
    expect(page).to have_content 'Shin guards'
    click_on 'Edit'
    fill_in 'Name', with: 'Softball'
    fill_in 'Equip', with: 'Cleats'
    click_on 'Update sport'
    expect(page).to have_content 'Softball'
    expect(page).to have_content 'Cleats'
    expect(page).to_not have_content 'Soccer'
    expect(page).to_not have_content 'Shin guards'
  end
end