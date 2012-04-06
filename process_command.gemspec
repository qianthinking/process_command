# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{process_command}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Leon Li"]
  s.date = %q{2012-04-06}
  s.description = %q{Interprocess communication with command for ruby}
  s.email = %q{qianthinking@gmail.com}
  s.has_rdoc = true
  s.homepage = %q{https://github.com/qianthinking/process_command}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "RAlgorithms", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Interprocess communication with command for ruby.}
  s.files = Dir.glob("{lib}/**/*") + %w(README.md)

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
  end
end
