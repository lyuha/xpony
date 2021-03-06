use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_LeapTest)

class iso _LeapTest is UnitTest
  """
  Test Leap package
  """
  fun name(): String => "leap/Leap"

  fun apply(h: TestHelper) =>
    // Note -> Current master-branch simplifies these functions to
    // assert_true/false, and removes expect
    // https://github.com/ponylang/ponyc/blob/master/packages/ponytest/helper.pony
    h.assert_true(Leap(1996), "Testing a leap year")
    h.assert_false(Leap(1997), "Testing an odd year")
    h.assert_false(Leap(1998), "Testing a non-leap even year")
    h.assert_false(Leap(1900), "Testing a century")
    h.assert_true(Leap(2000), "Testing an exceptional century")
