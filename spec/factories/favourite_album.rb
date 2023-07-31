# frozen_string_literal: true

FactoryBot.define do
  factory :favourite_album do
    collection_id { rand(1..1000) }
    thumbnail { 'http://url.com.br' }
    title { 'title' }
    subtitle { 'subtitle' }
    favourite { true }
  end
end
