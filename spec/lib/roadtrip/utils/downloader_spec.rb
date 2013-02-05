require_relative '../../../../lib/roadtrip/utils/downloader'

describe RoadTrip::Downloader do
  let(:source_url) { 'http://www.fueleconomy.gov/feg/epadata/' }
  let(:downloader) { RoadTrip::Downloader.new(:url => source_url) }

  describe "#initialize" do
    it "creates a new downloader with a given base URL" do
      downloader.url.should == source_url
    end
  end

  describe "#get", :vcr do
    it "downloads the data file for the specified year" do
      downloader.get(2012)
			File.exists?("lib/roadtrip/utils/data/2012-fuel-economy.zip")
    end
  end
end
