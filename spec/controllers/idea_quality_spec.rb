require "rails_helper"

describe 'An idea quality', type: :feature do

  context "upon creation" do
    it "is defaulted to swill" do
      @idea = Idea.create(title: "What a great new idea!", description: "Description of this great new idea.")

      expect(page).to have_content("What a great new idea!")
      expect(page).to have_content("Description of this great new idea.")
      assert_equals "Swill", @idea.quality
    end
  end

  context "after idea is created" do
    before(:each) do
      FactoryGirl.create(:idea, title: 'Idea #1', description: 'Idea #1 Description')
      FactoryGirl.create(:idea, title: 'Idea #2', description: 'Idea #2 Description')
      visit root_path
    end

    it "can either be swill, plausible, or genius"

    it "that is thumbs-up, can only change swill to plausible, and plausible to genius"

    it "that is genius and is thumbs-up, has no effect"

    it "that is thumbs-down, can only change genius to plausible, and plausible to swill"

    it "that is swill and is thumbs-down, has no effect"

  end
end

