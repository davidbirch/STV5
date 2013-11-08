require 'spec_helper'

describe "raw_channels/edit" do
  before(:each) do
    @raw_channel = assign(:raw_channel, stub_model(RawChannel,
      :channel_name => "MyString",
      :xmltv_id => "MyString"
    ))
  end

  it "renders the edit raw_channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", raw_channel_path(@raw_channel), "post" do
      assert_select "input#raw_channel_channel_name[name=?]", "raw_channel[channel_name]"
      assert_select "input#raw_channel_xmltv_id[name=?]", "raw_channel[xmltv_id]"
    end
  end
end
