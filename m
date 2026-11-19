Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795118276;
	b=n6iea2kEQj10ZWl4vQFVBTSRKA6oRNNkM+b2U890Z1rr/IWJ3gqOzXcUcsMlfPLPMMtD
	 nYXg0nMM9IagIdyzWpL1vhnDziyP1rgoZYeX5GSi+Y5jLzf7RySd418656cT+g6Zv04+l
	 ihB71XuuIpZHojg25oBUCMfY/+HrZzAePqNobZ8/cM98aqhQKG8Cxh52O1bFnb6gsdjw9
	 f1hV0e3ei1fLG6lEcyTo2uuPHb+gT5Q4spRSFRwhQCRT9g7n+iCaRWCSjNKoZ5+moUIew
	 vqzsgxlw5pOp+E8aqxAEscSXaquV+MrhXOVRZ60nKUFvLBwwCyfSuOHMaV0A1IfRd/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118276;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 X-Mailer:Thread-Index:Content-Language:X-Antivirus:X-Antivirus-Status:
	 Content-Transfer-Encoding;
	bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
	b=jRBYTkPh7jdjYwLnJ66ZScoV/Vsk+JJwjaXjxyaGzfZM8oZjDCamnaF+q/GZcsn/WBgS
	 kmxHQ0on/jxQOpQ1BNzSeXv8gstnlp8STsWbKss3dy8OZgcmJYBICHligfCG7OiR/pxPc
	 hXxcNuzuvCrfzqQcZeyWE1PZmtk2EZPyLFSe2wBGNA5+4A5EdR0A7tMm+3ynUez6EwlyA
	 JcxM9yBHkcooc/140EsgmvxdYXi+E97f/wuHciIah0wNvMX36gq2tYWx2lJEud25NdJ+m
	 nlwjlEn2YXVvGhoycTHO/As5JQy+RJFEulshXVSzt96iGlvpBqEOrXhMoV+PmDx//2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luettge.info;
	spf=none smtp.mailfrom=luettge.info;
	dkim=pass header.d=luettge.info header.i=@luettge.info header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jXKIjbTf;
	dkim=pass header.d=luettge.info header.i=@luettge.info header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HKdzcOdR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7D606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 19:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA7D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luettge.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=luettge.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luettge.info header.i=@luettge.info header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jXKIjbTf;
	dkim=pass header.d=luettge.info header.i=@luettge.info header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HKdzcOdR
ARC-Seal: i=1; a=rsa-sha256; t=1795118254; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=U1NpDYQB0AWlRP8e6jZu97cHEFnnHtPldl0owiyBaczESw+XPZ4cjZWjRg+Zr+CpLd
    33idBclWFhZJaLw4ROSdKwPH+EbzR0T6HBx42y2J8qHq/L1ycnLiBRVLF/nADI8dJ8jL
    wYG/5Sv8t/iFtlIOmC5KRJFGLnxYsSKfYzbvfGwKO7ZK14SMBP1hCES1KR3BmW3BYnQE
    HVsuXWVRuDokrqkEHWjpKOwyRR6YiYoYXZ5sK2AcWkY+s2IK8eK2ZO475u4S93CLQVt9
    FQyU3jOHrc8n9dig3Tvzj56rQdevbh06SwAUxemn+k/VPaJ4JCR6qB0cTSbuA+OqaMXy
    9Rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=ckvHJj2DPEnI81MweSZILp6hMsTLEDaGKlC/+Havdmgywdazdlh4X8QzwbzUpMdxO0
    j46x1dk76psQYQhBsIDTC57ArQn2OJrBbcNICMOJ7Nx3SEmwzyhyv5p4W6DurpEzHMbB
    EXe6oqzcHrg7EwOdt0s+aGuoh382+gC/La1tfXOp8zMYDJFxxXacNO3nWMOAdeDwak1A
    IE4M/3NFqgvLuAhxfbvTXyvTIv+ejWpTuFjJQE/feW42OsjXgJV5Qv6kAiAtOqEttahq
    9zU97bVPkyjZTTop+wwo8mXoqrA4u0joF4bRxTdZVBPkyYLEfTnu2dsAz9EAJUAoCuyl
    20Zg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0002; d=luettge.info;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=jXKIjbTfjjvWgiKmpRLRt42LCL0gRzZdRNPpjDXgufzfSF2gvqxHRAqsubD9lOH43h
    3TAw/Fub4XRw45X2PrWOhqHOXHOJRpV9CJbzY9Vl98iiGjPXVXMHKICSvy2Pw2UtZ2dn
    NTMcM46V4j16tkZ/6QFnLtI1F7Tuzxlxtr32/5Wr+gB0K55Y3rP0EoBEWY/MzDWKS65u
    e7SwAxMPFMp+GB3AJJmY9ze6Lrd2r9vMVrvjkqiuJFaSlqK4TXYpa/YqnANNXxM+85mq
    H+gTq7R6jQZoOdupPi2KX7DVFszZXUKHDCp22F/TZ6LnpmiLAL7JKW1m4KuwiA0SPLFV
    UR3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0003; d=luettge.info;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=HKdzcOdRy8buVCczAn03W2gvxoZXNKMlVO0noRj46+FE8Jy/da41kwoZSiovc658I4
    QcbVVbvAL9dKraiJ9VAw==
X-RZG-AUTH: ":ImUBeVOId+pOILSccbq5ALmheyGcr8lFeaRcD5zyRilB8L88+U77HCjw5pzwRZGaqiACruARGosmlo0cOphz9Iqm/dM9tdnaLGA="
Received: from Prime
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Lfda502AJJvYakN
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 19 Nov 2026 20:57:34 +0100 (CET)
From: =?iso-8859-1?Q?Niels_L=FCttge?= <niels@luettge.info>
To: <nbd@nbd.name>,
	<lorenzo@kernel.org>,
	<sean.wang@mediatek.com>
Cc: <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] wifi: mt76: mt7921: handle BSS_CHANGED_TXPOWER and update txpower_cur
Date: Thu, 19 Nov 2026 20:57:33 +0100
Message-ID: <006901dd7860$37a75690$a6f603b0$@luettge.info>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_006A_01DD7868.996C81E0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad14X9B/QmKsIe4cQBWC8T7FvdeTiw==
Content-Language: de
X-Antivirus: Norton (VPS 261119-2, 19.11.2026), Outbound message
X-Antivirus-Status: Clean
Content-Transfer-Encoding: 7bit

This is a multipart message in MIME format.

------=_NextPart_000_006A_01DD7868.996C81E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

Currently, mt7921 ignores BSS_CHANGED_TXPOWER in =
mt7921_bss_info_changed(),
so runtime TX power limits configured via nl80211/iw (e.g. "iw dev <if>
set txpower limit <mbm>") have no effect in AP or STA mode.

On hardware like MT7922, running at the full regulatory limit (e.g. 23 =
dBm)
pushes tmac values above the EEPROM calibration limits visible in
txpower_sku. This causes PA overdrive/saturation, severe throughput
degradation, and thermal overheating=97which eventually wedges the =
firmware
and driver (MCU timeouts) so badly that only a hard reboot / power cycle
can recover the device, with no way for users or hostapd to reduce TX
power at runtime.

Furthermore, mt76_connac_mcu_rate_txpower_band() never updates
phy->txpower_cur, causing mt76_get_txpower() ("iw dev <if> info") to
always report a static 3.00 dBm regardless of the actual configured
TX power.

Fix both issues by:
1. Handling BSS_CHANGED_TXPOWER in mt7921_bss_info_changed(), refreshing
=A0=A0 the CLC country power table via mt7921_mcu_set_clc() before =
calling
=A0=A0 mt76_connac_mcu_set_rate_txpower() so both downward and upward =
runtime
=A0=A0 TX power adjustments take effect immediately on MT7921/MT7922 =
firmware.
2. Updating phy->txpower_cur in mt76_connac_mcu_rate_txpower_band().

Tested on:
- Hardware: Compulab fitlet2 with MediaTek MT7922 (RZ616, PCIe =
14c3:0616)
- Mode: 5 GHz 80 MHz AP mode (hostapd, regdom DE)
- Kernel: Linux 7.0.0 (also verified on 6.8.0)
- Firmware: WM Firmware Build 20250523103234 (and 20231120)
- OS: Linux Mint 22.3

Analyzed and fixed with AI support.=20

Tested on MT7922 (PCIe) in 5 GHz 80 MHz AP mode.

Best regards,

Niels

---------------------------------------------
Niels Luettge
mailto:niels@luettge.info
---------------------------------------------



------=_NextPart_000_006A_01DD7868.996C81E0
Content-Type: application/octet-stream;
	name="mt7921-txpower-fix-upstream.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mt7921-txpower-fix-upstream.patch"

--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c=0A=
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c=0A=
@@ -719,6 +719,12 @@=0A=
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))=0A=
 		mt7921_mcu_set_tx(dev, vif);=0A=
 =0A=
+	if (changed & BSS_CHANGED_TXPOWER) {=0A=
+		hw->conf.power_level =3D info->txpower > 0 ? info->txpower : 0;=0A=
+		mt7921_mcu_set_clc(dev, dev->mt76.alpha2, dev->country_ie_env);=0A=
+		mt76_connac_mcu_set_rate_txpower(&dev->mphy);=0A=
+	}=0A=
+=0A=
 	if (changed & BSS_CHANGED_PS)=0A=
 		mt7921_mcu_uni_bss_ps(dev, vif);=0A=
 =0A=
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c=0A=
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c=0A=
@@ -2179,6 +2179,7 @@=0A=
 	tx_power =3D 2 * phy->hw->conf.power_level;=0A=
 	if (!tx_power)=0A=
 		tx_power =3D 127;=0A=
+	phy->txpower_cur =3D tx_power;=0A=
 =0A=
 	if (band =3D=3D NL80211_BAND_2GHZ) {=0A=
 		n_chan =3D ARRAY_SIZE(chan_list_2ghz);=0A=

------=_NextPart_000_006A_01DD7868.996C81E0--

