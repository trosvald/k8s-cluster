#!/usr/bin/env bash
# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --reboot -n k8s-w0.monosense.io -e k8s-w0.monosense.io
talosctl reset --graceful=false --reboot -n k8s-w1.monosense.io -e k8s-w1.monosense.io
talosctl reset --graceful=false --reboot -n k8s-w2.monosense.io -e k8s-w2.monosense.io
talosctl reset --graceful=false --reboot -n k8s-w3.monosense.io -e k8s-w3.monosense.io

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --reboot -n k8s-m0.monosense.io -e k8s-m0.monosense.io
talosctl reset --graceful=false --reboot -n k8s-m1.monosense.io -e k8s-m1.monosense.io
talosctl reset --graceful=false --reboot -n k8s-m2.monosense.io -e k8s-m2.monosense.io
