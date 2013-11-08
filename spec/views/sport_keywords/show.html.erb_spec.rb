require 'spec_helper'

describe "sport_keywords/show" do
  before(:each) do
    @sport_keyword = assign(:sport_keyword, stub_model(SportKeyword,
      :rule_type => "Rule Type",
      :value => "Value",
      :sport_id => 1,
      :priority => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rule Type/)
    rendered.should match(/Value/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
