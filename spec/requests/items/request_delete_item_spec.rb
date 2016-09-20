require 'rails_helper'

RSpec.describe 'Request delete item' do
  context 'deletes successfully' do
    it 'deletes an item' do
      item = create(:item)

      expect(Item.count).to eq(1)

      delete '/api/v1/1'

      expect(response).to have_http_status(204)
      expect(response.content_type).to eq('application/json')
      expect(Item.count).to eq(0)
    end
  end

  context 'unable to delete' do
    xit 'attempts to delete an item' do
      delete '/api/v1/1'

      expect(response).to have_http_status(404)
      expect(response.content_type).to eq('application/json')
    end
  end
end
