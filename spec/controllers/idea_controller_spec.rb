require 'rails_helper'

describe 'Ideas', type: :feature do

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

    expect(page).to have_content("Description cannot be blank.")

    fill_in "New Idea Description", with: "Description of brand new idea."

    expect(page).to have_content('Brand New Idea!')
    expect(page).to have_content("Description of brand new idea.")
  end


  it "can be edited" do
    first("Edit").click

    # expect(page). to have_field()
    expect(page).to have_content('First idea title')
    expect(page).to have_content('Idea #1 Description')

    fill_in 'First idea title', with: 'Idea Title #1'
    fill_in 'Idea #1 Description', with: 'Description of Idea #1'
    click_on "Update"

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Idea Title #1')
    expect(page).to have_content('Description of Idea #1')
    expect(page).to_not have_content('First idea title')
    expect(page).to_not have_content('Idea #1 Description')
  end

  it "can be deleted" do
    first("Delete").click

    expect(page).to_not have_content('First idea title')
    expect(page).to_not have_content('Idea #1 Description')
    expect(page).to have_content('Second idea title')
    expect(page).to have_content('Idea #2 Description')
  end

  it "can have different qualities; lowest is swill, highest is genius"





end
