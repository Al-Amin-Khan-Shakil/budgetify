require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'user 1') }

  it 'name should be present' do
    expense = Expense.new
    expect()
end