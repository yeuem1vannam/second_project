SecondProject::Application do
  # Speed up tests by lowering BCrypt's cost function.
  require 'bcrypt'
  silence_warnings do
    BCrypt::Engine::DEFAULT_COST = BCrypt::Engine::MIN_COST
  end
end
