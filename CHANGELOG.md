# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-10-06

### Fixed

- logrotate configuration matched every file in `/var/log/simple-process-monitor/`, including files it had already rotated. Each run rotated the rotated files again and appended another date to their names until logrotate failed with "File name too long" and the logrotate service was marked as failed. The configuration now matches only `*.log` files, and skips missing and empty files.

## [1.0.0] - 2024-03-26

### Added

- Initial version is completed. 