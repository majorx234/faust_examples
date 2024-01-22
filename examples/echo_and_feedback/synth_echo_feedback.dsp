import("stdfaust.lib");

echo_damp = hslider("echo damp", 0.5, 0, 1.0, 0.01);
echo_length = hslider("echo length", 48000, 1000, 48000, 1000);

echo(f,l) = A~B
with {
  A = +;
  B = _ @ (l) * f;
};

freq = hslider("freq", 440, 50, 2000, 0.1);
gain = hslider("gain", 0.5, 0 ,1, 0.01);
pan = hslider("pan",0.5 , 0 , 1, 0.01);
gate = button("gate");

envelope = en.asr(0.1, 1, 1, gate);
process = os.sawtooth(freq)  *envelope*gain: fi.resonlp(500 + envelope * 3000,7,1):_ : echo(echo_damp, echo_length) <: (_*pan,_ *(1-pan));
