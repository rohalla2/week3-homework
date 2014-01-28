class DiceController < ApplicationController
  def dice
  end

  def play
    #roll dice
    die = {:fname => "d01.png", :value => 1}, {:fname => "d02.png", :value => 2}, {:fname => "d03.png", :value => 3},
           {:fname => "d04.png", :value => 4}, {:fname => "d05.png", :value => 5}, {:fname => "d06.png", :value => 6}

    @side1 = die.sample(1)
    @side2 = die.sample(1)
    @value = @side1[0][:value] + @side2[0][:value]

    @target = params["target"].to_i
    if @target == 0
      #This is the first roll. 7 or 11 auto WIN
      if @value == 7 || @value == 11
        @message = "You Win!"
        @button = {:link => "/dice/play", :text => "Start Over."}

      else
        if @value == 2 || @value == 3 || @value == 12 #2,3,12  User looses
          @message = "You lose."
          @button = {:link => "/dice/play", :text => "Start Over."}
        else
          @message = "Your goal is now #{@value}."
          @message2 = "Now try to get a #{@value} again before you roll a 7"
          @button = {:link => "/dice/play?target=#{@value}", :text => "Roll the dice."}
        end
      end

    else
      #if target = roll, win
      if @target == @value
         @message = "You Win!"
         @button = {:link => "/dice/play", :text => "Start Over."}
      else
        if @value == 7
          @message = "You Lose."
          @button = {:link => "/dice/play", :text => "Start Over."}
        else
          @message = "Your rolled #{@value}"
          @message2 = "Roll again to try to get a #{@target} before you roll a 7"
          @button = {:link => "/dice/play?target=#{@target}", :text => "Roll the dice."}
        end
      end
    end
  end
end
