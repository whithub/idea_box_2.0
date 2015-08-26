class Idea < ActiveRecord::Base
  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :quality,     presence: true

  enum quality: %w(Swill Plausible Genius)
  # validates :status, inclusion: ['swill', 'plausible', 'genius']

end
