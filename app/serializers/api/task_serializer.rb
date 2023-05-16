# frozen_string_literal: true

class API::TaskSerializer < ActiveModel::Serializer
  attributes :title,
             :state
end
