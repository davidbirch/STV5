require 'spec_helper'

describe "raw_channels/show" do
  before(:each) do
    @raw_channel = assign(:raw_channel, stub_model(RawChannel,
      :channel_name => "Channel Name",
      :xmltv_id => "Xmltv"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Channel Name/)
    rendered.should match(/Xmltv/)
  end
end
