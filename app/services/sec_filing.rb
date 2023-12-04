require "net/http"

class SecFiling

  def get(metric)
    uri = URI(
      "https://data.sec.gov/api/xbrl/companyconcept/CIK0000004127/us-gaap/#{metric}.json"
    )
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == "https"
    request = Net::HTTP::Get.new(uri.path, headers)
    req = http.request(request)
    body = JSON.parse(req.body)

    if body.fetch("units").key?("USD/shares")
      body["units"]["USD"] = body.fetch("units").delete("USD/shares")
    end

    TenK::FinancialValue.new(body)
  end

  def get_all_financials
    uri = URI(
      "https://data.sec.gov/api/xbrl/companyfacts/CIK0000004127.json"
    )
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == "https"
    request = Net::HTTP::Get.new(uri.path, headers)
    req = http.request(request)
    body = JSON.parse(req.body)
  end

  private

  def headers
    {
      "User-Agent": "test@gmail.com"
    }
  end
end
