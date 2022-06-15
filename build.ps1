$outdir = "output"

if (-not (Test-Path $outdir -PathType Container)) {
  New-Item $outdir -ItemType Directory | Out-Null
}

$attrsHash = @{
  Nfontname = "Arimo";
  Nfontcolor = "/greys4/4";
  Gfontname = "Arial";
  Gfontcolor = "/greys8/6";
  Gbgcolor = "/greys9/2";
  Gpad = "0.75"
}

$attrs = @();

foreach ($pair in $attrsHash.GetEnumerator()) {
  $attrs += "-$($pair.Name)=$($pair.Value)"
}

Get-ChildItem -File -Filter *.dot | ForEach-Object {
  dot -Tpng $attrs $_.FullName -o (Join-Path $outdir ($_.BaseName + ".png"))
}