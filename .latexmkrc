# Configuración global de compilación para LaTeX (Documento V&V)

$out_dir = 'build';

use File::Path qw(make_path);
foreach my $sub (qw(
    front cap01 cap02 cap03 cap04 cap05 cap06 cap07
)) {
    make_path("$out_dir/sections/$sub");
}

$pdf_mode = 1;
$max_repeat = 7;

$pdflatex = 'internal mypdflatex %O %S';
sub mypdflatex {
    my @args = @_;
    my $ret = system('pdflatex', '-interaction=nonstopmode',
                     '-synctex=1', '-shell-escape', @args);
    my $base = $args[-1];
    $base =~ s/\.tex$//;
    $base =~ s{.*/}{};
    my $log = "$out_dir/$base.log";
    if ($ret != 0 && -e $log) {
        open(my $fh, '<', $log) or return $ret;
        local $/; my $content = <$fh>; close($fh);
        return 0 if $content =~ /Output written on/;
    }
    return $ret;
}

$clean_ext = 'aux out log toc bbl blg synctex.gz fls fdb_latexmk vrb snm nav run.xml bcf';
