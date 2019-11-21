# _MachineBox's Classificationbox_ Open Microservice

> Automatically classify various types of data, such as text, images, structured and unstructured data.

[![Open Microservice Specification Version](https://img.shields.io/badge/Open%20Microservice-1.0-477bf3.svg)](https://openmicroservices.org)
[![Open Microservices Spectrum Chat](https://withspectrum.github.io/badge/badge.svg)](https://spectrum.chat/open-microservices)
[![Open Microservices Code of Conduct](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](https://github.com/oms-services/.github/blob/master/CODE_OF_CONDUCT.md)
[![Open Microservices Commitzen](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Introduction

This project is an example implementation of the [Open Microservice Specification](https://openmicroservices.org), a standard
originally created at [Storyscript](https://storyscript.io) for building highly-portable "microservices" that expose the
events, actions, and APIs inside containerized software.

## Getting Started

The `oms` command-line interface allows you to interact with Open Microservices. If you're interested in creating an Open
Microservice the CLI also helps validate, test, and debug your `oms.yml` implementation!

See the [oms-cli](https://github.com/microservices/oms) project to learn more!

### Installation

```
npm install -g @microservices/oms
```

## Usage

### Open Microservices CLI Usage

Once you have the [oms-cli](https://github.com/microservices/oms) installed, you can run any of the following commands from
within this project's root directory:

#### Actions

##### createModel

> Analyze text with its sentiment and keywords.

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                                            |
| :------------ | :------- | :------- | :------ | :------------------------------------------------------------------------------------- |
| id            | `string` | `false`  | None    | The model ID, if omitted a unique ID will be assigned.                                 |
| name          | `string` | `true`   | None    | The name of the model.                                                                 |
| ngram         | `int`    | `false`  | None    | The number of word n-grams to generate from a body of text (default is 1).             |
| skipgrams     | `int`    | `false`  | None    | The distance between words from which to generate n-grams (default is 0, no skipping). |
| classes       | `list`   | `true`   | None    | Two or more classes that the model will learn.                                         |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                                                 |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key                             |

```shell
oms run createModel \
    -a id='*****' \
    -a name='*****' \
    -a ngram='*****' \
    -a skipgrams='*****' \
    -a classes='*****' \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

##### teachModel

> Teach class with feature.

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                |
| :------------ | :------- | :------- | :------ | :--------------------------------------------------------- |
| modelId       | `string` | `true`   | None    | The model ID.                                              |
| class         | `string` | `true`   | None    | The class that these inputs belong to.                     |
| inputs        | `list`   | `true`   | None    | The key, type and value of this feature.                   |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                     |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key |

```shell
oms run teachModel \
    -a modelId='*****' \
    -a class='*****' \
    -a inputs='*****' \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

##### getModel

> Get model by ID.

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                |
| :------------ | :------- | :------- | :------ | :--------------------------------------------------------- |
| modelId       | `string` | `true`   | None    | The model ID to get details.                               |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                     |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key |

```shell
oms run getModel \
    -a modelId='*****' \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

##### makePredictions

> Prepare model for prediction based on a series of input features.

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                                                            |
| :------------ | :------- | :------- | :------ | :----------------------------------------------------------------------------------------------------- |
| modelId       | `string` | `true`   | None    | The model ID.                                                                                          |
| limit         | `int`    | `true`   | None    | The maximum number of classes to return (default is 10).                                               |
| inputs        | `list`   | `true`   | None    | Input features are properties that the model should consider when deciding which class they belong in. |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                                                                 |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key                                             |

```shell
oms run makePredictions \
    -a modelId='*****' \
    -a limit='*****' \
    -a inputs='*****' \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

##### listModels

> List all models from classificationbox..

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                |
| :------------ | :------- | :------- | :------ | :--------------------------------------------------------- |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                     |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key |

```shell
oms run listModels \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

##### deleteModel

> Delete model by ID from classificationbox.

##### Action Arguments

| Argument Name | Type     | Required | Default | Description                                                |
| :------------ | :------- | :------- | :------ | :--------------------------------------------------------- |
| modelId       | `string` | `true`   | None    | The model ID to delete.                                    |
| ADDRESS       | `string` | `true`   | None    | The server IP address.                                     |
| MB_KEY        | `string` | `false`  | None    | Head over to https://machinebox.io/account to get your key |

```shell
oms run deleteModel \
    -a modelId='*****' \
    -e ADDRESS=$ADDRESS \
    -e MB_KEY=$MB_KEY
```

## Contributing

All suggestions in how to improve the specification and this guide are very welcome. Feel free share your thoughts in the
Issue tracker, or even better, fork the repository to implement your own ideas and submit a pull request.

[![Edit machinebox-classificationbox on CodeSandbox](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/s/github/oms-services/machinebox-classificationbox)

This project is guided by [Contributor Covenant](https://github.com/oms-services/.github/blob/master/CODE_OF_CONDUCT.md).
Please read out full [Contribution Guidelines](https://github.com/oms-services/.github/blob/master/CONTRIBUTING.md).

## Additional Resources

- [Install the CLI](https://github.com/microservices/oms) - The OMS CLI helps developers create, test, validate, and build
  microservices.
- [Example OMS Services](https://github.com/oms-services) - Examples of OMS-compliant services written in a variety of
  languages.
- [Example Language Implementations](https://github.com/microservices) - Find tooling & language implementations in Node,
  Python, Scala, Java, Clojure.
- [Storyscript Hub](https://hub.storyscript.io) - A public registry of OMS services.
- [Community Chat](https://spectrum.chat/open-microservices) - Have ideas? Questions? Join us on Spectrum.
