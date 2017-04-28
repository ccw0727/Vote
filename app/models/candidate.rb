class Candidate < ApplicationRecord
  validates :name,presence: true
  has_many :logs
  
  def display_name
    "#{name}(#{party})"
  end
  
  def vote
    self.votes=self.votes + 1
    #也可以用 increment(:votes) ,結果一樣
    save
    
  end
end