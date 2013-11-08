require 'spec_helper'

describe "sport_keywords/index" do
  before(:each) do
    assign(:sport_keywords, [
      stub_model(SportKeyword,
        :rule_type => "Rule Type",
        :value => "Value",
        :sport_id => 1,
        :priority => 2
      ),
      stub_model(SportKeyword,
        :rule_type => "Rule Type",
        :value => "Value",
        :sport_id => 1,
        :priority => 2
      )
    ])
  end

  it "renders a list of sport_keywords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rule Type".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
