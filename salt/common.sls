install_common_packages:
    pkg.installed:
        - pkgs:
            - curl
vim installed:
    pkg.installed:
        - name: {{ pillar['editor'] }}