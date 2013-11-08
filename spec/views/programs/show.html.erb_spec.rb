require 'spec_helper'

describe "programs/show" do
  before(:each) do
    @program = assign(:program, stub_model(Program,
      :title => "Title",
      :subtitle => "Subtitle",
      :region_id => 1,
      :sport_id => 2,
      :channel_id => 3,
      :category => "Category",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Subtitle/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Category/)
    rendered.should match(/Description/)
  end
end
