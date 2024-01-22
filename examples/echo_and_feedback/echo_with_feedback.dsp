import("stdfaust.lib");

echo = A~B
with {
  A = +;
  B = _ @ 48000 * 0.3;
};
process = echo;
