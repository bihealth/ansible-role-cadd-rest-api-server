[![Build Status](https://travis-ci.org/bihealth/ansible-role-cadd-rest-api-server.svg?branch=master)](https://travis-ci.org/bihealth/ansible-role-cadd-rest-api-server)

# CADD REST API Server

Setup of CADD REST API server.

## Requirements

No additional requirements but as the files required for CADD-scripts are huge, you will need ~520 GB of free space (we recommend 600 GB of free space).

## Role Variables

See `defaults/main.yml` for all role variables and their documentation.

## Dependencies

- `bihealth.nginx`
- `bihealth.python3`

## Example Playbook

```yaml
- hosts: servers
  vars:
    # bihealth.ssl_certs --------------------------------------------------------------------------
    ssl_certs_certs:
      - name: cadd-rest-api.example.com
  roles:
    - role: bihealth.cadd-rest-api_server
```

## License

MIT

## Author Information

- Manuel Holtgrewe

Created with love at [Core Unit Bioinformatics (CUBI), Berlin Institute of Health (BIH)](https://www.cubi.bihealth.org).
