# typed: ignore
# frozen_string_literal: true

require "test_helper"
require "rails_test_helper"
require "packwerk/application_validator"

module Packwerk
  class ApplicationValidatorTest < Minitest::Test
    include FixtureHelper

    setup do
      @configuration = Packwerk::Configuration.from_path("test/fixtures/skeleton")
    end

    test "validity" do
      copy_template(:skeleton)
      result = validator.check_all
      assert result.ok?, result.error_value
    end

    test "check_package_manifests_for_privacy returns an error for unresolvable privatized constants" do
      copy_template(:minimal)
      merge_into_yaml_file("components/sales/package.yml", { "enforce_privacy" => ["Some::Constant"] })

      assert_raises(NameError) { validator.check_package_manifests_for_privacy }
    end

    test "returns error for mismatched inflections.yml file" do
      copy_template(:skeleton)
      merge_into_yaml_file("packwerk.yml", { "inflections_file" => "custom_inflections.yml" })

      result = validator.check_all

      refute(result.ok?, result.error_value)
    end

    test "works for custom inflections file with inflections matching ActiveSupport" do
      copy_template(:skeleton)
      merge_into_yaml_file("packwerk.yml", { "inflections_file" => "custom_inflections.yml" })

      inflections = ActiveSupport::Inflector.inflections.deep_dup
      Packwerk::Inflections::Custom.new(
        path_to("custom_inflections.yml")
      ).apply_to(inflections)

      ActiveSupport::Inflector.expects(:inflections).returns(inflections).at_least_once

      result = validator.check_all

      assert(result.ok?, result.error_value)
    end

    def validator
      @application_validator ||= Packwerk::ApplicationValidator.new(
        config_file_path: config.config_path,
        application_load_paths: config.all_application_autoload_paths,
        configuration: config
      )
    end
  end
end
