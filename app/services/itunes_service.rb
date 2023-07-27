class ItunesService
  BASE_URL = 'https://itunes.apple.com/search?'.freeze

  def initialize(term)
    @term = term
  end

  def call
    response = HTTParty.get("#{BASE_URL}#{params}")
    JSON.parse(response, symbolize_names: true)[:results]
  end

  private

  def params
    "entity=musicArtist&entity=album&term=#{@term}"
  end
end
