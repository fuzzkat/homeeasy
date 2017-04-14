require 'homeeasy'

RSpec.describe HomeEasy, "#rooms" do

  context "when connected to the server with a valid session pass through rooms list" do
	  let(:rooms_response) { double("Response", :body => File.read('spec/allroomdevice.json') ) }
    let(:rest_client) { class_double "User Aware Rest Client"} 
    let(:homeeasy) { HomeEasy.new 'user', 'password', rest_client }
    before do
      allow(rest_client).to receive(:post).with(HomeEasy:: ROOT_URL + HomeEasy::ALL_ROOM_ENDPOINT, { optype: 'select' } ) { rooms_response }
    end
    it "returns a list of rooms" do
      expect(homeeasy.rooms).to be rooms_response
    end
  end

end
