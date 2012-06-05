# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

HashDiffDemo.views ||= {}

class HashDiffDemo.views.HomeView
  constructor: ->
    @bind()

  bind:->
    $("#json-compare-btn").click ->
      $("#json-spinner").toggleClass("hide")

      obj1 = $("#json-one-area").val()
      obj2 = $("#json-two-area").val()

      $.post "/diff", {obj1: obj1, obj2: obj2, type: "json"}, (response)->
        $("#json-spinner").toggleClass("hide")
        $("#json-compare-results").html(response)

    $("#yaml-compare-btn").click ->
      $("#yaml-spinner").toggleClass("hide")

      obj1 = $("#yaml-one-area").val()
      obj2 = $("#yaml-two-area").val()

      $.post "/diff", {obj1: obj1, obj2: obj2, type: "yaml"}, (response)->
        $("#yaml-spinner").toggleClass("hide")
        $("#yaml-compare-results").html(response)
