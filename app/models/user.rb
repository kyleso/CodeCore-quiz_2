class User < ApplicationRecord
  has_many :ideas, dependent: :nullify
end
