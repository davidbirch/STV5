require 'spec_helper'

describe "sport_keywords/edit" do
  before(:each) do
    @sport_keyword = assign(:sport_keyword, stub_model(SportKeyword,
      :rule_type => "MyString",
      :value => "MyString",
      :sport_id => 1,
      :priority => 1
    ))
  end

  it "renders the edit sport_keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sport_keyword_path(@sport_keyword), "post" do
      assert_select "input#sport_keyword_rule_type[name=?]", "sport_keyword[rule_type]"
      assert_select "input#sport_keyword_value[name=?]", "sport_keyword[value]"
      assert_select "input#sport_keyword_sport_id[name=?]", "sport_keyword[sport_id]"
      assert_select "input#sport_keyword_priority[name=?]", "sport_keyword[priority]"
    end
  end
end
