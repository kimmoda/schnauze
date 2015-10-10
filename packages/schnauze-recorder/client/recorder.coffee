AUDIO_DURATION = 30

class Recorder

  desktop: false

  record: () ->
    return if @desktop
    console.log 'start recording'
    window.plugins.audioRecorderAPI.record ((msg) ->
      console.log '[recorder:record] success', msg
      return
    ), ((msg) ->
      console.log '[recorder:record] error', msg
      return
    ), AUDIO_DURATION
    return

  stop: () ->
    return if @desktop

    self = @
    window.plugins.audioRecorderAPI.stop ((msg) ->
      console.log '[recorder:stop] success', msg
      window.resolveLocalFileSystemURL 'file://' + msg, self.onResolveLocalFileSystemSuccess, self.onResolveLocalFileSystemError
      return
    ), ((msg) ->
      console.log '[recorder:stop] error', msg
      return
    ), AUDIO_DURATION
    return

  playback: () ->
    return if @desktop

    window.plugins.audioRecorderAPI.playback ((msg) ->
      console.log '[recorder:playback] success', msg
      return
    ), ((msg) ->
      console.log '[recorder:playback] error', msg
      return
    ), AUDIO_DURATION
    return
  
  # file handling
  onResolveLocalFileSystemSuccess: (res) ->
    console.log '[recorder:resolveLocalFileSystemURL] success', res
    res.file ((file) ->
      Schnauze.EventEmitter.emit 'Recorder:stopRecording',
        file: file
      console.log '[recorder:file] success', file
      return
    ), (err) ->
      console.log '[recorder:file] err', err
      return
    return

  onResolveLocalFileSystemError: (err) ->
    console.log '[recorder:resolveLocalFileSystemURL] error', err
    return

Schnauze.Recorder = new Recorder
Schnauze.Recorder.desktop = true unless Meteor.isCordova