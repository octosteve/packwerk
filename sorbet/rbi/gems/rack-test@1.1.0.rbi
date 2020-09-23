# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rack-test` gem.
# Please instead update this file by running `dev typecheck update`.

# typed: true

module Rack
  class << self
    def release; end
    def version; end
  end
end

Rack::CACHE_CONTROL = T.let(T.unsafe(nil), String)

Rack::CONTENT_LENGTH = T.let(T.unsafe(nil), String)

Rack::CONTENT_TYPE = T.let(T.unsafe(nil), String)

Rack::DELETE = T.let(T.unsafe(nil), String)

Rack::ETAG = T.let(T.unsafe(nil), String)

Rack::EXPIRES = T.let(T.unsafe(nil), String)

Rack::File = Rack::Files

Rack::GET = T.let(T.unsafe(nil), String)

Rack::HEAD = T.let(T.unsafe(nil), String)

Rack::HTTPS = T.let(T.unsafe(nil), String)

Rack::HTTP_COOKIE = T.let(T.unsafe(nil), String)

Rack::HTTP_HOST = T.let(T.unsafe(nil), String)

Rack::HTTP_PORT = T.let(T.unsafe(nil), String)

Rack::HTTP_VERSION = T.let(T.unsafe(nil), String)

Rack::LINK = T.let(T.unsafe(nil), String)

class Rack::MockSession
  def initialize(app, default_host = T.unsafe(nil)); end

  def after_request(&block); end
  def clear_cookies; end
  def cookie_jar; end
  def cookie_jar=(_); end
  def default_host; end
  def last_request; end
  def last_response; end
  def request(uri, env); end
  def set_cookie(cookie, uri = T.unsafe(nil)); end
end

Rack::OPTIONS = T.let(T.unsafe(nil), String)

Rack::PATCH = T.let(T.unsafe(nil), String)

Rack::PATH_INFO = T.let(T.unsafe(nil), String)

Rack::POST = T.let(T.unsafe(nil), String)

Rack::PUT = T.let(T.unsafe(nil), String)

Rack::QUERY_STRING = T.let(T.unsafe(nil), String)

Rack::RACK_ERRORS = T.let(T.unsafe(nil), String)

Rack::RACK_HIJACK = T.let(T.unsafe(nil), String)

Rack::RACK_HIJACK_IO = T.let(T.unsafe(nil), String)

Rack::RACK_INPUT = T.let(T.unsafe(nil), String)

Rack::RACK_IS_HIJACK = T.let(T.unsafe(nil), String)

Rack::RACK_LOGGER = T.let(T.unsafe(nil), String)

Rack::RACK_METHODOVERRIDE_ORIGINAL_METHOD = T.let(T.unsafe(nil), String)

Rack::RACK_MULTIPART_BUFFER_SIZE = T.let(T.unsafe(nil), String)

Rack::RACK_MULTIPART_TEMPFILE_FACTORY = T.let(T.unsafe(nil), String)

Rack::RACK_MULTIPROCESS = T.let(T.unsafe(nil), String)

Rack::RACK_MULTITHREAD = T.let(T.unsafe(nil), String)

Rack::RACK_RECURSIVE_INCLUDE = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_COOKIE_HASH = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_COOKIE_STRING = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_FORM_HASH = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_FORM_INPUT = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_FORM_VARS = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_QUERY_HASH = T.let(T.unsafe(nil), String)

Rack::RACK_REQUEST_QUERY_STRING = T.let(T.unsafe(nil), String)

Rack::RACK_RUNONCE = T.let(T.unsafe(nil), String)

Rack::RACK_SESSION = T.let(T.unsafe(nil), String)

Rack::RACK_SESSION_OPTIONS = T.let(T.unsafe(nil), String)

Rack::RACK_SESSION_UNPACKED_COOKIE_DATA = T.let(T.unsafe(nil), String)

Rack::RACK_SHOWSTATUS_DETAIL = T.let(T.unsafe(nil), String)

Rack::RACK_TEMPFILES = T.let(T.unsafe(nil), String)

Rack::RACK_URL_SCHEME = T.let(T.unsafe(nil), String)

Rack::RACK_VERSION = T.let(T.unsafe(nil), String)

Rack::RELEASE = T.let(T.unsafe(nil), String)

Rack::REQUEST_METHOD = T.let(T.unsafe(nil), String)

Rack::REQUEST_PATH = T.let(T.unsafe(nil), String)

Rack::SCRIPT_NAME = T.let(T.unsafe(nil), String)

Rack::SERVER_NAME = T.let(T.unsafe(nil), String)

Rack::SERVER_PORT = T.let(T.unsafe(nil), String)

Rack::SERVER_PROTOCOL = T.let(T.unsafe(nil), String)

Rack::SET_COOKIE = T.let(T.unsafe(nil), String)

Rack::TRACE = T.let(T.unsafe(nil), String)

Rack::TRANSFER_ENCODING = T.let(T.unsafe(nil), String)

module Rack::Test
  class << self
    def encoding_aware_strings?; end
  end
end

class Rack::Test::Cookie
  include(::Rack::Utils)

  def initialize(raw, uri = T.unsafe(nil), default_host = T.unsafe(nil)); end

  def <=>(other); end
  def domain; end
  def empty?; end
  def expired?; end
  def expires; end
  def http_only?; end
  def matches?(uri); end
  def name; end
  def path; end
  def raw; end
  def replaces?(other); end
  def secure?; end
  def to_h; end
  def to_hash; end
  def valid?(uri); end
  def value; end

  protected

  def default_uri; end
end

class Rack::Test::CookieJar
  def initialize(cookies = T.unsafe(nil), default_host = T.unsafe(nil)); end

  def <<(new_cookie); end
  def [](name); end
  def []=(name, value); end
  def delete(name); end
  def for(uri); end
  def get_cookie(name); end
  def merge(raw_cookies, uri = T.unsafe(nil)); end
  def to_hash; end

  protected

  def hash_for(uri = T.unsafe(nil)); end
end

Rack::Test::CookieJar::DELIMITER = T.let(T.unsafe(nil), String)

Rack::Test::DEFAULT_HOST = T.let(T.unsafe(nil), String)

class Rack::Test::Error < ::StandardError
end

Rack::Test::MULTIPART_BOUNDARY = T.let(T.unsafe(nil), String)

module Rack::Test::Methods
  extend(::Forwardable)

  def _current_session_names; end
  def authorize(*args, &block); end
  def basic_authorize(*args, &block); end
  def build_rack_mock_session; end
  def build_rack_test_session(name); end
  def clear_cookies(*args, &block); end
  def current_session; end
  def custom_request(*args, &block); end
  def delete(*args, &block); end
  def digest_authorize(*args, &block); end
  def env(*args, &block); end
  def follow_redirect!(*args, &block); end
  def get(*args, &block); end
  def head(*args, &block); end
  def header(*args, &block); end
  def last_request(*args, &block); end
  def last_response(*args, &block); end
  def options(*args, &block); end
  def patch(*args, &block); end
  def post(*args, &block); end
  def put(*args, &block); end
  def rack_mock_session(name = T.unsafe(nil)); end
  def rack_test_session(name = T.unsafe(nil)); end
  def request(*args, &block); end
  def set_cookie(*args, &block); end
  def with_session(name); end
end

Rack::Test::Methods::METHODS = T.let(T.unsafe(nil), Array)

class Rack::Test::MockDigestRequest
  def initialize(params); end

  def method; end
  def method_missing(sym); end
  def response(password); end
end

class Rack::Test::Session
  include(::Rack::Utils)
  include(::Rack::Test::Utils)
  extend(::Forwardable)

  def initialize(mock_session); end

  def authorize(username, password); end
  def basic_authorize(username, password); end
  def clear_cookies(*args, &block); end
  def custom_request(verb, uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def delete(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def digest_authorize(username, password); end
  def env(name, value); end
  def follow_redirect!; end
  def get(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def head(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def header(name, value); end
  def last_request(*args, &block); end
  def last_response(*args, &block); end
  def options(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def patch(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def post(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def put(uri, params = T.unsafe(nil), env = T.unsafe(nil), &block); end
  def request(uri, env = T.unsafe(nil), &block); end
  def set_cookie(*args, &block); end

  private

  def default_env; end
  def digest_auth_configured?; end
  def digest_auth_header; end
  def env_for(uri, env); end
  def headers_for_env; end
  def params_to_string(params); end
  def parse_uri(path, env); end
  def process_request(uri, env); end
  def retry_with_digest_auth?(env); end
end

class Rack::Test::UploadedFile
  def initialize(content, content_type = T.unsafe(nil), binary = T.unsafe(nil), original_filename: T.unsafe(nil)); end

  def content_type; end
  def content_type=(_); end
  def local_path; end
  def method_missing(method_name, *args, &block); end
  def original_filename; end
  def path; end
  def tempfile; end

  private

  def initialize_from_file_path(path); end
  def initialize_from_stringio(stringio, original_filename); end
  def respond_to_missing?(method_name, include_private = T.unsafe(nil)); end

  class << self
    def actually_finalize(file); end
    def finalize(file); end
  end
end

module Rack::Test::Utils
  include(::Rack::Utils)
  extend(::Rack::Utils)


  private

  def build_file_part(parameter_name, uploaded_file); end
  def build_multipart(params, first = T.unsafe(nil), multipart = T.unsafe(nil)); end
  def build_nested_query(value, prefix = T.unsafe(nil)); end
  def build_parts(parameters); end
  def build_primitive_part(parameter_name, value); end
  def get_parts(parameters); end

  class << self
    def build_file_part(parameter_name, uploaded_file); end
    def build_multipart(params, first = T.unsafe(nil), multipart = T.unsafe(nil)); end
    def build_nested_query(value, prefix = T.unsafe(nil)); end
    def build_parts(parameters); end
    def build_primitive_part(parameter_name, value); end
    def get_parts(parameters); end
  end
end

Rack::Test::VERSION = T.let(T.unsafe(nil), String)

Rack::UNLINK = T.let(T.unsafe(nil), String)

Rack::VERSION = T.let(T.unsafe(nil), Array)
