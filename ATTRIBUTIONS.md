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
and swisstopo's OGD terms. Terms are the provider's to set and can change; re-check before a
formal release.

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

Every dataset above is **federal**. That is deliberate — see the exclusions below.

ISOS carries an additional statement from its publisher: all ISOS data (maps, texts, photos) are
the intellectual property of the Confederation, **© BAK, Bern**. That is an attribution
requirement, consistent with `terms_by`, not a restriction on redistribution.

⚠ **One entry to confirm before a formal release:** `biores`. Swiss biosphere reserves are
administered as a category of *parks of national importance*, so it is recorded here under that
inventory's `terms_by`. Confirm with BAFU whether it was extracted from that inventory or from a
separate one. Either way it is `terms_open` or `terms_by`, so the copyleft answer is unaffected —
those differ only in whether citation is required, and this file provides it in both cases.

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

## Not included here

**Point-cloud tiles** (`data/example/pointcloud_tiles/` in the software repository) are *not*
part of this payload. They are synthetic demonstration tiles for the globe view, they are
regenerable from `frontend/tools/pointcloud/generate_synthetic_pointcloud.py`, and their
provenance still needs confirming before public release — if they derive from swisstopo
**swissSURFACE3D** they must be attributed "© swisstopo" and their OGD terms verified. Keeping
them out of a payload whose whole purpose is a clean licence trail is deliberate.
