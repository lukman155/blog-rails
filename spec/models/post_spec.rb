require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it 'is not valid without a title' do
      expect(Post.new).to_not be_valid
    end
  end
  context 'associations' do
    it 'belongs to author' do
      assc = described_class.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end
    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
    it 'has many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end
end
