require 'spec_helper'

describe "channels/show" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :name => "Name",
      :short_name => "Short Name",
      :free_or_pay => "Free Or Pay",
      :xmltv_id => "Xmltv",
      :black_flag => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Short Name/)
    rendered.should match(/Free Or Pay/)
    rendered.should match(/Xmltv/)
    rendered.should match(/false/)
  end
end
