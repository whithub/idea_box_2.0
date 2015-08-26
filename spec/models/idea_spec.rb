require 'rails_helper'

describe Idea, type: :model do

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:quality) }

  before(:each) do
    @idea_1 = Idea.create(title: "Idea Title #1", description: "Great idea description #1", quality: 'swill')
    @idea_2 = Idea.create(title: "Idea Title #2", description: "Great idea description #2", quality: 'genius')
    @idea_3 = Idea.create(title: "Idea Title #3", description: "Great idea description #3")
  end

  it "is defaulted to swill when created" do
    expect(@idea_3.quality).to eq('swill')
    expect(@idea_3.quality).to_not eq('plausible')
    expect(@idea_3.quality).to_not eq('genius')

  end

  it "can either be swill, plausible, or genius" do

  end

  it "can only be upvoted, incrementally, if quality is swill or plausible" do
    @idea_1.upvote
    expect(@idea_1.quality).to eq('plausible')

    @idea_1.upvote
    expect(@idea_1.quality).to eq('genius')
  end

  it "cannot be upvoted if quality is genius, remains at genius" do
    @idea_2.upvote
    @idea_2.upvote

    expect(@idea_2.quality).to eq('genius')
  end

  it "can only be downvoted, incrementally, if quality is genius or plausible" do
    @idea_2.downvote
    expect(@idea_2.quality).to_not eq('swill')
    expect(@idea_2.quality).to eq('plausible')

    @idea_2.downvote
    expect(@idea_2.quality).to eq('swill')
  end

  it "can not be downvoted if quality is swill" do
    @idea_1.downvote
    @idea_1.downvote
    expect(@idea_1.quality).to eq('swill')
  end

end





