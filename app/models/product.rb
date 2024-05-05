class Product < ApplicationRecord
  belongs_to :company
  belongs_to :supplier, optional: true
  belongs_to :warehouse
  has_and_belongs_to_many :bundles
  has_many :products_purchase_orders
  has_many :purchase_orders, through: :products_purchase_orders
  before_validation :set_lead_time_to_default, if: -> { lead_time.nil? && company.default_lead_time.present? }
  before_validation :set_days_of_stock_to_default, if: -> { days_of_stock.nil? && company.default_days_of_stock.present? }
  before_validation :set_forecasting_days_to_default, if: -> { forecasting_days.nil? && company.default_forecasting_days.present? }

  def self.copy_vendors_as_suppliers(company)
    self.transaction do
      company.products.each do |product|
        supplier = company.suppliers.find_or_create_by(name: product.vendor)
        product.update(supplier: supplier)
      end
    rescue ActiveRecord::RecordInvalid => e
      return { errors: e.message, success: false}
    end
    return { success: true}
  end

  def set_lead_time_to_default
    self.lead_time = company.default_lead_time
  end

  def set_days_of_stock_to_default
    self.days_of_stock = company.default_days_of_stock
  end

  def set_forecasting_days_to_default
    self.forecasting_days = company.default_forecasting_days
  end
end