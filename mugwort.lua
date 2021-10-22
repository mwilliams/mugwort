guitar = _path.dust.."audio/stems/guitar.wav"
kick = _path.dust.."audio/stems/kick.wav"

local a = arc.connect(1)


-- file = _path.dust.."audio/tehn/drumev.wav"

function init()
  play_guitar()
  play_kick()
  -- TODO: Look at https://github.com/justmat/larc/blob/main/larc.lua#L164
end

function a.delta(n, d)
  softcut.level(n, d)
end
 
function play_kick()
  -- read file into buffer
  -- buffer_read_mono (file, start_src, start_dst, dur, ch_src, ch_dst)
  softcut.buffer_clear_channel(2)
  softcut.buffer_read_mono(kick,0,1,300,1,2)
  softcut.enable(2,1)
  softcut.buffer(2,2)
  softcut.level(2,1.0)
  softcut.loop(2,0)
  softcut.loop_start(2,1)
  softcut.loop_end(2,300)
  softcut.position(2,1)
  softcut.rate(2,1.0)
  softcut.play(2,1)
end

function play_guitar()
  -- clear buffer
    softcut.buffer_clear_channel(1)

  -- read file into buffer
  -- buffer_read_mono (guitar, start_src, start_dst, dur, ch_src, ch_dst)
  softcut.buffer_read_mono(guitar,0,1,300,1,1)
  softcut.enable(1,1)
  softcut.buffer(1,1)
  softcut.level(1,1.0)
  softcut.loop(1,0)
  softcut.loop_start(1,1)
  softcut.loop_end(1,300)
  softcut.position(1,1)
  softcut.rate(1,1.0)
  softcut.play(1,1)
end