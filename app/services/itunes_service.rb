class ItunesService
  BASE_URL = 'https://itunes.apple.com/search?'.freeze

  def initialize(term)
    @term = term
  end

  def call
    response = HTTParty.get("#{BASE_URL}#{params}")
    results = JSON.parse(response, symbolize_names: true)[:results]

    format_results(results)
  end

  private

  def params
    "entity=musicArtist&entity=album&term=#{@term}"
  end

  def format_results(results)
    results.map do |result|
      {
        thumbnail: result[:artworkUrl100],
        title: result[:collectionName],
        subtitle: result[:artistName],
        collection_id: result[:collectionId],
        favourite: false
      }
    end
  end
end
