# Attributions — sources and terms for the demo datasets

Everything in `payload/` is **third-party Swiss open government data**, cropped to the
Innertkirchen–Mettlen study area and redistributed here for demonstration. None of it is covered
by the 3D-DSS software licence, and each source **requires source citation on reuse**.

This file is the reason the demo travels as its own artefact rather than as files inside the
software repository: when the data moves, its terms have to move with it.

## Terms in one sentence

**Every dataset here is Swiss open government data under "open use" terms that permit
commercial use and redistribution. None of them is copyleft** — no share-alike obligation
attaches to this repository, to the 3D-DSS software, or to anything you derive from either.
The strongest condition any of them imposes is *cite the source*.

Verified 2026-08-15 against the publishers' own metadata on
[opendata.swiss](https://opendata.swiss/) (the `rights` field each publisher sets per resource)
and swisstopo's OGD terms; `Building_Zones.json`, added in payload v1.1.0, was verified
2026-11-16 (details in its own section below). Terms are the provider's to set and can change;
re-check before a formal release.

### What the opendata.swiss categories mean

| Category | Commercial use | Source citation | Copyleft? |
|---|---|---|---|
| `terms_open` — *Open use* | allowed | **recommended** | no |
| `terms_by` — *Open use. Must provide the source.* | allowed | **required** | no |
| `terms_ask` | permission required | recommended | no |
| `terms_by_ask` | permission required | required | no |

Nothing in this payload falls under `terms_ask` or `terms_by_ask`, so **no dataset here requires
anyone's permission for commercial use**. opendata.swiss deliberately publishes *terms of use*
rather than Creative Commons licences; swisstopo states outright that CC licences are not
compatible with the Swiss legal basis (GeoIG / GeoIV).

## Vector datasets (`payload/data_2_data/`)

| File | Description | Provider | Terms |
|---|---|---|---|
| `ISOS_Objekte_160815.json` | ISOS — Federal Inventory of Swiss Heritage Sites of national importance | Federal Office of Culture (BAK/FOC) | `terms_by` — **cite the source** |
| `XYKGS_Objekte_merged_160815.json` | KGS / PBC — cultural-property-protection inventory, objects of national importance | Federal Office for Civil Protection (BABS/FOCP) | `terms_open` |
| `Park.json` | Swiss National Park & parks of national importance | Federal Office for the Environment (BAFU/FOEN) | `terms_by` — **cite the source** |
| `biores.json` | Biosphere reserves | BAFU/FOEN | `terms_by` — **cite the source** ⚠ see note |
| `aqua.json` | REN — national ecological network, rivers & lakes habitat | BAFU/FOEN | `terms_open` |
| `Earthquake_Zones.gpkg` | Seismic zones per building standard SIA 261 | BAFU/FOEN (with SED) | `terms_open` |
| `Building_Zones.json` | Building zones Switzerland (harmonised) — *Bauzonen Schweiz (harmonisiert)*, data status 1 January 2022 | Federal Office for Spatial Development (ARE), compiled from the cantonal spatial-planning offices | `terms_by` — **cite the source** ⚠ see its section |

Every dataset above is a **federal publication**. That is deliberate — see the exclusions below.
One of them, `Building_Zones.json`, is a federal publication *of cantonal source data*; why that
is nevertheless inside the line this file draws is explained in its own section.

ISOS carries an additional statement from its publisher: all ISOS data (maps, texts, photos) are
the intellectual property of the Confederation, **© BAK, Bern**. That is an attribution
requirement, consistent with `terms_by`, not a restriction on redistribution.

⚠ **One entry to confirm before a formal release:** `biores`. Swiss biosphere reserves are
administered as a category of *parks of national importance*, so it is recorded here under that
inventory's `terms_by`. Confirm with BAFU whether it was extracted from that inventory or from a
separate one. Either way it is `terms_open` or `terms_by`, so the copyleft answer is unaffected —
those differ only in whether citation is required, and this file provides it in both cases.

## Building zones (`payload/data_2_data/Building_Zones.json`)

**Source: Federal Office for Spatial Development ARE, cantonal spatial-planning offices**
(*Quelle: Bundesamt für Raumentwicklung ARE, Kantonale Raumplanungsfachstellen*) — the citation
the publisher prescribes. Dataset *Bauzonen Schweiz (harmonisiert)* / *Building zones Switzerland
(harmonized)*, **data status 1 January 2022**, the current vintage (earlier ones: 2012, 2017).

| | |
|---|---|
| Terms | `terms_by` — *Open use. Must provide the source.* |
| Verified | 2026-11-16 |
| Record | <https://opendata.swiss/en/dataset/bauzonen-schweiz-harmonisiert> — every resource carries `rights = terms_by` |
| Publisher's own statement | *"Open Data: freie Nutzung, Quellenangabe ist Pflicht"* — `Metadaten_Nutzungsbedingungen.pdf`, shipped inside the 2022 download |
| Obtained from | <https://www.kgk-cgc.ch/geodaten/geodaten-bauzonen-schweiz> (`bauzonen_are_2022_korrigiert.zip`, GeoPackage, EPSG:2056), downloaded 2026-11-16 |
| Extent of the extract | 6 558 polygons in the cantons BE, LU, NW and OW |

**What was changed.** The file is an extract, not the original: clipped to the study area;
generalised with a 0.5 m tolerance and snapped to a 0.1 m coordinate grid (4 polygons left smaller
than 1 m² by that were dropped); reduced to the attributes `CH_CODE_HN` (code of
the main use, 11–19), `CH_BEZ_D` (the publisher's German name of the main use) and `KT_KZ`
(canton). `ZONE_NAME_EN` is **our own English translation** of `CH_BEZ_D`, not a term of the
publisher. The data has no legal effect: the legally binding zone plans are the cantons'.

**The vintage is the licence.** This is the one dataset here where that matters. The **2012 and
2017** vintages were released under a bespoke *"Lizenz- und Nutzungsbedingungen"* (dated
11.12.2017) that is **not** an open-use term: it allows passing the data on only in processed form
and with that licence attached, keeps derived parts under the same conditions, and forbids selling
or licensing the data or anything derived from it. Only the **2022** vintage is published as open
data. This extract was therefore cut from the 2022 release itself and **not** from an older copy.
The two are easy to tell apart: the 2022 release holds 370 281 polygons in 2 139 municipalities,
all of which existed on 1 January 2022; an older copy still names municipalities that had merged
by then (Filisur, Kirchenthurnen, Bagnes, Peseux). Do not refresh this file from a pre-2022
download.

⚠ **To confirm before a formal release.** The download page still prints, under the 2022 files,
the sentence that downloading means accepting the "Lizenz- und Nutzungsbedingungen (in der
Zip-Datei enthalten)", with a link to the 2017 licence document. The 2022 archive does not contain
that document; it contains the open-data statement quoted above, and the opendata.swiss record
agrees with it. The link is taken to be a leftover, but it is the publisher's page and a one-line
confirmation from ARE would settle it.

**Why this is not the cantonal data excluded below.** The zones originate with the cantons — in
this extract including Obwalden and Lucerne — but what is redistributed here is the harmonised
federal compilation that ARE publishes for the whole country under `terms_by`, obtained from that
open publication. The exclusions below concern datasets obtained *directly* from a canton under
special conditions; nothing from those copies is in this file.

## Deliberately excluded — cantonal data with non-open conditions

**Rockfall / rockslide hazard zones (Canton of Obwalden)** and any **Canton of Lucerne** layers
were obtained for the original research project under **special conditions that are not an
open-source licence**, and they are therefore **not part of this payload**. The example's
decision model was reduced accordingly rather than shipping a criterion whose data cannot be
redistributed.

This is not a formality. Canton Obwalden is **not a publisher on opendata.swiss at all**
(checked 2026-08-15: no registered organisation), so there is no open federal-portal record to
fall back on — unlike several *other* cantons, whose *Gefahrenkarte Sturz* layers are published
as `terms_open` and which must not be mistaken for Obwalden's.

If either canton later publishes the equivalent data under genuinely open terms, it can be
re-obtained **from that open source** and added back with its own attribution row. The copy held
by the original project is not that copy, and re-labelling it would not make it so.

A user who wants a rockfall criterion in their own project can of course add their own hazard
dataset through the import wizard; nothing in the software depends on this layer.

## Digital elevation model (`payload/data_1_study_area/digital_elevation_model/`)

- **`swissALTI3D_20m.tif`** — © **swisstopo**. A 20 m resampled crop covering the study area,
  bundled so that a first run needs no API key. swissALTI3D is part of swisstopo's open
  government data; free to use with source citation.

The 3D-DSS can also fetch **OpenTopography SRTMGL1** automatically for a study area of your own.
That is a runtime service, not part of this payload: SRTM data are courtesy of **NASA/USGS**,
distributed via [OpenTopography](https://opentopography.org/), and require a free API key.

## Control tables (`payload/data_0_tables/`)

`FC.csv`, `ATTR.csv` and `MG.csv` describe how the datasets above map onto criteria, categories
and objectives. They are **the example's decision model**, authored for the Innertkirchen–Mettlen
case study rather than obtained from a provider, and carry no third-party terms.

`PROVENANCE.csv` records, per dataset, the provider, the terms, the required credit line and
whether the dataset may be passed on, in the form the 3D-DSS stores them. It restates this file
for the software and is read by the seeder, so that the example opens with its licence
questions answered instead of marked *not checked*. If the two ever disagree, this file is right.

## Not included here

**Point-cloud tiles** (`data/example/pointcloud_tiles/` in the software repository) are *not*
part of this payload. They are synthetic demonstration tiles for the globe view, they are
regenerable from `frontend/tools/pointcloud/generate_synthetic_pointcloud.py`, and their
provenance still needs confirming before public release — if they derive from swisstopo
**swissSURFACE3D** they must be attributed "© swisstopo" and their OGD terms verified. Keeping
them out of a payload whose whole purpose is a clean licence trail is deliberate.
