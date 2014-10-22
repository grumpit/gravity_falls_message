# encoding: utf-8

require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda/context'
require 'shoulda/matchers'
require 'pry'

require 'gravity_falls_message'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new 