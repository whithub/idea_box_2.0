require "rails_helper"

describe 'Searching for an Idea' do

  before(:each) do
    FactoryGirl.create(:idea, title: 'First idea title', description: 'Idea #1 Description')
    FactoryGirl.create(:idea, title: 'Second idea title', description: 'Idea #2 Description')
    visit root_path
  end

  it 'can search when on the main page' do
    expect(page).to have_field("Search for Idea")
  end

  it "by title in real time" do
    fill_in "Search for Idea", with: "Seco"

    expect(page).to have_content('Second idea title')
    expect(page).to_not have_content('First idea title')
  end

  it "by description in real time" do
    fill_in "Search for Idea", with: "Idea #1 Des"

    expect(page).to have_content('Idea #1 Description')
    expect(page).to_not have_content('Idea #2 Description')
  end

  it "displays list of all ideas when search box is cleared" do
    fill_in "Search for Idea", with: "First idea"

    expect(page).to have_content('First idea title')
    expect(page).to_not have_content('Second idea title')

    fill_in "Search for Idea", with: " "

    expect(page).to have_content('First idea title')
    expect(page).to have_content('Idea #1 Description')
    expect(page).to have_content('Second idea title')
    expect(page).to have_content('Idea #2 Description')
  end
end

