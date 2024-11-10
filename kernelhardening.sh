#!/bin/bash
# for permanent  change /etc/sysctl.conf 
# sysctl -p /etc/sysctl.d/myconf.conf
# for reset : sysctl -f

sysctl -w net.ipv4.ip_forward=0 > /etc/sysctl.d/myconf.conf
sysctl -w kernel.kptr_restrict=2 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.dmesg_restrict=1 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.printk=3 3 3 3 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.kexec_load_disabled=1 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.sysrq=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_syncookies=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_rfc1337=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.all.rp_filter=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.default.rp_filter=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.icmp_echo_ignore_all=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_sack=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_dsack=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_fack=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.ipfrag_low_thresh=393216 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.ipfrag_high_thresh=544288 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_max_syn_backlog=8192 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_synack_retries=3 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_keepalive_time = 2000>> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.tcp_keepalive_probes=4 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.randomize_va_space=2 >> /etc/sysctl.d/myconf.conf
sysctl -w vm.swappiness=30 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.default.accept_source_route=0 >> /etc/sysctl.d/myconf.conf
sysctl -w fs.protected_hardlinks=1 >> /etc/sysctl.d/myconf.conf
sysctl -w fs.protected_symlinks=1 >> /etc/sysctl.d/myconf.conf
sysctl -w fs.protect_regular=2 >> /etc/sysctl.d/myconf.conf
sysctl -w fs.protected_fifos=2 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.panic=10 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel self protection
sysctl -w kernel.kptr_restriction =2 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.unprivileged_bpf_disable=1 >> /etc/sysct.d/myconf.conf
sysctl -w net.core.bpf_jit_harden=2
sysctl -w dev.tty.ldisc_autoload=0 >> /etc/sysctl.d/myconf.conf
sysctl -w vm.unprivilage__userfaultfd=0 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.kexec_load_disabled=1 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.unprivileged_userns_clone=0 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.perf_event_paranoid=3 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.panic=10 >> /etc/sysctl.d/myconf.conf
sysctl -w 'net.ipv4.tcp_rmem=4096 87380 6291456' >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.exec-shield=1 >> /etc/sysctl.d/myconf.conf
sysctl -w kernel.yama.ptrace_sclope="1 2 3" >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.default.accept_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.all.accept_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv6.conf.default.accept_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv6.conf.all.accept_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.default.secure_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.all.secure_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.default.send_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.conf.all.send_redirects=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv4.ip_forward=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv6.conf.all.forwarding=0 >> /etc/sysctl.d/myconf.conf
sysctl -w net.ipv6.conf.default.forwarding=0 >> /etc/sysctl.d/myconf.conf

# performance Network tune:
sysctl -w sysctl -w net.ipv4.ip_local_port_range="1024 65535" >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w net.ipv4.tcp_fastopen=3 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w net.ipv4.tcp_keepalive_time=600 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w net.ipv4.tcp_keepalive_probes=5 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w net.ipv4.tcp_keepalive_intvl=15 >> /etc/sysctl.d/myconf.conf

# Enhance tune: 
sysctl -w sysctl -w fs.file-max=2097152 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w vm.swappiness=10 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w vm.dirty_background_ratio=5 >> /etc/sysctl.d/myconf.conf
sysctl -w sysctl -w kernel.core_pattern=/var/crash/core.%e.%p.%h.%t >> /etc/sysctl.d/myconf.conf

