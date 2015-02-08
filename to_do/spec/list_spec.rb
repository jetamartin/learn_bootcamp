require 'list'
require 'pg'

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe List do
  it 'is initialized with a name' do
    list = List.new('Notch8 stuff')
    expect(list).to be_an_instance_of List
  end

  it 'tells you its name' do
    list = List.new('Notch8 stuff')
    expect(list.name).to eq 'Notch8 stuff'
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('Notch8 stuff')
    list2 = List.new('Notch8 stuff')
    expect(list1).to eq list2
  end

  it 'starts off with no lists' do
    expect(List.all).to eq []
  end

  it 'lets you save lists to the database' do
    list = List.new('Notch8 stuff')
    list.save
    expect(List.all).to eq [list]
  end

end
