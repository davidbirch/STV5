require 'spec_helper'

describe "programs/index" do
  before(:each) do
    assign(:programs, [
      stub_model(Program,
        :title => "Title",
        :subtitle => "Subtitle",
        :region_id => 1,
        :sport_id => 2,
        :channel_id => 3,
        :category => "Category",
        :description => "Description"
      ),
      stub_model(Program,
        :title => "Title",
        :subtitle => "Subtitle",
        :region_id => 1,
        :sport_id => 2,
        :channel_id => 3,
        :category => "Category",
        :description => "Description"
      )
    ])
  end

  it "renders a list of programs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
