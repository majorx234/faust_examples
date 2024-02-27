import("stdfaust.lib");

echo_damp = hslider("echo damp", 0.5, 0, 1.0, 0.01) : si.smoo;
echo_length = hslider("echo length", 48000, 1000, 48000, 1000);

echo(f,l) = A~B
with {
  A = +;
  B = _ @ (l) * f;
};

freq = hslider("freq", 440, 50, 2000, 0.1) : si.smoo;
gain = hslider("gain", 0.5, 0 ,1, 0.01) : si.smoo;
gate = button("gate");

envelope = en.asr(0.1, 1, 1, gate);
envelope_lfo = en.ar(0,1,gate);
lfo_envelope = aa.sine(10*envelope_lfo);
process = os.sawtooth(freq)  *envelope*gain*lfo_envelope: fi.resonlp(500 + envelope * 3000,7,1):_  <: (_,_ );
