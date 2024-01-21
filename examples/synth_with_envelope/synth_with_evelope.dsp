import("stdfaust.lib");

freq_base = hslider("freq", 440, 50, 2000, 0.02);
gain = hslider("gain", 0.5, 0, 1, 0.01);
gate = button("");

envelope = en.asr(0.1, 1, 0.1, gate);
process = os.sawtooth(freq_base)*envelope*gain <: (_,_);
