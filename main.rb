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
                  :playerPoints, :cpuPoints, :playerScore, :cpuScore

    def initialize 
        @gameMode = "maker/breaker"
        @rounds = 1
        @currentRound = 0
        @turnNumber = 0
        @currentCode = []
        @playerPoints = 0
        @cpuPoints = 0
        @playerScore = 0
        @cpuScore = 0
    end

    # asks uses how many rounds they want to play
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
currentGame.chooseMode()
