class View
  def initialize

  end
def display(recipes)
  recipes.each_with_index do |recipe, index|
    puts "#{index + 1} - #{recipe.name}: #{} "
  end
end

def ask_user_for(word)
  puts "What is the #{word} of your recipe?"
  gets.chomp
end

end
