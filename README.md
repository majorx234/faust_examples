# Info
- learning use of tooling around Faust

# Examples
## 1.Stormy White Noise
## 2.Synth with Envelope
## 3.Echo and Feedback
- simple_echo.dsp
  - delay a side channel with `@` (48000 samples is 1sec)
- echo_with_feedback.dsp
  - use a slider to control length of feedback
  - doing real echo with `~` - rekursion operator
- synth_echo_feedback.dsp
  - having a complete chain of sound generation
  - an echo modul (now also with dampening)
  - a pan effect on stereo output
