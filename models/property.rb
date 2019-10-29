require('pg')

class Property

  attr_accessor :address, :value, :num_bedrooms, :buy_let_status
  attr_reader :id

  def initialize(options)
    @address = options['address']
    @value = options['value'].to_i
    @num_bedrooms = options['num_bedrooms'].to_i
    @buy_let_status = options['buy_let_status']
    @id = options['id'].to_i if options['id']

  end





  def save
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "INSERT INTO property(
    address,
    value,
    num_bedrooms,
    buy_let_status
    ) VALUES
    ($1, $2, $3, $4)
    RETURNING *;"
    values = [@address, @value, @num_bedrooms, @buy_let_status]
    db.prepare('save', sql)
    result = db.exec_prepared('save', values)
    @id = result[0]['id'].to_i
    db.close
  end


  def delete()
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "DELETE FROM property
    WHERE id= $1;"
    values = [@id]
    db.prepare('delete_one', sql)
    db.exec_prepared('delete_one', values)
    db.close
  end

  def update()
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "UPDATE property SET(address,
    value,
    num_bedrooms,
    buy_let_status
    ) =
    ($1, $2, $3, $4)
    WHERE id = $5;"
    values = [@address, @value, @num_bedrooms, @buy_let_status, @id]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close
  end

  def Property.find(id)
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "SELECT * FROM property
    WHERE id = $1;"
    db.prepare('find', sql)
    result = db.exec_prepared('find', [id])
    db.close
    return Property.new(result[0])

  end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "SELECT * FROM property
    WHERE address = $1;"
    db.prepare('find', sql)
    result = db.exec_prepared('find', [address])
    db.close
    return Property.new(result[0])

  end

  def Property.delete_all()
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "DELETE FROM property;"
    db.prepare('delete_all', sql)
    db.exec_prepared('delete_all' )
    db.close
  end



end
