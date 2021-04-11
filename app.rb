require 'mongo'

class DB
  def initialize()
    @client = Mongo::Client.new(["#{ENV['MONGO_HOST']}:#{ENV['MONGO_PORT']}"], :database => 'cars')
    @collection = @client[:cars]
  end

  def find_by_manufacture(manufacture)
    @collection.find({manufacture: manufacture}).to_a
  end

  def find_later_then(year)
    @collection.find({year: {'$gt': year.to_i}}).to_a
  end
end

def handle_input(input)
  db = DB.new()
  case input
  in ['manufacture', manufacture]
    db.find_by_manufacture(manufacture)
  in ['later_then', year]
    db.find_later_then(year)
  in ['options', id]
    "Here will be options #{id} output"
  in ['help']
    """
    Flags for app.rb:
    manufacture <manufacture> -- finds all cars by manufacture
    later_then <year> -- finds all cars which were produced after year
    options <id> -- puts options of car with id
    help -- puts help
    """
  else
    'Wrong command. Print "ruby app.rb help" for help.'
  end
end

puts handle_input(ARGV)
