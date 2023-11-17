# frozen_string_literal: true

# This migration creates the ApplicationRecord class.

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
