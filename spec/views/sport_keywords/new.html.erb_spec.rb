require 'spec_helper'

describe "sport_keywords/new" do
  before(:each) do
    assign(:sport_keyword, stub_model(SportKeyword,
      :rule_type => "MyString",
      :value => "MyString",
      :sport_id => 1,
      :priority => 1
    ).as_new_record)
  end

  it "renders new sport_keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sport_keywords_path, "post" do
      assert_select "input#sport_keyword_rule_type[name=?]", "sport_keyword[rule_type]"
      assert_select "input#sport_keyword_value[name=?]", "sport_keyword[value]"
      assert_select "input#sport_keyword_sport_id[name=?]", "sport_keyword[sport_id]"
      assert_select "input#sport_keyword_priority[name=?]", "sport_keyword[priority]"
    end
  end
end
