class DiceController < ApplicationController

  def check_status
    (params["status"] == "playing") ? roll_dice : display_instructions
  end

  def roll_dice
    die = [{:fname => "d01.png", :value => 1}, {:fname => "d02.png", :value => 2}, {:fname => "d03.png", :value => 3},
            {:fname => "d04.png", :value => 4}, {:fname => "d05.png", :value => 5}, {:fname => "d06.png", :value => 6}]

    dice_pairs = die.product(die)
    @roll = die.sample(1)
    render "dice"

  end




  def display_instructions
    @content = <<-eos
    <h2>Welcome</h2><p>Here are the rules:</p>
    <ul>
    <li>Roll the dice to start the game.</li>
    <li>If your first roll is a 7 or 11, you win.</li>
    <li>If your first roll is a 2, 3, or 12, you lose.</li>
    <li>Anything else becomes your <i>goal</i>. Roll your goal again before rolling a 7, and you win.  Roll a 7
    instead of your goal, and you lose.</li>
  </ul>
  eos
    @button = {:link => "/dice?status=playing", :text => "Roll to start the game!"}
    render "dice"
  end
end