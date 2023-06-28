# gouba-manage-app

A new Flutter project，version: `3.10.5`

## Getting Started

1. Recommend [`fvm`](https://fvm.app/docs/getting_started/installation) manage flutter version.
2. [Config flutter app](https://flutter.cn/docs/get-started/install/macos)

## Json and Serializable data

### dependencies
- dependencies
  - json_annotation: ^4.8.0
- dev_dependencies
  - json_serializable: ^6.7.0
  - build_runner: ^2.3.3

### Generate [model].g.dart file

To generate [model].g.dart file which has toJson and fromJson implementation, please follow up these steps:

1. add ``@JsonSerializable`` annotation on your class
2. add ``part 'xxx.g.dart';`` above class file to assign a name to new generated file
3. run command ``./scripts/generate_models.sh`` in your terminal to generate ``xxx.g.dart`` file  


### Notes
1. should restart simulator after change themeData;

