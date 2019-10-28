# frozen_string_literal: true

require 'execjs'

module Attractor
  class JsCalculator < BaseCalculator
    def initialize(file_prefix: '', minimum_churn_count: 3)
      super(file_prefix: file_prefix, file_extension: 'js', minimum_churn_count: minimum_churn_count)
    end

    def calculate
      super do |change|
        complexity, details = JSON.parse(`node #{__dir__}/../../../dist/calculator.bundle.js #{change[:file_path]}`)

        [complexity, details]
      end
    end
  end
end
