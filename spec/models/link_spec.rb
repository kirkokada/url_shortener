require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { Link.new(url: "https://www.google.com") }

  subject { link }

  it { should respond_to :url }
  it { should respond_to :slug }

  describe "when the URL is not unique" do
    before do
      dup = link.dup
      dup.save
    end

    it "should not be valid" do
      expect(link).to_not be_valid
    end
  end

  describe "after saving" do
    before { link.save }

    it "should create a slug" do
      expect(link.slug).to_not be_nil
    end
  end
end
