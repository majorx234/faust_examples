import("effect.lib");

whitenoise = +(12345) ~ *(1103515245) : /(214783647.0);

wind(f) = whitenoise : moog_vcf_2bn(f, freq)
    with {
        freq = (f*87)+1 : pianokey2hz : smooth(0.9999);
    };

force = hslider("force[accx: 1 0 0 0][owl: parameter_a]", 0, -0.98, 0.98, 0.01) : abs;

process = force : wind <: (_,_);
