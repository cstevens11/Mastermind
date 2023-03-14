#playable mastermind game
class Mastermind
    # def randomNumber
    #     array = Array.new(20)
    #     # p array
    #     array.each_with_index do |cell, index|
    #         array[index] = rand(1..6)
    #     end
    #     p array
    # end
    def initialize 
        @gameMode = ""
        @rounds = ""
        @currentRound = 0
        @turnNumber = 0
        @currentCode = []
        @playerPoints = 0
        @cpuPoints = 0
        @playerScore = 0
        @cpuScore = 0
    end






end
def brokenCheck()
    puts "Haven't broken it yet :)"
end

brokenCheck()

currentGame = Mastermind.new
# currentGame.randomNumber()
