require 'spec_helper'

describe "channels/index" do
  before(:each) do
    assign(:channels, [
      stub_model(Channel,
        :name => "Name",
        :short_name => "Short Name",
        :free_or_pay => "Free Or Pay",
        :xmltv_id => "Xmltv",
        :black_flag => false
      ),
      stub_model(Channel,
        :name => "Name",
        :short_name => "Short Name",
        :free_or_pay => "Free Or Pay",
        :xmltv_id => "Xmltv",
        :black_flag => false
      )
    ])
  end

  it "renders a list of channels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Free Or Pay".to_s, :count => 2
    assert_select "tr>td", :text => "Xmltv".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
