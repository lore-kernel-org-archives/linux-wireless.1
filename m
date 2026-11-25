Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619165;
	b=xNGyY6/gWotX/dHO36Z6cupI+VDluZ7lrUpKLdksKDD1cPeXY7A5nSsKCUKtlXFMZPW+
	 KezeddrdjxL5VZHJHx7ruPd6ESl1TWqcQtVSXpsRDMt25SRGgOOigYVyPoGYh3Go4iNk7
	 AN56Mzk4G5B9QpoJqj7ZeYgjxiddRXrVcoJAtgLsSwYY2rbMUf+USMYoAc9nyknTO1HDP
	 zvMSCbf6ixmYSxAOUyXxB0hyH2vi0iTVJ08Zc2kpmgC5JOfVgQw+fr1KzoaVNLKq61Jep
	 m/A0WmBiK2MmzcRCmi9E8fCMrt+InCxNMmwqMpaA3OVt8TAzO0RnfSLT6SUR+MyMrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iVscJ+A2dm5X4zyOnr98V75IK2rfUQ5A/yzvYmObLVM=;
	b=M1V+gYMyUBWuM20IgTpWScj1zwISGPcT2gSiHn/iHtr0e9GPwf7oDQUEkvNIB0oOUNT4
	 Ew6urMrClYWhH3Sr1PfgKAAd3KoX+X54JXe8lJ4YECelqUzkpFadpf3tXyFup7xhl/IIf
	 mwBEtSg6gt4NG1Gj2pSxf0YEnCOM6AIAUL7xjHnUyL9pjXDbWV/RBJbpLwAMWDJz5HZ31
	 7YgKtQub21HeqlqLUKLtry8TGO8mCQu+PVSjhvQ6QgDXOy0VQa38X2K/qTTNfpP4pTpm5
	 rbNZG1G3uAewO0JnzZT9g0G/quAWoTYeis/Vz0Z9eKQjZfsmSTjMQVuWxIYAUEx9buA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwZsMFVp;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED2606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 15:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AED2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwZsMFVp
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1282154a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 07:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619164; x=1796223964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVscJ+A2dm5X4zyOnr98V75IK2rfUQ5A/yzvYmObLVM=;
        b=hwZsMFVpNZnF29VXRRqx3Otju3HC5z0yS4WGB8ol8q640V6cPn85wy4BdajkfEdKsB
         BaEtkcqRIz3IwX1DStZWehmQxPohTqLtSUd55sqG5TTltLGN8KXDU7mo3q0GvFJYgukn
         PsPVzpuGdYvXWgfU4epnL/bI5xu3v1EjGI4wQ7bpucHlRVeXAReVopHBV5qAwZ5TkICM
         2zOBLJgR6LSFMcXg6M39H+bWEVxORZ+VFHbpC3bHDo2fDo0aJP+yo/6ecuRNZ/QR2Tc0
         eeWqs2ksIOC7/THpxCIo45tH0V3jqPPbxkJN4W0pZ6STDPaZ493RcrwkqNxMjFXzZIZ3
         GlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619164; x=1796223964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVscJ+A2dm5X4zyOnr98V75IK2rfUQ5A/yzvYmObLVM=;
        b=09cb8LmfFkklnWD5qA9iufmepnH5xDhs7r114SR3+IiEfiB6z71uGYGcNl97rvaEOm
         qoYnkX/MLFnXLE2ufz/c0xjmfX/9u9NbLWfEnF5gN/x2q01yyxhjLc7PVhdEKCU9LFxD
         UWM62ccAJqgzGLc44Lxh/qcykaVwaMFNeiE/8dfmA1lE9IP2e6UQoWNCRaYa+ZpOdShw
         MSDUw4CR5gYqLtB7AYsVgzvklB7y59rpbQuq+4/PZmIfD8GnOywTz4qMEzrQgX/UDCFn
         EkYm4NGMDs+BWuoes4igq5zCdtihuagExdnpsgWhYLk5D9oDVdD0TnpeGAgqSla0swpw
         7LiQ==
X-Forwarded-Encrypted: i=1; AL+hErEwQHJrPcFuG+J6V2aIxKimj5AvcNPz4bPjCu6/OVtVREAcq27VwgMtA0HgHZ2yjVH+y3bdfmCaYCEIQ5ybpw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LjqbYHdewYAXs7pjq4lFoPabc+8x5i6SZ+yTp+meygC/8bLqL
	4/FhVlDoLgX5/eo9c4b9fD8GkVA0e60o8AZRoxT4kTJ3/ry8MGfWIf2o1xWY+w==
X-Gm-Gg: AZFdTZf/nhLnvPF+y2tbDE08mxNgv7v+F5b9KB+Kq/j1IC8MbvvqM0lYaQfrsR1A6ha
	s4ooyF5VbVgZAMVm9+DSk/S5M4nKfRzLub1ViFsRXiw5fkOi+gMXxZYnBpBcDEXWflOm8vQ3MXN
	7KipdF/bo2VI6dyp0iSgfqriLsDWhATPBnlffT3E5XNAD9Y3Olb2Hoiummue/q2wAV6sVyem8mu
	0UY5iELMiKbfMxuwLT03imOsJUWhTCxIrA98f0YnKUjIAdCdSpgoC3KrjZNf643/Qlud/lA3lWp
	Osg/1FYlW1BzuHPGeIlQLMtSAgEkzDYq8vogPNtZ8YoPOQUcqUZ1m631M44Ud411pOTPau0HSie
	1UQykI8LVgWgG98vumwcmcx84RHcnFgbJ4CrgNZEhusUu/yD7Njh1Dw8r6EuxJVd4SDEDX6pYeI
	d0M+ivbuB85D2fKgUStCwgHv3ooonuxMqudoyuLgSD3hfisAsJpF+dY4fxCl99DCRPTsWtEEdvW
	ANmgHT58og5s8qdJUbVVUkTDUs6J1AB5xZst+IXQIXq/Pz8j1dTvD537/LKuX2IP4PAVgXwLnu0
	6NqFzLJDpocIV73KeHp6UDwoXiAivTLxbnKdjqhEGnuB97Rb3NoLUjBu1prngDEJkXoq0a5A1nH
	maQ8OCDKRnPmEqwvtzd15hK8Rgnnwdpuy5U786YI5priF
X-Received: by 2002:a17:90b:3cc7:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b41c9715a7mr18382410a91.49.1795619164277;
        Wed, 25 Nov 2026 07:06:04 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:6384:b36b:9439:1ccb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm28606203a91.2.2026.11.25.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:06:03 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH rt2x00 v2] wifi: rt2x00: upload beacon before starting the beacon queue
Date: Wed, 25 Nov 2026 23:05:53 +0800
Message-ID: <20261125150553.3442483-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On PCI and SoC devices, rt2x00mac_bss_info_changed() starts the beacon
queue without uploading a beacon, and leaves that to the PRE_TBTT
interrupt. But the TSF is 0 when the queue starts, so the first TBTT is
due at once. With no beacon enabled, BCN_OFFSET0 is 0, and rt2800 sends
a beacon from shared memory 0x4000, the start of the pairwise key table.

On the RT3883 this wedges the baseband until the BBP is reset: the radio
neither receives nor transmits, so the AP never comes up.

Upload the beacon of the first beaconing interface before starting the
queue, as is done on USB devices. The (PRE)TBTT tasklets are not running
yet, so this cannot race with them.

Tested on an ASUS RT-N56U (RT3883).

Fixes: 1dae8d342e84 ("rt2x00: Limit beacon updates in bss_info_changed to USB devices")
Fixes: ba08910e04e0 ("rt2x00: change beaconing setup on RT2800")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
Changelog from v1:
- Add comment about how (PRE)TBTT tasklet will not race with this
https://lore.kernel.org/linux-wireless/20261122163416.14269-1-hjf3108@gmail.com/

OpenWrt PR: https://github.com/openwrt/openwrt/pull/26850

 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906..d4e4bbfc30 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -630,10 +630,14 @@ void rt2x00mac_bss_info_changed(struct ieee80211_hw *hw,
 			rt2x00dev->intf_beaconing++;
 			intf->enable_beacon = true;
 			/*
-			 * Upload beacon to the H/W. This is only required on
-			 * USB devices. PCI devices fetch beacons periodically.
+			 * Upload beacon to the H/W. This is required on USB
+			 * devices. PCI devices fetch beacons periodically, but
+			 * the first TBTT can come before the first fetch. This
+			 * does not race with the (PRE)TBTT tasklet, which only
+			 * runs while the beacon queue is started.
 			 */
-			if (rt2x00_is_usb(rt2x00dev))
+			if (rt2x00_is_usb(rt2x00dev) ||
+			    rt2x00dev->intf_beaconing == 1)
 				rt2x00queue_update_beacon(rt2x00dev, vif);
 
 			if (rt2x00dev->intf_beaconing == 1) {
-- 
2.53.0

