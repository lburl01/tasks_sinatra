require 'active_record'
require_relative 'schema'
require_relative 'environment'

class Task < ActiveRecord::Base
  validates :description, :priority, :completed, presence: true
end
