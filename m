Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748571;
	b=mGylRrt3MNEGsP5JTkJT4s0WxNm9QNwMK5LCn04VswLo3e08tkjj9ZrSCcdEpbbWg+uR
	 8MMxefxCvie95JNLlo/L5mi3Df60RV62xL86rEB88LlkK91bmMkGaiwEjSHEnPctWpQAe
	 jYBqDRezL3fBK1DvY2sHRabcuvgxBurmAsp18T1blfELL+JdAMWrZPn8ilaAqXZWRLZte
	 6p5SvzO4p/6pr3ln7sXT80J8EjM68lPf8zr3oNo0IdiPLzvqqYH6O3c1MywuonnX9/N8x
	 BhPVoN/MHIQzGqXWe6btksFPdEC5EsCFWyEaTQduifxd+zAc2yYqf9yJOt2m3z7SiqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748571;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8go9S3oYzYO5ww8YtwyFyx26lMvshd8Hs+WOxsUkQR8=;
	b=3KBnsI1Svzji5q3IZFPz1jwIqyR9ATylmsxttT0PhZjPW9Yz2tO2h9v3r+ox9TOSYhlX
	 QvJ1z4uBJ9V2ctHoOsNLvzwLuBEe80xe2jchdOH/dB7QMXGGqeRqkBsc190u87lzVdNcm
	 idRWuLW4netcXFO2GpGlDcdP0AO1uj7dl0WdbfwOBPAJD0A7C9H0/2H8saB9IYRYpJbLp
	 FY1kb7U6mh3HbJYwsx/toZigwY2pQJkkc4F1eH43TyEt1HVbi2Y0zKJIlqb2nqyReFQgB
	 0sIu8Gl/5ru2prTiS41SrEjA2NBfRZ31Mc1AOFCTLPqoXBfpFdAFIgxC+TjWFD36pAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JvwGx3Ll;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09710606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09710606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JvwGx3Ll
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794748567; x=1795007767;
	bh=8go9S3oYzYO5ww8YtwyFyx26lMvshd8Hs+WOxsUkQR8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JvwGx3Ll61GnAjTU1i0dGH+STl/IerAHTw1Hxh05weYh8G792/U7mypr0ZDJ0yFsf
	 TD0+QOxFmWuMRMNFRz6h+T5j35kNUz752XsJfR4QgCDULovg6ZqcFmDsRn2U4NM1NA
	 r381xjNdhhtXaRBY29kWHJoKCymBQ9joACIdwoMGXC1Hnhzsq5PWP9KG3YCxLyzTOU
	 B5bsXI6dOfQuf7TUvukKou+nJneaxnigSnt7BsiAdxd9/GLZHtDC6Zgz63tJ1w5Fal
	 ZslDWKZLW6aV+VmsvuU08+Nn0lOGJZ+3lYhPvx+iVf4qJAXK+RdGi1oGQIqGCDy7Jn
	 M60hKkuV4Zzhw==
Date: Sun, 15 Nov 2026 13:16:02 +0000
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: alexiscalin <alexiscalin@protonmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: ath11k: WCN6855 on Lenovo (17aa:9309) uses generic regdb, 5 GHz passive-only
Message-ID: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
Feedback-ID: 41683595:user:proton
X-Pm-Message-ID: 0e80abd9cae358e0bc39a71cd1ebe1bcfdd9c9c2
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hardware: ThinkPad P14s Gen 5 AMD (21ME), Qualcomm QCNFA765 / WCN6855
hw2.1 [17cb:1103], subsystem 17aa:9309, chip_id 0x12, board_id 0xff.
Firmware: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
board-2.bin: atheros-firmware-20261019 (Fedora 44)
Kernel: 7.2.13 (ath11k identical to v7.2.13)

ath11k finds the board data for the Lenovo variant (SMBIOS type 0xf8
"LE"):

  boot found board data for 'bus=3Dpci,vendor=3D17cb,device=3D1103,
  subsystem-vendor=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D18,
  qmi-board-id=3D255,variant=3DLE'

but there is no regdb for it, so it falls back to the generic one:

  boot failed to fetch regdb data for bus=3Dpci,vendor=3D17cb,device=3D1103=
,
  subsystem-vendor=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D18,
  qmi-board-id=3D255,variant=3DLE from ath11k/WCN6855/hw2.1/board-2.bin
  boot found match regdb data for name 'bus=3Dpci'

board-2.bin has 16 board entries for Lenovo (subsystem-device 9308,
9309, 930a and e0be) but no Lenovo regdb entry. Its 35 regdb entries are
the generic 'bus=3Dpci' one and 34 for HP (subsystem-vendor 105b).

With the generic regdb, the firmware's default country is BR, and every
5 GHz rule it reports has REGULATORY_CHAN_NO_IR (FLAGS 2), also after
11d has switched the country to US or FR:

  wmi cc_ext BR dfs 0 ...
  wmi reg rule 1: (5170 - 5330 @ 160) (0, 20) (FLAGS 2)
  wmi reg rule 2: (5490 - 5730 @ 160) (0, 20) (FLAGS 2)
  wmi reg rule 3: (5735 - 5895 @ 160) (0, 20) (FLAGS 2)

So all 28 5 GHz channels are scanned passively, including the non-DFS
ones. For FR, wireless-regdb (iw reg get, global) has no NO-IR on these
ranges, but the device reports:

  global: (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
          (5725 - 5875 @ 80), (N/A, 13), (N/A)
  phy:    (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
          (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW, PASSIVE-SCAN

A full scan takes about 5 s, of which the 28 passive 5 GHz channels at a
150 ms dwell time account for about 4.2 s. This delays every connection
that needs a scan, e.g., Wi-Fi after resume: with NetworkManager, Wi-Fi
is back 6.6-7.7 s after the wake-up alarm. For comparison, an Intel 8265
laptop measured the same way takes 5.4-5.5 s. (An additional scan done
by wpa_supplicant after resume, which made it 12.6-12.7 s, is a separate
wpa_supplicant issue and has been reported on the hostap list:
"wpa_supplicant: Initialize is_6ghz_enabled when adding an interface".)

Could a regdb for the Lenovo WCN6855 variants be added to board-2.bin,
as was done for HP? I can test a candidate file on this machine.

