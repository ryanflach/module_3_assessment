require 'rails_helper'

RSpec.describe 'Request items', type: :request do
  it 'gets all items' do
    create_list(:item, 5)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    first_item = items.first

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(items.count).to eq(5)
    expect(first_item).to have_key('id')
    expect(first_item).to have_key('name')
    expect(first_item).to have_key('description')
    expect(first_item).to have_key('image_url')
    expect(first_item).to_not have_key('created_at')
    expect(first_item).to_not have_key('updated_at')
  end

  it 'gets an individual item' do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    returned_item = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(returned_item['id']).to eq(1)
    expect(returned_item['name']).to eq('test')
    expect(returned_item['description']).to eq('testing')
    expect(returned_item['image_url']).to eq('www.testtesttest.com')
    expect(returned_item).to_not have_key('created_at')
    expect(returned_item).to_not have_key('updated_at')
  end
end
