require 'rails_helper'

RSpec.describe 'Request create an item' do
  it 'creates an item' do
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    expect(Item.count).to eq(0)

    post '/api/v1/items?name=hello&description=hi&image_url=www.hi.com'

    returned_item = JSON.parse(response.body)

    # I receive a 201 JSON  response if the record is successfully created
    expect(response).to have_http_status(201)
    expect(response.content_type).to eq('application/json')
    expect(Item.count).to eq(1)
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(returned_item['id']).to eq(1)
    expect(returned_item['name']).to eq('hello')
    expect(returned_item['description']).to eq('hi')
    expect(returned_item['image_url']).to eq('www.hi.com')
    expect(returned_item).to_not have_key('created_at')
    expect(returned_item).to_not have_key('updated_at')
  end
end
