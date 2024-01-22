import("stdfaust.lib");

echo_damp = hslider("echo damp", 0.5, 0, 1.0, 0.01);
echo(f) = A~B
with {
  A = +;
  B = _ @ 48000 * f;
};
process = echo(echo_damp);
