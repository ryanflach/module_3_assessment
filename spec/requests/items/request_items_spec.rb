require 'rails_helper'

RSpec.describe 'Request items', type: :request do
  it 'gets all items' do
    create_list(:item, 5)

    get 'api/v1/items'

    items = JSON.parse(response.body, serialize_names: true)
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
end
