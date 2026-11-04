## Block every lib cell whose SITE is CoreSiteDouble.
## The floorplan only has CoreSite rows, so the optimizer must not insert such cells
## (e.g. BUFX2 -> FE_OFC* buffers caused IMPSP-365).
## dont-use settings are not reliably kept across restoreDesign, so source this in every stage that optimizes.
## -p2 : head.libCells.site.name -> go up 2 levels (name -> site -> libCell) to get the CELL objects
set double_site_cells [dbGet [dbGet -p2 head.libCells.site.name CoreSiteDouble].name]
puts "dont_use CoreSiteDouble cells ([llength $double_site_cells]): $double_site_cells"
foreach c $double_site_cells {
    setDontUse $c true
}
