require('pry-byebug')
require_relative('./models/property.rb')


property1 = Property.new({
  'address' => '1 Mayfair',
  'value' => 30000,
  'num_bedrooms' => 10,
  'buy_let_status' => 'buy'

  })

  property2 = Property.new({
    'address' => '1 Pentland Terrance',
    'value' => 1200,
    'num_bedrooms' => 3,
    'buy_let_status' => 'let'

    })

binding.pry


nil
