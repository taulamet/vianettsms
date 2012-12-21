require 'spec_helper.rb'

describe Vianettsms, "Config" do

  let(:valid_config) { { :username => 'diego@maradona.com.ar', 
      :password => '1234' } }

  before { Vianettsms.config =  valid_config }

  it "should have valid username" do
    Vianettsms.config[:username].should == "diego@maradona.com.ar"
  end

  it "should have valid password" do
    Vianettsms.config[:password].should == "1234"
  end
end

describe Vianettsms::Sms, "#deliver" do

  let(:valid_config) { { :username => 'diego@maradona.com.ar', 
      :password => '1234' } }
  
  context "With valid params" do

    before { Vianettsms.config =  valid_config }
    
    let(:valid_params) do {
        :msgid => '1234',
        :to => '4711111111',
        :message => 'Hello World' }
    end

   before do
      stub_request(:post, Vianettsms.url).
        with(:body => {"username"=>"diego@maradona.com.ar", "msg"=>"Hello World", "tel"=>"4711111111", "msgid"=>"1234", "password"=>"1234"},
             :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded'}).
        to_return(:status => 200, :body => "<?xml version=\"1.0\"?><ack refno=\"1234\" errorcode=\"200\">OK</ack>", :headers => {})
    end

    let(:sms) { 
      sms = Vianettsms::Sms.new(valid_params)
      sms.deliver
      sms
    }

    it "should have status 200" do
      sms.status.should == "200"
    end

    it "should have correct refno" do
      sms.response_hash['refno'].should == "1234"
    end

    it "should return true for devivered? method" do
      sms.delivered?.should == true
    end

  end

end

