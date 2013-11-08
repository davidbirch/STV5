require 'spec_helper'

describe "channels/edit" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :name => "MyString",
      :short_name => "MyString",
      :free_or_pay => "MyString",
      :xmltv_id => "MyString",
      :black_flag => false
    ))
  end

  it "renders the edit channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do
      assert_select "input#channel_name[name=?]", "channel[name]"
      assert_select "input#channel_short_name[name=?]", "channel[short_name]"
      assert_select "input#channel_free_or_pay[name=?]", "channel[free_or_pay]"
      assert_select "input#channel_xmltv_id[name=?]", "channel[xmltv_id]"
      assert_select "input#channel_black_flag[name=?]", "channel[black_flag]"
    end
  end
end
