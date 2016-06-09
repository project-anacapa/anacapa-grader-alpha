class Course < ActiveRecord::Base
  validates :dept, :presence => true
  validates :num, :presence => true
  validates :desc, :presence => true
  validates :term, :presence => true

  def course_slug
    return [self.dept, self.num, self.term].join "_"
  end
end
