escape = (editor) ->
  text = editor.replaceSelectedText {}, JSON.stringify

unescape = (editor) ->
  text = editor.replaceSelectedText {}, JSON.parse

module.exports =
  atomJsonEscapeView: null

  activate: (state) ->
    atom.workspaceView.command 'atom-json-escape:escape', '.editor', ->
      editor = atom.workspaceView.getActivePaneItem()
      escape(editor)

    atom.workspaceView.command 'atom-json-escape:unescape', '.editor', ->
      editor = atom.workspaceView.getActivePaneItem()
      unescape(editor)

  deactivate: ->
    @atomJsonEscapeView.destroy()

  serialize: ->
    atomJsonEscapeViewState: @atomJsonEscapeView.serialize()
