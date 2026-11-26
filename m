Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795668103;
	b=js2Yu8JZYMxP6X4/WKnRFQfl+rbAKPEXJ7k4TXNJeFTE68Hmw84C0x6VtrA3HIwZ77qc
	 lCEV0NCuoHE2xgUoxrJNjod5Hvu76waJnAmeM/t6nBedDR8NtRtKjWACNuPpB4UqXsf9o
	 iY1pe+ZUP4k+ILP21IaAjBJSONyfy01+qNCM/c6KmMQXlEyRmZRxo5j6k2cZwxlj0VJa9
	 PK51eZinV+NS6ndhTo0cCjYMiHkoY5bhdDJyKYLB0VCrujOcdFEPhQoQUMJz0vuBiz7el
	 1Yepn/Gf7YkhNvvTDQM8RbQz0beKc6mxh9EgGEGoqjTOd6dBGBABc48DrB5BMV2tbpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
	b=QBEXPUGpgWaqbuHYLbizXb6iaPrLeFQAKrH0Nj4tE45XNdiB+bz9yut2Fsh8FpyAObog
	 zquNTaDkIHw36Rsar9LRQs8rFdiIFQCixOZ0SVKUo4opWEgqECkqWWJFY22vY60ybe8Ts
	 cJHvmSqeoblGwC+aTj+4wCIYAyFNcwwvYRh8bOu8AKzxMdc+Y1/9olL4/t7Tp0CpeDGFq
	 NDy0/x6tWyZRU98m4pSv3Sww2gRNPmOWg4Gjvjs7mCc/7HvOrLL/QsC4lSAgHWcPeLsAl
	 YIOMbIvBBv8HaXvgpfpXkS0QUlW/jAlOQx8IZ182TXkzF9FSYfF0gWLsaA/BLS7qzQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUe6w3K+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F13606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 04:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUe6w3K+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso46581505e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 20:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668102; cv=none;
        d=google.com; s=arc-20260327;
        b=bIe6rsI9Y9KG86GDNZhv1x+FucYWjSfmwaM+HbvM5wUQCuH8aQM+1ShsnvHUwXGdxP
         wibB17OfW5pECjRg8CA/mHSf3s6vJdq9Fl4aaSVwagMByZhP+3mdJhGeMFEKXvGS1DKK
         DPRA+FzXoN2b3l5pKIBcsGWMD/Tj33XCpKiZl73kq8mEHRbij5rNUQGYF5S8+pTD0S4l
         m8Est1chOibxJt/swALUsOFfj+jZbIO5LDbZiI2wIkN5AGES2p+gqIxL5gIoo/wp7LBS
         ZBT57bU6sQi1qFppHQox/ToVQYxDWNOoDU3c/0EMdZ5fs26TrWBl12567e5D8dz4SrK2
         KI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        fh=6csRn67vPZk17VDeuyoUY25h5k1762RCB4OqKPsQnYs=;
        b=dYYm3KWGUEAPXQfOHJoSOeRCngWyusN5+sr3Qe5yTK3IGmrKPikXRegAOqpW/8jZwT
         WSpMSuerrkYiRdlI0YCAB0lIAQ5y64VZ0o/UmPfbncUE8irpakwme5FMxfeCbK1LN8aM
         izUwNCwVBfeS+JS5zdkuc64JJ3CZDXfvxYGzaKI9hsNdNtxYbz9zVpR1Fs6pcM/ydqo/
         W49QeVPZ2daZjaGthd/zKKVvRxJhSn/On4JDw8sjyUVlmd0hvIBRc0PCaQJxt1eC0bPM
         yzbBtuoSQpMLD+uknU6PuYa8nSAXVmcJcP52NZGAiVQhljE+dXj0E4r9rFIfbKDgyNHR
         aDqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795668102; x=1796272902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        b=jUe6w3K+ow0KMwHm2nZ8gwsXhP6dWY8UOyvUP1qfcQp1/a7yvTckervGlWkYMTa3av
         LAtN3Xo+j5YExbmWDWXD0Nl4ebol5EDnS9FjMCFuhsmZObdAmXOnD2UYN+VjqgqapcTA
         3WfaJoKPUHdte6DfEXf3Lci7tW7JiY5y2Mn5DCLaHIqDKVPZkX8cC4TtOiYT3EtbtZ8i
         lDAwxihBy1NEHkrNYy1V2agoWar3rbCLKrrJsrx/NaFCqEjBSiNjhRPOjX8qEGwp9HIN
         Dv4JSpk5y36FK1rVPpPSMepv9eMtCYOsQ9SVcqrLkZt51GE1cos9DkkPDcX2Z56gGwis
         1xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668102; x=1796272902;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        b=CJf8uNRkN7t7PnqfRxSWCfUrlKWZOurBA5yDtKFWDwT6M6VaifZrXOvH72jb79Gboh
         dOe3j2cNiN/DXloapmMwXo08qPGleXvBhNK1m75ODfmmMRdWrEwHx/IGd9rvtZulQUGH
         FGahh7zOK5Fa3/mnuA9dpXtdg4hGQjVk3bwo2cAhrUQc623JqLfezgEF/umRVpmvTfJ4
         cWUeUC433dRWwGfrDnNsLcAqMfMKiBb+lZiAqXWaIREOmIMlRtTtV0l3k1kxATGYYX3Z
         +Cw20aVK7gTUFKYKMCwI9y0q+b2vx4ICzaQWMfIvlD44o8zVxOpycQRWSTK6EYIottZn
         Fh8A==
X-Gm-Message-State: APuU4Z+tBYF5L4SvU0uamGafmIuowe0YMR03p4xiZqR6JFsETXKuH79T
	NiXs6/Yr1hLVPlSh9SPHEnm+dGBPk2Yvv6lNNYx1+TOHwIckDIv0834V7FhnqWETVXtM19ZEoaE
	/hGAjZOF9hT9Sve6Wg2wTD5zBWVwJTrY=
X-Gm-Gg: AZFdTZcnCxnJHw9UzKHTV6iP0UPBHx0uR/Z6f1vZPDFIbek2BdywQfbdKAQzR+/5jwI
	ciSb7aVTW3jXiAh9UEUZ9V7fPdhFszcGvpYN+6wXpgN8+7ErWsmNq5Oe9++upPNDhBMZ+UxECAe
	BO/lruMpmdWVneHUMD3XAqQ7IQJ659Qgr3CpaCeAgIdUAHWG4Y8+Zpr3mqQXw75vMJR1Stqt3nh
	/WonYz5XRjms0X65M2OTNr4G5MjsM8MtbMxyOF8wFe+KEpe9CSudI/e71Slfu6dkhIpiUM2jVtV
	vkxL41Z/bM8E3K+VqodrqIFPftl2SSwjfc56UNyPIfLD+okIXpY9Gout7fCZ0+tEgxbOdp5gsky
	ubO+/c+mIWyVKmg4zagfU0+EtK1miUJnn3J0cMYQSmJGW7aVQBMXqqceA5TpvtQ1TCdaIm+Ufm+
	EZfxrKj7nXSFEKjJg/Vg==
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id
 5b1f17b1804b1-4bb88810708mr459749095e9.15.1795668101526; Wed, 25 Nov 2026
 20:41:41 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Karol Adamiak <karol.kosciany@gmail.com>
Date: Thu, 26 Nov 2026 05:41:27 +0100
X-Gm-Features: Aa3M54qtYOoLCQuxFLQghM_P3dcTq6Jbq3OUf1u0grHn0z5sS4QOAoicBrRfwgs
Message-ID: <CAOUCBqp44oaRa5bBv6XOPs8+Uf0xvQJ4nfdsF9YeX19FHevphg@mail.gmail.com>
Subject: mt7921e (MT7921K/RZ608): since linux-firmware a80dabbc, Wi-Fi RX
 loses ~40% of packets after a scan while A2DP is streaming
To: allan.wang@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-firmware@kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	sean.wang@mediatek.com, ryder.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I am seeing a regression after a Wi-Fi firmware update on a MediaTek
MT7921K (RZ608, ASIC revision 79610010). Wi-Fi is on PCIe (mt7921e),
Bluetooth on USB (0e8d:0608, btusb), so both share the same chip.

Symptom:
With a BT headset connected and A2DP streaming (aptX HD; the same
happens when streaming silence), every Wi-Fi scan leaves the link
degraded. The scan can be the periodic NetworkManager background scan
(every 300 s) or a manual "nmcli device wifi rescan". For as long as
the stream runs, downlink (AP to client) loses a steady ~40% of UDP
packets at 100 Mb/s. TCP drops from ~600 to ~100 Mb/s with thousands
of retransmissions. About 2 s after the A2DP stream stops, the loss
disappears, with no reassociation. Without A2DP streaming, a scan
causes only 4-5 s of loss and then 0% again. Uplink is almost
unaffected. Ping shows 0% loss during the same window, so the problem
is invisible to ping and shows up only under sustained UDP/TCP load
(in practice: a brief lag in online games every few minutes).

Bisection:
Same kernel (7.0.0-44-generic, Ubuntu 26.04.1) throughout. Wi-Fi and
BT firmware were swapped independently via /lib/firmware/updates/.

Wi-Fi firmware (linux-firmware commit, build) Result (3 scans while streaming)
------------------------------------------------------------------------------------------------
3b128b60 (2024-03, patch 20240219110958a) good (4-10 s loss)
1d4c88ee (patch 20241106151007a) good
5cf85776 (2025-07-03, patch 20250625153620a) good (5-9 s)
a80dabbc (2026-01-19, patch 20251223091050a, WM 20251223091148) bad:
99-100 s of loss after every scan
ced02591 (2026-03-13, patch 20260224110909a) bad (bit-identical to
Ubuntu's linux-firmware 20260319)

Between 5cf85776 and a80dabbc the only changes to
WIFI_RAM_CODE_MT7961_1.bin and WIFI_MT7961_patch_mcu_1_2_hdr.bin are
in that one commit, so a80dabbc is the first bad commit. BT firmware
is irrelevant: new Wi-Fi + old BT (20240219111427) is bad, old Wi-Fi +
new BT (20260224111243) is good. An external USB BT adapter (Realtek
RTL8761B) under the same conditions does not trigger the problem.

Where the packets are lost:
Measured on the new firmware (ced02591), 5 GHz, A2DP streaming, UDP
100 Mb/s downlink, scan at 10:40:37. Counters from the AP (OpenWrt,
MT7915, client station entry) and from the card, sampled about every 3
s:

Phase AP sent AP retries / failed Card received
------------------------------------------------------------------------------------------
before BT streaming 8913 pkt/s 250/s 8913 pkt/s
streaming ON, before scan 8599 pkt/s 53/s 8600 pkt/s
after scan, streaming ON (205 s) 8687 pkt/s 125/s 5161 pkt/s (-40%)
after stopping the stream 8580 pkt/s 295/s 8581 pkt/s

The AP keeps sending the same rate and sees no extra failures (so the
frames are being ACKed by the card), yet the card hands ~40% fewer
packets to the host. On the host side nothing is dropped: "ip -s link"
RX dropped 0 / missed 0, "iw station" rx drop misc 0, beacon loss 0,
rates unchanged (rx 1200.9 / tx 960.7 Mb/s). In debugfs mt76, BA miss
count climbs 0 -> 29 -> 36 -> 56 during the bad window and stops when
the stream stops. My working interpretation: after a scan the firmware
receives and acknowledges frames but does not deliver them to the host
while A2DP is active (RX reorder / BA scoreboard, or coex gating).
This points inside the card firmware, not at the host driver or the
radio link.

Band pinning does not help:
Pinned to 5 GHz (band=a), the new firmware fails identically (365 s
and 205 s of ~41% loss in two independent runs, ended only by stopping
the stream). The nl80211 scan still covers all 2.4 GHz channels
(2412-2472) and all 5 GHz including DFS, so pinning does not shorten
the scan.

Reproducibility:
3 of 3 scans bad with a80dabbc and newer, 0 of 3 with 5cf85776 and
older; repeated many times. AP: OpenWrt (MT7915), channel 36, 80 MHz,
HE; client on 5 GHz, signal about -55 dBm.

Environment:
Kernel 7.0.0-44-generic, bluez 5.85, PipeWire 1.6.2, WirePlumber
0.5.13, in-kernel mt7921e with default parameters.

Separate observation (may be known coex behavior):
On 2.4 GHz with the older firmware, A2DP streaming alone cuts Wi-Fi
capacity heavily: UDP downlink loss without streaming at 10/20/50/100
Mb/s is 0%/0%/0.13%/0.02%, with streaming 0.17%/11%/31%/38%
(throughput 10/17.7/34.7/62 Mb/s). A 20 min run at 50 Mb/s shows a
flat 31% loss from the first second. On 5 GHz this does not occur.

Workaround in use:
Staying on the 5cf85776 Wi-Fi blobs (placed in
/lib/firmware/updates/mediatek/). With them, a 25 min test (A2DP on, 5
forced + 5 natural scans) gave 1.61% total loss, longest burst 5 s,
each returning to 0%.

I can provide raw iperf3 logs (per-second loss), mt76 debugfs dumps, a
btmon capture, and a self-contained reproduction script (bash, iperf3,
nmcli, PipeWire, python3). Could you tell me what changed in
20251223... in the scan handling or BT coexistence path? I am happy to
test patched firmware.

Thanks,
Karol Adamiak
