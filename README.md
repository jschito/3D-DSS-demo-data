# 3D-DSS demo data — the Innertkirchen–Mettlen example

The example project for the [3D Decision Support System](https://github.com/jschito/3D-DSS):
a 901 km² study area in the Bernese Oberland, the seven open datasets that make up its
decision model, and the coarse elevation model it is rasterized onto.

**This repository holds data, not code.** It exists so the 3D-DSS core does not have to.

## Why the demo lives outside the core

Three reasons, in the order they matter:

1. **Geography.** A Swiss example bundled *into* the core makes the core look
   Switzerland-specific. Nothing in the software is. The method is a multi-criteria cost
   surface and a least-cost path; the fact that the worked example uses Swiss federal
   inventories is a property of the example, not of the system.
2. **Lifecycle.** The demo can be re-cut, corrected and re-versioned without touching a line
   of the software, and the software can be released without re-releasing the data.
3. **Size.** Today the payload is 13 MB. It is intended to grow — a full-resolution
   swissALTI3D tile and TLM extracts are the obvious next additions — and none of that
   belongs in the history of a source repository.

## What is in here

```
payload/
  data_0_tables/       FC.csv, ATTR.csv, MG.csv — the control tables the seeder reads
  data_1_study_area/   study area, start/end points, substations, localities, and a
                       20 m swissALTI3D crop covering the area
  data_2_data/         the seven source datasets the decision model is built from
```

That layout is not arbitrary: it is exactly what `seed_example_project.py` expects to find,
and it is exactly what a user would produce themselves through the import wizard. **The moment
the example needs a special code path, it stops being a teaching model and becomes a second
implementation.** Keep the shape.

Provenance and licensing for every dataset: [ATTRIBUTIONS.md](ATTRIBUTIONS.md). These are
third-party open government datasets under their own terms — the terms are *not* the 3D-DSS
licence, and they travel with the data, which is a large part of why this repository exists.

## Using it

### From the 3D-DSS installer

```bash
./docker-3ddss.sh setup --with-example
```

which downloads the release tarball, verifies its checksum, unpacks it into `data/example/`
and seeds the database from it.

### By hand

Unpack the payload anywhere and point the seeder at it:

```bash
docker compose exec -T -e EXAMPLE_DATA_DIR=/data/example backend \
  sh -c 'cd /app/src && python seed_example_project.py'
```

`EXAMPLE_DATA_DIR` is the seam — it defaults to `/data/example` inside the backend container.
Anything satisfying the layout above works, including a study area of your own.

## Releasing a new version

```bash
./build-payload.sh 1.0.0
```

writes `dist/3d-dss-demo-1.0.0.tar.gz` and `dist/3d-dss-demo-1.0.0.tar.gz.sha256`, and
refreshes `manifest.json`. Attach both to a GitHub release; the installer verifies the
checksum before unpacking, so a corrupted or substituted download fails loudly instead of
seeding a half-broken project.

Version the data on its own terms. A corrected geometry is a new demo version and not a new
software version, which is the entire point of the split.
