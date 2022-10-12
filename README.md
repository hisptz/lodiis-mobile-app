# KB MOBILE APPLICATION

### contents:
- [Introduction](#intro)
- [Pre-requisites](#preRrequisites)
- [Getting started](#started)
- [Source code structure](#structure)
- [Running the application](#run)

## Introduction <a name="intro"></a>

This is a mobile application that facilitates tracking of beneficiaries along with service provision within different interventions across all implementing partners. It is an essential part of the Lesotho OVC-DREAMS Integrated Information System (LODIIS) since it is the primary source of data within the system where it offers offline data capture from different implementing partners, with support for data synchronization.

The mobile app is divided into multiple modules based on the interventions. These interventions includes:

<li>DREAMS Module</li>
<li>OVC Module</li>
<li>Education module
  <ul>
    <li>LBSE module</li>
    <li>BURSARY module</li>
  </ul>
</li>
<li>PP_PREV Module</li>
<li>OGAC Module</li>

The access to these interventions is basing on user implementing partner, since the KB Mobile application allows access to multiple modules.

## Pre-requisites <a name="preRrequisites"></a>

To get started with this project, it is required to have installed [flutter](https://flutter.dev/) framework. If not installed, [here](https://docs.flutter.dev/get-started/install) is the link to the download page and installation guide.

## Getting started <a name="started"></a>

To get started with the project, clone repository with the below command:

```
git clone https://github.com/hisptz/kb-mobile-app
```

The navigate to the created project folder and install the packages using the command:

```
flutter pub get
```

## Source code structure <a name="structure"></a>

The following tree represent the basic project structure with files and folders for the KB mobile applications.

```
|-android
|-assets
|  |-icons
|  |-logos
|-ios
|-lib
|  |-app_state
|  |-core
|    |-components
|    |-constants
|    |-offline_db
|    |-services
|    |-utils
|  |-models
|  |-modules
|    |-about_app
|    |-app_logs
|    |-dreams_intervention
|    |-education_intervention
|    |-intervention_selection
|    |-language_selection
|    |-login
|    |-ogac_intervention
|    |-ovc_intervention
|    |-pp_prev_intervention
|    |-splash
|    |-synchronization
|
|  |-app.dart
|  |-main.dart
|-test
|
|...
|-pubspec.yml
|-README.md

```

Below is the description of the above structure:

<li><strong>android</strong> : This is the folder for the basic mobile android app configuration</li>
<li><strong>assets</strong> : This folder contains assets for the project
    <ul>
        <li><strong>icons</strong> : This is a collection of custom icons used in the app.</li>
        <li><strong>logos</strong> : This is a collection of different logos used in the app.</li>
    </ul>
</li>
<li><strong>ios</strong> : This is the folder for the basic mobile ios app configuration</li>
<li><strong>lib</strong> : This is a folder containing the actual source code which constitutes the app.
    <ul>
        <li><strong>app_state</strong> : This folder contains different state management folders for different modules within the app.</li>
        <li><strong>core</strong>: Contains all the shared and basic functions, components, constants and service to be used across the app. These are classified into
             <ul>
                <li><strong>components</strong> : This is a collection of user interface widgets. </li>
                <li><strong>constants</strong> : This is a collection of constants that are used to hold static values.</li>
                <li><strong>offline_db</strong> : This is a collection of all the services and definition of the offline database responsible for data storage. This uses the sqlite database with the abstraction provided by the sqflite flutter package.</li>
                <li><strong>services</strong> : This is a collection of different service classes for data manipulation.</li>
                <li><strong>utils</strong> : This folder contains different helper functions that performs specific functionalities.</li>
            </ul>
        </li>
        <li><strong>models</strong> : This folder contains all the data models used within the app.</li>
        <li><strong>modules</strong> : This folder contains different modules in the app. Each module has a folder structure similar to core folder.</li>
        <li><strong>tests</strong> : This folder contains different tests for the app.</li>
    </ul>
</li>
<li><strong>web</strong> : This is the folder for the basic web app configuration</li>
<li><strong>window</strong> : This is the folder for the basic windows desktop app configuration.</li>
<li><strong>pubspec.yaml</strong> : This file contains the package dependencies required to get started with the app</li>
<li><strong>README.md</strong> : This is the file that contains the developer documentation for getting started with the app</li>

## Running the application <a name="run"></a>

This application can be run using the below flutter command within the project folder.

```
flutter run
```