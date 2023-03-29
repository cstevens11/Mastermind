# playable mastermind game
class Mastermind

    attr_accessor :gameMode, :rounds, :currentRound, :turnNumber, :currentCode,
                  :currentGuess, :playerPoints, :cpuPoints, :playerScore, :cpuScore, :winner

    def initialize 
        @gameMode = "breaker"
        @rounds = 1
        @currentRound = 1
        @turnNumber = 0
        @currentCode = []
        @currentGuess = []
        @playerPoints = 0
        @cpuPoints = 0
        @playerScore = 0
        @cpuScore = 0
        @winner = false
    end

    # asks user how many rounds userr wants to play and verifies input is integer
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
        puts "The cpu has thought hard and created a code. Your attempts at guessing it may begin."
        @currentCode = Array.new(4) { rand(1..6) }
        # @currentCode = [1,1,1,1]
        # p "shhhhh the code is #{@currentCode}"
    end

    def guessCode
        if @turnNumber < 12
            puts "Time for guess ##{@turnNumber}. Choose wisely, you have #{(13 - @turnNumber)} guesses left."
        else
            puts "Time for your last attempt at breaking the code. Good luck."
        end
        guess = gets.chomp.split("")
        guess = guess.map { |str| str.to_i }
        p guess
        until guess.length == 4 && guess.all? { |digit| (digit.to_i >= 1) && (digit.to_i <= 6) } do 
            puts "Invalid code, please enter your code breaking attempt."
            guess = gets.chomp.split("")
            guess = guess.map { |str| str.to_i }
        end
        @currentGuess = guess
        p "current guess updated to #{@currentGuess}"
    end

    def attemptBreak
        tempCode = @currentCode.clone
        tempGuess = @currentGuess.clone
        matches = 0
        mismatches = 0
        if @currentCode == @currentGuess
            puts "Congrats, you have broken the code"
            @cpuScore += (@turnNumber - 1)
            puts "cpu Score is #{@cpuScore}"
            @winner = true
        else
            tempGuess.each_with_index do |gdigit, gindex|
                tempCode.each_with_index do |cdigit, cindex|
                    if gdigit == cdigit && gindex == cindex
                        matches += 1
                        tempGuess[gindex] = 0
                        tempCode[cindex] = 0
                        # puts "current code #{@currentCode} current guess #{@currentGuess}"
                        # puts "matches just changed temp code to #{tempCode} and temp guess to #{tempGuess}"
                        break
                    end
                end
            end

            tempGuess.each_with_index do |gdigit, gindex|
                tempCode.each_with_index do |cdigit, cindex|
                    if  cdigit != 0 && gdigit == cdigit 
                        mismatches += 1 
                        tempGuess[gindex] = 0
                        tempCode[cindex] = 0
                        # puts "current code #{@currentCode} current guess #{@currentGuess}"
                        # puts "mismatches just changed temp code to #{tempCode} and temp guess to #{tempGuess}"
                        break
                    end
                end
            end
            puts "you have #{matches} digits in the correct position and #{mismatches} digits in the incorrect position, turn number is #{@turnNumber}"
        end
    end

    # game mode where player guesses the cpu created code
    def playCodeBreaker
        @winner = false
        cpuCreateCode()
        until @turnNumber == 12 || @winner == true do 
            @turnNumber += 1
            guessCode()
            attemptBreak()
        end
    end

    # game mode where cpu guesses the player created code
    def codeMaker
    end
    def cpuGuess
    end

    # def roundsTest
    #     puts @rounds
    #     roundsAmount()
    #     puts @rounds
    # end
end

def rules 
    puts "----------------Rules!----------------
When started, the computer will create a 4 digit code.
The code will only contain the numbers 1-6.
Try to guess in as few moves as possible!

After guessing, you will be shown how many digits you have in the correct position,
as well as how many correct digits you have in the incorrect position.

Good Luck!    
--------------------------------------"
end
# def brokenCheck()
#     puts "Haven't broken it yet :)"
# end

# brokenCheck()

currentGame = Mastermind.new
# currentGame.roundsAmount()
# currentGame.roundsTest()
# currentGame.chooseMode()
# currentGame.chooseCode()
# currentGame.createCode()
# currentGame.cpuCreateCode()
# currentGame.guessCode()
# currentGame.attemptBreak()
rules()
currentGame.playCodeBreaker()
# currentGame.codeMaker()

