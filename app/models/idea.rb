class Idea < ActiveRecord::Base
  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :quality,     presence: true

  enum quality: %w(swill plausible genius)

  def upvote
    if quality == 'swill'
      self.quality = 'plausible'
    elsif quality == 'plausible'
      self.quality = 'genius'
    end
  end

  def downvote
    if quality == 'genius'
      self.quality = 'plausible'
    elsif quality == 'plausible'
      self.quality = 'swill'
    end
  end
end
