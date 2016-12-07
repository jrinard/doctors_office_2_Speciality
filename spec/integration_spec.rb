# require('capybara/rspec')
# require('./app')
# # require('spec_helper')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe('path to add doctor form', {:type => :feature}) do
#   it('allows a user to click link to doctors form') do
#     visit('/')
#     click_link('Add New Doctor')
#     expect(page).to have_content('Add New Doctor')
#   end
# end
#
# describe('add new doctor', {:type => :feature}) do
#   it('allows a user to enter new doctor') do
#     visit('/doctors/new')
#     fill_in('name', :with => 'Thor')# making it exist for future form
#     click_button('Save')
#     expect(page).to have_content('Success')
#   end
# end
#
# describe('view list of doctors', {:type => :feature}) do
#   it('allows a user to click link to see list of doctors') do
#     visit('/doctors')
#     click_link('View All Doctors')
#     expect(page).to have_content('Your Current Doctors')
#   end
# end
#
# describe('view list of patients under a doctor', {:type => :feature}) do
#   it('allows a user to click link to see list of patients') do
#     doctor = Doctor.new({:id => 1, :name => 'Thor'})
#     doctor.save()
#     visit('/doctors')
#     click_link('Thor')
#     expect(page).to have_content('Add a Patient to Thor')
#   end
# end
