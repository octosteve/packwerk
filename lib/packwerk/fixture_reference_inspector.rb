# typed: strict
# frozen_string_literal: true

require "packwerk/constant_name_inspector"
require "packwerk/fixture_reference_inspector/fixture_retriever"
require "packwerk/node"

module Packwerk
  # Exracts the constant reference from a fixture call
  class FixtureReferenceInspector
    extend T::Sig
    include ConstantNameInspector

    sig { params(root_path: String).void }
    def initialize(root_path:)
      @root_path = T.let(File.join(root_path, "test/fixtures"), String)
    end

    sig { override.params(node: ::AST::Node, ancestors: T::Array[::AST::Node]).returns(T.nilable(String)) }
    def constant_name_from_node(node, ancestors:)
      return unless applies?(node)
      return unless (fixture = retrieve_fixture(node))

      constant = fixture.model_class
      if constant.start_with?("::")
        constant
      else
        "::#{constant}"
      end
    end

    private

    sig { returns(String) }
    attr_reader :root_path

    sig { params(node: ::AST::Node).returns(T::Boolean) }
    def applies?(node)
      return false unless Node.method_call?(node)
      arguments = Node.method_arguments(node)
      return false if arguments.length != 1
      return false unless Node.symbol?(arguments[0])

      true
    end

    sig { params(node: ::AST::Node).returns(T.nilable(Fixture)) }
    def retrieve_fixture(node)
      method_name = Node.method_name(node).to_s
      fixture_retriever.find_by!(method_name: method_name)
    end

    sig { returns(FixtureRetriever) }
    def fixture_retriever
      @fixture_retriever = T.let(@fixture_retriever, T.nilable(FixtureRetriever))

      @fixture_retriever ||= FixtureRetriever.new(root_path)
    end
  end
end
