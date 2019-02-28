module Services
  class DetermineWinner

    def initialize(user_throw, opponent_throw)
      @user_throw = user_throw
      @opponent_throw = opponent_throw
    end

    def perform
      check_params

      {
        result: determine_winner,
        user_throw: @user_throw,
        opponent_throw: @opponent_throw
      }
    end

    def determine_winner
      return :tie if @user_throw == @opponent_throw
      return :victory if @user_throw == 'hammer'

      if @user_throw == 'rock' && @opponent_throw == 'paper'
        :defeat
      elsif @user_throw == 'rock' && @opponent_throw == 'scissors'
        :victory
      elsif @user_throw == 'scissors' && @opponent_throw == 'paper'
        :victory
      elsif @user_throw == 'scissors' && @opponent_throw == 'rock'
        :defeat
      elsif @user_throw == 'paper' && @opponent_throw == 'scissors'
        :defeat
      elsif @user_throw == 'paper' && @opponent_throw == 'rock'
        :victory
      end
    end

    def check_params
      invalid_params = @user_throw.nil? || @opponent_throw.nil?
      invalid_params_result = 'Your or opponent throw is incorrect! Please, try again.'
      return { result: invalid_params_result, opponent_throw: nil } if invalid_params
    end
  end
end