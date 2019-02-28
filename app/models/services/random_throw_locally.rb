module Services
  class RandomThrowLocally

    def perform
      Throw::POSSIBLE_ACTIONS.sample
    end
  end
end