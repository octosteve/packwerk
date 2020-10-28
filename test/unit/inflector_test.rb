# typed: false
# frozen_string_literal: true

require "test_helper"

require "packwerk/inflector"

module Packwerk
  class InflectorTest < Minitest::Test
    def setup
      @inflector = Inflector.new
    end

    test "acts like activesupport inflector" do
      assert_operator Inflector.ancestors, :include?, ActiveSupport::Inflector
    end

    test "uses default inflections" do
      assert_equal(
        "Order",
        @inflector.classify("orders")
      )

      assert_equal(
        "Ox",
        @inflector.classify("oxen")
      )
    end

    test "#pluralize will pluralize when count not 1" do
      assert_equal "things", @inflector.pluralize("thing", 3)
      assert_equal "things", @inflector.pluralize("thing", -5)
      assert_equal "things", @inflector.pluralize("thing", 0)
      assert_equal "things", @inflector.pluralize("things", 1000)
    end

    test "#pluralize will singularize when count is 1" do
      assert_equal "thing", @inflector.pluralize("thing", 1)
      assert_equal "thing", @inflector.pluralize("things", 1)
    end

    test "#apply_inflections will apply any custom inflections from file" do
      file = "./test/fixtures/skeleton/custom_inflections.yml"
      custom_inflector = custom_inflector_for(file)

      expected_inflections = {
        "acronym" => ["GraphQL", "MRuby", "TOS"],
        "irregular" => [["analysis", "analyses"], ["reserve", "reserves"]],
        "uncountable" => ["payment_details"],
      }

      assert_equal custom_inflector.inflections, expected_inflections
    end

    test "#apply_inflections will not apply any custom inflections if there aren't any" do
      file = "no_inflections_here.yml"
      custom_inflector = custom_inflector_for(file)

      assert_empty custom_inflector.inflections
    end

    private

    def custom_inflector_for(file)
      custom_inflector = Packwerk::Inflections::Custom.new(file)
      Inflector.new(custom_inflector: custom_inflector).apply_all_inflections
      custom_inflector
    end
  end
end
