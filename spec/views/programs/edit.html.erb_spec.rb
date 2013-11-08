require 'spec_helper'

describe "programs/edit" do
  before(:each) do
    @program = assign(:program, stub_model(Program,
      :title => "MyString",
      :subtitle => "MyString",
      :region_id => 1,
      :sport_id => 1,
      :channel_id => 1,
      :category => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", program_path(@program), "post" do
      assert_select "input#program_title[name=?]", "program[title]"
      assert_select "input#program_subtitle[name=?]", "program[subtitle]"
      assert_select "input#program_region_id[name=?]", "program[region_id]"
      assert_select "input#program_sport_id[name=?]", "program[sport_id]"
      assert_select "input#program_channel_id[name=?]", "program[channel_id]"
      assert_select "input#program_category[name=?]", "program[category]"
      assert_select "input#program_description[name=?]", "program[description]"
    end
  end
end
