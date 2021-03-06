use v6.d;
my $camelia-svg = 'Camelia.svg'.IO.slurp;
my $camelia-ico = 'camelia-ico.bin'.IO.slurp;
my $camelia-faded-svg = 'Camelia-faded.svg'.IO.slurp;

%(
    'camelia-img' => sub ( %prm, %tml ) { $camelia-svg },
    'favicon' => sub ( %prm, %tml ) {
        "\n<link" ~ ' href="data:image/x-icon;base64,' ~ $camelia-ico ~ '" rel="icon" type="image/x-icon"' ~ "/>\n"
    },
    'camelia' => sub (%prm, %tml ) {
        '<img src="' ~ $camelia-svg ~'"'
                ~ ' class="' ~ ( %prm<class>:exists // 'camelia-css') ~ '"'
                ~ ( %prm<id>:exists ?? ( ' id="' ~ %prm<id> ~ '" ') !! '')
                ~ ">\n"
    },
    :camelia-faded( $camelia-faded-svg ),
)