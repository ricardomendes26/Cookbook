require_relative "view.rb"
require_relative "recipe.rb"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # ask repo for all recipes
    recipes = @cookbook.all
    # ask view to display recipes
    @view.display(recipes)
  end

  def create
    # ask user for a name (view)#
    name = @view.ask_user_for("name")
    # ask user for a description (view)
    description = @view.ask_user_for("description")
    # create a recipe in the model (model)
    recipe = Recipe.new(name, description)
    # store it in the cookbook (repo)
    @cookbook.add(recipe)
    # display
    list
  end

  def destroy
    # display the recipes (view)
    list
    # ask user which recipe he wants to delete(view)
    index = @view.ask_user_for("index").to_i - 1
    # remove chosen recipe from repo (repo)
    @cookbook.remove_at(index)
    # display the recipes
    list
  end
end
