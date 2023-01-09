require 'date'
require_relative './main'

class App
  attr_reader :books, :people, :rental

  def initialize
    Main.new
  end
end

def run_program
  App.new
end

run_program
