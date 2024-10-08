#!/bin/bash
{{% if 'sle' in product or 'slmicro' in product %}}
# packages = libselinux1
{{% else %}}
# packages = python3-libselinux
{{% endif %}}

. $SHARED/group_updating_utils.sh

config_file="$(find_config_file)"

if grep -q "^gpgcheck" "$config_file"; then
	sed -i "s/^gpgcheck.*/gpgcheck=yes/" "$config_file"
else
	echo "gpgcheck=yes" >> "$config_file"
fi
