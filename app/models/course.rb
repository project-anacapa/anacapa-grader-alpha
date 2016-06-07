class Course < ActiveRecord::Base
  validates :dept, :presence => true
  validates :num, :presence => true
  validates :desc, :presence => true
  validates :term, :presence => true

  def course_slug
    return [dept, num, term].join "_"
  end

end
