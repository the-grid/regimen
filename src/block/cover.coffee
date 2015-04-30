equality = require "./helpers/equality"
existence = require "./helpers/existence"

module.exports = (chai, utils) ->
  property = "cover"
  equality.call @, chai, utils, property
  existence.call @, chai, utils, property

  addOrientationMethod = (name) ->
    chai.Assertion.addMethod name, (orientation) ->
      block = @_obj
      {cover} = block

      if orientation?
        expected = orientation
        actual = cover?.orientation

        @assert(
          expected is actual
          "expected block #{block.id} to have a cover with orientation \#{exp} but got \#{act}"
          "expected block #{block.id} to have a cover without orientation \#{exp} but got \#{act}"
          expected
          actual
        )

      else
        @assert(
          cover?.orientation?
          "expected block #{block.id} to have a cover with an orientation"
          "expected block #{block.id} to have a cover without an orientation"
        )

  addOrientationMethod "orientation"
  addOrientationMethod "oriented"
