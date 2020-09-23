# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails-dom-testing` gem.
# Please instead update this file by running `dev typecheck update`.

# typed: true

class HTMLSelector
  def initialize(values, previous_selection = T.unsafe(nil), &root_fallback); end

  def context; end
  def css_selector; end
  def message; end
  def select; end
  def selecting_no_body?; end
  def tests; end

  private

  def extract_equality_tests; end
  def extract_root(previous_selection, root_fallback); end
  def extract_selectors; end
  def filter(matches); end

  class << self
    def context; end
  end
end

HTMLSelector::NO_STRIP = T.let(T.unsafe(nil), Array)

module Rails
  extend(::ActiveSupport::Autoload)

  class << self
    def app_class; end
    def app_class=(_); end
    def application; end
    def application=(_); end
    def autoloaders; end
    def backtrace_cleaner; end
    def cache; end
    def cache=(_); end
    def configuration; end
    def env; end
    def env=(environment); end
    def gem_version; end
    def groups(*groups); end
    def initialize!(*args, &block); end
    def initialized?(*args, &block); end
    def logger; end
    def logger=(_); end
    def public_path; end
    def root; end
    def version; end
  end
end

module Rails::Dom
end

module Rails::Dom::Testing
end

module Rails::Dom::Testing::Assertions
  include(::Rails::Dom::Testing::Assertions::DomAssertions)
  include(::Rails::Dom::Testing::Assertions::SelectorAssertions::CountDescribable)
  include(::Rails::Dom::Testing::Assertions::SelectorAssertions)
  extend(::ActiveSupport::Concern)
end

module Rails::Dom::Testing::Assertions::DomAssertions
  def assert_dom_equal(expected, actual, message = T.unsafe(nil)); end
  def assert_dom_not_equal(expected, actual, message = T.unsafe(nil)); end

  protected

  def compare_doms(expected, actual); end
  def equal_attribute?(attr, other_attr); end
  def equal_attribute_nodes?(nodes, other_nodes); end
  def equal_children?(child, other_child); end

  private

  def fragment(text); end
end

module Rails::Dom::Testing::Assertions::SelectorAssertions
  include(::Rails::Dom::Testing::Assertions::SelectorAssertions::CountDescribable)

  def assert_select(*args, &block); end
  def assert_select_email(&block); end
  def assert_select_encoded(element = T.unsafe(nil), &block); end
  def css_select(*args); end

  private

  def assert_size_match!(size, equals, css_selector, message = T.unsafe(nil)); end
  def document_root_element; end
  def nest_selection(selection); end
  def nodeset(node); end
end

module Rails::Dom::Testing::Assertions::SelectorAssertions::CountDescribable
  extend(::ActiveSupport::Concern)


  private

  def count_description(min, max, count); end
  def pluralize_element(quantity); end
end

class SubstitutionContext
  def initialize; end

  def match(matches, attribute, matcher); end
  def substitute!(selector, values, format_for_presentation = T.unsafe(nil)); end

  private

  def matcher_for(value, format_for_presentation); end
  def substitutable?(value); end
end
