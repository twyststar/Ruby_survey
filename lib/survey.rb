class Survey < ActiveRecord::Base
  
  has_many(:questions)
  validates(:name, :presence => true)

  before_save(:caps)

private

  def caps
    self.name=(name.split(/ |\_|\-/).map(&:capitalize).join(" "))
  end

end
