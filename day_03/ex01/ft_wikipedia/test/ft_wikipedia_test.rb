require 'test_helper'

class FtWikipediaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FtWikipedia::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_works_with_kiss
    assert_equal 16, Ft_Wikipedia.search("Kiss"), "================= test avec Kiss"
  end

  def test_it_arrive_to_Philosophy
    assert_output (/Philosophy/) { Ft_Wikipedia.search("Philosophy") }
    assert_output (/Philosophy/) { Ft_Wikipedia.search("kiss") }
    assert_output (/Philosophy/) { Ft_Wikipedia.search("Einstein") }
  end

  def test_it_detects_loops_with_France
    puts "================= test avec France qui boucle"
    assert_nil Ft_Wikipedia.search("France")
  end

  def test_it_detects_dead_ends_with_PilouXvfg
    puts "================= test avec PilouXvfg qui pete"
    assert_nil Ft_Wikipedia.search("PilouXvfg")
  end

end
