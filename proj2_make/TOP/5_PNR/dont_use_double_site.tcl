## Block every lib cell whose SITE is CoreSiteDouble.
## The floorplan only has CoreSite rows, so the optimizer must not insert such cells
## (e.g. BUFX2 -> FE_OFC* buffers caused IMPSP-365).
## dont-use settings are not reliably kept across restoreDesign, so source this in every stage that optimizes.
foreach c [dbGet [dbGet -p head.libCells.site.name CoreSiteDouble].name] {
    setDontUse $c true
}
