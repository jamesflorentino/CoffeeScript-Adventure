# 1. Binding model events in the collection
# ------------------------------------------------------------
# I discovered that you can bind events in the collection
# extension with the `change:attribute` event name which makes
# things easier to debug

class User extends Backbone.Model
  defaults:
    karmaPoints: 0

class Users extends Backbone.Collection
  initialize: ->
    @on 'change:karmaPoints', @karmaUpdate

  karmaUpdate: (user) =>
    karmaMogul = @max (user) -> user.get 'Karma'
    @trigger 'karmaMogul', karmaMogul


# 2. Implementing a `close` event to the Backbone View
# ------------------------------------------------------------
# Sometimes we need to be sure that we're removing all events
# from the view for garbage collection.
# source: http://lostechies.com/derickbailey/2011/09/15/zombie
# s-run-managing-page-transitions-in-backbone-apps/

# Backbone.View.prototype.close
# - we add a close method to remove events and the element from the
#   viewport.
Backbone.View::close = ->
  do @remove # aka @$el.remove()
  do @unbind # unbinds all events
  do @onClose if @onClose? # remove any event bindings

class Photo extends Backbone.View
  events:
    'click .delete': 'remove'
  
  initialize: ->
    @model.on 'change:name', @nameChange

  onClose: =>
    @model.off 'change:name', @nameChange

  nameChange: (model) =>
    @$el.find('.name').text model.get 'name'

  remove: =>
    do @close
