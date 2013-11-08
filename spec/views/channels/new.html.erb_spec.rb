require 'spec_helper'

describe "channels/new" do
  before(:each) do
    assign(:channel, stub_model(Channel,
      :name => "MyString",
      :short_name => "MyString",
      :free_or_pay => "MyString",
      :xmltv_id => "MyString",
      :black_flag => false
    ).as_new_record)
  end

  it "renders new channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", channels_path, "post" do
      assert_select "input#channel_name[name=?]", "channel[name]"
      assert_select "input#channel_short_name[name=?]", "channel[short_name]"
      assert_select "input#channel_free_or_pay[name=?]", "channel[free_or_pay]"
      assert_select "input#channel_xmltv_id[name=?]", "channel[xmltv_id]"
      assert_select "input#channel_black_flag[name=?]", "channel[black_flag]"
    end
  end
end
