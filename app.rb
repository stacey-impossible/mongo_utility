require 'mongo'

class DB
  def initialize()
    @client = Mongo::Client.new(["#{ENV['MONGO_HOST']}:#{ENV['MONGO_PORT']}"], :database => 'cars')
    @collection = @client[:cars]
  end

  def find_by_manufacture(manufacture)
    @collection.find({manufacture: manufacture})
  end

  def self.print_collection(collection)
    collection.each {|record| puts record}
  end
end

def handle_input(input)
  db = DB.new()
  case input
  in ['manufacture', manufacture]
    DB.print_collection(db.find_by_manufacture(manufacture))
  in ['later_then', year]
    "Here will be later then #{year} output"
  in ['options', id]
    "Here will be options #{id} output"
  in ['help']
    puts """
    Flags for app.rb:
    manufacture <manufacture> -- finds all cars by manufacture
    later_then <year> -- finds all cars which were produced after year
    options <id> -- puts options of car with id
    help -- puts help
    """
  else
    puts 'Wrong command. Print "ruby app.rb help" for help.'
  end
end

handle_input(ARGV)
