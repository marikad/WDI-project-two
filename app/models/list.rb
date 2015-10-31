class List < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  belongs_to :show
end
