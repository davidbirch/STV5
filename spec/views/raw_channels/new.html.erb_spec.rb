require 'spec_helper'

describe "raw_channels/new" do
  before(:each) do
    assign(:raw_channel, stub_model(RawChannel,
      :channel_name => "MyString",
      :xmltv_id => "MyString"
    ).as_new_record)
  end

  it "renders new raw_channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", raw_channels_path, "post" do
      assert_select "input#raw_channel_channel_name[name=?]", "raw_channel[channel_name]"
      assert_select "input#raw_channel_xmltv_id[name=?]", "raw_channel[xmltv_id]"
    end
  end
end
