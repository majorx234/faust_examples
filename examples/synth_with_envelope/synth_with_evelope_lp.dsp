import("stdfaust.lib");

freq = hslider("freq", 440, 50, 2000, 0.1);
gain = hslider("gain", 0.5, 0 ,1, 0.01);
gate = button("gate");

envelope = en.asr(1, 1, 1, gate);
process = os.sawtooth(freq)*envelope*gain: fi.resonlp(5000,7,1);
