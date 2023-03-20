# playable mastermind game
class Mastermind
    # def randomNumber
    #     array = Array.new(20)
    #     # p array
    #     array.each_with_index do |cell, index|
    #         array[index] = rand(1..6)
    #     end
    #     p array
    # end

    attr_accessor :gameMode, :rounds, :currentRound, :turnNumber, :currentCode,
                  :currentGuess, :playerPoints, :cpuPoints, :playerScore, :cpuScore

    def initialize 
        @gameMode = "breaker"
        @rounds = 1
        @currentRound = 1
        @turnNumber = 1
        @currentCode = []
        @currentGuess = []
        @playerPoints = 0
        @cpuPoints = 0
        @playerScore = 0
        @cpuScore = 0
    end

    # asks uses how many rounds userr wants to play and verifies input is integer
    def roundsAmount
        puts "How many rounds would you like to play?"
        begin
            @rounds = Integer(gets.chomp)
        rescue ArgumentError
            puts "Oops, invalid input. Please type how many rounds you want to play \nusing the number keys"
            roundsAmount()
        end
    end


    def chooseMode
        puts "Please choose the mode you start in."
        puts "(M) Start as Code Maker? or (B) Start as Code Breaker?"
        input = gets.chomp
        if input == "M" || input == "B"
            if input == "M"
                @gameMode = "maker"
            else 
                @gameMode = "breaker"
            end
        else 
            puts "Invalid input, please type M to start as Code Maker \nor type B to start as Code Breaker"
            chooseMode()
        end
    end







# #########    CODE MAKER METHODS BELOW    ##########

    def codeValidator(input)
        input = input.split("")
        if input.length == 4 && input.all? { |digit| (digit.to_i >= 1) && (digit.to_i <= 6) }
            @currentCode = input
        else 
            puts "Looks like your code was more than 4 digits or some digits were not between 1 and 6! \nLets try again."
            chooseCode()
        end
    end


    def chooseCode
        puts "enter the code below"
        input = gets.chomp
        codeValidator(input)
        puts "second"
        p @currentCode
    end

    def createCode
        puts "first"
        p @currentCode
        puts "Time to make the code! Enter a 4 digit code of numbers between 1 and 6."
        chooseCode()
    end







# #########    CODE BREAKER METHODS BELOW    ##########

# cpu creates random code for player to break
    def cpuCreateCode
        @currentCode = Array.new(4) { rand(1..6) }
    end

    def guessCode
        if @turnNumber < 12
            puts "Time for guess ##{@turnNumber}. Choose wisely, you have #{(13 - @turnNumber)} guesses left."
        else
            puts "Time for your last attempt at breaking the code. Good luck."
        end
        guess = gets.chomp.split("")
        p guess
        until guess.length == 4 && guess.all? { |digit| (digit.to_i >= 1) && (digit.to_i <= 6) } do 
            puts "Invalid code, please enter your code breaking attempt."
            guess = gets.chomp.split("")
        end
        @currentGuess = guess
        p "current guess updated to #{@currentGuess}"


         


    end



    # game mode where player guesses the cpu created code
    def codeBreaker
    end

    # game mode where cpu guesses the player created code
    def codeMaker
    end

    def roundsTest
        puts @rounds
        roundsAmount()
        puts @rounds
    end





end


def brokenCheck()
    puts "Haven't broken it yet :)"
end

brokenCheck()

currentGame = Mastermind.new
# currentGame.randomNumber()
# currentGame.roundsAmount()
# currentGame.roundsTest()
# currentGame.chooseMode()
# currentGame.chooseCode()
# currentGame.createCode()
# currentGame.cpuCreateCode()
currentGame.guessCode()
