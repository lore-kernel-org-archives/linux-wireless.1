Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423111;
	b=pffb4U5R1PGoaICNWjs05moGmR26xGivKi7EUS+Ymoknsdbxpj78wLb9rHgB4R9MQxqn
	 uyHfYMJrZbZ0cg9AbFQhLfcszCRO8evJEikojzhM/3Okk7l76IKwaUUb1aEpBWrjF5bO/
	 6wI/YPt6a206G+uFc7b2JrWLxms+RW/3VJDqBodsq4JqTpddvMf9dXGo8Qymkr5zqyO1X
	 SJzJmt8s4T6lefjUEPSFwvpaqG2lp8hNW1eYer8N4OstF2xf6fBdwLXVLDWCLaOA5B8Px
	 ydd5wb8p8yP63fxHe3NS2e/J5vC/AhLgin/eJDsf5P4kxiu+3R6ZpxBGd6p2v/H0dLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
	b=VdX7QL+qCTj4+inIZE3tCz2CCQvJQanlmHIyGNzlWGg5MUmKvX5lucCj8jlqCe/674Oc
	 eS1J+qgjiYGJ5xNekmB2orpj9F5/t2Y2IIRTxzv3e6mM63XZ5aB7t3RMUX/JxNDCpnYrT
	 DpNOORFUqlR0PMx755HH8w0+mVulTBv+PQy6ag1wfB5SBusNnkVRUi1hrugw34SQ2CCDj
	 lzkuRjjgrwlZv1/aX2aS9Dc1stDFNtS3oOSA9NED93yu95lL+bhilu//zQ3KXLPdEnO3M
	 UIbAGQtvS5qFZTehMDI2s/OcwnpjEken4DLJh618Ha6QYYXXcsMbwcIbx7Y2IFx7r+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIIS1+a2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9067606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 18:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9067606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIIS1+a2
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be1e468a8so2795322d50.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423110; cv=none;
        d=google.com; s=arc-20260327;
        b=pIfcYchpN5sR6haUdgiD3hLsXMNFgxCwZJUVvFBX+t2FaSj8r381cRo7mfE6zBn+jA
         ls7dEUVa8RKu0loFL2fwFFpAWHPnu3Xn7otCISmIn7SCQGPoVXsntUCHaKE51fjxLHse
         C2PwNm9giVE5N4EXf1TLGiq7hb3rYbCMB2nhURNET7jjlIUPUFUtCbWylovd+c9f58cn
         Bz9j79ehGzap13ir4OxzVPGMi8CFjEt4eUvrZZ3bjKS0+0FoepWMr4YxLLDDiSs4AA9s
         NJAWPVIsEblJ4Afd/wU5fMdQH630kV3MqLK1k1+XQbOFL7yVFKfi0dAsmNypE1/c9t6C
         jZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        fh=5wOCSfHC+MjrWRFIcFhuLCxZ+oXRK4wNfqgik8o8yx4=;
        b=Qj9aTVOfHkzGD7mut76s1Pt1yUzT15FgNHEwiPyfWEbPIV+vjbYKkGXYwghJOet1s1
         F8OQgQGRLz9/Kd6zzegG0D4JNB2f2AvusPqnw5IO0fJPvLbMiEOGZV/1cdYPyD1clq/T
         EAKObzBCLUBbkVefjF3QKIecykpJmGp094c95zvndQbAH0nwjv3JoJ9S56iPSroN67rB
         tR7at1LkEeOghOiDQ58Pcv9xzXj59qmPjwa/Tz355WIZOO1dSil9/dhYraadbfyItvDS
         GOAY8nAWXxUl65gIqJWxiwOPahxvpGQJuLpDaOzl9jtIWqdGIncmG1YH5RzsHCkqblaI
         6tDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423110; x=1795027910; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        b=hIIS1+a2UUvtq+EhF7GdPYdQeH5jmrhck+dmpePtDbpdD3reSuoPD50E8rDRBDSeqT
         xjwZsv6SppMUcqsF1CrRq//9Mq6pSed71Tcxved7Ti2S1IX1x3V3Va4zeTcJr4CDDyBL
         kWCOBfS5fOkIHb8QgKBIfIiSYOa+9ir2bdvlL6n9csLkZGUhOKjkD9uTJVaOxAz/tDr7
         Qfau0v20ewXmsoPcj4IVOFwns6leFyRMj3mKoBTLig07uad0aHVvk3ICxsqFk6GCkh6w
         AowYr9tLxBw4JI7Osm95z7nWM2+P3i7VDe7Oizd8XF6FidlFXPZl4p7WBYBszKt1Yh0C
         ymOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423110; x=1795027910;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        b=cezV7CGFBVf07voTcbvBjExcStfY+UM07+6HpRCNhaUfs8Sv/G4UlVW1y4/2iVWALW
         gJTnMY6kfU6uhhkH4Rhum9Hwwu8jVOyn5JwYbuM+txpQ2aBfsqAIKRWV2g549qmSDeSo
         RTICmHEHR2exxqQVflZIrE77qTf/d9RrvoDkGF3w11xpHWNb32kJDei7vLdRamOpCle5
         6aNtutKHfZzmImGC7eC4475TD9SxjsIA6/xRwXziL425+3wKeucYY1UzxYlfIBxt4GUo
         tfj/KmklnFN/pbHnYLKrkxHVVcKqk6t4jUcdnIst4Uvjdw4VV4a+7GM6PflglVd1AvVp
         LndQ==
X-Gm-Message-State: APuU4Z9P+aapY2kBmfcDrH/F4/38QXUTfwFj5MGgekhCAjmfcboXDl+m
	y/3O3fMQC0CU0WlsOqkZaGS0wCT5tuCKT/imROEnI1IwqY85aeUh2UWmS3Xj4TZO5LO1DJffDNx
	SlhigcKG1FZTkeqkCbZSCN0Nt+mnyEf+sFXPq
X-Gm-Gg: AYBFou3gdsam2zneWYG2Rbbst/O27lCsWILYdPBHq5rYAtUylTa8oPqMKfsxH0CkJJC
	qiynfopD+vQoiX5AdBGQWMQRzp0rvAJdwuBSYi5nPpDMJCsKUABdmzuaVkqllo3jK/rhvg4I/9K
	woNalXEkbu2vXeBzqQis7rbRQsGCJHVEq6Y/paFpZPBsfNqgugfW3665T69k6iF0CxTTdiYGie4
	SQdVCRLg9XAly/e4Vg52NF0cV6nmwy19J0eme8Lyv4R6AMk8dkfrZgdMEbowdPq2KErKlMf4yzm
	1BoZI0P2wAsrRNlBVzqiYdZ86pGcMUicQhap3a784DVZhiHtS3LewGYrJFtSfjUlfGsSWUq88YB
	UjFI+iJ3zqUNUko+X1TPaKRFCcCXiCfQVWFfr5w==
X-Received: by 2002:a05:690e:1385:b0:67c:c1d:e5ff with SMTP id
 956f58d0204a3-67c67a44ec8mr2651052d50.0.1794423109391; Wed, 11 Nov 2026
 10:51:49 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Colin C <ccharm480@gmail.com>
Date: Wed, 11 Nov 2026 12:51:38 -0600
X-Gm-Features: AclHuK_8HGtlGC5_tkNn91ABpmkm4Qnopf5PO5ai9P-hAuAXxuL1IerzjAdosxY
Message-ID: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Subject: [REGRESSION] rtw89_8851be: 5 GHz link drops after association and
 re-auth times out on 7.3.0-4 and 7.3.3-1 (7.2.11 works)
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hardware: Realtek RTL8851BE (PCI 0000:04:00.0, 10ec:b851,
rtw89_8851be); Bluetooth
          is the same module (rtl8851bu firmware loaded by btusb)
Distro/kernel: CachyOS (clang build)
  linux-cachyos 7.2.11-1  = GOOD
  linux-cachyos 7.3.0-4   = BAD
  linux-cachyos 7.3.3-1   = BAD (re-tested 2026-11-11)
Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac) on all
three kernels
linux-firmware-realtek: 1:20261019-1 on all three (firmware is not the variable)
AP: UniFi U6 Extender (Wi-Fi 6, 802.11ax), WPA2 CCMP, 5 GHz ch153/80 MHz,
    several BSSIDs of one SSID, -43 dBm. On 7.2.11 the link ran at
600/540 Mbit/s;
    I did not capture HE vs VHT on the 5 GHz link during the failing boots (the
    2.4 GHz fallback link, a GL.iNet router, negotiates HE-MCS 10 on 7.3.3-1).
Taint: /proc/sys/kernel/tainted = 4096 (O, out-of-tree module: nvidia-open).
    The WLAN problem is independent of the GPU driver as far as I can tell.

Summary
The adapter has worked on every earlier kernel (7.2.x and before).On
7.3.0-4 and again on 7.3.3-1, 5 GHz association is either dropped
shortly
after the 4-way handshake or never gets going again: every authentication
attempt then times out ("send auth (try 3/3)", "authentication with <bssid>
timed out"), across several BSSIDs, until the card falls back to a 2.4 GHz
network. Booting 7.2.11-1 with identical firmware and userspace restores normal
operation (one boot of ~7.7 h on 5 GHz at 600/540 Mbit/s; a single AP-initiated
reason=34 disassoc, reconnected in 4 s).

Failing boots on 7.3.0-4, 2026-10-26:
  07:48:30 wpa_supplicant: Key negotiation completed with ba:8b:a9:d1:28:25
  07:49:04 CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
  07:49:08-07:50:35 kernel: "authenticate with <bssid>" / "send auth
(try 1/3..3/3)"
                     / "authentication with <bssid> timed out", for three
                     different BSSIDs, repeated; SSID-TEMP-DISABLED CONN_FAILED
  12:28:29 Key negotiation completed; 12:28:50 DISCONNECTED reason=4
locally_generated=1
           then the same auth-timeout loop until ~12:31

Failing boot on 7.3.3-1, 2026-11-11 (boot 12:12):
  12:13:00 associated with ba:8b:a9:d1:28:25 (5 GHz), aid=3
  12:13:07 onwards: auth to 2a:e8:29:52:c6:9c, ba:8b:a9:d1:28:25 and
           9e:05:d6:d1:6d:d4 all time out (3/3 tries each), repeated until the
           card gave up and joined a 2.4 GHz network (GL-MT3000, ch7).
  A manual `nmcli con up` for the 5 GHz SSID later failed with "The Wi-Fi
  network could not be found" although the BSSes are listed at full signal.
No rtw89 error lines appear in dmesg around the drops (only the wlan0 auth
timeouts above).

Caveat on the 7.2.11 baseline: it is not perfectly clean. Over the 10-day
7.2.11 boot (2026-11-01 to 11-11) the journal has 8 wlan0 authentication
timeouts and 36 "rtw89_8851be 0000:04:00.0: timed out to flush queues"
messages (Nov 4-10). Some auth timeouts overlap with a hidden-SSID issue on
my side that I fixed on Nov 9. In all cases on 7.2.11 the link stayed up or
recovered by itself; it never got stuck in the endless auth-timeout loop seen
on 7.3.0-4 and 7.3.3-1. Filtered logs (UFW lines removed) are available for
both boots.

Bluetooth coexistence lead (7.3.3-1, one run each, so not conclusive):
  With Bluetooth blocked (rfkill block bluetooth): `nmcli con up` joined the
  5 GHz BSS ba:8b:a9:d1:28:25 (5765 MHz) on the first try, auth/assoc clean.
  After rfkill unblock, the link was on 2.4 GHz again at the next check (about
  3 minutes later; I did not see when it dropped), and a repeat `nmcli con up`
  for the 5 GHz SSID failed as above.
  The card shares the module with Bluetooth, and an LE keyboard and an LE mouse
  were connected during the failing cases. I am not claiming a cause: the
  Wi-Fi/Bluetooth coexistence code is shared and has been changing (e.g. the
  July 2026 rtw-next coex patches for the 8922D, which are not in 7.3.x), so
  it seemed worth mentioning. The first 7.3.3-1 boot did associate once on
  5 GHz with Bluetooth active, so timing may also matter. A repeat of each
  case (3+) is still to do.

Things tried that did not help on 7.3.0-4:
  - /etc/modprobe.d/rtw89.conf, exact options (still active, and confirmed
    in /sys/module/rtw89_pci/parameters/ on 7.3.3-1, so the 7.3.3-1 failure
    above happened with them set):
      options rtw89_pci disable_aspm_l1=Y disable_aspm_l1ss=Y disable_clkreq=Y
      options rtw89_core disable_ps_mode=Y
  - reloading rtw89 modules (briefly restores 2.4 GHz only)
  - firmware 20261019-1 vs earlier (ruled out: 7.2.11 works with 20261019-1)
Also not the cause: the SSID is no longer hidden and the extender BSSes are
visible at full signal; ch153 worked on 7.2.11.

Package history (pacman.log): linux-cachyos 7.2.11-1 -> 7.3.0-4 on 2026-10-24
23:41; first failure observed the next boot. Updated to 7.3.3-1 on 2026-11-11;
same failure.

Searched lore.kernel.org (all lists) for "8851BE" on 2026-11-11: no report of
this problem. Possibly related, not read in full: "[PATCH] Bluetooth: Add
HCI_QUIRK_NO_SCAN_WHILE_CONNECTED for combo chips" (April 2026). The symbol is
not present in the installed 7.2.11-1 or 7.3.3-1 headers, so it cannot explain
the difference between those two kernels.

Related, not duplicates (found by web search):
  - [regression] rtw89_8852be: silent RX stalls since v7.1; reverting
    bda294ed0ed0 appears to fix it (https://lkml.iu.edu/2607.2/04572.html)
  - RTL8852BE can't connect on high 5Ghz channels
    (https://bugs.launchpad.net/bugs/2059170)

Expected: link stays up on 5 GHz as on 7.2.11.
Not tested: vanilla mainline (CachyOS patches may be a factor); a bisect; a
boot with nvidia-open not loaded (to rule the taint out completely).
Happy to test patches or bisect between v7.2.11 and v7.3.0 if pointed
at a range.
