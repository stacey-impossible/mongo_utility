def handle_input(input)
  case input
  in ["manufacture", manufacture]
    "Here will be manufacture #{manufacture} output"
  in ["later_then", year]
    "Here will be later then #{year} output"
  in ["options", id]
    "Here will be options #{id} output"
  in ["help"]
    """
    Flags for app.rb:
    manufacture <manufacture> -- finds all cars by manufacture
    later_then <year> -- finds all cars which were produced after year
    options <id> -- puts options of car with id
    help -- puts help
    """
  else
    "Wrong command. Print \"ruby app.rb help\" for help."
  end
end

puts handle_input(ARGV)
