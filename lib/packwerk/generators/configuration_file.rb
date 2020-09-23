# typed: true
# frozen_string_literal: true

require "packwerk/configuration"
require "erb"

module Packwerk
  module Generators
    class ConfigurationFile
      extend T::Sig

      CONFIGURATION_TEMPLATE_FILE_PATH = "templates/packwerk.yml.erb"

      class << self
        def generate(load_paths:, root:, out:)
          new(load_paths: load_paths, root: root, out: out).generate
        end
      end

      sig { params(load_paths: T::Array[String], root: String, out: T.any(StringIO, IO)).void }
      def initialize(load_paths:, root:, out: $stdout)
        @load_paths = load_paths
        @root = root
        @out = out

        set_template_variables
      end

      sig { returns(T::Boolean) }
      def generate
        @out.puts("📦 Generating Packwerk configuration file...")
        default_config_path = File.join(@root, ::Packwerk::Configuration::DEFAULT_CONFIG_PATH)

        if File.exist?(default_config_path)
          @out.puts("⚠️  Packwerk configuration file already exists.")
          return true
        end

        File.write(default_config_path, render)

        @out.puts("✅ Packwerk configuration file generated in #{default_config_path}")
        true
      end

      private

      def set_template_variables
        @load_paths_formatted = if @load_paths.empty?
          "# load_paths:\n# - 'app/models'\n"
        else
          @load_paths.map { |path| "- #{path}\n" }.join
        end

        @load_paths_comment = unless @load_paths.empty?
          "# These load paths were auto generated by Packwerk.\nload_paths:\n"
        end
      end

      def render
        ERB.new(template, trim_mode: "-").result(binding)
      end

      def template
        template_file_path = File.join(__dir__, CONFIGURATION_TEMPLATE_FILE_PATH)
        File.read(template_file_path)
      end
    end
  end
end
