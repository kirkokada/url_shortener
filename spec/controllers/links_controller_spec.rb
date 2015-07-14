require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let!(:link) { FactoryGirl.create :link, slug: "llll0000" }

  describe 'GET #redirect' do
    
    it 'should redirect to the link url' do
      get :redirect, slug: link.slug
      expect(response).to redirect_to(link.url)
    end

    it 'should properly redirect mistranscribed slugs' do
      get :redirect, slug: link.slug.gsub(/[l0]/, 'l' => 'I', '0' => 'O')
      expect(response).to redirect_to(link.url)
    end
  end
end
