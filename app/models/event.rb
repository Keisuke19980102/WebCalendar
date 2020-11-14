class Event < ApplicationRecord
    validates :name, {presence: true}
    validates :start_year, {presence: true}
    validates :start_month, {presence: true}
    validates :start_day, {presence: true}
    validates :start_hour, {presence: true}
    validates :end_year, {presence: true}
    validates :end_month, {presence: true}
    validates :end_day, {presence: true}
    validates :end_hour, {presence: true}
end
