import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_local_socket(host):
    assert host.socket("tcp://127.0.0.1:8080").is_listening


def test_external_socket(host):
    assert not host.socket("tcp://0.0.0.0:8080").is_listening
    assert host.socket("tcp://0.0.0.0:80").is_listening
    assert host.socket("tcp://0.0.0.0:443").is_listening
