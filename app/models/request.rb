class Request < ApplicationRecord
  scope :pending, -> {where(request_status:0)}
  scope :accepted, -> {where(request_status:1)}
end
