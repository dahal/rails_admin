class NestedFieldTest
  include Mongoid::Document

  field :title, type: String
  belongs_to :field_test, inverse_of: :nested_field_tests
  belongs_to :another_field_test, inverse_of: :nested_field_tests
  include Mongoid::Timestamps

  has_one :comment, as: :commentable, autosave: true
  accepts_nested_attributes_for :comment, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
end
