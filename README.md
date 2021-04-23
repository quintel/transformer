# Transformer

[![Build Status](https://travis-ci.org/quintel/transformer.svg?branch=master)](https://travis-ci.org/quintel/transformer)

Library that takes a set of start values, assumption and turns them into attributes useable for the
ETM with help of the graph.

## How Transfomer creates a dataset

The typical entrypoint to the library is through `DatasetGenerator`. This is initialized with a hash
containing all the keys and values exported by ETLocal for a dataset. The generator creates a
`DatasetCast` which describes the attributes for the dataset itself (stored in the Active Document
file), such as the area key, parent dataset key, number of residences, etc.

#### Generator

The generator then runs through two steps to create or update a dataset in ETSource:

1. `DatasetGenerator::Scaler` – Uses Atlas to create new scaled dataset. This is based on the
   "base_dataset" param provided when the generator was initialized. At this point, ETSource now
   contains the new dataset, with an ActiveDocument file, and numerious directories symlinked to the
   parent dataset (curves, demands, network, etc).

2. `DatasetGenerator::Analyzer` – Responsible for taking the parameters with which the generator was
   initialized and updates the dataset; either by making changes to the Active Document file, or by
   preparing values to be written to the graph_values.yml file.

#### Analyzer

The analyzer itself runs through several steps to determine what changes must be made to the
dataset.

1. `Caster.cast` converts the params provided to the generator to a more structured form; the params
   are split into sub-hashes, depending on where the value will be persisted (for example, "area"
   contains values stored in the Active Document file).

   To create this structure, `Caster` creates a `Template` which allows setting area and graph
   values. Then it:

   1. Runs `Caster::Exporter`. Exporter takes the params provided by ETLocal and maps their keys and
      values to attributes stored in the graph_values.yml file. Any attribute which have a related
      "sparse graph query" have this query executed, with the resulting value added to the
      template's graph values.

   2. Runs `AreaAttributes` which takes the ETLocal params and extracts values which should be
      stored in the dataset Active Document. As in step 1, any attributes which have a query will
      execute that query and store the value in the template.

2. Values for the dataset Active Document file are updated with those from the Caster.

3. Values for the graph_values.yml file are set with those from the Caster.
