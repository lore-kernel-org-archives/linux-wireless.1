Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.223.33.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795239645;
	b=WYSxrZyqBwTCIvobHF831Pmd1bZvqq5ROxfaYQC/psN0M0Ht8a31Ow/9rV6/v/riJf00
	 HCW2SKGKtu5NtLkW2xPWPVZNvhfL4xWw75Gtn7/NhvInNXfjuVvqFlQuhc4z6hTy+Cb++
	 HWpRNdMyDpkhgMDFUJbwSE21CimRZtpSzecdmW9Pa/ougoN7y2IhoJkogxe6aVQs2MzzA
	 Tr2yPAV/UPQ0oqEOfJjMkddsJ+toht7vg39PaGhvIeY+UGgPIMlMLjo6Zl6iXtGftfG8F
	 ZukxifvBGe9Gly/5G+WlHCqOtnEwitJndcvDOz/jkbWVz2ntsKp8aGPoqNH71MaQX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795239645;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-PPP-Message-ID:X-PPP-Vhost:X-Originating-IP:X-SpamExperts-Domain:
	 X-SpamExperts-Username:X-SpamExperts-Outgoing-Class:
	 X-SpamExperts-Outgoing-Evidence:X-Recommended-Action:X-Filter-ID:
	 X-Report-Abuse-To:X-Complaints-To;
	bh=7EzdwExqFSYlEGobJRQFVqMjGoqXyJI7K0vzgKnzhU8=;
	b=SwRr1Cs2eSpMMkw973t39+QnKxIoCpr2pQi8UlJfPFFHBDTQETg0fMy6xBbMdSgsqSo0
	 omwnxyyNZVajTUQY750NTauO1wdLuh5q3ahdImeptS5/GJ+dyRGgdYlFuO1QwS/Iic1sJ
	 H8W3BQYR+ifBu0Y2uSf0MTAxWuKbe/PTpUY0tHDfxiem8nqD+D6hLtcp/hiJdbJsuAOjY
	 Epoa8dwjm/jeyY7WuqtKZp5uF+obcVl/la7efRTtiMRH9pnUNCx5hw7eeGlGf1Ya7gtUX
	 +GwgqvpyNN8ziDlQEdymzBH411c6VJ+SVNYnxjP8viwfv1c9rys3fYR/H/BF07BGsyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ellarik.com;
	spf=pass smtp.mailfrom=ellarik.com;
	dkim=pass header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=qi4vogQS;
	arc=none smtp.remote-ip=185.223.33.25
Received: from se21-yh.route25.eu (se21-yh.route25.eu [185.223.33.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25D0606A68A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 05:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25D0606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ellarik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellarik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=qi4vogQS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellarik.com;
	s=default; t=1795239631;
	bh=7EzdwExqFSYlEGobJRQFVqMjGoqXyJI7K0vzgKnzhU8=; h=Subject:From:To;
	b=qi4vogQSpuu8fZLTBmHW6P+fKZyeGkwttWJdGvp7f8zn04e9FoMOVgb98nq/Zh8Be
	 boitxdANCor+04pOFs9xnayM001Bfz+e4aT2KhDpK5bcYGke1yGPIVi5yUJotHwPnn
	 AAK9FFjiAzvQm6ZO3B64ED6lkFYX7bCC/HYwRsuxsJCiO2LC1t4FUdNYwM61sAcsVX
	 v3H62YriTpiQ7fEfhl9tUh6SKrx6VcjGUl4Cy0WDRI9c9mT81iRZyJjgfscY1qVdMJ
	 kNZYy2bQ77etRTuK17tYgFVpD9Qs/n+73zMKn1wUdKGgYx8In0fQIypEGl0CjRly2U
	 MV5PQDH+IB6xQ==
Message-ID: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
Subject: Bug report: Realtek RTL8851BE Wi-Fi does not recover from suspend
From: Rik van Westendorp <rik@ellarik.com>
To: linux-wireless@vger.kernel.org
Date: Sat, 21 Nov 2026 12:39:55 +0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-PPP-Message-ID: 
 <179523963123.2395752.2226053486416840794@web-1125.yourhosting.nl>
X-PPP-Vhost: ellarik.com
X-SpamExperts-Domain: out.yourhosting.nl
X-SpamExperts-Username: 92.63.174.241
Authentication-Results: route25.eu; auth=pass smtp.auth=92.63.174.241@out.yourhosting.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUjdGJ7Hmjk70M6VEd8yUngqKZGhFjCGfvE
 +aOMqWab4iu2SmbhJN1U9FKs8X3+Nt08vHb8nbKbJjqE4jpc4fX4H1XfVn4bX3C5WEBxzW8NgP3U
 G/ZDDYnMocOqHgLfwqXilbHtbFYVmmyNP/jzd7CC/1Co8nyDpMGpKMnWLT/M28QYiTpLCsrpI++d
 V3X+sU8j/cY2oirhNZm7m6wh7Iqz7eibU04JcTWQKv3WukWvpM7C3136a365LSB3jzgrkGO5tsip
 JSrP8cFfJBPbeO2YmTmYf9felIf8Q0lvYJANy1im26jqdSLearSSTVIJyNKROUzReCS8EpKh0It9
 L25JS816nuiE0t5pG6MLXGczoTQJqA/o+t3Ea0E0Ube9kHXDIs+XnBNIfh5zMQdp2DJwyCvN3Vbg
 xD0/9G1wETYb71dAw+pKUNW1n03s4Dq5bQNAJf3d6GivlcLHRpT7/3B0pzi4JDWEiJuf4ysgNjLZ
 YAmGZionQ8jFfz1/t0tMyqzHMkD6FRF7VJW6mpBnE/ZkPZla/rT07rpnmNGb4JCTlRmZu2cicrxa
 qiqFMmVRKBqtI4g+l6rCWbY0MZcgnbHsJfMkJrb2kroNbkL+wM74TDTfCsoyLtX6kMRdvGOfPLOP
 33mJ55W70osiZSx/UtKBCAObPxF4XWWMm7b1nigsq5a0MriId+3NggpgCThPl0yhSFRdPgGo2MZV
 r7kox676wxx7NztRJeY5QrqeCaSFwXC9Qe7k3PAAB6oQaycVBGqWHSLsIohx7Rh+T35C/vwPNJ4P
 PTQyQV8F8AJLqeUeO/6PEB3K/5h7czMNRmRubN1Gh06k7oYvgODR0yOycCBRwD/3EaCPu1onFa0d
 n3u5il5UVYfMwIzpLASsIWP0b9zDqcigOvSxdRnthmhn8Zn6GcQHjUeyK9mmg+8efc3/fEk2jl3e
 21SNdaJ1xf8MyzvvpZLSAr3jBzAtGBhZHAsUCYZmKidDyMV/PX+3S0zKrE9wSbzS5rEObsfJ+MGx
 EcdWWvwGn7UMvvWRueuZvUQzYx7elnKg3LLG4yTJ6k2Z+zEvuGslKTrRIXcXpFg5ivY=
X-Report-Abuse-To: spam@semaster01.route25.eu
X-Complaints-To: abuse@semaster01.route25.eu

Bug report: Realtek RTL8851BE Wi-Fi does not recover from suspend

Summary

On an ASUS Vivobook 14 X1404MA, the Wi-Fi adapter (Realtek RTL8851BE)
does not come back after resuming from suspend (s2idle). After resume,
the wireless interface (wlp1s0) disappears completely from
NetworkManager (nmcli device shows only lo), no wireless networks are
visible, and a full reboot is required to restore Wi-Fi. Wired
networking is not available on this laptop, so the machine is
effectively offline until reboot.

Hardware

Laptop: ASUS Vivobook 14 X1404MA (Intel Core 5 315 platform, brand new,
2026)

Wi-Fi/Bluetooth combo: Realtek RTL8851BE PCIe 802.11ax (subsystem:
Foxconn International, Inc.)

Kernel driver: rtw89_8851be

Bluetooth part (RTL8851BU over USB/SDIO): also reloads firmware after
resume and appears affected

Software

OS: Ubuntu 26.04 LTS (Resolute), fully updated as of 2026-11-21 (apt
full-upgrade clean, no phasing issues relevant)

Kernel: 6.x/7.0 series - 7.0.0-44-generic (issue also present on 7.0.0-
30-generic before update)

NetworkManager: 1.54.3

Firmware: rtw89/rtw8851b_fw.bin, firmware version reported at boot:
0.29.41.5 (4bd6ebac)

Symptoms and dmesg evidence

Immediately after resume, the kernel logs (dmesg) show the driver
failing to reinitialize the chip:

rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=3D0xB48
rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=3D0xB48
rtw89_8851be 0000:01:00.0: failed to read PCI cap, ret=3D134
rtw89_8851be 0000:01:00.0: loaded firmware rtw89/rtw8851b_fw.bin
rtw89_8851be 0000:01:00.0: xtal si not ready(R): offset=3D41
rtw89_8851be 0000:01:00.0: xtal si not ready(W): offset=3D90 val=3D10
mask=3D10
rtw89_8851be 0000:01:00.0: failed to power on
rtw89_8851be 0000:01:00.0: failed to setup chip information
rtw89_8851be 0000:01:00.0: probe with driver rtw89_8851be failed with
error -110

Additional recurring warnings while the system is running (before
suspend, sometimes after heavy traffic):

rtw89_8851be 0000:01:00.0: timed out to flush queues

NetworkManager logs meanwhile show the device moving to unmanaged and
the rfkill device for the adapter disappearing (radio killswitch
/sys/devices/.../rfkill3 disappeared), after which the Wi-Fi device is
gone. A cold boot restores everything: firmware loads, chip powers on,
connection succeeds. This is a power-state problem, not a general
driver-failure problem.

Workarounds attempted (all without success)

Full system update (apt full-upgrade), including kernel upgrade from
7.0.0-30 to 7.0.0-44: issue persists.

Disable Wi-Fi power saving in NetworkManager (wifi.powersave =3D 2): no
effect.

Kill and re-enable Wi-Fi radio via nmcli radio wifi off/on after
resume: device does not return.

Manual driver reload after resume (modprobe -r rtw89_8851be && modprobe
rtw89_8851be): fails with the failed to power on / error -110 messages
above.

Resume hook in /usr/lib/systemd/system-sleep/ unloading and reloading
the module and restarting NetworkManager: no effect (same driver
failure).

Module options rtw89_pci disable_clkreq=3Dy and rtw89_core
disable_lps_deep=3Dy (verified active via sysfs): issue persists.

Kernel parameter pcie_aspm=3Doff (verified active via /proc/cmdline):
issue persists.

Switching suspend mode to deep (mem_sleep_default=3Ddeep): made things
worse, system failed to wake at all from suspend and required a 10-15 s
power-button hard shutdown; reverted. Platform apparently only supports
s2idle properly.

Manual PCI remove/rescan after a failed resume (echo 1 >
/sys/bus/pci/devices/0000:01:00.0/remove, then echo 1 >
/sys/bus/pci/rescan) was not yet tested successfully.

Current status

All configuration changes have been reverted to stock. Laptop boots and
works normally, Wi-Fi works normally after a cold boot. Suspend remains
unusable: after resume there is no Wi-Fi at all, and the only recourse
is a full reboot. As a result, suspend cannot be used on this machine.

Request

This appears to be a power-management state bug in the rtw89 driver /
the RTL8851BE firmware suspend path (PCIe device fails to power on
after resume, error -110 =3D ETIMEDOUT at probe). The chip seems to
remain wedged in a low-power state that the driver cannot recover from,
even after full module reload.

Requested: investigation of the rtw89 suspend/resume path for RTL8851BE
on s2idle, ideally fixed in a future kernel/firmware update. Happy to
provide full logs (dmesg, NetworkManager journal, lspci -vv, uname -a)
on request. Please let me know if additional debugging output would
help (e.g. dynamic debug traces of rtw89 suspend).

Reporter

Rik van Westendorp, ThailandDate: 21 November 2026
--=20
sent from Ubuntu / Evolution
