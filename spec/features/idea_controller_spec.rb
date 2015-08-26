require 'rails_helper'

describe 'Ideas', type: :feature, :js => true do

  before(:each) do
    FactoryGirl.create(:idea, title: 'First idea title', description: 'Idea #1 Description')
    FactoryGirl.create(:idea, title: 'Second idea title', description: 'Idea #2 Description')
    visit root_path
  end

  it "displays all ideas on root page" do
    expect(page).to have_content('First idea title')
    expect(page).to have_content('Idea #1 Description')
    expect(page).to have_content('Second idea title')
    expect(page).to have_content('Idea #2 Description')
  end

  it "can be created" do
    fill_in "New Idea Title", with: "Brand New Idea!"
    fill_in "New Idea Description", with: "Description of brand new idea."
    click_on "Save"

    expect(page).to have_content('Brand New Idea!')
    expect(page).to have_content("Description of brand new idea.")
    expect(page).to have_content('Second idea title')
    expect(page).to have_content('Idea #2 Description')
  end

  it "cannot be created without both an title and description" do
    fill_in "New Idea Title", with: "Brand New Idea!"
    click_on "Save"

    error_message = page.driver.browser.switch_to.alert
    expect(error_message.text).to eq("You goof... You need both title and description to create an idea.")

    # expect(page).to have_errors

    # expect(page).to have_content("You goof... You need both title and description to create an idea.")

    # fill_in "New Idea Description", with: "Description of brand new idea."
    #
    # expect(page).to have_content('Brand New Idea!')
    # expect(page).to have_content('Description of brand new idea.')
  end


  it "can be edited" do
    first(:link, "Edit").click

    expect(page).to have_content("Edit Idea:")

    find_field('New Idea Title').value.should eq('Second idea title')
    find_field('New Idea Description').should have_content('Idea #2 Description')

    fill_in 'New Idea Title', with: 'Edited idea title'
    fill_in 'New Idea Description', with: 'Edited idea description'
    click_on "Save"

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Edited idea title')
    expect(page).to have_content('Edited idea description')
    expect(page).to_not have_content('Second idea title')
    expect(page).to_not have_content('Idea #2 Description')
  end

  it "can be deleted" do
    first(:link, "Delete").click

    expect(current_path).to eq('/')
    expect(page).to have_content('First idea title')
    expect(page).to have_content('Idea #1 Description')
    expect(page).to_not have_content('Second idea title')
    expect(page).to_not have_content('Idea #2 Description')
  end

end
