class Conjuge < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :tipo
end