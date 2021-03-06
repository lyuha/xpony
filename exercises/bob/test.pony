use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_BobShoutTest)
    test(_BobQuestionTest)
    test(_BobSilentTest)
    test(_BobDefaultTest)

class iso _BobShoutTest is UnitTest
  """
  Test matching when Bob is shouted at
  """
  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): None ? =>
    let shout_resp: String = "Whoa, chill out!"

    h.assert_eq[String](shout_resp, Bob("WATCH OUT!"))
    h.assert_eq[String](shout_resp, Bob("WHAT THE HELL WERE YOU THINKING?"))
    h.assert_eq[String](shout_resp, Bob("1, 2, 3 GO!"))
    h.assert_eq[String](shout_resp, Bob("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))

class iso _BobQuestionTest is UnitTest
  """
  Test matching when Bob is questioned
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): None ? =>
    let ques_resp: String = "Sure."

    h.assert_eq[String](ques_resp, Bob("Does this cryogenic chamber make me look fat?"))
    h.assert_eq[String](ques_resp, Bob("You are, what, like 15?"))
    h.assert_eq[String](ques_resp, Bob("4?"))
    h.assert_eq[String](ques_resp, Bob("Wait! Hang on. Are you going to be OK?"))

class iso _BobSilentTest is UnitTest
  """
  Test matching when Bob faces silence
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): None ? =>
    let silent_resp: String = "Fine. Be that way!"

    h.assert_eq[String](silent_resp, Bob(""))
    h.assert_eq[String](silent_resp, Bob("   "))

class iso _BobDefaultTest is UnitTest
  """
  Test matching when Bob is defaulting
  """

  fun name(): String => "bob/Bob"

  fun apply(h: TestHelper): None ? =>
    let default_resp: String = "Whatever."

    h.assert_eq[String](default_resp, Bob("Tom-ay-to, tom-aaaah-to."))
    h.assert_eq[String](default_resp, Bob("Let's go make out behind the gym!"))
    h.assert_eq[String](default_resp, Bob("It's OK if you don't want to go to the DMV."))
    h.assert_eq[String](default_resp, Bob("1, 2, 3"))
    h.assert_eq[String](default_resp, Bob("Ending with ? means a question."))
