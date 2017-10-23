class Job < ApplicationRecord
  belongs_to :user
  belongs_to :corp
  validates_uniqueness_of :user_id, scope: :corp_id

  def corp_name
    corp.name
  end
end
