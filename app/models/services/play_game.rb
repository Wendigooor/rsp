module Services
  class PlayGame

    def perform(user_throw)
      return { result: 'Make your turn!', opponent_throw: nil } unless user_throw

      throw_via_api = ::Services::ThrowViaAPI.new.perform
      opponent_throw =
        if ::Throw::POSSIBLE_ACTIONS.include?(throw_via_api)
          throw_via_api
        else
          ::Services::RandomThrowLocally.new.perform
        end

      ::Services::DetermineWinner.new(user_throw, opponent_throw).perform
    end
  end
end