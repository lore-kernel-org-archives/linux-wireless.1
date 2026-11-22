Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365265;
	b=eZXA7eP3CNMcbM/mRvq8EwKKoCzhkT84pQk7oXaTqDFdJTLOH0VGymeKdNVKrjIJlT91
	 PZVYpNeOmmwfcm+WNeWSuZItJbv4nTTBAjyo4Lv+wlPt3ddf3HnktsM4iaiBJs+D8zX/B
	 LiVtYtPSuKpVBdynesUWScux5UuvBP4PImLvCjdA/XQeMt7Dz3l4u63D80Z/lPxEwJtNf
	 /3SH6zvdnkldWUa7nq0vwbQp8Nca66EHAWoGvpWY+I/xK9Gd6NCeWZsKGlvHhWmPHS9R+
	 RrOJhjPNGc4TMqL4DpzMCVNlb1m7Iv3j23qGYDcFnMCoPcV64aJUKo2i9n+Q5Dq4Zng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
	b=yAIocxEmKjPcvZ1Wc08xRrIV0F3FVgHeRBqeZq3P9aWcCuHP0ibK3v7oyXDKapSziq9N
	 rn5/SYInMxaEdmMfStVFye+f5PtxN4A/BjC64NyTZyNHyJ81yfSjB2qq9y7aIMD/XrYJu
	 YnpuqTkNykYeYpoNKvhr6Io48CzQ4/hQfh/gdUz0iwcSw/WNtq8FuF792gpGx9Nh6jhCG
	 81NOE9Skv1UM7/+QMyS7fq+Zgm9g9UVBGVhsmZZ/CvKFKRqlKrr+wNY9WZIPiGx7moSzD
	 UzRVqc1up1JdP8NSuI13TQ/3D48UuXti3D3m9TCj9GXQTL0PHE28IuUBeGf+jwR/Huw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLcVMaIM;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA16606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 16:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA16606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLcVMaIM
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1017214b3a.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365264; x=1795970064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
        b=XLcVMaIMsgTzBo78gyw0vfMzb+lmw2wx5kzg/3pL8r/aCHDsMdCSJ0pzbsQlZzb+Xf
         dhQDx4Q0rZ1G4ePNYuvKvoL9rGDscWLfNw7tITzVlen8a5dF8/x6Gx/hqznHcgNKrbBT
         Vo2QnkwPVBzWAOglMSGIOFAnVzgwod3D/Aw9MztVZm7IxUIWAP4xNC87er8o/S3CWiTt
         TsbcICCI4EYD1TQLhEkFusBItHqF683FwRzAltBXnWyky8PpnykVj4xrGm3GfzEzadT/
         XfnRxvRxv9mtmVmfqrgZsz/R6RpHvUMOPdw2ICZY6CZhK630lebjGsVV1++Q2JB54t2l
         UFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365264; x=1795970064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
        b=x3mVkmqG7EX19mjZ5Fd/r76lfl5b7QnElZBUGN2hNXsAV8fG5MUFUDoLaDSgFq/EYz
         93rut0BZyD5CRdN9r5BfRDQjSMCzV/nE4ylAMkOWMgocvYmB/s6BqD/tTNzbR92BMhYH
         K981JIYaZwZerlymZTQfY4IbwuwzHvlqnBWOrawDGKufrQO4kS8Dzs92ZN/6j6Gcci8u
         ChtAdXu7jTNR5Qk3/VsBaoUBy7DJICHKcsB1BFsWNwI7AsblKp15+amR8zbcNikWT+KA
         UMmWufW9uvs2gi9TKcCIxoao+QutVyUh3oo4ZNCsCT558u121J583WV55JOShQ5ezFeq
         QfWA==
X-Gm-Message-State: APuU4Z9ss1dm6EAwB93FE5SPhPI9+acPD0bc520ThM0Qa+m00kMnvWky
	o1I7Rz3TvEFPKCOcj5RVR11vK+Pi/ZZ+MN++trI7iuSjCNoKmkUnXornTqQ+oVLi
X-Gm-Gg: AZFdTZf6wSm1MAiZFC0tD5lnL0xQ4yPOl5uleLxY+1hp9VqVPXSLsySlV+mZfpwF6Zn
	GfxJHvRwucS5zV5OLr+aaJD+Ion3sizDsYIGLL6reNOFRhLY8E84yNroagsbw5LOEwhP/PsyPaZ
	EbPAlfZ0TlqwcLUrBQwkzPVkWjB9Mv1vCU5KdGAu1Qt3V98gpdycRExPM3kuSAcEBsK3xU9jdSC
	xrrKN8dtZxlfF6YaVOBPW5OnAUXnsAKgzn+Y54bYwTFf2vs/TL4f61BrTHUxtRgW6ogkrt0PCX5
	KJhvlaEut7tFXsClMcC7Tr3BpQviqgm4y5uI16MGf7KYd6UNk7ISXpb/AoEXqS23bljitjZdE1t
	vDfuPx4NhpKNmpAX5C5Z8rgVMwUpEUDKQJpNNzZMiMVe8eyzz22mfClzZcJHfj9ww/XP815ODvx
	jBqD4MZnJyUUvPlYJX7qrVVwjKk+eJF7D3m/Z5T09EURiNw0j85LU5oY5GO6jKsELYnQVop66Vr
	fup9/hNyfVavhp9PIyW9i6Sm8fb85XnV1EDFhNM1zJfknMLiTzKAw8g4uxoUQhzHBN0Xv/+XC0H
	IV7h7D8dloxBUH0se1pZDq3BI3FY3wEjWJuiK1Ffka5BrUEiTsbdqH7e2r/U86dfOL2/k/RUpZj
	knL1A5tbvMaMjapVeP/L6GencS6k=
X-Received: by 2002:a05:6a00:4189:b0:899:55e9:880b with SMTP id d2e1a72fcca58-8c87bacb423mr7471731b3a.14.1795365264278;
        Sun, 22 Nov 2026 08:34:24 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm4218560b3a.18.2026.11.22.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:34:23 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hauke@hauke-m.de,
	Ho Jie Feng <hjf3108@gmail.com>,
	stable@vger.kernel.org,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: rt2x00: upload beacon before starting the beacon queue
Date: Mon, 23 Nov 2026 00:34:16 +0800
Message-ID: <20261122163416.14269-1-hjf3108@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
OpenWrt PR: https://github.com/openwrt/openwrt/pull/26850

 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906..48c875e198 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -630,10 +630,12 @@ void rt2x00mac_bss_info_changed(struct ieee80211_hw *hw,
 			rt2x00dev->intf_beaconing++;
 			intf->enable_beacon = true;
 			/*
-			 * Upload beacon to the H/W. This is only required on
-			 * USB devices. PCI devices fetch beacons periodically.
+			 * Upload beacon to the H/W. This is required on USB
+			 * devices. PCI devices fetch beacons periodically, but
+			 * the first TBTT can come before the first fetch.
 			 */
-			if (rt2x00_is_usb(rt2x00dev))
+			if (rt2x00_is_usb(rt2x00dev) ||
+			    rt2x00dev->intf_beaconing == 1)
 				rt2x00queue_update_beacon(rt2x00dev, vif);
 
 			if (rt2x00dev->intf_beaconing == 1) {

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

