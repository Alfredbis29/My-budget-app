require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(email: 'kalumunabisimwa5@gmail.com', password: '123456') }
  let(:group) { Category.create(name: 'Shoes', icon: 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=398&q=80') }

  context '.name' do
    it 'is not valid with a name less than 3 characters' do
      # user.name = 'M'
      # expect(user).to_not be_valid
    end

    it 'is not valid without a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without an icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end
