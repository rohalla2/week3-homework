class DiceController < ApplicationController
  def dice
    #empty method for instruction page.
  end

  def play
    #Define the sides of a die in hashes of their filename and value
    die = {:fname => "d01.png", :value => 1}, {:fname => "d02.png", :value => 2}, {:fname => "d03.png", :value => 3},
           {:fname => "d04.png", :value => 4}, {:fname => "d05.png", :value => 5}, {:fname => "d06.png", :value => 6}

    #select the two die and compute their value
    @side1 = die.sample(1)
    @side2 = die.sample(1)
    @value = @side1[0][:value] + @side2[0][:value]

    #get "target" parameter, if it exists
    @target = params["target"].to_i

    #if target = 0 (i.e. this is the first roll)
    if @target == 0
      #This is the first roll. 7 or 11 auto WIN
      if @value == 7 || @value == 11
        @message = "You Win!"
        @button = {:link => "/dice/play", :text => "Start Over."}
      else
        #2,3,12  User looses
        if @value == 2 || @value == 3 || @value == 12
          @message = "You lose."
          @button = {:link => "/dice/play", :text => "Start Over."}
        else
          #set new goal
          @message = "Your goal is now #{@value}."
          @message2 = "Now try to get a #{@value} again before you roll a 7"
          @button = {:link => "/dice/play?target=#{@value}", :text => "Roll the dice."}
        end
      end

    else  #this is not the first roll
      #if target = roll, win
      if @target == @value
         @message = "You Win!"
         @button = {:link => "/dice/play", :text => "Start Over."}
      else
        #if user rolled 7, lose
        if @value == 7
          @message = "You Lose."
          @button = {:link => "/dice/play", :text => "Start Over."}
        else
          #if user rolled other value, keep rolling
          @message = "Your rolled #{@value}"
          @message2 = "Roll again to try to get a #{@target} before you roll a 7"
          @button = {:link => "/dice/play?target=#{@target}", :text => "Roll the dice."}
        end
      end
    end
  end
end
