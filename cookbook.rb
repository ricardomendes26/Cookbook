require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_at(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  private

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [ recipe.name, recipe.description ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0] , row[1])
    end
  end
end
