class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'RXFPGRO0NTB0Y032P3FHWYJMTN1PZWLMCMRLQS41G5F4GODQ'
      req.params['client_secret'] = 'VYNEPDRG0TKELTGZ2U3G4AOJ3XMXSAPFAJ1G0QRCQJBDSQ1Y'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
