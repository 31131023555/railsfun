class Product < ActiveRecord::Base
 extend Enumerize
 belongs_to :category, optional: true
 validates :title, :description, presence: true
 validate :title_is_shorter_than_description
 validates :price, presence: true, numericality: { greater_than: 0 }
 #before_save :strip_html_from_description
 #before_save :lower_case_title_2
 #before_validation :lower_case_title

# scope :active,        -> { where(published: true) }
# scope :priced_more_than, -> (price) { where('price > ?', price) }

 #def strip_html_from_description
 #  self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
 #end

 #def lower_case_title
 #  self.title = title.downcase
 #end

 #def lower_case_title_2
 #  self.title = title.downcase
 #end

 enumerize :level, in: [:easy, :medium, :hard]

 def title_is_shorter_than_description
 	return if title.blank? or description.blank?
 	if description.length < title.length
 		errors.add(:description, 'can not be shorter han title')
 	end
 end

end